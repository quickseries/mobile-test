package com.lidboud.kotlin.ui.common


data class NavigationInfo(var navigationType: NavigationType, var destination: String)

enum class NavigationType {
    EMAIL,
    WEBSITE,
    ADDRESS;
}