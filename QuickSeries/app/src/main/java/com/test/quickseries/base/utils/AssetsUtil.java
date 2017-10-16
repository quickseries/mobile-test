package com.test.quickseries.base.utils;

import android.content.Context;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by elton on 2017-10-15.
 */

public class AssetsUtil {

    public static String readFile(Context context, String filename) {
        BufferedReader reader = null;
        StringBuilder output = new StringBuilder();
        try {
            if (context == null) {
                throw new Error(" Context was null, cannot read file");
            }
            reader = new BufferedReader(new InputStreamReader(context.getAssets().open(filename), "UTF-8"));

            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return output.toString();
    }
}
