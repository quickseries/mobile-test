package com.qbeuvelet.quickseriesapp.activities;

import android.graphics.PorterDuff;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.qbeuvelet.quickseriesapp.R;
import com.qbeuvelet.quickseriesapp.model.DataManager;
import com.qbeuvelet.quickseriesapp.model.Resource;

public class ResourceActivity extends AppCompatActivity {
	
	public static String EXTRA_SELECTED_RESOURCE = "extraSelectedResource";
	
	private Resource selectedResource;
	
	private TextView     titleResource;
	private TextView     descriptionResource;
	private LinearLayout layoutInfoContact;
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_resource);
		
		if (savedInstanceState == null)
		{
			selectedResource = DataManager.getInstance().getResourceById(getIntent().getStringExtra(EXTRA_SELECTED_RESOURCE));
		}
		else
		{
			selectedResource = DataManager.getInstance().getResourceById(savedInstanceState.getString(EXTRA_SELECTED_RESOURCE));
		}
		
		Toolbar toolbar = findViewById(R.id.toolbar);
		setSupportActionBar(toolbar);
		getSupportActionBar().setTitle(R.string.details);
		getSupportActionBar().setDisplayHomeAsUpEnabled(true);
		getSupportActionBar().setDisplayShowHomeEnabled(true);
		toolbar.getNavigationIcon().setColorFilter(getResources().getColor(R.color.colorAccent), PorterDuff.Mode.SRC_ATOP);
		
		titleResource = findViewById(R.id.titleResource);
		descriptionResource = findViewById(R.id.descriptionResource);
		layoutInfoContact = findViewById(R.id.layoutInfoContact);
		
		LayoutInflater layoutInflater = getLayoutInflater();
		
		titleResource.setText(selectedResource.getTitle());
		
		if (selectedResource != null)
		{
			descriptionResource.setText(Html.fromHtml(selectedResource.getDescription()));
		}
		
		Resource.ContactInfo contactInfo = selectedResource.getContactInfo();
		if (contactInfo != null)
		{
			for (String phoneNumber : contactInfo.getPhoneNumber())
			{
				View item = layoutInflater.inflate(R.layout.resource_info_item, null);
				((TextView) item.findViewById(R.id.titleItemInfo)).setText(R.string.phone_number);
				((TextView) item.findViewById(R.id.descriptionItemInfo)).setText(phoneNumber);
				
				LinearLayout              layoutIcons = item.findViewById(R.id.layoutIcons);
				LinearLayout.LayoutParams layoutParam = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
				layoutParam.setMargins(10, 0, 10, 0);
				
				ImageView iconMessage = new ImageView(this);
				iconMessage.setImageResource(android.R.drawable.ic_dialog_email);
				iconMessage.setLayoutParams(layoutParam);
				layoutIcons.addView(iconMessage);
				
				ImageView iconCall = new ImageView(this);
				iconCall.setImageResource(android.R.drawable.ic_dialog_dialer);
				iconCall.setLayoutParams(layoutParam);
				layoutIcons.addView(iconCall);
				
				layoutInfoContact.addView(item);
			}
			for (String tollfreeNumber : contactInfo.getTollFree())
			{
				View item = layoutInflater.inflate(R.layout.resource_info_item, null);
				((TextView) item.findViewById(R.id.titleItemInfo)).setText(R.string.tollfree_number);
				((TextView) item.findViewById(R.id.descriptionItemInfo)).setText(tollfreeNumber);
				layoutInfoContact.addView(item);
			}
			for (String faxNumber : contactInfo.getFaxNumber())
			{
				View item = layoutInflater.inflate(R.layout.resource_info_item, null);
				((TextView) item.findViewById(R.id.titleItemInfo)).setText(R.string.fax_number);
				((TextView) item.findViewById(R.id.descriptionItemInfo)).setText(faxNumber);
				layoutInfoContact.addView(item);
			}
			for (String emailAddress : contactInfo.getEmail())
			{
				View item = layoutInflater.inflate(R.layout.resource_info_item, null);
				((TextView) item.findViewById(R.id.titleItemInfo)).setText(R.string.email_address);
				((TextView) item.findViewById(R.id.descriptionItemInfo)).setText(emailAddress);
				layoutInfoContact.addView(item);
			}
			for (String website : contactInfo.getWebsite())
			{
				View item = layoutInflater.inflate(R.layout.resource_info_item, null);
				((TextView) item.findViewById(R.id.titleItemInfo)).setText(R.string.website);
				((TextView) item.findViewById(R.id.descriptionItemInfo)).setText(website);
				layoutInfoContact.addView(item);
			}
		}
	}
	
	@Override
	public boolean onSupportNavigateUp()
	{
		onBackPressed();
		return true;
	}
	
	@Override
	protected void onSaveInstanceState(Bundle outState)
	{
		outState.putString(EXTRA_SELECTED_RESOURCE, selectedResource.getId());
		super.onSaveInstanceState(outState);
	}
	
}
