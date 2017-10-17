package com.test.quickseries.category.view;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.LinearLayoutManager;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import com.test.quickseries.R;
import com.test.quickseries.base.BaseActivity;
import com.test.quickseries.base.Const;
import com.test.quickseries.base.ListInteractor;
import com.test.quickseries.base.model.Category;
import com.test.quickseries.category.adapter.CategoryAdapter;
import com.test.quickseries.databinding.ActivityCategoryListBinding;
import com.test.quickseries.resource.list.view.ResourceListActivity;

import java.util.List;

public class CategoryActivity extends BaseActivity implements CategoryPresenter.Viewable, ListInteractor<Category> {

    ActivityCategoryListBinding binding;
    CategoryPresenter presenter;
    CategoryAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_category_list);
        presenter = new CategoryPresenter(this);
        setupActionBar();

        setupDrawerMenu();
        onNewIntent(getIntent());
    }

    private void setupActionBar() {
        setSupportActionBar(binding.toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayShowTitleEnabled(true);
            getSupportActionBar().setTitle(getString(R.string.categories_title));
        }
    }

    private void setupDrawerMenu() {
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, binding.drawerLayout, binding.toolbar, R.string.drawer_open, R.string.drawer_closed) {
            @Override
            public void onDrawerSlide(View drawerView, float slideOffset) {
                super.onDrawerSlide(drawerView, slideOffset);
            }
        };
        binding.drawerLayout.addDrawerListener(toggle);
        toggle.syncState();

        binding.navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                binding.drawerLayout.closeDrawer(GravityCompat.START);
                Toast.makeText(CategoryActivity.this, "Wait for the next big feature!!", Toast.LENGTH_SHORT).show();
                return false;
            }
        });
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        presenter.load(this);

    }

    @Override
    public void showContent(List<Category> result) {
        setupAdapter();
        adapter.setItems(result);
    }

    private void setupAdapter() {
        if (adapter == null) {
            adapter = new CategoryAdapter(this);
            binding.categoriesRecyclerView.setLayoutManager(new LinearLayoutManager(this));
            binding.categoriesRecyclerView.setHasFixedSize(true);
            binding.categoriesRecyclerView.setAdapter(adapter);
        }
    }

    @Override
    public void showError(Throwable thowable) {
        Toast.makeText(this, getString(R.string.generic_error, thowable.getMessage()), Toast.LENGTH_LONG).show();
    }

    @Override
    public void onClick(Category item) {
        if (item != null) {
            Intent intent = new Intent(this, ResourceListActivity.class);
            Bundle bundle = new Bundle();
            bundle.putString(Const.ID, item.getEid());
            bundle.putString(Const.TITLE, item.getTitle());
            intent.putExtras(bundle);
            startActivity(intent);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        if (presenter != null)
            presenter.onStart();
    }

    @Override
    protected void onStop() {
        if (presenter != null)
            presenter.onStop();
        super.onStop();
    }


    @Override
    protected void onDestroy() {
        if (presenter != null)
            presenter.onDestroy();
        super.onDestroy();
    }

}
