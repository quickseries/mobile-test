package com.lidboud.kotlin.ui.common

import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.core.content.ContextCompat.startActivity
import com.lidboud.kotlin.ui.webview.WebViewActivity

fun navigateTo(context: Context, navigationInfo: NavigationInfo) {
    when (navigationInfo.navigationType) {
        NavigationType.EMAIL -> navigateToEmail(navigationInfo, context)
        NavigationType.WEBSITE -> navigateToWebsite(navigationInfo, context)
        NavigationType.ADDRESS -> navigateToMap(navigationInfo, context)
    }
}

private fun navigateToMap(navigationInfo: NavigationInfo, context: Context) {
    val intent = getMapIntent(navigationInfo.destination)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    startActivity(intent, context)
}

private fun navigateToWebsite(navigationInfo: NavigationInfo, context: Context) {
    val intent = WebViewActivity.getIntent(context, navigationInfo.destination)
    startActivity(intent, context)
}

private fun navigateToEmail(navigationInfo: NavigationInfo, context: Context) {
    val intent = Intent(Intent.ACTION_SENDTO)
    intent.data = Uri.parse("mailto:${navigationInfo.destination}")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    startActivity(intent, context)
}

private fun startActivity(intent: Intent, context: Context) {
    if (intent.resolveActivity(context.packageManager) != null) {
        startActivity(context, intent, null)
    }
}
