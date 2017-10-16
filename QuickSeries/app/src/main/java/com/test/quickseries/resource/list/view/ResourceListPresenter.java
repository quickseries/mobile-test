package com.test.quickseries.resource.list.view;

import android.content.Context;

import com.test.quickseries.base.BasePresenter;
import com.test.quickseries.base.model.Resource;
import com.test.quickseries.base.utils.Callback;
import com.test.quickseries.resource.list.datasource.ResourceDatasource;
import com.test.quickseries.resource.list.datasource.ResourceLocalDataSource;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class ResourceListPresenter extends BasePresenter {

    interface Viewable {
        void showContent(List<Resource> result);

        void showError(Throwable thowable);
    }

    private final Viewable viewable;
    private ResourceDatasource datasource;

    ResourceListPresenter(Viewable viewable) {
        this.viewable = viewable;
        this.datasource = new ResourceLocalDataSource();
    }

    void loadByCategory(Context context, String category_eid) {
        datasource.loadByCategory(context, category_eid, new Callback<List<Resource>>() {
            @Override
            public void onSuccess(final List<Resource> result) {
                post(() -> viewable.showContent(result));
            }

            @Override
            public void onFailure(final Throwable thowable) {
                post(() -> viewable.showError(thowable));

            }
        });
    }


}
