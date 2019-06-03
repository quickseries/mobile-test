package com.test.mobile_test.resource_detail;

import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.squareup.picasso.Picasso;
import com.test.mobile_test.R;
import com.test.mobile_test.base.BaseFragment;
import com.test.mobile_test.model.resource.ResourceModel;

import java.util.Map;

import butterknife.BindView;

public class ResourceDetailFragment extends BaseFragment {

    @BindView(R.id.resource_img)
    ImageView resourceImage;

    @BindView(R.id.title)
    TextView resourceTitle;

    @BindView(R.id.description)
    TextView resourceDescription;

    @BindView(R.id.detail_ll)
    LinearLayout parentDetailLinearLayout;

    private String[] days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

    @Override
    protected void initView() {

        ResourceModel resourceModel = (ResourceModel) getArguments().get("data");
        loadImage(resourceModel.getPhoto());
        resourceTitle.setText(resourceModel.getTitle());
        resourceDescription.setText(Html.fromHtml(resourceModel.getDescription()));
        if (resourceModel.getContactInfo() != null)
            addContactLayout(resourceModel.getContactInfo());
        if (resourceModel.getAddresses() != null) {
            addAddressLayout(resourceModel.getAddresses());
        }
        if (resourceModel.getBizHours() != null) {
            addBizHours(resourceModel.getBizHours());
        }
        if (resourceModel.getSocialMedia() != null) {
            addSocialMediaIcons(resourceModel.getSocialMedia());
        }
    }

    private void addSocialMediaIcons(ResourceModel.SocialMedia socialMedia) {
        boolean isEmpty = true;
        View parentLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_detail_item, null);
        TextView textView = parentLayout.findViewById(R.id.heading);
        textView.setText(R.string.notes);
        LinearLayout childLayout = new LinearLayout(getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
        childLayout.setLayoutParams(layoutParams);
        childLayout.setOrientation(LinearLayout.HORIZONTAL);
        ((LinearLayout) parentLayout).addView(childLayout);
        if (socialMedia.getFacebook() != null && socialMedia.getFacebook().length > 0) {
            for (String url : socialMedia.getFacebook()) {
                if (!TextUtils.isEmpty(url)) {
                    isEmpty = false;
                    ImageView imgView = new ImageView(getContext());
                    imgView.setImageDrawable(getResources().getDrawable(R.mipmap.ic_launcher));
                    childLayout.addView(imgView);
                }
            }
        }

        if (socialMedia.getTwitter() != null && socialMedia.getTwitter().length > 0) {
            for (String url : socialMedia.getTwitter()) {
                if (!TextUtils.isEmpty(url)) {
                    isEmpty = false;
                    ImageView imgView = new ImageView(getContext());
                    imgView.setImageDrawable(getResources().getDrawable(R.mipmap.ic_launcher));
                    childLayout.addView(imgView);
                }
            }
        }

        if (socialMedia.getYoutubeChannel() != null && socialMedia.getYoutubeChannel().length > 0) {
            for (String url : socialMedia.getYoutubeChannel()) {
                if (!TextUtils.isEmpty(url)) {
                    isEmpty = false;
                    ImageView imgView = new ImageView(getContext());
                    imgView.setImageDrawable(getResources().getDrawable(R.mipmap.ic_launcher));
                    childLayout.addView(imgView);
                }
            }
        }

        if (!isEmpty) {
            parentDetailLinearLayout.addView(parentLayout);
        }
    }

    private void addBizHours(Map<String, ResourceModel.BizHours> bizHours) {
        View parentLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_detail_item, null);
        TextView textView = parentLayout.findViewById(R.id.heading);
        textView.setText(R.string.business);
        LinearLayout childLayout = parentLayout.findViewById(R.id.child_ll);
        for (String day : days) {
            View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_biz_hours_item, null);
            TextView dayTv = itemLayout.findViewById(R.id.day);
            TextView timingTv = itemLayout.findViewById(R.id.timing);
            ResourceModel.BizHours hours = bizHours.get(day.toLowerCase());
            dayTv.setText(day);
            if (hours == null) {
                timingTv.setText("CLOSED");
            } else {
                StringBuilder builder = new StringBuilder();
                builder.append(hours.getFrom());
                builder.append(" - ");
                builder.append(hours.getTo());
                timingTv.setText(builder.toString());

            }
            childLayout.addView(itemLayout);
        }
        parentDetailLinearLayout.addView(parentLayout);
    }

    private void addAddressLayout(ResourceModel.Addresses[] addresses) {

        if (addresses != null && addresses.length > 0) {
            View parentLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_detail_item, null);
            TextView textView = parentLayout.findViewById(R.id.heading);
            textView.setText(R.string.address);
            LinearLayout childLayout = parentLayout.findViewById(R.id.child_ll);
            for (ResourceModel.Addresses address : addresses) {
                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                ImageView icon_1 = itemLayout.findViewById(R.id.icon_2);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                heading.setText(R.string.address);
                StringBuilder builder = new StringBuilder();
                builder.append(address.getAddress1());
                builder.append("\n");
                builder.append(address.getCity());
                builder.append(",");
                builder.append(address.getState());
                builder.append(" ");
                builder.append(address.getZipCode());
                builder.append("\n");
                builder.append(address.getCountry());
                detailTv.setText(builder.toString());
                icon_1.setVisibility(View.VISIBLE);
                childLayout.addView(itemLayout);
            }
            parentDetailLinearLayout.addView(parentLayout);
        }
    }

    private void loadImage(String photo) {
        Picasso.get()
                .load(photo)
                .placeholder(R.mipmap.ic_launcher)
                .error(R.mipmap.ic_launcher)
                .into(resourceImage);
    }

    @Override
    protected int getLayoutById() {
        return R.layout.fragment_resource_detail;
    }

    @Override
    public String getTitle() {
        return "Resources";
    }


    private void addContactLayout(ResourceModel.ContactInfo contactInfo) {
        View parentLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_detail_item, null);
        TextView textView = parentLayout.findViewById(R.id.heading);
        textView.setText(R.string.contact_information);
        LinearLayout childLayout = parentLayout.findViewById(R.id.child_ll);
        if (contactInfo.getPhoneNumber() != null && contactInfo.getPhoneNumber().length > 0) {
            boolean isEmpty = true;
            StringBuilder builder = new StringBuilder();
            for (String phoneNumber : contactInfo.getPhoneNumber()) {
                if (!TextUtils.isEmpty(phoneNumber)) {
                    isEmpty = false;
                    builder.append(phoneNumber + "\n");
                }
            }
            if (!isEmpty) {
                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                ImageView icon_1 = itemLayout.findViewById(R.id.icon_1);
                ImageView icon_2 = itemLayout.findViewById(R.id.icon_2);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                icon_1.setVisibility(View.VISIBLE);
                icon_2.setVisibility(View.VISIBLE);
                heading.setText(R.string.phone_number);
                detailTv.setText(builder.toString());
                childLayout.addView(itemLayout);
            }
        }

        if (contactInfo.getEmail() != null && contactInfo.getEmail().length > 0) {
            boolean isEmpty = true;
            StringBuilder builder = new StringBuilder();
            for (String email : contactInfo.getEmail()) {
                if (!TextUtils.isEmpty(email)) {
                    isEmpty = false;
                    builder.append(email + "\n");
                }
            }
            if (!isEmpty) {
                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                ImageView icon_1 = itemLayout.findViewById(R.id.icon_1);
                ImageView icon_2 = itemLayout.findViewById(R.id.icon_2);
                icon_1.setVisibility(View.VISIBLE);
                heading.setText(R.string.email);
                detailTv.setText(builder.toString());
                childLayout.addView(itemLayout);
            }
        }

        if (contactInfo.getWebsite() != null && contactInfo.getWebsite().length > 0) {
            boolean isEmpty = true;
            StringBuilder builder = new StringBuilder();
            for (String website : contactInfo.getWebsite()) {
                if (!TextUtils.isEmpty(website)) {
                    isEmpty = false;
                    builder.append(website + "\n");
                }
            }
            if (!isEmpty) {
                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                ImageView icon_1 = itemLayout.findViewById(R.id.icon_1);
                icon_1.setVisibility(View.VISIBLE);
                heading.setText(R.string.website);
                detailTv.setText(builder.toString());
                childLayout.addView(itemLayout);
            }
        }

        if (contactInfo.getFaxNumber() != null && contactInfo.getFaxNumber().length > 0) {
            StringBuilder builder = new StringBuilder();
            boolean isEmpty = true;
            for (String faxNumber : contactInfo.getFaxNumber()) {
                if (!TextUtils.isEmpty(faxNumber)) {
                    isEmpty = false;
                    builder.append(faxNumber + "\n");
                }
            }
            if (!isEmpty) {

                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                heading.setText(R.string.fax_number);
                detailTv.setText(builder.toString());
                childLayout.addView(itemLayout);
            }
        }

        if (contactInfo.getTollFree() != null && contactInfo.getTollFree().length > 0) {
            StringBuilder builder = new StringBuilder();
            boolean isEmpty = true;
            for (String faxNumber : contactInfo.getTollFree()) {
                if (!TextUtils.isEmpty(faxNumber)) {
                    isEmpty = false;
                    builder.append(faxNumber + "\n");
                }
            }
            if (!isEmpty) {
                View itemLayout = LayoutInflater.from(getContext()).inflate(R.layout.layout_resource_item, null);
                TextView heading = itemLayout.findViewById(R.id.textView);
                TextView detailTv = itemLayout.findViewById(R.id.textView2);
                ImageView icon_1 = itemLayout.findViewById(R.id.icon_1);
                ImageView icon_2 = itemLayout.findViewById(R.id.icon_2);
                icon_1.setVisibility(View.VISIBLE);
                icon_2.setVisibility(View.VISIBLE);
                heading.setText(R.string.toll_free);
                detailTv.setText(builder.toString());
                childLayout.addView(itemLayout);
            }
        }

        parentDetailLinearLayout.addView(parentLayout);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        resourceImage = null;
        resourceTitle = null;
        parentDetailLinearLayout = null;
        resourceDescription = null;
    }
}
