package com.mvckx.elistique.data

sealed class Lce<T> {
    class Loading<T> : Lce<T>()
    data class Content<T>(val content: T) : Lce<T>()
    data class Error<T>(val throwable: Throwable) : Lce<T>()
}