package com.test.mobile_test.resources;

import android.os.Bundle;
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
import com.test.mobile_test.model.resource.ResourceModel;
import com.test.mobile_test.resource_detail.ResourceDetailFragment;

import java.util.List;

import butterknife.BindView;

public class ResourceFragment extends BaseFragment implements OnItemClickListener<ResourceModel> {

    @BindView(R.id.fragment_category_rv)
    public RecyclerView recyclerView;

    private ResourceViewModel mResourceViewModel;

    private ResourceAdapter mAdapter;

    @Override
    protected void initView() {
        CategoryListModel model = (CategoryListModel) getArguments().get("data");
        mAdapter = new ResourceAdapter(this);
        recyclerView.setAdapter(mAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        mResourceViewModel = ViewModelProviders.of(this, new AppViewModelFactory(getContext()))
                .get(ResourceViewModel.class);
        mResourceViewModel.fetchData(model);
        mResourceViewModel.getMutableLiveData().observe(this, new Observer<List<ResourceModel>>() {
            @Override
            public void onChanged(List<ResourceModel> resourceModels) {
                if (resourceModels != null) {
                    mAdapter.setData(resourceModels);
                } else {
                    Toast.makeText(getContext(), getResources().getString(R.string.error_occurred), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    @Override
    public String getTitle() {
        return "Resources";
    }

    @Override
    protected int getLayoutById() {
        return R.layout.fragment_category;
    }

    @Override
    public void onItemClick(ResourceModel resourceModel) {
        ResourceDetailFragment detailFragment = new ResourceDetailFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("data", resourceModel);
        detailFragment.setArguments(bundle);
        sharedViewModel.getMutableLiveData().setValue(detailFragment);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mResourceViewModel = null;
        mAdapter = null;
        recyclerView = null;
    }
}
