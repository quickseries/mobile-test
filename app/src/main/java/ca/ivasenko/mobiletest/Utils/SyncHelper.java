package ca.ivasenko.mobiletest.Utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import ca.ivasenko.mobiletest.resources.data.ResourceDao;
import ca.ivasenko.mobiletest.resources.data.tasks.InsertResourceObjectListAsyncTask;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class SyncHelper
{
    private static final String PREFERENCE_IS_FETCH_NEEDED_RESOURCE_OBJECTS = "should_fetch_resources";
    private static final String RESTAURANTS_JSON = "restaurants.json";
    private static final String VACATION_SPOTS_JSON = "vacation-spot.json";

    private final Context context;

    public SyncHelper(Context context)
    {
        this.context = context;
    }

    public void checkAndFetchIfNeeded(ResourceDao dao)
    {
        if(isFetchNeeded())
            fetchResourceObjects(dao);
    }

    private void fetchResourceObjects(ResourceDao dao)
    {
        Gson gson = new Gson();
        JsonReader jsonReader = new JsonReader(context);
        Type listType = new TypeToken<List<ResourceObject>>(){}.getType();

        String restaurantsJsonString = jsonReader.loadJsonFromFile(RESTAURANTS_JSON);
        List<ResourceObject> restaurants = gson.fromJson(restaurantsJsonString, listType);

        String vacationSpotsJsonString = jsonReader.loadJsonFromFile(VACATION_SPOTS_JSON);
        List<ResourceObject> vacationSpots = gson.fromJson(vacationSpotsJsonString, listType);

        List<ResourceObject> result = new ArrayList<>();
        result.addAll(restaurants);
        result.addAll(vacationSpots);


        new InsertResourceObjectListAsyncTask(dao).execute(result);

        SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor ed = pref.edit();
        ed.putBoolean(PREFERENCE_IS_FETCH_NEEDED_RESOURCE_OBJECTS, false);
        ed.apply();
    }

    private boolean isFetchNeeded()
    {
        SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(context);
        return pref.getBoolean(PREFERENCE_IS_FETCH_NEEDED_RESOURCE_OBJECTS, true);
    }
}
