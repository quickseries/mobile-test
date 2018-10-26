package ca.ivasenko.mobiletest.resources.data;

import android.app.Application;
import android.arch.lifecycle.LiveData;

import java.util.List;

import ca.ivasenko.mobiletest.Utils.SyncHelper;
import ca.ivasenko.mobiletest.data.AppRoomDatabase;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class ResourceRepository
{
    private ResourceDao resourceDao;

    private LiveData<List<ResourceObject>> mAllResources;
    private LiveData<ResourceObject> mResourceObject;

    public ResourceRepository(Application application)
    {
        AppRoomDatabase db = AppRoomDatabase.getDatabase(application);
        resourceDao = db.resourceDao();
        SyncHelper helper = new SyncHelper(application.getBaseContext());
        helper.checkAndFetchIfNeeded(resourceDao);
    }

    public LiveData<List<ResourceObject>> getAllResources(String categoryEid)
    {
        if(mAllResources == null)
            mAllResources = resourceDao.getAllResources(categoryEid);
        return mAllResources;
    }

    public LiveData<ResourceObject> getResourceObject(int objectId)
    {
        if(mResourceObject == null)
            mResourceObject = resourceDao.getResourceObject(objectId);
        return mResourceObject;
    }
}
