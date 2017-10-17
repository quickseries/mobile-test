package com.test.quickseries.resource.list.datasource;

import android.content.Context;

import com.test.quickseries.base.model.Resource;
import com.test.quickseries.base.utils.Callback;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public interface ResourceDatasource {

    void loadByCategory(Context context, String category_eid, Callback<List<Resource>> callback);

}
