package com.quickseries.mobiletest.domain.model

/**
 * Enum representing the differents types of Slug.
 */
enum class Slug(val stringValue: String) {
    RESTAURANTS("restaurants"),
    VACATION_SPOTS("vacation-spots"),
    UNKNOWN("unknown");

    companion object {
        private val map = values().associateBy(Slug::stringValue)

        /**
         * Get an enum from a string.
         */
        fun fromString(value: String?) = map[value] ?: UNKNOWN
    }
}