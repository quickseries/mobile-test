package com.quickseriestest.RestuarantMain;

import com.quickseriestest.models.Restuarant;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface RestuarantInteractor {

    interface OnFinishedListener {
        void onFinished(List<Restuarant> restuarantList);
        void onError(Exception e);
    }

    void searchRestuarant(RestuarantInteractor.OnFinishedListener listener);
}
