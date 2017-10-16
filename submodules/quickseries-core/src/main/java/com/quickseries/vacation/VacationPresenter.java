package com.quickseries.vacation;

import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.restaurant.RestaurantPresenter;

import java.util.List;

import retrofit2.Retrofit;
import retrofit2.http.GET;
import rx.Observable;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by Anou on 2017-10-15.
 */

public class VacationPresenter implements VacationContract.Presenter {

    public Retrofit retrofit;
    VacationContract.View mView;
    VacationContract.Router router;

    public VacationPresenter(Retrofit retrofit, VacationContract.View mView, VacationContract.Router router) {
        this.retrofit = retrofit;
        this.mView = mView;
        this.router = router;
    }

    @Override
    public void loadVacationSpots() {
        retrofit.create(VacationPresenter.GetVacationOperation.class)
                .fetchVacations()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .unsubscribeOn(Schedulers.io())
                .subscribe(new Observer<List<VacationContract.Vacation>>() {
                    @Override
                    public void onCompleted() {
                        mView.showComplete();
                    }

                    @Override
                    public void onError(Throwable e) {
                        mView.showError(e.getMessage());
                    }

                    @Override
                    public void onNext(List<VacationContract.Vacation> vacations) {
                        mView.showVacationSpots(vacations);
                    }
                });
    }

    @Override
    public void didSelectVacation(VacationContract.Vacation vacation) {
        router.showVacationDetailsScreen(vacation);
    }

    // This could be a use case
    public interface GetVacationOperation {
        @GET("vacation-spot.json")
        Observable<List<VacationContract.Vacation>> fetchVacations();
    }
}
