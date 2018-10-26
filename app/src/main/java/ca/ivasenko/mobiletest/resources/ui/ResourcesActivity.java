package ca.ivasenko.mobiletest.resources.ui;

import android.arch.lifecycle.Observer;
import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Menu;
import android.view.MenuItem;

import java.util.List;

import ca.ivasenko.mobiletest.R;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class ResourcesActivity extends AppCompatActivity
{
    public static final String EID_EXTRA = "category_eid";
    public static final String RESOURCE_OBJECT_ID_EXTRA = "resource_object_id";
    private ResourcesContentAdapter adapter;
    private boolean sortOrderAlphabetical;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_resources);
        setTitle(R.string.activity_resources_title);

        String categoryEid = getIntent().getStringExtra(EID_EXTRA);

        RecyclerView recyclerView = findViewById(R.id.recyclerview);
        int tilePadding = getResources().getDimensionPixelSize(R.dimen.tile_padding);
        recyclerView.setPadding(tilePadding, tilePadding, tilePadding, tilePadding);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);
        DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(recyclerView.getContext(),
                layoutManager.getOrientation());
        recyclerView.addItemDecoration(dividerItemDecoration);

        adapter = new ResourcesContentAdapter(this);
        recyclerView.setAdapter(adapter);

        ResourceListViewModel categoryListViewModel = ViewModelProviders.of(this).get(ResourceListViewModel.class);
        categoryListViewModel.getAllResources(categoryEid).observe(this, new Observer<List<ResourceObject>>()
        {
            @Override
            public void onChanged(@Nullable List<ResourceObject> resources)
            {
                adapter.setResources(resources);
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_resources, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        switch (item.getItemId())
        {
            case R.id.action_sort:
                if (adapter != null){
                    adapter.sort(!sortOrderAlphabetical);
                }
                sortOrderAlphabetical = !sortOrderAlphabetical;
                return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
