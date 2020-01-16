package com.ztd.interview_test.mvvm.detailfragment

import com.ztd.interview_test.infrustructure.AppDataManager
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.mvvm.detailfragment.adapter.addressadapter.AddressAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.businesshouradapter.BusinessHourAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.noteadapter.NoteItemAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.socialmediaadapter.SocialMediaAdapter
import dagger.Module
import dagger.Provides

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
@Module
class DetailModule {

    @Provides
    fun provideViewModel(dataManager: DataManager):DetailViewModel= DetailViewModel(dataManager)

    @Provides
    fun provideDataManager(appDataManager: AppDataManager):DataManager = appDataManager

    @Provides
    fun provideContactAdapter():ContactInfoAdapter= ContactInfoAdapter(arrayListOf())

    @Provides
    fun provideAddressAdapter(): AddressAdapter = AddressAdapter(arrayListOf())

    @Provides
    fun provideNoteAdapter(): NoteItemAdapter= NoteItemAdapter(arrayListOf())

    @Provides
    fun provideSocialMediaAdapter(): SocialMediaAdapter= SocialMediaAdapter(arrayListOf())

    @Provides
    fun provideBusinessHourAdapter(): BusinessHourAdapter = BusinessHourAdapter(arrayListOf())

}