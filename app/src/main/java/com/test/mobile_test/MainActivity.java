package com.test.mobile_test;

import androidx.lifecycle.Observer;

import com.test.mobile_test.base.BaseActivity;
import com.test.mobile_test.base.BaseFragment;
import com.test.mobile_test.categories.CategoryFragment;

public class MainActivity extends BaseActivity {


    @Override
    protected int getLayoutById() {
        return R.layout.activity_main;
    }

    @Override
    protected void initView() {
        replaceFragment(R.id.container, new CategoryFragment(), true);
        sharedViewModel.getMutableLiveData().observe(this, fragmentObserver);
    }


    Observer<Object> fragmentObserver = new Observer<Object>() {
        @Override
        public void onChanged(Object o) {
            if (o instanceof BaseFragment) {
                BaseFragment fragment = (BaseFragment) o;
                setTitle(fragment.getTitle());
                replaceFragment(R.id.container, (BaseFragment) o, true);
            }
        }
    };


}
