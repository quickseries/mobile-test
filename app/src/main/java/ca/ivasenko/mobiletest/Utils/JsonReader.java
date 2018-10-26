package ca.ivasenko.mobiletest.Utils;

import android.content.Context;

import java.io.IOException;
import java.io.InputStream;

public class JsonReader
{

    private Context context;

    public JsonReader(Context context){
        this.context = context;
    }

    public String loadJsonFromFile(String filename)
    {
        if (filename == null)
            return null;

        String jsonString = null;
        try {
            InputStream is = context.getAssets().open(filename);
            byte[] buffer = new byte[is.available()];
            is.read(buffer);
            is.close();
            jsonString = new String(buffer);
        }
        catch (IOException exception){
            exception.printStackTrace();
        }
        return jsonString;
    }
}
