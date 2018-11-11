package com.example.mhamed.demo.events

import com.example.mhamed.demo.model.Category

/**
 * @author mhamed
 * @since 2018-11-10
 */
data class CategoriesEvent(val categoriesEvent : List<Category>?, val successful:Boolean ) {

}