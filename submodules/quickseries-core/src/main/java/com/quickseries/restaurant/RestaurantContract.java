package com.quickseries.restaurant;

import java.io.Serializable;
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

        /**
         * Call when a restaurant is being selected
         *
         * @param restaurant
         */
        void didSelectRestaurant(Restaurant restaurant);

        /**
         * Call when a restaurant sorted ascending
         *
         * @param restaurants
         */
        void sortAscending(List<RestaurantContract.Restaurant> restaurants);

        /**
         * Call when a restaurant sorted descending
         *
         * @param restaurants
         */
        void sortDescending(List<RestaurantContract.Restaurant> restaurants);
    }

    class Restaurant implements Serializable {

        private final String title;
        private final String description;
        private final String photo;

        public Restaurant(String title, String description, String photo) {
            this.title = title;
            this.description = description;
            this.photo = photo;
        }

        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }

        public String getPhoto() {
            return photo;
        }
    }


    interface Router {
        void showRestaurantDetailsScreen(Restaurant restaurant);
    }
}
