package com.quickseries.mobiletestcore.util.deserializers

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.quickseries.mobiletestcore.util.Constants
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import java.lang.reflect.Type

class DateTimeDeserializer : JsonDeserializer<DateTime> {
    override fun deserialize(json: JsonElement?, typeOfT: Type?, context: JsonDeserializationContext?): DateTime? {
        val strDate = json!!.asString
        val formatter = DateTimeFormat.forPattern(Constants.DATE_TIME_FORMAT_UTC)
        return try {
            formatter.parseDateTime(strDate).toLocalDateTime().toDateTime()
        } catch (ex: Exception) {
            null
        }
    }
}