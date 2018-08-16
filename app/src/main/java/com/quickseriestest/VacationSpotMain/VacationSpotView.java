package com.quickseriestest.VacationSpotMain;

import com.quickseriestest.models.VacationSpot;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface VacationSpotView {
    
    void showProgress();

    void hideProgress();

    void setVacationSpot(List<VacationSpot> vacationSpotList);

    void showMessage(String message);

    void navigateToMain();
}
