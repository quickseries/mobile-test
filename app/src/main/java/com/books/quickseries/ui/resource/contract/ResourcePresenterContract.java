package com.books.quickseries.ui.resource.contract;

import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.model.Resource;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public interface ResourcePresenterContract {


    void onViewCreated(int resourceId);
    void onResourceItemClicked(Resource resource);
    void sortList(List<Resource> categories);

}
