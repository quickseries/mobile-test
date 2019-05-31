package com.kotlin.test.di.module

import android.content.Context
import com.kotlin.test.di.qualifier.ApplicationContext
import com.kotlin.test.di.scopes.ApplicationScope
import dagger.Module
import dagger.Provides

@Module
class ContextModule(private val context: Context) {

    @Provides
    @ApplicationScope
    @ApplicationContext
    fun provideContext(): Context {
        return context
    }
}
