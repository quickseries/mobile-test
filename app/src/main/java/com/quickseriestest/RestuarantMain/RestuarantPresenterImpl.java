package com.quickseriestest.RestuarantMain;

import com.quickseriestest.models.Restuarant;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class RestuarantPresenterImpl implements RestuarantPresenter, RestuarantInteractor.OnFinishedListener {


    private RestuarantView restuarantView;
    private RestuarantInteractor restuarantInteractor;
    private Restuarant selectedRestuarant;
    private List<Restuarant> restuarantList = new ArrayList<>();

    public RestuarantPresenterImpl(RestuarantView restuarantView, RestuarantInteractor restuarantInteractor) {
        this.restuarantView = restuarantView;
        this.restuarantInteractor = restuarantInteractor;
    }

    public RestuarantPresenterImpl() {
    }

    @Override public void onResume() {
        if (restuarantView != null) {
            restuarantView.showProgress();
        }

        restuarantInteractor.searchRestuarant(this);
    }

    @Override public void onItemClicked(int position) {
        if (restuarantView != null) {
            restuarantView.showMessage(String.format("Position %d clicked", position + 1));
        }
    }

    @Override public void onDestroy() {
        restuarantView = null;
    }

    @Override
    public void setSelected(Restuarant restuarant) {
        this.selectedRestuarant = restuarant;
    }

    @Override
    public void onSortClicked() {
        if (restuarantView != null) {
            Collections.sort(restuarantList);
            restuarantView.setRestuarant(restuarantList);
        }
    }

    @Override
    public void onDoubleSortClicked() {
        if (restuarantView != null) {
            Collections.reverse(restuarantList);
            restuarantView.setRestuarant(restuarantList);
        }

    }

    @Override public void onFinished(List<Restuarant> restuarantList) {
        if (restuarantView != null) {
            restuarantView.setRestuarant(restuarantList);
            this.restuarantList = restuarantList;
            restuarantView.hideProgress();
        }
    }

    @Override
    public void onError(Exception e) {
        if (restuarantView != null) {
            restuarantView.showMessage(String.format("Exception:", e));
        }
    }

    public RestuarantView getRestuarantView() {
        return restuarantView;
    }
}
