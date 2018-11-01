package com.quickseries.mobiletestcore.util

import android.content.Context
import java.io.IOException
import java.io.InputStream

object AssetUtil {
    fun loadJsonFromAsset(context: Context, filename: String): String? {
        val json: String?
        var assetStream: InputStream? = null
        try {
            assetStream = context.assets.open(filename)
            val available = assetStream!!.available()
            val byteArray = ByteArray(available)
            assetStream.read(byteArray)
            json = String(byteArray, charset("UTF-8"))
        } catch (ex: IOException) {
            assetStream?.close()
            return null
        } finally {
            assetStream?.close()
        }

        return json
    }
}