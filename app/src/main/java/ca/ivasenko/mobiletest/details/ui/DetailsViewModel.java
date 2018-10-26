package ca.ivasenko.mobiletest.details.ui;

import android.app.Application;
import android.arch.lifecycle.AndroidViewModel;
import android.arch.lifecycle.LiveData;
import android.support.annotation.NonNull;

import ca.ivasenko.mobiletest.resources.data.ResourceRepository;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class DetailsViewModel extends AndroidViewModel
{
    private final ResourceRepository mRepository;
    private LiveData<ResourceObject> mResourceObject;

    public DetailsViewModel(@NonNull Application application)
    {
        super(application);
        mRepository = new ResourceRepository(application);
    }

    public LiveData<ResourceObject> getResourceObject(int objectId)
    {
        if(mResourceObject == null)
            mResourceObject = mRepository.getResourceObject(objectId);
        return mResourceObject;
    }
}
