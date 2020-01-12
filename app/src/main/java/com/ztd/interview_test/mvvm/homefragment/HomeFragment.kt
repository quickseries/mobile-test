package com.ztd.interview_test.mvvm.homefragment

import android.os.Bundle
import android.view.View
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.Observer
import androidx.navigation.fragment.findNavController
import com.ztd.interview_test.R
import com.ztd.interview_test.mvvm.base.BaseFragment
import com.ztd.interview_test.databinding.FragmentHomeBinding
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class HomeFragment : BaseFragment<FragmentHomeBinding, HomeViewModel>(), HomeNavigator,
    CategoryAdapter.CategoryClickListener {


    @Inject
    lateinit var homeViewModel: HomeViewModel

    @Inject
    lateinit var categoryAdapter: CategoryAdapter

    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.fragment_home
    override val viewModel: HomeViewModel
        get() = homeViewModel


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.setNavigator(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        categoryAdapter.clickListener = this
        viewDataBinding.rvCategories.adapter = categoryAdapter

        viewModel.categoryLiveData.observe(this , Observer {
            if (it!=null){
                viewModel.categories.clear()
                viewModel.categories.addAll(it)
            }
        })

        viewModel.retrieveCategories()
    }

    override fun onCategoryClicked(category: CategoryModel) {
        val action  = HomeFragmentDirections.actionHomeFragmentToCategoryDetailFragment(category.title!!,category.slug!!)
        findNavController().navigate(action)
    }
}