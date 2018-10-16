package mobiletest.yucef.ca.mobiletest.model;

public class Address {
    String address1;
    String label;
    String zipCode;
    String city;
    String state;
    String country;
    Long latitude;
    Long longitude;

    public Address(String address1, String label, String zipCode, String city, String state, String country, Long latitude, Long longitude) {
        this.address1 = address1;
        this.label = label;
        this.zipCode = zipCode;
        this.city = city;
        this.state = state;
        this.country = country;
        this.latitude = latitude;
        this.longitude = longitude;
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

    public Long getLatitude() {
        return latitude;
    }

    public Long getLongitude() {
        return longitude;
    }
}
