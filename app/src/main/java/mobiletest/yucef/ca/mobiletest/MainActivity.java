package mobiletest.yucef.ca.mobiletest;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
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

public class MainActivity extends AppCompatActivity {
    private static class Category {
        String title;
        String description;
        String path;

        Category(String title, String description, String path) {
            this.title = title;
            this.description = description;
            this.path = path;
        }
    }

    private static class CategoryAdapter extends RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder>{
        Context context;
        List<Category> categories;

        private CategoryAdapter() {
        }

        public CategoryAdapter(Context context, List<Category> categories) {
            this.context = context;
            this.categories = categories;
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
            categoryViewHolder.title.setText(categories.get(position).title);
            categoryViewHolder.description.setText(categories.get(position).description);
            categoryViewHolder.cv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(context, ResourcesActivity.class);
                    intent.putExtra(ResourcesActivity.RESOURCES_PATH_EXTRA, categories.get(position).path);
                    context.startActivity(intent);
                }
            });
        }

        @Override
        public int getItemCount() {
            return categories.size();
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
        recyclerView.setAdapter(new CategoryAdapter(this, getCategoriesFromFile()));
    }

    private List<Category> getCategoriesFromFile(){
        List<Category> categories = null;
        try {
            categories = new ArrayList<>();
            JSONArray categoriesJSONArray = new JSONArray(loadJSONFromAsset(this, "categories.json"));

            for (int i = 0; i < categoriesJSONArray.length(); i++) {
                JSONObject category = categoriesJSONArray.getJSONObject(i);
                categories.add(new Category(category.optString("title", "Title"),
                        category.optString("description", "Description"),
                        category.getString("slug")));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return categories;
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
