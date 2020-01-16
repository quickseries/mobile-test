package com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemContactBinding
import com.ztd.interview_test.mvvm.base.BaseViewHolder
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
class ContactInfoAdapter(private var contacts: MutableList<ContactItem>) :
    RecyclerView.Adapter<ContactInfoAdapter.ContactViewHolder>() {

    var clickListener:OnContactClickListener? = null

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ContactViewHolder {
        return ContactViewHolder(
            LayoutItemContactBinding.inflate(
                LayoutInflater.from(parent.context),
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return contacts.size
    }

    override fun onBindViewHolder(holder: ContactViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(contacts: MutableList<ContactItem>) {
        this.contacts.clear()
        this.contacts.addAll(contacts)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.contacts.clear()
    }

    inner class ContactViewHolder(private val mBinding: LayoutItemContactBinding) :
        BaseViewHolder(mBinding.root) {

        override fun onBind(position: Int) {
            mBinding.vm = ContactItemViewModel(contacts[position],clickListener)
            mBinding.executePendingBindings()
        }

    }

    interface OnContactClickListener{
        fun onMailClickListener(mail:String)
        fun onOpenWebUrlClicked(webUrl:String)
        fun onCallClicked(phoneNumber:String)
        fun onTextMessageClicked(phoneNumber: String)
    }
}