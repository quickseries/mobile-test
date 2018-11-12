package com.rodionov.igor.mobiletest.model

enum class CategoryType  constructor(private val mValue: String) {
    RESTAURANTS("restaurants"),
    VACATIONS("vacation-spots");

    companion object {

        fun getByValue(value: String?): CategoryType {
            var type = RESTAURANTS
            for (categoryType in values()) {
                if (categoryType.mValue.equals(value, ignoreCase = true)) {
                    type = categoryType
                }
            }
            return type
        }
    }
}
