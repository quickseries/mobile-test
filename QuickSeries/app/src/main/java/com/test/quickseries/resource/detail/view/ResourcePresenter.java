package com.test.quickseries.resource.detail.view;

import com.test.quickseries.base.BasePresenter;
import com.test.quickseries.base.model.Resource;

/**
 * Created by elton on 2017-10-15.
 */

public class ResourcePresenter extends BasePresenter {

    interface Viewable {
        void showContent(Resource resource);

        void showError(Throwable thowable);

    }

    private Resource resource;
    private final Viewable viewable;

    public ResourcePresenter(Viewable viewable) {
        this.viewable = viewable;
    }

    public void load(Resource resource) {
        this.resource = resource;
        if (resource != null) {
            post(() -> viewable.showContent(resource));
        } else {
            post(() -> viewable.showError(new Throwable("Resource not found")));
        }
    }


}

