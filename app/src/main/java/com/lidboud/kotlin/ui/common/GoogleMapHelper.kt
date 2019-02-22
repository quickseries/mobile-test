package com.lidboud.kotlin.ui.common

import android.content.Intent
import android.net.Uri

private val GOOGLE_MAP_QUERY_KEY = "query"
private val GOOGLE_BASE_URL = "https://www.google.com/maps/search/?api=1"
private val GOOGLE_MAP_DIRECTION_API_BASE_URI = Uri.parse(GOOGLE_BASE_URL)
        .buildUpon()
        .build()
private val PACKAGE_GOOGLE_APP = "com.google.android.apps.maps"

fun getMapIntent(destination: String): Intent {
    val uri = createGoogleMapUri(destination)
    val mapIntent = Intent(Intent.ACTION_VIEW, uri)
    mapIntent.`package` = PACKAGE_GOOGLE_APP
    return mapIntent
}

private fun createGoogleMapUri(destination: String) = GOOGLE_MAP_DIRECTION_API_BASE_URI.buildUpon()
        .appendQueryParameter(GOOGLE_MAP_QUERY_KEY, destination).build()
