package factory;

import org.json.JSONException;
import org.json.JSONObject;
import models.Address;

public class AddressFactory {

    public static Address decodeJSON(JSONObject object) throws JSONException {

        String address;

        try {
            address = object.getString("address1");
        } catch (JSONException e) {
            address = "";
        }

        String city;

        try {
            city = object.getString("city");
        } catch (JSONException e) {
            city = "";
        }

        String country;
        try {
            country = object.getString("country");
        } catch (JSONException e) {
            country = "";
        }


        return new Address(address, city, country);
    }
}