package com.ztd.interview_test.mvvm.categorydetailfragment.adapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class VacationSpotItemViewModel(private val vacationSpotModel: VacationSpotModel, private val clickListener: CategoryDetailAdapter.OnItemClickListener?) {

    val title: ObservableField<String> = ObservableField(vacationSpotModel.title ?: "")
    val description: ObservableField<String> = ObservableField(vacationSpotModel.description ?: "")
    val address: ObservableField<String> = if (vacationSpotModel.addresses?.get(0)?.address1 != null) {
        ObservableField(
            "${vacationSpotModel.addresses[0]?.address1},${vacationSpotModel.addresses[0]?.city},${vacationSpotModel.addresses[0]?.state},${vacationSpotModel.addresses[0]?.country}"
        )
    } else {
        ObservableField("")
    }


    fun onItemClicked(){
        clickListener?.onItemClicked(vacationSpotModel)
    }
}