package com.books.quickseries.utils;

import android.app.Activity;
import android.content.Context;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by zakir on 06/09/2018.
 */

public class CommonUtils {

    public static String loadStringFromJson(Context activity, String fileName) {
        String json = null;
        try {
            InputStream is = activity.getAssets().open(fileName);
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        return json;
    }

    public static String isNullOrEmpty(String s) {
        if(s == null)
            return "";
        else
            return s;
    }

}
