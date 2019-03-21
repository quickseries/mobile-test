package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class Category {

	@SerializedName("eid")
	private String eid;

	@SerializedName("updated_at")
	private String updatedAt;

	@SerializedName("__v")
	private int V;

	@SerializedName("description")
	private String description;

	@SerializedName("created_at")
	private String createdAt;

	@SerializedName("_active")
	private boolean active;

	@SerializedName("_id")
	private String id;

	@SerializedName("title")
	private String title;

	@SerializedName("slug")
	private String slug;

	@SerializedName("custom_module_eid")
	private String customModuleEid;

	public void setEid(String eid){
		this.eid = eid;
	}

	public String getEid(){
		return eid;
	}

	public void setUpdatedAt(String updatedAt){
		this.updatedAt = updatedAt;
	}

	public String getUpdatedAt(){
		return updatedAt;
	}

	public void setV(int V){
		this.V = V;
	}

	public int getV(){
		return V;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	public void setCreatedAt(String createdAt){
		this.createdAt = createdAt;
	}

	public String getCreatedAt(){
		return createdAt;
	}

	public void setActive(boolean active){
		this.active = active;
	}

	public boolean isActive(){
		return active;
	}

	public void setId(String id){
		this.id = id;
	}

	public String getId(){
		return id;
	}

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setSlug(String slug){
		this.slug = slug;
	}

	public String getSlug(){
		return slug;
	}

	public void setCustomModuleEid(String customModuleEid){
		this.customModuleEid = customModuleEid;
	}

	public String getCustomModuleEid(){
		return customModuleEid;
	}

	@Override
 	public String toString(){
		return 
			"Category{" +
			"eid = '" + eid + '\'' + 
			",updated_at = '" + updatedAt + '\'' + 
			",__v = '" + V + '\'' + 
			",description = '" + description + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			",_active = '" + active + '\'' + 
			",_id = '" + id + '\'' + 
			",title = '" + title + '\'' + 
			",slug = '" + slug + '\'' + 
			",custom_module_eid = '" + customModuleEid + '\'' + 
			"}";
		}
}