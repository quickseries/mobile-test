package com.ztd.interview_test.mvvm.categorydetailfragment

import android.os.Bundle
import android.view.View
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.Observer
import androidx.navigation.fragment.findNavController
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentCategoryDetailBinding
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel
import com.ztd.interview_test.mvvm.base.BaseFragment
import com.ztd.interview_test.mvvm.categorydetailfragment.adapter.CategoryDetailAdapter
import javax.inject.Inject


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class CategoryDetailFragment : BaseFragment<FragmentCategoryDetailBinding, CategoryDetailViewModel>(),
    CategoryDetailNavigator,
    CategoryDetailAdapter.OnItemClickListener {


    @Inject
    lateinit var categoryDetailViewModel: CategoryDetailViewModel

    @Inject
    lateinit var categoryDetailAdapter: CategoryDetailAdapter

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

        categoryDetailAdapter.clickListener = this
        viewDataBinding.rvCategoryDetail.adapter = categoryDetailAdapter

        viewModel.catDetailLiveData.observe(this, Observer {
            if (it != null) {
                viewModel.catDetail.clear()
                viewModel.catDetail.addAll(it)
            }
        })

        viewModel.retrieveCategoryDetail(CategoryDetailFragmentArgs.fromBundle(arguments!!).catType)
    }


    override fun onItemClicked(restaurantModel: RestaurantModel) {
        val action = CategoryDetailFragmentDirections.actionCategoryDetailFragmentToDetailFragment(
            restaurantModel.title ?: "",
            CategoryDetailFragmentArgs.fromBundle(arguments!!).catType,
            restaurantModel.id!!
        )
        findNavController().navigate(action)
    }

    override fun onItemClicked(vacationSpotModel: VacationSpotModel) {
        val action = CategoryDetailFragmentDirections.actionCategoryDetailFragmentToDetailFragment(
            vacationSpotModel.title ?: "",
            CategoryDetailFragmentArgs.fromBundle(arguments!!).catType,
            vacationSpotModel.id!!
        )
        findNavController().navigate(action)
    }
}