package com.quickseries.codetest.services

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.quickseries.codetest.model.Resource

object ResourcesService {

    fun getResouces(json: String): MutableList<Resource> {
        val groupListType = object : TypeToken<ArrayList<Resource>>() {}.type
        return Gson().fromJson(json, groupListType)
    }
}