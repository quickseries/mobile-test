package com.lidboud.kotlin.data.model.domain

import com.google.gson.annotations.SerializedName

data class Resource(@field:SerializedName("_id") val id: String = "",
                    @field:SerializedName("title") val title: String = "",
                    @field:SerializedName("description") val description: String = "",
                    @field:SerializedName("addresses") val addresses: List<Address> = listOf(),
                    @field:SerializedName("contactInfo") val contactInfo: ContactInfo)

data class Address(@field:SerializedName("address1") val address: String = "",
                   @field:SerializedName("city") val city: String = "",
                   @field:SerializedName("zipCode") val zipCode: String = "",
                   @field:SerializedName("country") val country: String = "",
                   @field:SerializedName("gps") val gps: Gps? = null)


data class Gps(@field:SerializedName("latitude") val latitude: String,
               @field:SerializedName("longitude") val longitude: String)

class ContactInfo(@field:SerializedName("email") val email: List<String>?,
                  @field:SerializedName("website") val website: List<String>?)

