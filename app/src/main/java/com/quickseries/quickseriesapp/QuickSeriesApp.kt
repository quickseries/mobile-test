package com.quickseries.quickseriesapp

import android.app.Application
import android.content.Context
import android.support.multidex.MultiDex
import com.pixplicity.easyprefs.library.Prefs
import io.realm.Realm
import io.realm.RealmConfiguration
import io.realm.rx.RealmObservableFactory

/**
 * Created by parth.gadhiya on 2018-10-26.
 */

class QuickSeriesApp : Application() {

    override fun onCreate() {
        super.onCreate()
        Prefs.Builder()
            .setContext(applicationContext)
            .setMode(Context.MODE_PRIVATE)
            .setPrefsName(packageName)
            .setUseDefaultSharedPreference(true)
            .build()


        Realm.init(this)
        val realmConfiguration = RealmConfiguration.Builder()
            .name(getString(R.string.realm_config_name))
            .schemaVersion(getString(R.string.realm_schema_version).toLong())
            .modules(QuickSeriesRealmModule())
            .rxFactory(RealmObservableFactory())
            .deleteRealmIfMigrationNeeded()
            .build()
        Realm.setDefaultConfiguration(realmConfiguration)

        Injector.init(this)
        Injector.get().inject(this)


    }

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(base)
    }

    companion object {
        private val MAIN_REALM_CONFIG_NAME = "main.quickseries.realm"
        private val SCHEMA_VERION = "1.0.0"
    }

}
