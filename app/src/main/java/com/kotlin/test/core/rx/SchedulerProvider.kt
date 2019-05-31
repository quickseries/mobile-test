package com.kotlin.test.core.rx

import io.reactivex.Scheduler

interface SchedulerProvider {
    fun ui(): Scheduler

    fun io(): Scheduler
}
