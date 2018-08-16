package com.quickseriestest.VacationSpotMain;

import com.quickseriestest.models.VacationSpot;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface VacationSpotInteractor {

    interface OnFinishedListener {
        void onFinished(List<VacationSpot> vacationSpotList);
        void onError(Exception e);
    }

    void searchVacationSpot(VacationSpotInteractor.OnFinishedListener listener);
}
