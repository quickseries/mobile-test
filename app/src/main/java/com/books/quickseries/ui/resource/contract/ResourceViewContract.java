package com.books.quickseries.ui.resource.contract;

import android.content.Context;

import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.model.Resource;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public interface ResourceViewContract {

    void showResources(List<Resource> resources);
    Context getContext();
    void openResourceDialog(Resource resource);
}
