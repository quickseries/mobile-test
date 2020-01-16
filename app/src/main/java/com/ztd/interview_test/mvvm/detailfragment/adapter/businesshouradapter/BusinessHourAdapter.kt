package com.ztd.interview_test.mvvm.detailfragment.adapter.businesshouradapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemBusinessHourBinding
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.mvvm.base.BaseViewHolder
import com.ztd.interview_test.mvvm.detailfragment.model.BusinessHours


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class BusinessHourAdapter(private var businessHours: MutableList<BusinessHours>):RecyclerView.Adapter<BusinessHourAdapter.BusinessHourViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BusinessHourViewHolder {
        return BusinessHourViewHolder(LayoutItemBusinessHourBinding.inflate(LayoutInflater.from(parent.context),parent,false))
    }

    override fun getItemCount(): Int {
        return businessHours.size
    }

    override fun onBindViewHolder(holder: BusinessHourViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(businessHours: MutableList<BusinessHours>) {
        this.businessHours.clear()
        this.businessHours.addAll(businessHours)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.businessHours.clear()
    }

    inner class BusinessHourViewHolder(private var mBinding:LayoutItemBusinessHourBinding):BaseViewHolder(mBinding.root){
        override fun onBind(position: Int) {
            mBinding.vm = BusinessHourItemViewModel(businessHours[position])
            mBinding.executePendingBindings()
        }
    }
}