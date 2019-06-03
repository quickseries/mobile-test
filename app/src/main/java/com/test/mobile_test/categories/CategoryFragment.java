package com.test.mobile_test.categories;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.test.mobile_test.R;
import com.test.mobile_test.base.BaseFragment;
import com.test.mobile_test.common.AppViewModelFactory;
import com.test.mobile_test.common.OnItemClickListener;
import com.test.mobile_test.model.CategoryListModel;
import com.test.mobile_test.resources.ResourceFragment;

import java.util.List;

import butterknife.BindView;

public class CategoryFragment extends BaseFragment implements OnItemClickListener<CategoryListModel> {

    @BindView(R.id.fragment_category_rv)
    public RecyclerView mRecyclerView;

    private CategoryViewModel mCategoryViewModel;

    private CategoriesAdapter mCategoriesAdapter;

    @Override
    protected void initView() {
        initRecyclerView();
        mCategoryViewModel = ViewModelProviders.of(this, new AppViewModelFactory(getContext()))
                .get(CategoryViewModel.class);
        mCategoryViewModel.fetchCategoryList();
        mCategoryViewModel.getMutableLiveData().observe(this, new Observer<List<CategoryListModel>>() {
            @Override
            public void onChanged(List<CategoryListModel> categoryListModel) {
                Log.e(">>>>>>>>>> data", categoryListModel.toString());
                if (categoryListModel != null) {
                    mCategoriesAdapter.setData(categoryListModel);
                } else {
                    Toast.makeText(getContext(), getResources().getString(R.string.error_occurred), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private void initRecyclerView() {
        mCategoriesAdapter = new CategoriesAdapter(this);
        mRecyclerView.setAdapter(mCategoriesAdapter);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
    }

    @Override
    protected int getLayoutById() {
        return R.layout.fragment_category;
    }

    @Override
    public String getTitle() {
        return "Category";
    }


    @Override
    public void onItemClick(CategoryListModel categoryListModel) {
        BaseFragment fragmentBaseFragment = new ResourceFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("data", categoryListModel);
        fragmentBaseFragment.setArguments(bundle);
        sharedViewModel.getMutableLiveData().setValue(fragmentBaseFragment);
    }
}
