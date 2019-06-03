package com.test.mobile_test;

import android.app.Application;

import androidx.arch.core.executor.testing.InstantTaskExecutorRule;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.Observer;

import com.test.mobile_test.common.RESOURCE_TYPE;
import com.test.mobile_test.data.DataManager;
import com.test.mobile_test.model.CategoryListModel;
import com.test.mobile_test.model.resource.ResourceModel;
import com.test.mobile_test.resources.ResourceViewModel;
import com.test.mobile_test.utils.FileUtils;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.Arrays;
import java.util.List;

import io.reactivex.Observable;
import io.reactivex.android.plugins.RxAndroidPlugins;
import io.reactivex.schedulers.Schedulers;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FileUtils.class)
public class ResourceViewModelTest {

    @Rule
    public InstantTaskExecutorRule instantTaskExecutorRule = new InstantTaskExecutorRule();

    ResourceViewModel mResourceViewModel;

    @Mock
    DataManager dataManager;

    @Mock
    Application context;

    @Mock
    Observer<List<ResourceModel>> observer;

    @Mock
    LifecycleOwner lifecycleOwner;

    Lifecycle lifecycle;

    @Before
    public void setUp() throws Exception {
        RxAndroidPlugins.setInitMainThreadSchedulerHandler(scheduler -> Schedulers.trampoline());
        MockitoAnnotations.initMocks(this);
        PowerMockito.mockStatic(FileUtils.class);
        lifecycle = new LifecycleRegistry(lifecycleOwner);
        mResourceViewModel = new ResourceViewModel(context, dataManager);
        mResourceViewModel.getMutableLiveData().observeForever(observer);
    }

    @Test
    public void testForNull() {
        when(dataManager.getResourceList(context.getApplicationContext(), RESOURCE_TYPE.RESTAURANT)).thenReturn(null);
        assertNotNull(mResourceViewModel.getMutableLiveData());
        assertTrue(mResourceViewModel.getMutableLiveData().hasObservers());
    }

    @Test
    public void testObserverCategoryDataSuccess() {
        List<ResourceModel> data = createResourceData();
        when(dataManager.getResourceList(context, RESOURCE_TYPE.RESTAURANT)).thenReturn(Observable.just(data));
        mResourceViewModel.fetchData(createDummyData());
        verify(observer).onChanged(data);
    }

    @Test
    public void testObserverCategoryDataError() {
        Throwable t = new Throwable();
        when(dataManager.getResourceList(context, RESOURCE_TYPE.RESTAURANT)).thenReturn(Observable.error(t));
        mResourceViewModel.fetchData(createDummyData());
        verify(observer).onChanged(null);
    }


    public List<ResourceModel> createResourceData() {
        ResourceModel resourceModel = new ResourceModel();
        resourceModel.setTitle("Restaurant");
        resourceModel.setEid("ac5bd194-11de-48f6-94db-fd16cfccb570");
        return Arrays.asList(resourceModel);
    }

    public CategoryListModel createDummyData() {
        CategoryListModel categoryListModel = new CategoryListModel();
        categoryListModel.setEid("ac5bd194-11de-48f6-94db-fd16cfccb570");
        return categoryListModel;
    }
}
