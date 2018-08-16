package com.quickseriestest.RestuarantMain;

import com.quickseriestest.models.Restuarant;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface RestuarantPresenter {

    void onResume();

    void onItemClicked(int position);

    void onDestroy();

    void setSelected(Restuarant restuarant);

    void onSortClicked();

    void onDoubleSortClicked();

}
