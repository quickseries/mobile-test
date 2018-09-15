package factory;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import models.Address;
import models.CategoryModel;
import models.ContactInfo;
import models.ResourceModel;

public class ResourceModelFactory {

    public static ResourceModel decodeJSON(JSONObject object) throws JSONException {
        final String title = object.getString("title");

        ArrayList<Address> addressList = new ArrayList<>();
        try {
            final JSONArray addressArray = object.getJSONArray("addresses");

            for (int i = 0; i < addressArray.length(); i++) {
                final Address address = AddressFactory.decodeJSON(addressArray
                        .getJSONObject(i));
                addressList.add(address);
            }

        } catch (JSONException e) {
            addressList = null;
        }

        ContactInfo contactInfo;
        try {
            contactInfo = ContactInfoFactory.decodeJSON(object.getJSONObject("contactInfo"));
        } catch (JSONException e) {
            contactInfo = null;
        }

        return new ResourceModel(title, addressList, contactInfo);
    }
}
