package com.quickseries.mobiletest.ui.resources.details

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AlertDialog
import androidx.browser.customtabs.CustomTabsIntent
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.quickseries.mobiletest.databinding.FragmentResourceDetailsBinding
import com.quickseries.mobiletest.domain.resources.model.Address
import com.quickseries.mobiletest.ui.resources.ResourcesState
import com.quickseries.mobiletest.ui.resources.ResourcesViewModel
import com.quickseries.mobiletest.ui.resources.model.ContactInfoItem
import java.util.*


class ResourceDetailsFragment : Fragment(), ResourceDetailsAdressesAdapter.Listener, ResourceDetailsContactInfoAdapter.Listener {

    private val viewmodel by lazy {
        ViewModelProviders.of(requireActivity()).get(ResourcesViewModel::class.java)
    }

    private var binding: FragmentResourceDetailsBinding? = null

    private val addresses = mutableListOf<Address>()
    private val resourceAddressesAdapter by lazy {
        ResourceDetailsAdressesAdapter(this, addresses)
    }
    private val contactInfos = mutableListOf<ContactInfoItem>()
    private val contactInfosAdapter by lazy {
        ResourceDetailsContactInfoAdapter(this, contactInfos)
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentResourceDetailsBinding.inflate(layoutInflater, container, false)
        return binding?.root
    }

    override fun onAdressItemClick(address: Address) {
        // search with address if the latitude or longitude is not valid
        val uri = if (address.latitude.isEmpty() || address.longitude.isEmpty()) {
            String.format(Locale.ENGLISH, "geo:0,0?q=%s(%s)", address.address1, address.label)
        } else {
            String.format(Locale.ENGLISH, "geo:%1\$s,%2\$s?q=%1\$s,%2\$s>(%3\$s)", address.latitude, address.longitude, address.label)
        }
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(uri))
        requireContext().startActivity(intent)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        binding?.resourceDetailsAddressesRecyclerview?.apply {
            layoutManager = LinearLayoutManager(requireContext())
            adapter = resourceAddressesAdapter
        }
        binding?.resourceDetailsContactInfoRecyclerview?.apply {
            layoutManager = LinearLayoutManager(requireContext())
            adapter = contactInfosAdapter
        }

        viewmodel.stateLiveData.observe(viewLifecycleOwner, Observer { state ->
            handleState(state)
        })
    }

    override fun onContactInfoItemClick(contactInfoItem: ContactInfoItem) {
        when (contactInfoItem.type) {
            ContactInfoItem.Type.WEBSITE -> {
                CustomTabsIntent.Builder().build().launchUrl(
                    requireContext(),
                    Uri.parse(contactInfoItem.info)
                )
            }
            ContactInfoItem.Type.EMAIL -> {
                val intent = Intent(Intent.ACTION_SEND).apply {
                    type = "plain/text"
                    putExtra(Intent.EXTRA_EMAIL, contactInfoItem.info)
                }
                requireContext().startActivity(Intent.createChooser(intent, "Send email"))
            }
            ContactInfoItem.Type.PHONE_NUMBER,
            ContactInfoItem.Type.TOLL_FREE_NUMBER -> {
                val intent = Intent(Intent.ACTION_DIAL).apply {
                    data = Uri.parse("tel:" + contactInfoItem.info)
                }
                startActivity(intent)
            }
            ContactInfoItem.Type.FAX_NUMBER -> { /* nothing to do */ }
        }
    }

    private fun handleState(state: ResourcesState) {
        when (state) {
            is ResourcesState.Details -> {
                binding?.resource = state.resourceItem

                addresses.clear()
                addresses.addAll(state.resourceItem.addresses)
                resourceAddressesAdapter.notifyDataSetChanged()

                contactInfos.clear()
                contactInfos.addAll(state.resourceItem.contactInfos)
                contactInfosAdapter.notifyDataSetChanged()
            }
            is ResourcesState.Error -> {
                AlertDialog.Builder(requireContext())
                    .setMessage(state.message)
                    .show()
            }
        }
    }

    companion object {
        fun newInstance() = ResourceDetailsFragment()
    }
}