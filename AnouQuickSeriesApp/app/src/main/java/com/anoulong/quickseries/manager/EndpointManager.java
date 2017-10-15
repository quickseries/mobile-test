package com.anoulong.quickseries.manager;

import android.content.Context;
import android.content.SharedPreferences;

import com.anoulong.quickseries.R;

import timber.log.Timber;


/**
 * Provide configurations for different environment (prod, dev staging).
 * Define base url store in res/values/config.xml for each specific environment
 * Values are loaded during app build
 */
public class EndpointManager {

    public enum Environment {dev, staging, prod}

    private String backendBaseUrl = "undefined";
    public static final String TAG = EndpointManager.class.getSimpleName();

    public static String PREF_ENV = "env";

    private Environment currentEnvironment;

    private Context context;

    public EndpointManager(Context context) {
        this.context = context;
        Environment savedEnvironment = getSavedEnvironement();
        if (savedEnvironment == null) {
            // Using env from build
            String rawEnv = context.getString(R.string.config_environment);
            setEnvironement(Environment.valueOf(rawEnv));
        }else {
            currentEnvironment = savedEnvironment;
        }

        switch (currentEnvironment) {
            case prod:
                backendBaseUrl = context.getString(R.string.URL_PROD);
                break;
            case staging:
                backendBaseUrl = context.getString(R.string.URL_STAGING);
                break;
            case dev:
            default:
                backendBaseUrl = context.getString(R.string.URL_DEV);
                break;
        }

        Timber.i("Using environment: " + getCurrentEnvironment());
    }

    public String getBackendBaseUrl() {
        return backendBaseUrl;
    }

    public Environment getCurrentEnvironment() {
        return currentEnvironment;
    }

    private Environment getSavedEnvironement() {
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREF_ENV, Context.MODE_PRIVATE);
        if (sharedPreferences.contains(context.getString(R.string.pref_key_env))) {
            Timber.i( "Environment found on disk");
            return Environment.valueOf(sharedPreferences.getString(context.getString(R.string.pref_key_env), null));
        }
        Timber.i( "Environment not found on disk, using build default");
        return null;
    }

    public void setEnvironement(Environment env) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREF_ENV, Context.MODE_PRIVATE);
        sharedPreferences.edit().putString(context.getString(R.string.pref_key_env), env.toString()).apply();
        currentEnvironment = env;
    }
}
