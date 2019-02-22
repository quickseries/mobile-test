package com.lidboud.kotlin.injection

import com.lidboud.kotlin.KotlinApplication
import com.lidboud.kotlin.injection.module.ActivityProviderModule
import com.lidboud.kotlin.injection.module.ApplicationModule
import com.lidboud.kotlin.injection.module.DataModule
import com.lidboud.kotlin.injection.module.ViewModelFactoryModule
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import javax.inject.Singleton

@Singleton
@Component(modules = [AndroidSupportInjectionModule::class,
    DataModule::class, ApplicationModule::class,
    ActivityProviderModule::class,
    ViewModelFactoryModule::class])
interface ApplicationComponent : AndroidInjector<KotlinApplication> {

    @Component.Builder
    abstract class Builder : AndroidInjector.Builder<KotlinApplication>()
}
