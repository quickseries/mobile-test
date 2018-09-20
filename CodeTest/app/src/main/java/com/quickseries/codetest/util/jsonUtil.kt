package com.quickseries.codetest.util

import android.app.Application

object jsonUtil {

    fun loadJSONFromAsset(application: Application, file: String): String? {
        val jsonString = application.assets.open(file).bufferedReader().use {
            it.readText()
        }
        return jsonString
    }
}