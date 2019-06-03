package com.mohamadk.quickseries.core.repo.api

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.mohamadk.quickseries.pages.detail.items.contact.ItemContact
import java.lang.reflect.Type


class ArrayItemContactTypeAdapter : JsonDeserializer<Array<ItemContact>> {

    override fun deserialize(
        json: JsonElement?,
        typeOfT: Type?,
        context: JsonDeserializationContext?
    ): Array<ItemContact> {

        val result = mutableListOf<ItemContact>()
        val contacts = json!!.asJsonObject
        val keys = contacts.keySet()

        keys.forEach { key ->
            val infos = contacts.getAsJsonArray(key)
            infos.forEach {
                result.add(
                    ItemContact(
                        key,
                        it.asString,
                        isCallable(key),
                        isSMSable(key),
                        isEmail(key),
                        isWebsite(key)
                    )
                )
            }
        }

        return result.toTypedArray()

    }

    private fun isWebsite(key: String): Boolean {
        return when (key) {
            "website" -> true
            "email" -> false
            "faxNumber" -> false
            "tollFree" -> false
            "phoneNumber" -> false
            else -> {
                throw IllegalStateException("contact info ($key) is not implemented ")
            }
        }
    }

    private fun isEmail(key: String): Boolean {
        return when (key) {
            "website" -> false
            "email" -> true
            "faxNumber" -> false
            "tollFree" -> false
            "phoneNumber" -> false
            else -> {
                throw IllegalStateException("contact info ($key) is not implemented ")
            }
        }
    }

    private fun isCallable(key: String): Boolean {
        return when (key) {
            "website" -> false
            "email" -> false
            "faxNumber" -> false
            "tollFree" -> true
            "phoneNumber" -> true
            else -> {
                throw IllegalStateException("contact info ($key) is not implemented ")
            }
        }
    }

    private fun isSMSable(key: String): Boolean {
        return when (key) {
            "website" -> false
            "email" -> false
            "faxNumber" -> false
            "tollFree" -> true
            "phoneNumber" -> true
            else -> {
                throw IllegalStateException("contact info ($key) is not implemented ")
            }
        }
    }

}
