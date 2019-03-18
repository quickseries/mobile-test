package com.mvckx.elistique.data

import io.reactivex.Observable
import io.reactivex.schedulers.Schedulers
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class PlacesRepository : KoinComponent {
    private val networkService: NetworkService by inject()

    fun getCategories(): Observable<Lce<List<RepCategory>>> {
        return networkService.getCategories()
            .subscribeOn(Schedulers.io())
            .toLce()
    }

    fun getRestaurants(): Observable<Lce<List<RepRestaurant>>> {
        return networkService.getRestaurants()
            .subscribeOn(Schedulers.io())
            .toLce()
    }

    fun getVacationSpots(): Observable<Lce<List<RepVacationSpot>>> {
        return networkService.getVacationSpots()
            .subscribeOn(Schedulers.io())
            .toLce()
    }

    private fun <T> Observable<T>.toLce(): Observable<Lce<T>> {
        return this.map { Lce.Content(it) as Lce<T> }
            .startWith(Lce.Loading())
            .onErrorReturn { Lce.Error() }
    }
}