package com.quickseries.mobiletest.domain.resources.model

import com.quickseries.mobiletest.data.resources.BizHoursResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class BizHours(
    val sunday: String? = null,
    val monday: String? = null,
    val tuesday: String? = null,
    val wednesday: String? = null,
    val thursday: String? = null,
    val friday: String? = null,
    val saturday: String? = null
) {
    /**
     * Simple function to determine fi all the fields of the data class are empty.
     *
     * @return Boolean true if empty
     */
    fun isEmpty() = sunday == null && monday == null && tuesday == null && thursday == null && friday == null && saturday == null
}

/**
 * Extension that convert a [BizHoursResponse] to a list of [BizzHours].
 *
 * @return BizHours
 */
suspend fun BizHoursResponse.toBizHours() = withContext(Dispatchers.Default) {
    BizHours(
        sunday?.let { "${it.from} - ${it.to}" },
        monday?.let { "${it.from} - ${it.to}" },
        tuesday?.let { "${it.from} - ${it.to}" },
        wednesday?.let { "${it.from} - ${it.to}" },
        thursday?.let { "${it.from} - ${it.to}" },
        friday?.let { "${it.from} - ${it.to}" },
        saturday?.let { "${it.from} - ${it.to}" }
    )
}