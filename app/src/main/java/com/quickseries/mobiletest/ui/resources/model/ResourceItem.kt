package com.quickseries.mobiletest.ui.resources

import com.quickseries.mobiletest.domain.resources.model.Resource
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class ResourceItem(
    val resourceInfo: ResourceInfo
)

suspend fun List<Resource>.toResourcesItems() = withContext(Dispatchers.Default) {

}