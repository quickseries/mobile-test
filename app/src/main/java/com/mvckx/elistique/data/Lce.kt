package com.mvckx.elistique.data

sealed class Lce<T> {
    class Loading<T> : Lce<T>()
    data class Content<T>(val content: T) : Lce<T>()
    class Error<T> : Lce<T>()
}