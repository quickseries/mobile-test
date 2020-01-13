package com.ztd.interview_test.mvvm.detailfragment

import android.os.Bundle
import android.view.View
import android.widget.Adapter
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.Observer
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentDetailBinding
import com.ztd.interview_test.mvvm.base.BaseFragment
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
class DetailFragment:BaseFragment<FragmentDetailBinding,DetailViewModel>(),DetailNavigator {

    @Inject
    lateinit var detailViewModel: DetailViewModel

    @Inject
    lateinit var contactAdapter: ContactInfoAdapter

    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.fragment_detail
    override val viewModel: DetailViewModel
        get() = detailViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.setNavigator(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        viewDataBinding.rvContacts.adapter = contactAdapter

        viewModel.contactsLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.contacts.clear()
                viewModel.contacts.addAll(it)
            }
        })

        viewModel.getItemDetailById(DetailFragmentArgs.fromBundle(arguments!!).id,DetailFragmentArgs.fromBundle(arguments!!).catType)
    }
}