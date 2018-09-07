package com.books.quickseries.ui.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.Button;

import com.books.quickseries.R;
import com.books.quickseries.data.model.Category;
import com.books.quickseries.ui.base.BaseActivity;
import com.books.quickseries.ui.main.contract.MainPresenterContract;
import com.books.quickseries.ui.main.contract.MainViewContract;
import com.books.quickseries.ui.resource.ResourceActivity;
import com.books.quickseries.utils.AppConstants;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class MainActivity extends BaseActivity implements MainViewContract, CategoryAdapter.Callback {

    MainPresenterContract mMainPresenter;


    LinearLayoutManager mLayoutManager;


    CategoryAdapter mCategoryAdapter;

    @BindView(R.id.rv_categories_view)
    RecyclerView mRecyclerView;

    @BindView(R.id.btn_sort)
    Button btnSort;
    private List<Category> categories;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        mMainPresenter = new MainPresenter(this);
        setTitle("Categories");

    }


    @Override
    public void showCategories(List<Category> categories) {
        if(this.categories != null)
            this.categories.clear();
        this.categories = categories;
        mCategoryAdapter.addItems(categories);
        mCategoryAdapter.notifyDataSetChanged();
    }

    @Override
    public Context getContext() {
        return getApplicationContext();
    }

    @Override
    public void initUI() {
        mCategoryAdapter = new CategoryAdapter(new ArrayList<Category>());
        mLayoutManager = new LinearLayoutManager(getApplicationContext());
        mLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        mRecyclerView.setAdapter(mCategoryAdapter);
        mCategoryAdapter.setCallback(this);
        mMainPresenter.onViewCreated();
    }

    @Override
    public void onCategoryItemClicked(int position) {
        mMainPresenter.onCategoryItemClicked(position);
    }

    @Override
    public void openResourceActivity(int position) {
        Intent resourceIntent = new Intent(MainActivity.this, ResourceActivity.class);
        resourceIntent.putExtra(AppConstants.CATEGORY, position);
        startActivity(resourceIntent);
    }

    @OnClick(R.id.btn_sort)
    void sort() {
        mMainPresenter.sortList(categories);
    }
}
