package com.quickseries.restaurant;

/**
 * Created by Anou on 2017-10-14.
 */

public class RestaurantPresenter implements RestaurantContract.Presenter {
    @Override
    public void loadRestaurants() {

    }
//
//    public Retrofit retrofit;
//    RestaurantContract.View mView;
//
//    @Inject
//    public RestaurantPresenter(Retrofit retrofit, RestaurantContract.View mView) {
//        this.retrofit = retrofit;
//        this.mView = mView;
//    }
//
//    @Override
//    public void loadRestaurants() {
//        retrofit.create(GetRestaurantOperation.class).fetchRestaurants().subscribeOn(Schedulers.io())
//                .observeOn(AndroidSchedulers.mainThread())
//                .unsubscribeOn(Schedulers.io())
//                .subscribe(new Observer<List<Restaurant>>() {
//                    @Override
//                    public void onCompleted() {
//                        mView.showComplete();
//                    }
//
//                    @Override
//                    public void onError(Throwable e) {
//                        mView.showError(e.getMessage());
//                    }
//
//                    @Override
//                    public void onNext(List<Restaurant> restaurants) {
//                        mView.showRestaurant(restaurants);
//                    }
//                });
//    }
//
//    public interface GetRestaurantOperation {
//        @GET("/restaurants.json")
//        Observable<List<Restaurant>> fetchRestaurants();
//    }
}