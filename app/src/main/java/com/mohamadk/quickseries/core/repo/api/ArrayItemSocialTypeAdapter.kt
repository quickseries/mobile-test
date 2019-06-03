package com.mohamadk.quickseries.core.repo.api

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.mohamadk.quickseries.pages.detail.items.social.ItemSocial
import java.lang.reflect.Type

class ArrayItemSocialTypeAdapter : JsonDeserializer<ItemSocial> {
    override fun deserialize(json: JsonElement?, typeOfT: Type?, context: JsonDeserializationContext?): ItemSocial {

        return with(json!!.asJsonObject) {
            val facebook = getAsJsonArray("facebook")[0].asString
            val twitter = getAsJsonArray("twitter")[0].asString
            val youtube = getAsJsonArray("youtubeChannel")[0].asString

            ItemSocial(youtube, twitter, facebook)
        }
    }

}
