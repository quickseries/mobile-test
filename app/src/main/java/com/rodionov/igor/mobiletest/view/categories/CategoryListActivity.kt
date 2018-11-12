package com.rodionov.igor.mobiletest.view.categories

import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.databinding.DataBindingUtil
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager

import com.rodionov.igor.mobiletest.R
import com.rodionov.igor.mobiletest.databinding.ActivityCategoryListBinding
import com.rodionov.igor.mobiletest.model.Category
import com.rodionov.igor.mobiletest.view.general.Divider
import com.rodionov.igor.mobiletest.viewModel.CategoryListViewModel
import com.rodionov.igor.mobiletest.viewModel.ViewModelFactory

class CategoryListActivity : AppCompatActivity(), OnCategorySelectionListener {

    lateinit var mBinding: ActivityCategoryListBinding
    lateinit var mViewModel: CategoryListViewModel

    override fun onCategorySelected(category: Category?) {

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mBinding = DataBindingUtil.setContentView(this, R.layout.activity_category_list)
        initViewModel()
    }

    private fun initViewModel() {
        mViewModel = ViewModelProviders.of(this, ViewModelFactory(this)).get(CategoryListViewModel::class.java)
        mViewModel.categoryList.observe(this, Observer {categoryList -> initCategoryList(categoryList) })
    }

    private fun initCategoryList(categoryList: List<Category>?) {
        mBinding.categoriesView.layoutManager = LinearLayoutManager(this)
        mBinding.categoriesView.addItemDecoration(Divider(this))
        mBinding.categoriesView.adapter = CategoryListAdapter(categoryList, this)
    }
}
