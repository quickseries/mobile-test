package com.ztd.interview_test.mvvm.categorydetailfragment

import android.os.Bundle
import android.view.View
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.Observer
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentCategoryDetailBinding
import com.ztd.interview_test.mvvm.base.BaseFragment
import javax.inject.Inject


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class CategoryDetailFragment:BaseFragment<FragmentCategoryDetailBinding,CategoryDetailViewModel>(),CategoryDetailNavigator {

    @Inject
    lateinit var categoryDetailViewModel: CategoryDetailViewModel

    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.fragment_category_detail
    override val viewModel: CategoryDetailViewModel
        get() = categoryDetailViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.setNavigator(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        viewModel.catDetailLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.catDetail.clear()
                viewModel.catDetail.addAll(it)
            }
        })

        viewModel.retrieveCategoryDetail("restaurant")
    }
}