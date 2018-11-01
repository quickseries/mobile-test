package com.quickseries.mobiletestcore

import android.content.Context
import android.support.test.runner.AndroidJUnit4
import org.junit.Test
import org.junit.Assert.*
import org.junit.Before
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class PlacesDatabaseUnitTest {

    private var context: Context? = null

    @Before
    fun setup() {
        try {
            context = android.support.test.InstrumentationRegistry.getContext()
        } catch (ex: Throwable) {

        }
    }

    @Test
    public fun database_creation_and_load_fixed_data() {
        assertNotNull("Context should be not null", context)
    }
}