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
import ca.ivasenko.mobiletest.categories.data.CategoryDao;
import ca.ivasenko.mobiletest.categories.model.Category;
import ca.ivasenko.mobiletest.data.AppRoomDatabase;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertNull;

@RunWith(AndroidJUnit4.class)
public class ITestCategoryDao
{
    @Rule
    public InstantTaskExecutorRule instantTaskExecutorRule = new InstantTaskExecutorRule();

    private AppRoomDatabase mDatabase;
    private CategoryDao categoryDao;

    @Before
    public void initDb() throws Exception {
        mDatabase = Room.inMemoryDatabaseBuilder(InstrumentationRegistry.getContext(),
                AppRoomDatabase.class)
                .allowMainThreadQueries()
                .build();

        categoryDao = mDatabase.categoryDao();
    }

    @After
    public void closeDb() throws Exception {
        mDatabase.close();
    }

    @Test
    public void onFetchingCategories_shouldGetEmptyList_IfTable_IsEmpty() throws InterruptedException {
        List<Category> categoryList = LiveDataTestUtil.getValue(categoryDao.getAllCategories());
        assertTrue(categoryList.isEmpty());
    }

    @Test
    public void onCategoryDeletion_CheckIf_CategoryIsDeletedFromTable() throws InterruptedException {
        List < Category > categoryList = FakeSource.getFakeCategories(5);
        categoryDao.insertList(categoryList);
        categoryDao.deleteCategory(categoryList.get(2));
        assertNull(LiveDataTestUtil.getValue(categoryDao.getCategoryById(categoryList.get(2).getId())));
    }
}
