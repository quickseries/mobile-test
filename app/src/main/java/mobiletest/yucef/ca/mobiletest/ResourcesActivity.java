package mobiletest.yucef.ca.mobiletest;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import mobiletest.yucef.ca.mobiletest.model.Resource;

public class ResourcesActivity extends AppCompatActivity {
    public static final String RESOURCES_PATH_EXTRA = "resources-path";
    private String resourcesPath;

    private static class ResourceAdapter extends RecyclerView.Adapter<ResourceAdapter.CategoryViewHolder>{
        Context context;
        List<Resource> resources;
        String resourcesPath;

        private ResourceAdapter() {
        }

        public ResourceAdapter(Context context, List<Resource> resources, String resourcesPath) {
            this.context = context;
            this.resources = resources;
            this.resourcesPath = resourcesPath;
        }

        @NonNull
        @Override
        public CategoryViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_view_title_description, parent, false);
            CategoryViewHolder categoryViewHolder = new CategoryViewHolder(v);
            return categoryViewHolder;
        }

        @Override
        public void onBindViewHolder(@NonNull CategoryViewHolder categoryViewHolder, final int position) {
            categoryViewHolder.title.setText(resources.get(position).getTitle());
            categoryViewHolder.description.setText(Html.fromHtml(resources.get(position).getDescription()));
            categoryViewHolder.cv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(context, ResourceActivity.class);
                    intent.putExtra(RESOURCES_PATH_EXTRA, resourcesPath);
                    intent.putExtra(ResourceActivity.RESOURCE_ID_EXTRA, resources.get(position).getId());
                    context.startActivity(intent);
                }
            });
        }

        @Override
        public int getItemCount() {
            return resources.size();
        }

        public static class CategoryViewHolder extends RecyclerView.ViewHolder {
            CardView cv;
            TextView title;
            TextView description;

            CategoryViewHolder(View itemView) {
                super(itemView);
                cv = (CardView)itemView.findViewById(R.id.cv);
                title = (TextView)itemView.findViewById(R.id.title);
                description = (TextView)itemView.findViewById(R.id.description);
            }
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recyclerview);

        RecyclerView recyclerView = findViewById(R.id.recycler_view);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        resourcesPath = getIntent().getStringExtra(RESOURCES_PATH_EXTRA);
        recyclerView.setAdapter(new ResourceAdapter(this, getResourcesFromFile(resourcesPath), resourcesPath));
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.resource_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }

    private List<Resource> getResourcesFromFile(String path){
        path = path + ".json";
        List<Resource> resources = null;
        try {
            resources = new ArrayList<>();
            JSONArray categoriesJSONArray = new JSONArray(loadJSONFromAsset(this, path));

            for (int i = 0; i < categoriesJSONArray.length(); i++) {
                JSONObject category = categoriesJSONArray.getJSONObject(i);
                resources.add(new Resource(category.optString("_id"), category.optString("title", "Title"),
                        category.optString("description", "Description"),
                        null, null, null, null));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return resources;
    }

    public String loadJSONFromAsset(Context context, String fileName) {
        String json;

        try {
            InputStream is = context.getAssets().open(fileName);
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
}
