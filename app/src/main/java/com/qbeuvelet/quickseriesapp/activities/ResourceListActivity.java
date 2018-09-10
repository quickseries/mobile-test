package com.qbeuvelet.quickseriesapp.activities;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.qbeuvelet.quickseriesapp.R;
import com.qbeuvelet.quickseriesapp.model.Category;
import com.qbeuvelet.quickseriesapp.model.DataManager;
import com.qbeuvelet.quickseriesapp.model.Resource;

import java.util.Collections;
import java.util.List;

public class ResourceListActivity extends AppCompatActivity {
	
	public static String EXTRA_SELECTED_CATEGORY = "extraSelectedCategory";
	public static String EXTRA_SORT_STATE        = "extraSortState";
	
	private Category selectedCategory = null;
	private ListView       listViewResources;
	private List<Resource> resourcesOfCategory;
	private boolean sortAscend = true;
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_resource_list);
		
		if (savedInstanceState == null)
		{
			selectedCategory = DataManager.getInstance().getCategoryById(getIntent().getStringExtra(EXTRA_SELECTED_CATEGORY));
		}
		else
		{
			selectedCategory = DataManager.getInstance().getCategoryById(savedInstanceState.getString(EXTRA_SELECTED_CATEGORY));
			sortAscend = savedInstanceState.getBoolean(EXTRA_SORT_STATE);
		}
		
		Toolbar toolbar = findViewById(R.id.toolbar);
		setSupportActionBar(toolbar);
		getSupportActionBar().setTitle(selectedCategory.getTitle());
		getSupportActionBar().setDisplayHomeAsUpEnabled(true);
		getSupportActionBar().setDisplayShowHomeEnabled(true);
		toolbar.getNavigationIcon().setColorFilter(getResources().getColor(R.color.colorAccent), PorterDuff.Mode.SRC_ATOP);
		
		listViewResources = findViewById(R.id.lvResources);
		
		resourcesOfCategory = DataManager.getInstance().getResourcesOfCategory(this, selectedCategory);
		sortResources();
		
		listViewResources.setAdapter(new ResourceAdapter(this, resourcesOfCategory));
		
		listViewResources.setOnItemClickListener((parent, view, position, id) -> {
			Intent intent = new Intent(this, ResourceActivity.class);
			intent.putExtra(ResourceActivity.EXTRA_SELECTED_RESOURCE, ((Resource) listViewResources.getAdapter().getItem(position)).getId());
			startActivity(intent);
		});
	}
	
	@Override
	public boolean onSupportNavigateUp()
	{
		onBackPressed();
		return true;
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		getMenuInflater().inflate(R.menu.menu_resource_list, menu);
		return true;
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
		int id = item.getItemId();
		
		if (id == R.id.action_sort)
		{
			sortAscend = !sortAscend;
			sortResources();
			((ResourceAdapter) listViewResources.getAdapter()).notifyDataSetChanged();
			return true;
		}
		
		return super.onOptionsItemSelected(item);
	}
	
	@Override
	protected void onSaveInstanceState(Bundle outState)
	{
		outState.putString(EXTRA_SELECTED_CATEGORY, selectedCategory.getId());
		outState.putBoolean(EXTRA_SORT_STATE, sortAscend);
		super.onSaveInstanceState(outState);
	}
	
	private void sortResources()
	{
		if (sortAscend)
		{
			Collections.sort(resourcesOfCategory);
		}
		else
		{
			Collections.sort(resourcesOfCategory, Collections.reverseOrder());
		}
	}
	
	public class ResourceAdapter extends ArrayAdapter<Resource> {
		
		public ResourceAdapter(@NonNull Context context, @NonNull List<Resource> objects)
		{
			super(context, R.layout.custom_list_item, objects);
		}
		
		@NonNull
		@Override
		public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent)
		{
			ViewHolder     viewHolder;
			LayoutInflater inflater = (LayoutInflater) getContext().getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
			if (convertView == null)
			{
				viewHolder = new ViewHolder();
				convertView = inflater.inflate(R.layout.custom_list_item, parent, false);
				viewHolder.titleResource = convertView.findViewById(R.id.title);
				viewHolder.descriptionResource = convertView.findViewById(R.id.description);
				convertView.setTag(viewHolder);
			}
			else
			{
				viewHolder = (ViewHolder) convertView.getTag();
			}
			
			Resource resource = getItem(position);
			viewHolder.titleResource.setText(resource.getTitle());
			if (resource.getDescription() != null)
			{
				viewHolder.descriptionResource.setText(Html.fromHtml(resource.getDescription()));
			}
			
			return convertView;
		}
		
		private class ViewHolder {
			public TextView titleResource;
			public TextView descriptionResource;
		}
	}
	
}
