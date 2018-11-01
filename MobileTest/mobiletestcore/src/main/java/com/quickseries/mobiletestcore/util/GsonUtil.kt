package com.quickseries.mobiletestcore.util

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.quickseries.mobiletestcore.util.deserializers.DateTimeDeserializer
import org.joda.time.DateTime

object GsonUtil {
    fun createGson(): Gson {
        return GsonBuilder()
            .registerTypeAdapter(DateTime::class.java, DateTimeDeserializer())
            .create()

    }
}