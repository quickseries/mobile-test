package com.ztd.interview_test.mvvm.detailfragment.adapter.noteadapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.vacationspot.FreeTextItem


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class NoteItemViewModel(private val freeTextItem: FreeTextItem) {

    val freeText:ObservableField<String> = ObservableField(freeTextItem.textItem?:"")
}