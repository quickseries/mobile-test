package com.example.mhamed.demo.api.response

import com.example.mhamed.demo.model.Category

/**
 * Category object as represented by the server.
 * @author mhamed
 * @since 2018-11-10
 */
data class CategoryResponse(var _id: String, var updated_at:String, var custom_module_eid:String, var eid:String,
                            var __v:String, var created_at:String, var _active: Boolean,
                            var slug: String, override var title: String, override var description: String?) : Category {
}