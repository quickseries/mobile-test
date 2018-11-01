package com.quickseries.mobiletest.util

import android.os.Build
import android.text.Html
import android.text.Spanned
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

object TextUtil {
    fun textFromHtml(html: String): Spanned {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            Html.fromHtml(html, Html.FROM_HTML_MODE_COMPACT)
        } else {
            Html.fromHtml(html)
        }
    }

    fun formatDateTime(dateTime: DateTime) : String {
        return dateTime.toString(DateTimeFormat.forPattern("MM/dd/yyyy HH:mm"))
    }
}