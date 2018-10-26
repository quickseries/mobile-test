package ca.ivasenko.mobiletest.resources.data.tasks;

import android.os.AsyncTask;

import java.util.List;

import ca.ivasenko.mobiletest.resources.data.ResourceDao;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class InsertResourceObjectListAsyncTask extends AsyncTask<List<ResourceObject>, Void, Void>
{
    private ResourceDao resourceAsyncTaskDao;

    public InsertResourceObjectListAsyncTask(ResourceDao dao)
    {
        resourceAsyncTaskDao = dao;
    }

    @Override
    protected Void doInBackground(List<ResourceObject>... lists)
    {
        resourceAsyncTaskDao.insertList(lists[0]);
        return null;
    }
}
