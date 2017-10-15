package com.quickseries.restaurant;

import java.util.List;

/**
 * Created by Anou on 2017-10-14.
 */

public interface RestaurantContract {
    interface View {
        void showRestaurant(List<RestaurantContract.Restaurant> restaurants);

        // TODO: 2017-10-15 Refactor me to handle error properly
        void showError(String message);

        void showComplete();
    }

    interface Presenter {
        void loadRestaurants();
    }

     class Restaurant {

        private final String title;

        public Restaurant(String title) {
            this.title = title;
        }

        public String getTitle() {
            return title;
        }
    }

}
