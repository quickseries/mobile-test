package com.android.kotlin.utils

import android.content.Context
import android.content.pm.PackageManager
import android.support.v4.content.ContextCompat

class Util {
    companion object {
        fun isPermissionAvailable(context: Context, permission: String): Boolean {
            return ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED
        }
    }

}