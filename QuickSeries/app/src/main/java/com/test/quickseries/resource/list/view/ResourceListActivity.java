package com.test.quickseries.resource.list.view;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.widget.Toast;

import com.test.quickseries.R;
import com.test.quickseries.base.Const;
import com.test.quickseries.base.ListInteractor;
import com.test.quickseries.base.model.Resource;
import com.test.quickseries.databinding.ActivityResourceListBinding;
import com.test.quickseries.resource.detail.view.ResourceActivity;
import com.test.quickseries.resource.list.adapter.Resourcedapter;

import java.util.List;

public class ResourceListActivity extends AppCompatActivity implements ResourceListPresenter.Viewable, ListInteractor<Resource> {

    ActivityResourceListBinding binding;
    ResourceListPresenter presenter;
    Resourcedapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_resource_list);
        presenter = new ResourceListPresenter(this);
        setupActionBar();
        onNewIntent(getIntent());
    }

    private void setupActionBar() {
        setSupportActionBar(binding.toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowTitleEnabled(true);
            getSupportActionBar().setTitle(getIntent().getStringExtra(Const.TITLE));
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        if (getIntent().getExtras() != null)
            presenter.loadByCategory(this, getIntent().getStringExtra(Const.ID));
    }

    @Override
    public void onSaveInstanceState(Bundle outState, PersistableBundle outPersistentState) {
        super.onSaveInstanceState(outState, outPersistentState);
    }

    @Override
    public void showContent(List<Resource> result) {
        setupAdapter();
        adapter.setItems(result);
    }

    private void setupAdapter() {
        if (adapter == null) {
            adapter = new Resourcedapter(this);
            binding.contentsRecyclerView.setLayoutManager(new LinearLayoutManager(this));
            binding.contentsRecyclerView.setHasFixedSize(true);
            binding.contentsRecyclerView.setAdapter(adapter);
        }
    }

    @Override
    public void showError(Throwable thowable) {
        Toast.makeText(this, getString(R.string.generic_error, thowable.getMessage()), Toast.LENGTH_LONG).show();
    }


    @Override
    public void onClick(Resource item) {
        if (item != null) {
            Intent intent = new Intent(this, ResourceActivity.class);
            Bundle bundle = new Bundle();
            bundle.putParcelable(ResourceActivity.RESOURCE, item);
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
