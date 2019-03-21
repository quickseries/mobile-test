package com.numerad.quickseries;

import android.content.Context;

import com.numerad.quickseries.main.MainPresenter;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import javax.inject.Inject;

import androidx.test.InstrumentationRegistry;
import androidx.test.runner.AndroidJUnit4;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

/**
 * Instrumented test, which will execute on an Android device.
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
@RunWith(AndroidJUnit4.class)
public class InstrumentedTest {

    @Inject
    MainPresenter presenter;

    @Before
    public void setUp() {
    }

    @Test
    public void useAppContext() {
        // Context of the app under test.
        Context appContext = InstrumentationRegistry.getTargetContext();
        assertEquals("com.numerad.quickseries", appContext.getPackageName());
    }

    @Test
    public void toggleSortOrder() {
        boolean before = presenter.isAlphabetical();
        presenter.toggleSortOrder();
        assertNotEquals(before, presenter.isAlphabetical());
    }

}
