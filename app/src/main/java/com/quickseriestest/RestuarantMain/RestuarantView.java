package com.quickseriestest.RestuarantMain;

import com.quickseriestest.models.Restuarant;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface RestuarantView {

    void showProgress();

    void hideProgress();

    void setRestuarant(List<Restuarant> restuarantList);

    void showMessage(String message);

    void navigateToMain();

}
