package com.ztd.interview_test.mvvm.detailfragment.adapter.addressadapter

import androidx.databinding.ObservableBoolean
import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.AddressesItem


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class AddressItemViewModel(private var addressItem:AddressesItem,private var clickListener: AddressAdapter.OnAddressClickListener?) {

    val address:ObservableField<String> = ObservableField("${addressItem.address1}\n${addressItem.city}, ${addressItem.state}\n${addressItem.country}")

    val showLocButton :ObservableBoolean = ObservableBoolean(addressItem.gps?.latitude?.toFloat()?.equals(0f)?:true )

    fun onLocationClicked(){
        clickListener?.onLocationClicked(addressItem.gps?.latitude?.toFloat()?:0f,addressItem.gps?.longitude?.toFloat()?:0f,addressItem.label?:"")
    }
}