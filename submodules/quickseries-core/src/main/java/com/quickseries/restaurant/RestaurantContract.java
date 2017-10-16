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

    public   class Restaurant implements Serializable {

        private final String title;
        private final String description;
        private final String photo;
        private final List<Address> addresses;
        private final ContactInfo contactInfo;

        public Restaurant(String title, String description, String photo, List<Address> addresses, ContactInfo contactInfo) {
            this.title = title;
            this.description = description;
            this.photo = photo;
            this.addresses = addresses;
            this.contactInfo = contactInfo;
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

        public List<Address> getAddresses() {
            return addresses;
        }

        public ContactInfo getContactInfo() {
            return contactInfo;
        }

        public  class Address implements Serializable {
            private final String address1;
            private final String label;
            private final String zipCode;
            private final String city;
            private final String state;
            private final String country;
            private final Gps gps;

            public Address(String address1, String label, String zipCode, String city, String state, String country, Gps gps) {
                this.address1 = address1;
                this.label = label;
                this.zipCode = zipCode;
                this.city = city;
                this.state = state;
                this.country = country;
                this.gps = gps;
            }

            public String getAddress1() {
                return address1;
            }

            public String getLabel() {
                return label;
            }

            public String getZipCode() {
                return zipCode;
            }

            public String getCity() {
                return city;
            }

            public String getState() {
                return state;
            }

            public String getCountry() {
                return country;
            }

            public Gps getGps() {
                return gps;
            }

            class Gps implements Serializable{
                private double latitude;
                private double longitude;

                public Gps(double latitude, double longitude) {
                    this.latitude = latitude;
                    this.longitude = longitude;
                }

                public double getLatitude() {
                    return latitude;
                }

                public double getLongitude() {
                    return longitude;
                }
            }

        }

        public  class ContactInfo implements Serializable{
            private final List<String> website;
            private final List<String> email;
            private final List<String> phoneNumber;

            public ContactInfo(List<String> website, List<String> email, List<String> phoneNumber) {
                this.website = website;
                this.email = email;
                this.phoneNumber = phoneNumber;
            }

            public List<String> getWebsite() {
                return website;
            }

            public List<String> getEmail() {
                return email;
            }

            public List<String> getPhoneNumber() {
                return phoneNumber;
            }
        }
    }


    interface Router {
        void showRestaurantDetailsScreen(Restaurant restaurant);
    }
}
