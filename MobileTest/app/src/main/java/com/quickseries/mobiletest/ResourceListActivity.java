package com.quickseries.mobiletest;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.quickseries.mobiletest.tasks.GenerateResourceTask;

public class ResourceListActivity extends AppCompatActivity {

    public static final String CATEGORY_ID = "category_id";
    private String category;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_resource_list);
        category = getIntent().getStringExtra(CATEGORY_ID);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());

        // Show the Up button in the action bar.
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
            actionBar.setTitle(category.toUpperCase());
        }

        View recyclerView = findViewById(R.id.resource_list);
        assert recyclerView != null;
        setupRecyclerView((RecyclerView) recyclerView);
    }

    private void setupRecyclerView(@NonNull RecyclerView recyclerView) {
        String url = getString(R.string.url, category);
        new GenerateResourceTask(this, recyclerView).execute(url);
    }
}
