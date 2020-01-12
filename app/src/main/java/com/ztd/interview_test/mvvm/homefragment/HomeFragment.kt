package com.ztd.interview_test.mvvm.homefragment

import android.os.Bundle
import android.view.View
import androidx.databinding.library.baseAdapters.BR
import com.ztd.interview_test.R
import com.ztd.interview_test.mvvm.base.BaseFragment
import com.ztd.interview_test.databinding.FragmentHomeBinding
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class HomeFragment : BaseFragment<FragmentHomeBinding, HomeViewModel>(), HomeNavigator{

    @Inject
    lateinit var homeViewModel: HomeViewModel

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
        viewModel.retrieveCategories()
    }

}