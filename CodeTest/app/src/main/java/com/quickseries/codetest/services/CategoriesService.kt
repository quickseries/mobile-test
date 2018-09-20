package com.quickseries.codetest.services

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.quickseries.codetest.model.Categorie

object CategoriesService {

    fun getCategories(json: String): MutableList<Categorie> {
        val groupListType = object : TypeToken<ArrayList<Categorie>>() {}.type
        return Gson().fromJson(json, groupListType)
    }
}