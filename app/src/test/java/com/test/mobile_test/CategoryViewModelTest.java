package com.test.mobile_test;

import android.app.Application;

import androidx.arch.core.executor.testing.InstantTaskExecutorRule;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.Observer;

import com.test.mobile_test.categories.CategoryViewModel;
import com.test.mobile_test.data.DataManager;
import com.test.mobile_test.model.CategoryListModel;
import com.test.mobile_test.utils.FileUtils;

import net.bytebuddy.implementation.bytecode.Throw;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import io.reactivex.Observable;
import io.reactivex.android.plugins.RxAndroidPlugins;
import io.reactivex.schedulers.Schedulers;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;


@RunWith(PowerMockRunner.class)
@PrepareForTest(FileUtils.class)
public class CategoryViewModelTest {
    @Rule
    public InstantTaskExecutorRule instantTaskExecutorRule = new InstantTaskExecutorRule();

    CategoryViewModel mCategoryViewModel;

    @Mock
    DataManager dataManager;

    @Mock
    Application context;

    @Mock
    Observer<List<CategoryListModel>> observer;

    @Mock
    LifecycleOwner lifecycleOwner;

    Lifecycle lifecycle;

    @Before
    public void setUp() throws Exception {
        RxAndroidPlugins.setInitMainThreadSchedulerHandler(scheduler -> Schedulers.trampoline());
        MockitoAnnotations.initMocks(this);
        PowerMockito.mockStatic(FileUtils.class);
        lifecycle = new LifecycleRegistry(lifecycleOwner);
        mCategoryViewModel = new CategoryViewModel(context, dataManager);
        mCategoryViewModel.getMutableLiveData().observeForever(observer);
    }

    @Test
    public void testForNull() {
        when(dataManager.getCategoryList(context.getApplicationContext())).thenReturn(null);
        assertNotNull(mCategoryViewModel.getMutableLiveData());
        assertTrue(mCategoryViewModel.getMutableLiveData().hasObservers());
    }

    @Test
    public void testObserverCategoryDataSuccess() {
        List<CategoryListModel> data = createDummyData();
        when(dataManager.getCategoryList(context)).thenReturn(Observable.just(data));
        mCategoryViewModel.fetchCategoryList();
        verify(observer).onChanged(data);
    }

    @Test
    public void testObserverCategoryDataError() {
        Throwable t = new Throwable();
        when(dataManager.getCategoryList(context)).thenReturn(Observable.error(t));
        mCategoryViewModel.fetchCategoryList();
        verify(observer).onChanged(null);
    }


    public List<CategoryListModel> createDummyData() {
        List<CategoryListModel> models = new ArrayList<>();
        models.add(new CategoryListModel("test"));
        return models;

    }

}
