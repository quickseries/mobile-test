package com.test.mobile_test.base;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProviders;

import com.test.mobile_test.common.SharedViewModel;
import com.test.mobile_test.data.DataManager;

import butterknife.ButterKnife;

public abstract class BaseFragment extends Fragment {

    protected abstract void initView();

    protected abstract int getLayoutById();

    public abstract String getTitle();

    protected View view;

    protected SharedViewModel sharedViewModel;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(getLayoutById(), container, false);
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.view = view;
        ButterKnife.bind(this, view);
        sharedViewModel = ViewModelProviders.of(getActivity()).get(SharedViewModel.class);
        initView();
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }
}
