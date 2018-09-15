package factory;

import org.json.JSONException;
import org.json.JSONObject;

import models.CategoryModel;

public class CategoryModelFactory {


    public static CategoryModel decodeJSON(JSONObject object) throws JSONException {
        final String slug = object.getString("slug");
        final String title = object.getString("title");

        return new CategoryModel(slug, title);
    }
}
