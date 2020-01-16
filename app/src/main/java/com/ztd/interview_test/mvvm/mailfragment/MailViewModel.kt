package com.ztd.interview_test.mvvm.mailfragment

import android.util.Log
import android.widget.Toast
import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.mailutils.Mailer
import com.ztd.interview_test.mvvm.base.BaseViewModel
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers


/**
 * Created by Mahdi zarre Tahghigh doost on 1/15/2020.
 * mahdiZTD@gmail.com
 */
class MailViewModel : BaseViewModel<MailNavigator>() {

    val username: ObservableField<String> = ObservableField()
    val password: ObservableField<String> = ObservableField()

    val subject: ObservableField<String> = ObservableField()
    val content: ObservableField<String> = ObservableField()

    val mailAddress:ObservableField<String> = ObservableField()
    fun sendMail() {
        mNavigator.get()?.hideKeyboard()
        if (username.get().isNullOrEmpty() || password.get().isNullOrEmpty() || subject.get().isNullOrEmpty() || content.get().isNullOrEmpty()) {
            return
        } else {
            compositeDisposable.add(Mailer.sendMail(username.get()!!,password.get()!!,mailAddress.get()!!,subject.get()!!,content.get()!!)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                    {
                        Log.d("MAIL","Success")
                    },
                    {
                        Log.d("MAIL",it.toString())
                    }
                )
            )
        }
    }
}