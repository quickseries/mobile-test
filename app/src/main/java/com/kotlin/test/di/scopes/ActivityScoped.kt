package com.kotlin.test.di.scopes

import javax.inject.Scope
import java.lang.annotation.Documented
import java.lang.annotation.Retention
import java.lang.annotation.RetentionPolicy

@Documented
@Scope
@Retention(RetentionPolicy.RUNTIME)
annotation class ActivityScoped
