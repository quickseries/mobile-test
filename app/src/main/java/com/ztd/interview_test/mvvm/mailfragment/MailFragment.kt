package com.ztd.interview_test.mvvm.mailfragment

import android.content.Context
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import androidx.core.content.ContextCompat.getSystemService
import androidx.databinding.library.baseAdapters.BR
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentMailBinding
import com.ztd.interview_test.mvvm.base.BaseFragment
import javax.inject.Inject


/**
 * Created by Mahdi zarre Tahghigh doost on 1/15/2020.
 * mahdiZTD@gmail.com
 */
class MailFragment :BaseFragment<FragmentMailBinding,MailViewModel>(),MailNavigator{

    @Inject
    lateinit var mailViewModel: MailViewModel
    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.fragment_mail
    override val viewModel: MailViewModel
        get() = mailViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.setNavigator(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewModel.mailAddress.set(MailFragmentArgs.fromBundle(arguments!!).mailTo)

    }

    override fun onDetach() {
        super.onDetach()
        hideKeyboard()
    }

    override fun hideKeyboard() {
        val view = activity!!.currentFocus
        if (view != null) {
            val imm = activity?.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }
}