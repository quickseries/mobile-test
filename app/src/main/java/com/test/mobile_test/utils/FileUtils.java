package com.test.mobile_test.utils;

import android.content.Context;

import java.io.IOException;
import java.io.InputStream;

public class FileUtils {

    public static String readFile(Context context, String fileName) {
        String data = null;
        try {

            InputStream inputStream = context.getAssets().open(fileName);

            int size = inputStream.available();

            byte[] buffer = new byte[size];

            inputStream.read(buffer);

            inputStream.close();

            data = new String(buffer, "UTF-8");


        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        return data;

    }

}
