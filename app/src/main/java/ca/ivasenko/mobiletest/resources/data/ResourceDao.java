package ca.ivasenko.mobiletest.resources.data;

import android.arch.lifecycle.LiveData;
import android.arch.persistence.room.Dao;
import android.arch.persistence.room.Delete;
import android.arch.persistence.room.Insert;
import android.arch.persistence.room.Query;

import java.util.List;

import ca.ivasenko.mobiletest.resources.model.ResourceObject;

@Dao
public interface ResourceDao
{
    @Query("SELECT * from resources WHERE categoryeid = :categoryEid")
    LiveData<List<ResourceObject>> getAllResources(String categoryEid);

    @Insert
    void insertList(List<ResourceObject> list);

    @Query("SELECT * from resources WHERE id = :objectId")
    LiveData<ResourceObject> getResourceObject(int objectId);

    @Delete
    void deleteResource(ResourceObject resourceObject);
}
