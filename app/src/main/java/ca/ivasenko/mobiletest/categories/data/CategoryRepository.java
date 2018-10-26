package ca.ivasenko.mobiletest.categories.data;

import android.app.Application;
import android.arch.lifecycle.LiveData;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.preference.PreferenceManager;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

import ca.ivasenko.mobiletest.Utils.JsonReader;
import ca.ivasenko.mobiletest.categories.model.Category;
import ca.ivasenko.mobiletest.data.AppRoomDatabase;

public class CategoryRepository
{
    private static final String PREFERENCE_IS_FETCH_NEEDED_CATEGORIES = "should_fetch_categories";
    public static final String CATEGORIES_JSON = "categories.json";
    private CategoryDao categoryDao;

    private LiveData<List<Category>> mAllCategories;

    public CategoryRepository(Application application)
    {
        AppRoomDatabase db = AppRoomDatabase.getDatabase(application);
        categoryDao = db.categoryDao();
        if (isFetchNeeded(application.getBaseContext()))
            fetchCategories(application.getBaseContext());
        else
            mAllCategories = categoryDao.getAllCategories();
    }

    public LiveData<List<Category>> getAllCategories()
    {
        return mAllCategories;
    }

    public void insert(Category category)
    {
        new InsertCategoryAsyncTask(categoryDao).execute(category);
    }

    private static class InsertCategoryAsyncTask extends AsyncTask<Category, Void, Long>
    {
        private CategoryDao mCategoryAsyncTaskDao;

        InsertCategoryAsyncTask(CategoryDao categoryDao)
        {
            mCategoryAsyncTaskDao = categoryDao;
        }

        @Override
        protected Long doInBackground(Category... categories)
        {
            return mCategoryAsyncTaskDao.insert(categories[0]);
        }
    }

    private static class InsertCategoriesListAsyncTask extends AsyncTask<List<Category>, Void, Void>
    {
        private CategoryDao categoryAsyncTaskDao;

        InsertCategoriesListAsyncTask(CategoryDao categoryDao)
        {
            categoryAsyncTaskDao = categoryDao;
        }

        @Override
        protected Void doInBackground(List<Category>... lists)
        {
            categoryAsyncTaskDao.insertList(lists[0]);
            return null;
        }
    }

    //TODO: optimise
    private void fetchCategories(Context context)
    {
        Gson gson = new Gson();
        JsonReader jsonReader = new JsonReader(context);
        String jsonString = jsonReader.loadJsonFromFile(CATEGORIES_JSON);

        Type listType = new TypeToken<List<Category>>(){}.getType();
        List<Category> categories = gson.fromJson(jsonString, listType);

        new InsertCategoriesListAsyncTask(categoryDao).execute(categories);

        SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor ed = pref.edit();
        ed.putBoolean(PREFERENCE_IS_FETCH_NEEDED_CATEGORIES, false);
        ed.apply();

        mAllCategories = categoryDao.getAllCategories();
    }

    private boolean isFetchNeeded(Context context)
    {
        SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(context);
        return pref.getBoolean(PREFERENCE_IS_FETCH_NEEDED_CATEGORIES, true);
    }
}
