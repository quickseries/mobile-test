package com.quickseries.quickseriesapp

/**
 * Created by parth.gadhiya on 2018-10-26.
 */

object Injector {

    private var appComponent: AppComponent? = null

    fun init(app: QuickSeriesApp) {
        appComponent = DaggerAppComponent.builder()
            .appModule(AppModule(app))
            .build()

    }


    fun get(): AppComponent {
        return appComponent!!
    }

    fun restart(app: QuickSeriesApp) {
        appComponent = null
        init(app)
    }

}
