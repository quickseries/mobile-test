package com.ztd.interview_test.mvvm.detailfragment.adapter.businesshouradapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.mvvm.detailfragment.model.BusinessHours


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class BusinessHourItemViewModel(private val businessHours: BusinessHours) {

    val day:ObservableField<String> = ObservableField(businessHours.day)
    val businessHour:ObservableField<String> = ObservableField("${businessHours.from} - ${businessHours.to}")


}