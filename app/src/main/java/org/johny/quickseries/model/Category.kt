package org.johny.quickseries.model

data class Category(
    val _id: String,
    val slug: String,
    val title: String = "",
    val photo: String = "",
    val description: String = ""
)