package com.quickseriestest.VacationSpotMain;

import android.content.Context;
import android.os.Handler;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.quickseriestest.R;
import com.quickseriestest.models.VacationSpot;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class VacationSpotInteractorImpl implements VacationSpotInteractor {
    
    Context mContext = null;

    public VacationSpotInteractorImpl(Context mContext) {
            this.mContext = mContext;
        }

        @Override
        public void searchVacationSpot(final OnFinishedListener listener) {

            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        listener.onFinished(parseVacationSpotsFromRawFile(R.raw.vacationspot));
                    } catch (IOException e) {
                        listener.onError(e);
                    }
                }
            }, 2000);


        }


        private List<VacationSpot> parseVacationSpotsFromRawFile(int resId) throws IOException {
            InputStream inputStream = mContext.getResources().openRawResource(resId);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();

            int x = -1;
            byte[] buffer = new byte[1024];
            while ((x = inputStream.read(buffer, 0, buffer.length)) != -1) {
                bos.write(buffer, 0, x);
            }
            inputStream.close();

            String json = bos.toString();
            return getVacationSpotFromJson(json);

        }

        private List<VacationSpot> getVacationSpotFromJson(String json) {
            Type listType = new TypeToken<ArrayList<VacationSpot>>() {
            }.getType();
            List<VacationSpot> vacationSpotList = new Gson().fromJson(json, listType);
            return vacationSpotList;
        }


    }
