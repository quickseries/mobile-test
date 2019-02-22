package com.lidboud.kotlin.data.model.domain

import com.google.gson.annotations.SerializedName

data class Category(@field:SerializedName("_id") val id: String,
                    @field:SerializedName("title") val title: String)
