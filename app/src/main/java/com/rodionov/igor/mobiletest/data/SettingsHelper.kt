package com.rodionov.igor.mobiletest.data

import android.content.Context

object SettingsHelper {
    private val NAME = "mobileTestPreferences"

    val CATEGORIES_SAVED = "categories_saved"
    val RESTAURANTS_SAVED = "restaurants_saved"
    val VACATIONS_SAVED = "vacations_saved"

    fun setValue(key: String, context: Context) {
        context.getSharedPreferences(NAME, Context.MODE_PRIVATE).edit().putBoolean(key, true).apply()
    }

    fun getValue(key: String, context: Context): Boolean {
        return context.getSharedPreferences(NAME, Context.MODE_PRIVATE).getBoolean(key, false)
    }
}
