package com.quickseries.mobiletest.domain.resources.model

import com.quickseries.mobiletest.data.resources.ContactInfoResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class ContactInfo(
    val website: String? = null,
    val email: String? = null,
    val phoneNmber: String? = null,
    val faxNumber: String? = null,
    val tollFree: String? = null
) {
    fun isEmpty() = website == null && email == null && phoneNmber == null && faxNumber == null && tollFree == null
}

suspend fun ContactInfoResponse.toContactInfo() = withContext(Dispatchers.Default) {
    ContactInfo(
        websites.firstOrNull(),
        emails.firstOrNull(),
        phoneNumbers.firstOrNull(),
        faxNumbers.firstOrNull(),
        tollFrees.firstOrNull()
    )
}