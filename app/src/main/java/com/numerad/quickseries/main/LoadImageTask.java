package com.numerad.quickseries.main;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.ImageView;
import android.widget.ListView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class LoadImageTask extends AsyncTask<String, Void, Bitmap> {

    // todo context object leak here
    private ImageView imageView;

    public LoadImageTask(ImageView imageView, ListView listView) {
        this.imageView = imageView;
    }

    protected Bitmap doInBackground(String... paths) {
        try {
            URL url = new URL(paths[0]);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoInput(true);
            connection.connect();
            InputStream input = connection.getInputStream();
            return BitmapFactory.decodeStream(input);
        } catch (Exception e) {
            Log.d("LoadImageTask", "Can't load image: " + e.getMessage());
        }
        return null;
    }

    protected void onPostExecute(Bitmap result) {
        imageView.setImageBitmap(result);
    }
}
