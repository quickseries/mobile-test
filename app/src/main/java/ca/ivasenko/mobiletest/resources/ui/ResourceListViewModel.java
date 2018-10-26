package ca.ivasenko.mobiletest.resources.ui;

import android.app.Application;
import android.arch.lifecycle.AndroidViewModel;
import android.arch.lifecycle.LiveData;
import android.support.annotation.NonNull;

import java.util.List;

import ca.ivasenko.mobiletest.resources.data.ResourceRepository;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class ResourceListViewModel extends AndroidViewModel
{
    private final ResourceRepository mRepository;
    private LiveData<List<ResourceObject>> mAllResources;

    public ResourceListViewModel(@NonNull Application application)
    {
        super(application);
        mRepository = new ResourceRepository(application);
    }

    public LiveData<List<ResourceObject>> getAllResources(String categoryEid)
    {
        if(mAllResources == null)
            mAllResources = mRepository.getAllResources(categoryEid);
        return mAllResources;
    }
}
