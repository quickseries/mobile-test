package com.quickseries.vacation;

import com.quickseries.restaurant.RestaurantContract;

import java.util.List;

/**
 * Created by Anou on 2017-10-15.
 */

public interface VacationContract {
    interface View {
        void showVacationSpots(List<Vacation> vacations);

        // TODO: 2017-10-15 Refactor me to handle error properly
        void showError(String message);

        void showComplete();
    }

    interface Presenter {
        void loadVacationSpots();

        /**
         * Call when a vacation spot is being selected
         *
         * @param vacation
         */
        void didSelectVacation(VacationContract.Vacation vacation);
    }

    class Vacation {

        private final String title;
        private final String description;
        private final String photo;

        public Vacation(String title, String description, String photo) {
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
        void showVacationDetailsScreen(VacationContract.Vacation vacation);
    }
}
