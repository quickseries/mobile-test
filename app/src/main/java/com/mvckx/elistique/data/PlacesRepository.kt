package com.mvckx.elistique.data

import io.reactivex.Observable
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class PlacesRepository : KoinComponent {
    private val networkService: NetworkService by inject()
    private val placesCache = HashMap<String, RepPlace>()

    fun getCategories(): Observable<Lce<List<RepCategory>>> {
        return networkService.getCategories()
            .toLce()
    }

    fun getCategoryDetail(categoryId: String): Observable<Lce<List<RepPlace>>> {
        return getCategoryObservable(categoryId).doOnNext { addToCache(it) }.toLce()
    }

    // "Simulates" getting the detail from (potentially) a network request
    fun getPlaceDetail(placeId: String, categoryId: String): Observable<Lce<RepPlace>> {
        val repPlace = placesCache[placeId]
        if (repPlace != null) {
            return repPlace.toObservable().toLce()
        }

        return getCategoryObservable(categoryId).map {
            it.find { place ->
                place.eid == placeId
            } ?: throw RuntimeException("Unable to find place $placeId in category $categoryId")
        }.toLce()
    }

    private fun getCategoryObservable(categoryId: String): Observable<List<RepPlace>> {
        if (categoryId == RESTAURANT_ID) {
            return networkService.getRestaurants()
        }
        return networkService.getVacationSpots()
    }

    private fun addToCache(it: List<RepPlace>) {
        it.forEach {
            placesCache[it.eid] = it
        }
    }

    //////////////////////////////
    // HELPER EXTENSION METHODS
    //////////////////////////////
    private fun <T> Observable<T>.toLce(): Observable<Lce<T>> {
        return this.map { Lce.Content(it) as Lce<T> }
            .startWith(Lce.Loading())
            .onErrorReturn { Lce.Error(it) }
    }

    private fun <T> T.toObservable(): Observable<T> = Observable.just(this)

    companion object {
        private const val RESTAURANT_ID = "ac5bd194-11de-48f6-94db-fd16cfccb570"
    }
}