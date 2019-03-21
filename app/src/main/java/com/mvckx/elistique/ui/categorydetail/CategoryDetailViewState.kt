package com.mvckx.elistique.ui.categorydetail

data class CategoryDetailViewState(val placeItems: List<PlaceItem>, val loading: Boolean) {
    data class PlaceItem(val id: String, val title: String?, val imageUrl: String?)
}
