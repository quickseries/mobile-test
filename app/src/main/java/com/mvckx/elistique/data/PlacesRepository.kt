package com.mvckx.elistique.data

import io.reactivex.Observable
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class PlacesRepository : KoinComponent {
    private val networkService: NetworkService by inject()

    fun getCategories(): Observable<Lce<List<RepCategory>>> {
        return networkService.getCategories()
            .toLce()
    }

    fun getCategoryDetail(categoryId: String): Observable<Lce<List<RepPlace>>> {
        val observable = if (categoryId == RESTAURANT_ID) getRestaurants() else getVacationSpots()
        return observable.toLce()
    }

    private fun getRestaurants(): Observable<List<RepPlace>> {
        return networkService.getRestaurants()
    }

    private fun getVacationSpots(): Observable<List<RepPlace>> {
        return networkService.getVacationSpots()
    }

    private fun <T> Observable<T>.toLce(): Observable<Lce<T>> {
        return this.map { Lce.Content(it) as Lce<T> }
            .startWith(Lce.Loading())
            .onErrorReturn { Lce.Error() }
    }

    companion object {
        private const val RESTAURANT_ID = "ac5bd194-11de-48f6-94db-fd16cfccb570"
    }
}