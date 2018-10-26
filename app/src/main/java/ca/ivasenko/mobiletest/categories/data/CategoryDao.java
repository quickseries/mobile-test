package ca.ivasenko.mobiletest.categories.data;

import android.arch.lifecycle.LiveData;
import android.arch.persistence.room.Dao;
import android.arch.persistence.room.Insert;
import android.arch.persistence.room.Query;

import java.util.List;

import ca.ivasenko.mobiletest.categories.model.Category;

@Dao
public interface CategoryDao
{
    @Query("SELECT * from categories")
    LiveData<List<Category>> getAllCategories();

    @Insert
    long insert(Category category);

    @Insert
    void insertList(List<Category> list);
}
