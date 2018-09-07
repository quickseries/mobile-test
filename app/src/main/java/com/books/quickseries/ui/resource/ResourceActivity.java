package com.books.quickseries.ui.resource;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.books.quickseries.R;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.ui.base.BaseActivity;
import com.books.quickseries.ui.resource.contract.ResourcePresenterContract;
import com.books.quickseries.ui.resource.contract.ResourceViewContract;
import com.books.quickseries.utils.AppConstants;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class ResourceActivity extends BaseActivity implements ResourceViewContract, ResourceAdapter.Callback {

    ResourcePresenterContract mResourcePresenter;
    LinearLayoutManager mLayoutManager;
    ResourceAdapter mResourceAdapter;

    @BindView(R.id.rv_categories_view)
    RecyclerView mRecyclerView;


    private int resourceId;
    private List<Resource> resources;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        mResourcePresenter = new ResourcePresenter(this);
        resourceId = getIntent().getIntExtra(AppConstants.CATEGORY, 1);
        if (resourceId == AppConstants.CATEGORY_RESTAURANTS) {
            setTitle("Restaurants");
        } else {
            setTitle("Vacation Spots");
        }
    }

    @Override
    public void showResources(List<Resource> resources) {
        if(this.resources != null) {
            this.resources.clear();
        }
        this.resources = resources;
        mResourceAdapter.addItems(resources);
        mResourceAdapter.notifyDataSetChanged();
    }


    @Override
    public Context getContext() {
        return getApplicationContext();
    }

    @Override
    public void initUI() {
        mResourceAdapter = new ResourceAdapter(new ArrayList<Resource>());
        mLayoutManager = new LinearLayoutManager(getApplicationContext());
        mLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        mRecyclerView.setAdapter(mResourceAdapter);
        mResourceAdapter.setCallback(this);
        mResourcePresenter.onViewCreated(resourceId);
    }

    @Override
    public void onCategoryItemClicked(Resource resource) {
        mResourcePresenter.onResourceItemClicked(resource);
    }

    @Override
    public void openResourceDialog(Resource resource) {
        ResourceDetailFragment fragment = ResourceDetailFragment.newInstance();
        fragment.setResource(resource);
        fragment.show(getFragmentManager(), "Resource");
    }

    @OnClick(R.id.btn_sort)
    void sort() {
        mResourcePresenter.sortList(resources);
    }
}
