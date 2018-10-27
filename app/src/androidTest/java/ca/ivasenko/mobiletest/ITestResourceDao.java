package ca.ivasenko.mobiletest;

import android.arch.core.executor.testing.InstantTaskExecutorRule;
import android.arch.persistence.room.Room;
import android.support.test.InstrumentationRegistry;
import android.support.test.runner.AndroidJUnit4;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.List;

import ca.ivasenko.mobiletest.Utils.FakeSource;
import ca.ivasenko.mobiletest.Utils.LiveDataTestUtil;
import ca.ivasenko.mobiletest.data.AppRoomDatabase;
import ca.ivasenko.mobiletest.resources.data.ResourceDao;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

import static org.junit.Assert.assertNull;

@RunWith(AndroidJUnit4.class)
public class ITestResourceDao
{
    @Rule
    public InstantTaskExecutorRule instantTaskExecutorRule = new InstantTaskExecutorRule();

    private AppRoomDatabase mDatabase;
    private ResourceDao resourceDao;

    @Before
    public void initDb() throws Exception {
        mDatabase = Room.inMemoryDatabaseBuilder(InstrumentationRegistry.getContext(),
                AppRoomDatabase.class)
                .allowMainThreadQueries()
                .build();

        resourceDao = mDatabase.resourceDao();
    }

    @After
    public void closeDb() throws Exception {
        mDatabase.close();
    }

    @Test
    public void onResourceObjectDeletion_CheckIf_ResourceObjectIsDeletedFromTable() throws InterruptedException {
        List <ResourceObject> fakeResources = FakeSource.getFakeResources(5);
        resourceDao.insertList(fakeResources);
        resourceDao.deleteResource(fakeResources.get(2));
        assertNull(LiveDataTestUtil.getValue(resourceDao.getResourceObject(fakeResources.get(2).getId())));
    }
}
