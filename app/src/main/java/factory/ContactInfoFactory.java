package factory;

import org.json.JSONException;
import org.json.JSONObject;
import models.ContactInfo;

public class ContactInfoFactory {

    public static ContactInfo decodeJSON(JSONObject object) throws JSONException {

        String phone = "";

        try {
           phone = object.getString("phoneNumber");
        } catch (JSONException e) {
            phone = "";
        }
        String website;

        try {
            website = object.getString("website");
        } catch (JSONException e) {
            website = "";
        }

        String email;

        try {
            email = object.getString("email");
        } catch (JSONException e) {
            email = "";
        }

        String fax;

        try {
            fax = object.getString("faxNumber");
        } catch (JSONException e) {
            fax = "";
        }



        String tollPhone;

        try {
            tollPhone = object.getString("tollFree");
        } catch (JSONException e) {
            tollPhone = "";
        }


        return new ContactInfo(phone, website, email, fax, tollPhone);
    }
}