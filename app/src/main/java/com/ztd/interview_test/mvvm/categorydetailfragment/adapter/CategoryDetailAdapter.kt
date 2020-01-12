package com.ztd.interview_test.mvvm.categorydetailfragment.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemRestaurantBinding
import com.ztd.interview_test.databinding.LayoutItemVacationSpotBinding
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel
import com.ztd.interview_test.mvvm.base.BaseViewHolder


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * snappQ
 * mahdiZTD@gmail.com
 */
class CategoryDetailAdapter(private val categoryDetails: MutableList<Any>) :
    RecyclerView.Adapter<CategoryDetailAdapter.CategoryDetailViewHolder>() {

    val VIEW_TYPE_RESTAURANT        = 1
    val VIEW_TYPE_VACATION_SPOT     = 2


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryDetailViewHolder {
        return when(viewType){
            VIEW_TYPE_RESTAURANT ->
                CategoryDetailViewHolder(LayoutItemRestaurantBinding.inflate(LayoutInflater.from(parent.context),parent,false))
            VIEW_TYPE_VACATION_SPOT ->
                CategoryDetailViewHolder(LayoutItemVacationSpotBinding.inflate(LayoutInflater.from(parent.context),parent,false))
            else ->
                CategoryDetailViewHolder(LayoutItemRestaurantBinding.inflate(LayoutInflater.from(parent.context),parent,false))
        }
    }

    override fun getItemCount(): Int {
        return categoryDetails.size
    }

    override fun onBindViewHolder(holder: CategoryDetailViewHolder, position: Int) {
        holder.onBind(position)
    }

    override fun getItemViewType(position: Int): Int {
        return when(categoryDetails[position]){
            is RestaurantModel -> VIEW_TYPE_RESTAURANT
            is VacationSpotModel -> VIEW_TYPE_VACATION_SPOT
            else -> -1
        }
    }

    inner class CategoryDetailViewHolder(val mBinding: ViewDataBinding) :
        BaseViewHolder(mBinding.root) {

        override fun onBind(position: Int) {
            when(categoryDetails[position]){
                is RestaurantModel -> {
                    val restaurantModel = categoryDetails[position] as RestaurantModel
                    val restaurantViewModel = RestaurantItemViewModel(restaurantModel)
                    (mBinding as LayoutItemRestaurantBinding).vm = restaurantViewModel
                }
                is VacationSpotModel -> {
                    val vacationSpotModel = categoryDetails[position] as VacationSpotModel
                    val vacationSpotItemViewModel = VacationSpotItemViewModel(vacationSpotModel)
                    (mBinding as LayoutItemVacationSpotBinding).vm = vacationSpotItemViewModel
                }
            }

            mBinding.executePendingBindings()

        }
    }
}