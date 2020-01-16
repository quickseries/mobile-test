package com.ztd.interview_test.mvvm.detailfragment.adapter.socialmediaadapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.SocialMedia
import com.ztd.interview_test.mvvm.detailfragment.model.SocialMediaItem


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class SocialMediaItemViewModel (private var socialMedia: SocialMediaItem,private var clickListenr: SocialMediaAdapter.OnSocialMediaClickListenr?){

    var socialType:ObservableField<String> = ObservableField(socialMedia.type)

    fun onItemClick(){
        clickListenr?.onSocialMediaClicked(socialMedia.value)
    }
}