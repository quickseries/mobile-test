package com.lidboud.kotlin.common

import android.content.Context
import javax.inject.Inject

class RawFileReader @Inject constructor(private val context: Context) {

    fun getStringFromResource(resource: Int): String {
        val res = context.resources
        val rawStream = res.openRawResource(resource)
        val byteArray = ByteArray(rawStream.available())
        rawStream.read(byteArray)
        return String(byteArray)
    }
}