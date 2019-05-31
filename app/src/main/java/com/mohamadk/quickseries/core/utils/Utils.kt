package com.mohamadk.quickseries.core.utils

import com.mohamadk.quickseries.core.App

fun readFileText(fileName: String): String {
    return App.context.assets.open(fileName).bufferedReader().use { it.readText() }
}