package com.ztd.interview_test.mvvm.detailfragment

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.View
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.Observer
import androidx.navigation.fragment.findNavController
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentDetailBinding
import com.ztd.interview_test.mvvm.base.BaseFragment
import com.ztd.interview_test.mvvm.detailfragment.adapter.addressadapter.AddressAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.businesshouradapter.BusinessHourAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.noteadapter.NoteItemAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.socialmediaadapter.SocialMediaAdapter
import javax.inject.Inject


/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
class DetailFragment:BaseFragment<FragmentDetailBinding,DetailViewModel>(),DetailNavigator,
    ContactInfoAdapter.OnContactClickListener,AddressAdapter.OnAddressClickListener,SocialMediaAdapter.OnSocialMediaClickListenr{


    @Inject
    lateinit var detailViewModel: DetailViewModel

    @Inject
    lateinit var contactAdapter: ContactInfoAdapter

    @Inject
    lateinit var addressAdapter: AddressAdapter

    @Inject
    lateinit var noteAdapter: NoteItemAdapter

    @Inject
    lateinit var socialMediaAdapter:SocialMediaAdapter

    @Inject
    lateinit var businessHourAdapter: BusinessHourAdapter

    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.fragment_detail
    override val viewModel: DetailViewModel
        get() = detailViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel.setNavigator(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        contactAdapter.clickListener = this
        addressAdapter.clickListener = this
        socialMediaAdapter.clickListener = this

        viewDataBinding.rvContacts.adapter = contactAdapter
        viewDataBinding.rvAddresses.adapter = addressAdapter
        viewDataBinding.rvNotes.adapter = noteAdapter
        viewDataBinding.rvSocial.adapter = socialMediaAdapter
        viewDataBinding.rvBusinessHours.adapter = businessHourAdapter

        viewModel.contactsLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.contacts.clear()
                viewModel.contacts.addAll(it)
            }
        })

        viewModel.addressesLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.addresses.clear()
                viewModel.addresses.addAll(it)
            }
        })

        viewModel.notesLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.notes.clear()
                viewModel.notes.addAll(it)
            }
        })

        viewModel.socialMediaLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.socialMedia.clear()
                viewModel.socialMedia.addAll(it)
            }
        })


        viewModel.bizHoursLiveData.observe(this, Observer {
            if (it!=null){
                viewModel.bizHours.clear()
                viewModel.bizHours.addAll(it)
            }
        })

        viewModel.getItemDetailById(DetailFragmentArgs.fromBundle(arguments!!).id,DetailFragmentArgs.fromBundle(arguments!!).catType)
    }

    override fun onMailClickListener(mail: String) {
        val action = DetailFragmentDirections.actionDetailFragmentToMailFragment(mail)
        findNavController().navigate(action)
    }

    override fun onOpenWebUrlClicked(webUrl: String) {
        val action = DetailFragmentDirections.actionDetailFragmentToWebViewFragment(webUrl)
        findNavController().navigate(action)
    }

    override fun onCallClicked(phoneNumber: String) {
        val intent = Intent(Intent.ACTION_DIAL)
        intent.data = Uri.parse("tel:$phoneNumber")
        startActivity(intent)
    }

    override fun onTextMessageClicked(phoneNumber: String) {
        startActivity(Intent(Intent.ACTION_VIEW, Uri.fromParts("sms", phoneNumber, null)))
    }

    override fun onLocationClicked(lat: Float, lng: Float,title:String) {
        val geoUri = "http://maps.google.com/maps?q=loc:$lat,$lng ($title)"
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(geoUri))
        activity?.startActivity(intent)
    }

    override fun onSocialMediaClicked(url: String) {
        val action = DetailFragmentDirections.actionDetailFragmentToWebViewFragment(url)
        findNavController().navigate(action)
    }

}