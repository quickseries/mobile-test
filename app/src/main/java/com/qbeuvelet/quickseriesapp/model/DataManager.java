package com.qbeuvelet.quickseriesapp.model;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class DataManager {
	private static DataManager instance = null;
	
	public static DataManager getInstance()
	{
		if (instance == null)
		{
			instance = new DataManager();
		}
		return instance;
	}
	
	private DataManager()
	{
	}
	
	private HashMap<String, Category> categoriesMap       = null;
	private HashMap<String, Resource> currentResourcesMap = null;
	
	public List<Category> getCategories(Context context)
	{
		List<Category> categories;
		
		if (categoriesMap == null)
		{
			categoriesMap = new HashMap<>();
			try (Reader reader = new InputStreamReader(context.getAssets().open("categories.json"), "UTF-8"))
			{
				Gson gson = new GsonBuilder().create();
				categories = Arrays.asList(gson.fromJson(reader, Category[].class));
				
				for (Category category : categories)
				{
					categoriesMap.put(category.getId(), category);
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
				categories = new ArrayList<>();
			}
			
		}
		else
		{
			categories = new ArrayList<>(categoriesMap.values());
		}
		
		return categories;
	}
	
	public Category getCategoryById(String id)
	{
		return categoriesMap.get(id);
	}
	
	public List<Resource> getResourcesOfCategory(Context context, Category category)
	{
		List<Resource> resources;
		
		String filename = "";
		switch (category.getId())
		{
			case "59839fd7951cf747207bed3e":
				filename = "restaurants.json";
				break;
			case "5983a2b7951cf747207bed41":
				filename = "vacation-spot.json";
				break;
		}
		
		try (Reader reader = new InputStreamReader(context.getAssets().open(filename), "UTF-8"))
		{
			Gson gson = new GsonBuilder().create();
			resources = Arrays.asList(gson.fromJson(reader, Resource[].class));
			
			currentResourcesMap = new HashMap<>();
			for (Resource resource : resources)
			{
				currentResourcesMap.put(resource.getId(), resource);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			resources = new ArrayList<>();
		}
		
		return resources;
	}
	
	public Resource getResourceById(String id)
	{
		return currentResourcesMap.get(id);
	}
}
