package com.quickseries.restaurant;

import com.quickseries.data.Category;
import com.quickseries.data.Restaurant;

import java.util.List;

/**
 * Created by Anou on 2017-10-14.
 */

public interface RestaurantContract {
    interface View {
        void showRestaurant(List<Restaurant> restaurants);

        void showError(String message);

        void showComplete();
    }

    interface Presenter {
        void loadRestaurants();
    }
}
