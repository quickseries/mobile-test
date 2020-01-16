package com.ztd.interview_test.mvvm.detailfragment.adapter.addressadapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.appcompat.widget.DialogTitle
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemAddressBinding
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.mvvm.base.BaseViewHolder


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class AddressAdapter(private var addresses:MutableList<AddressesItem>) :RecyclerView.Adapter<AddressAdapter.AddressViewHolder>(){

    var clickListener:OnAddressClickListener?=null


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): AddressViewHolder {
        return AddressViewHolder(LayoutItemAddressBinding.inflate(LayoutInflater.from(parent.context),parent,false))
    }

    override fun getItemCount(): Int {
        return addresses.size
    }

    override fun onBindViewHolder(holder: AddressViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(addresses: MutableList<AddressesItem>) {
        this.addresses.clear()
        this.addresses.addAll(addresses)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.addresses.clear()
    }

    inner class AddressViewHolder(val mBinding:LayoutItemAddressBinding):BaseViewHolder(mBinding.root){
        override fun onBind(position: Int) {
            mBinding.vm = AddressItemViewModel(addresses[position],clickListener)
            mBinding.executePendingBindings()
        }
    }

    interface OnAddressClickListener{
        fun onLocationClicked(lat:Float,lng:Float,title: String)
    }
}