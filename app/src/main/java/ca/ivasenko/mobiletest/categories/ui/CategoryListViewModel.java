package ca.ivasenko.mobiletest.categories.ui;

import android.app.Application;
import android.arch.lifecycle.AndroidViewModel;
import android.arch.lifecycle.LiveData;
import android.support.annotation.NonNull;

import java.util.List;

import ca.ivasenko.mobiletest.categories.data.CategoryRepository;
import ca.ivasenko.mobiletest.categories.model.Category;

public class CategoryListViewModel extends AndroidViewModel
{
    private final CategoryRepository mRepository;
    private LiveData<List<Category>> mAllCategories;

    public CategoryListViewModel(@NonNull Application application)
    {
        super(application);
        mRepository = new CategoryRepository(application);
        mAllCategories = mRepository.getAllCategories();
    }

    LiveData<List<Category>> getAllCategories()
    {
        return mAllCategories;
    }
}
