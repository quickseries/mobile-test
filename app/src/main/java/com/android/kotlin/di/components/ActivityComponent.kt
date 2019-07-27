package com.android.kotlin.di.components

import com.android.kotlin.di.PerActivity
import com.android.kotlin.di.modules.ActivityModule
import com.android.kotlin.di.modules.NetworkModule
import com.android.kotlin.ui.BlockChainGraphActivity
import com.android.kotlin.ui.MainActivity
import com.android.kotlin.ui.RestaurantListActivity
import dagger.Component

@PerActivity
@Component(modules = arrayOf(NetworkModule::class, ActivityModule::class),
        dependencies = arrayOf(AppComponent::class))
interface ActivityComponent {

    fun inject(mainActivity: MainActivity)
    fun inject(blockChainGraphActivity: BlockChainGraphActivity)
    fun inject(restaurantListActivity: RestaurantListActivity)
}