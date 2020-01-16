package com.ztd.interview_test.mvvm.detailfragment.adapter.noteadapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemNoteBinding
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.infrustructure.data.models.vacationspot.FreeTextItem
import com.ztd.interview_test.mvvm.base.BaseViewHolder


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class NoteItemAdapter(private val notes: MutableList<FreeTextItem>) :
    RecyclerView.Adapter<NoteItemAdapter.NoteViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): NoteViewHolder {
        return NoteViewHolder(
            LayoutItemNoteBinding.inflate(
                LayoutInflater.from(parent.context),
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return notes.size
    }

    override fun onBindViewHolder(holder: NoteViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(notes: MutableList<FreeTextItem>) {
        this.notes.clear()
        this.notes.addAll(notes)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.notes.clear()
    }

    inner class NoteViewHolder(private val mBinding: LayoutItemNoteBinding) : BaseViewHolder(mBinding.root) {

        override fun onBind(position: Int) {
            mBinding.vm = NoteItemViewModel(notes[position])
            mBinding.executePendingBindings()
        }
    }
}