package com.numerad.quickseries.domain;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.NonNull;

import static com.numerad.quickseries.main.MainActivity.STATE_PREFERENCES;

public class StorageImpl implements
        Storage {

    private final Context context;
    private final SharedPreferences preferences;
    private static final int PREFERENCES_VERSION = 1;

    private static final String KEY_PREFERENCES_VERSION = "preferencesVersion";
    private static final String KEY_APP_VERSION = "appVersion";
    private static final String KEY_NUM_DISC = "numdiscs";

    public StorageImpl(@NonNull Context context) {

        this.context = context;
        preferences = context.getSharedPreferences(STATE_PREFERENCES, Context.MODE_PRIVATE);

        migrations();
    }

    private void migrations() {

        // prefs update migration
        int oldVersion = getPreferencesVersion();
        int newVersion = PREFERENCES_VERSION;
        if (oldVersion < newVersion) {
            SharedPreferences.Editor editor = preferences.edit();
            editor.clear();
            editor.putInt(KEY_PREFERENCES_VERSION, newVersion);
            editor.apply();
            return;
        }
    }

    @Override
    public void clear() {
        preferences.edit().clear().apply();
    }

    @Override
    public boolean isEmpty() {
        return preferences.getAll().isEmpty();
    }

    @Override
    public int getPreferencesVersion() {
        return preferences.getInt(KEY_PREFERENCES_VERSION, 1);
    }

    @Override
    public int getNumDiscs() {
        return preferences.getInt(KEY_NUM_DISC, 1);
    }

    @Override
    public void setNumDiscs(int value) {
        SharedPreferences.Editor editor = preferences.edit();
        editor.putInt(KEY_NUM_DISC, value).apply();
    }

}
