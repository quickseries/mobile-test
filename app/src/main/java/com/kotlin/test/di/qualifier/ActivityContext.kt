package com.kotlin.test.di.qualifier


import javax.inject.Qualifier
import java.lang.annotation.Retention
import java.lang.annotation.RetentionPolicy

@Qualifier
@Retention(RetentionPolicy.RUNTIME)
annotation class ActivityContext
