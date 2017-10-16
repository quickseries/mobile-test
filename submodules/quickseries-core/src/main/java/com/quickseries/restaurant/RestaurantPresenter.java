package com.quickseries.restaurant;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import retrofit2.Retrofit;
import retrofit2.http.GET;
import rx.Observable;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by Anou on 2017-10-14.
 */

public class RestaurantPresenter implements RestaurantContract.Presenter {

    public Retrofit retrofit;
    RestaurantContract.View mView;
    private RestaurantContract.Router router;

    public RestaurantPresenter(Retrofit retrofit, RestaurantContract.View mView, RestaurantContract.Router router) {
        this.retrofit = retrofit;
        this.mView = mView;
        this.router = router;
    }

    @Override
    public void loadRestaurants() {
        retrofit.create(GetRestaurantOperation.class)
                .fetchRestaurants()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .unsubscribeOn(Schedulers.io())
                .subscribe(new Observer<List<RestaurantContract.Restaurant>>() {
                    @Override
                    public void onCompleted() {
                        mView.showComplete();
                    }

                    @Override
                    public void onError(Throwable e) {
                        mView.showError(e.getMessage());
                    }

                    @Override
                    public void onNext(List<RestaurantContract.Restaurant> restaurants) {
                        mView.showRestaurant(restaurants);
                    }
                });
    }

    @Override
    public void didSelectRestaurant(RestaurantContract.Restaurant restaurant) {
        router.showRestaurantDetailsScreen(restaurant);
    }

    @Override
    public void sortAscending(List<RestaurantContract.Restaurant> restaurants) {
        Collections.sort(restaurants, new Comparator<RestaurantContract.Restaurant>() {
            @Override
            public int compare(RestaurantContract.Restaurant r1, RestaurantContract.Restaurant r2) {
                return r1.getTitle().compareTo(r2.getTitle());
            }
        });
        mView.showRestaurant(restaurants);

    }

    @Override
    public void sortDescending(List<RestaurantContract.Restaurant> restaurants) {
        Collections.sort(restaurants, new Comparator<RestaurantContract.Restaurant>() {
            @Override
            public int compare(RestaurantContract.Restaurant r1, RestaurantContract.Restaurant r2) {
                return r2.getTitle().compareTo(r1.getTitle());
            }
        });

        mView.showRestaurant(restaurants);
    }

    // This could be a use case
    public interface GetRestaurantOperation {
        @GET("restaurants.json")
        Observable<List<RestaurantContract.Restaurant>> fetchRestaurants();
    }
}