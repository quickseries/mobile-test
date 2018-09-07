package com.books.quickseries.ui.resource;

import com.books.quickseries.data.DataManager;
import com.books.quickseries.data.local.DataHelper;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.data.preference.PrefHelper;
import com.books.quickseries.ui.base.BasePresenter;
import com.books.quickseries.ui.resource.contract.ResourcePresenterContract;
import com.books.quickseries.ui.resource.contract.ResourceViewContract;
import com.books.quickseries.utils.AppConstants;
import com.books.quickseries.utils.sort.SortCategory;
import com.books.quickseries.utils.sort.SortResource;

import java.util.Collections;
import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public class ResourcePresenter extends BasePresenter implements ResourcePresenterContract {


    private ResourceViewContract viewContract;

    public ResourcePresenter(DataManager dataManager) {
        super(dataManager);
    }

    public ResourcePresenter(ResourceViewContract viewContract) {
        super(DataManager.getInstance(viewContract.getContext(), new DataHelper(), new PrefHelper()));
        this.viewContract = viewContract;
    }

    @Override
    public void onViewCreated(int resourceId) {
        if (resourceId == AppConstants.CATEGORY_RESTAURANTS) {
            viewContract.showResources(getDataManager().getAllRestaurants());
        } else {
            viewContract.showResources(getDataManager().getAllVacation());
        }
    }

    @Override
    public void onResourceItemClicked(Resource resource) {
        viewContract.openResourceDialog(resource);
    }

    @Override
    public void sortList(List<Resource> resources) {
        Collections.sort(resources, new SortResource());
        viewContract.showResources(resources);
    }
}
