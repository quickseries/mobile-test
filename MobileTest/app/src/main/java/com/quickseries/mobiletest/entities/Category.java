package com.quickseries.mobiletest.entities;

import org.json.JSONException;
import org.json.JSONObject;

public class Category {
    private static final String SLUG = "slug";
    private static final String TITLE = "title";
    private String slug;
    private String title;

    public Category(JSONObject jsonObject) throws JSONException {
        this.title = jsonObject.getString(TITLE);
        String str = jsonObject.getString(SLUG);
        if (title.equalsIgnoreCase("Vacation Spots"))
            str = str.substring(0, str.length() - 1);
        this.slug = str;
    }

    public String getSlug() {
        return slug;
    }

    public String getTitle() {
        return title;
    }
}
