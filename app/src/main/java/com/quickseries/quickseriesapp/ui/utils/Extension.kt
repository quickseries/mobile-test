package com.quickseries.quickseriesapp.ui.utils

import android.content.res.Resources
import android.databinding.BindingAdapter
import android.os.Build
import android.support.v4.app.Fragment
import android.telephony.PhoneNumberUtils
import android.text.TextUtils
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import com.squareup.picasso.Picasso
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.TimeUnit


/**
 * Created by parth.gadhiya on 2018-02-19.
 */


fun ViewGroup.inflate(layoutId: Int): View {
    return LayoutInflater.from(context).inflate(layoutId, this, false)
}

@BindingAdapter(value = "loadImg", requireAll = false)
fun ImageView.loadImg(imageUrl: String?) {
    if (TextUtils.isEmpty(imageUrl)) {
        Picasso.with(context)
            .load("https://www.gravatar.com/avatar/$imageUrl?s=200&r=pg&d=404")
            .into(this)
    } else {
        Picasso.with(context)
            .load("https://www.gravatar.com/avatar/$imageUrl?s=200&r=pg&d=404")
            .into(this)
    }
}

fun String.formateAsDate(): Date {
    val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH)
    return dateFormat.parse(this)
}

fun Date.formateDate(): String {
    val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH)
    return dateFormat.format(this)
}

fun String.to12HourTimeFormat(): String {
    val dateFormat = SimpleDateFormat("HH:mm", Locale.ENGLISH)
    val new12Format = SimpleDateFormat("h:mm a", Locale.ENGLISH)
    val string = new12Format.format(dateFormat.parse(this))
    return new12Format.format(dateFormat.parse(this))
}

fun String.to24HourTimeFormat(): String {
    val inFormat = SimpleDateFormat("h:mm a", Locale.ENGLISH)
    val outFormat = SimpleDateFormat("HH:mm", Locale.ENGLISH)
    val time24 = outFormat.format(inFormat.parse(this))
    return time24
}

fun String.dateTimeToMillisecond(): Long {
    val time = this.split(":")
    val hour = time[0].toInt()
    val t = hour * 60L
    return TimeUnit.HOURS.toMillis(t)
}

fun getCurrentMonth(): String {
    val monthFormat = SimpleDateFormat("MM", Locale.ENGLISH)
    return monthFormat.format(Date())
}


fun Int.getMonthName(): String {
    val monthParse = SimpleDateFormat("MM", Locale.ENGLISH)
    val monthDisplay = SimpleDateFormat("MMMM", Locale.ENGLISH)
    return monthDisplay.format(monthParse.parse(this.toString()))
}

fun getCurrentYear(): String {
    val monthFormat = SimpleDateFormat("YYYY", Locale.ENGLISH)
    return monthFormat.format(Date())
}

fun String.getDateRange(date: String, duration: String): String {
    val startDate = date.formateAsDate()
    val c = Calendar.getInstance()
    c.time = startDate
    val durations = duration.split(" ")
    when (durations[1]) {
        "Days" -> c.add(Calendar.DAY_OF_YEAR, durations[0].toInt())
        "Weeks" -> c.add(Calendar.WEEK_OF_YEAR, durations[0].toInt())
    }
    val endDate = c.time
    return startDate.formateDate() + " To " + endDate.formateDate()
}

fun String.toFormattedNumber(): String {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        PhoneNumberUtils.formatNumber(this, Locale.getDefault().country)
    } else {
        PhoneNumberUtils.formatNumber(this)
    }
}

fun String.stripPhoneSeparators(): String {
    return PhoneNumberUtils.stripSeparators(this)
}

fun Fragment.onMainThread(func: () -> Unit) {
    activity?.let {
        if (isAdded) {
            it.runOnUiThread { func() }
        }
    }
}


fun String.empty(): String {
    return ""
}

fun Int.convertDpToPixel(): Int {
    val metrics = Resources.getSystem().displayMetrics
    val px = this * (metrics.densityDpi / 160f)
    return Math.round(px)
}

fun Float.convertPixelsToDp(): Float {
    val metrics = Resources.getSystem().displayMetrics
    val dp = this / (metrics.densityDpi / 160f)
    return Math.round(dp).toFloat()
}
