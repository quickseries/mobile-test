package com.quickseriestest.VacationSpotMain;

import com.quickseriestest.models.VacationSpot;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class VacationSpotPresenterImpl implements VacationSpotPresenter, VacationSpotInteractor.OnFinishedListener {


    private VacationSpotView vacationSpotView;
    private VacationSpotInteractor vacationSpotInteractor;

    public VacationSpotPresenterImpl(VacationSpotView vacationSpotView, VacationSpotInteractor vacationSpotInteractor) {
        this.vacationSpotView = vacationSpotView;
        this.vacationSpotInteractor = vacationSpotInteractor;
    }

    @Override public void onResume() {
        if (vacationSpotView != null) {
            vacationSpotView.showProgress();
        }

        vacationSpotInteractor.searchVacationSpot(this);
    }

    @Override public void onItemClicked(int position) {
        if (vacationSpotView != null) {
            vacationSpotView.showMessage(String.format("Position %d clicked", position + 1));
        }
    }

    @Override public void onDestroy() {
        vacationSpotView = null;
    }

    @Override public void onFinished(List<VacationSpot> vacationSpotList) {
        if (vacationSpotView != null) {
            vacationSpotView.setVacationSpot(vacationSpotList);
            vacationSpotView.hideProgress();
        }
    }

    @Override
    public void onError(Exception e) {
        if (vacationSpotView != null) {
            vacationSpotView.showMessage(String.format("Exception:", e));
        }
    }

    public VacationSpotView getVacationSpotView() {
        return vacationSpotView;
    }
}
