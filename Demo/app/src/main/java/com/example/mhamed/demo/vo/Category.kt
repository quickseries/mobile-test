package com.example.mhamed.demo.vo

import com.example.mhamed.demo.model.Category

/**
 * @author mhamed
 * @since 2018-11-10
 */
data class Category(var slug: String, override var title: String,
                    override var description: String?, var active: Boolean) : Category {
}