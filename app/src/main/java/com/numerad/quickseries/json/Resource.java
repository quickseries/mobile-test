package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import java.util.List;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class Resource {

	@SerializedName("eid")
	private String eid;

	@SerializedName("addresses")
	private List<Address> addresses;

	@SerializedName("contactInfo")
	private ContactInfo contactInfo;

	@SerializedName("description")
	private String description;

	@SerializedName("photo")
	private String photo;

	@SerializedName("created_at")
	private String createdAt;

	@SerializedName("title")
	private String title;

	@SerializedName("category_eid")
	private String categoryEid;

	@SerializedName("updated_at")
	private String updatedAt;

	@SerializedName("__v")
	private int V;

    @SerializedName("freeText")
    private List<FreeTextItem> freeText;

    @SerializedName("_active")
	private boolean active;

	@SerializedName("_id")
	private String id;

	@SerializedName("slug")
	private String slug;

    @SerializedName("bizHours")
    private Hours hours;

    @SerializedName("socialMedia")
    private SocialMedia socialMedia;

    public void setEid(String eid){
		this.eid = eid;
	}

	public String getEid(){
		return eid;
	}

	public void setAddresses(List<Address> addresses){
		this.addresses = addresses;
	}

	public List<Address> getAddresses(){
		return addresses;
	}

	public void setContactInfo(ContactInfo contactInfo){
		this.contactInfo = contactInfo;
	}

	public ContactInfo getContactInfo(){
		return contactInfo;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	public void setPhoto(String photo){
		this.photo = photo;
	}

	public String getPhoto(){
		return photo;
	}

	public void setCreatedAt(String createdAt){
		this.createdAt = createdAt;
	}

	public String getCreatedAt(){
		return createdAt;
	}

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setCategoryEid(String categoryEid){
		this.categoryEid = categoryEid;
	}

	public String getCategoryEid(){
		return categoryEid;
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

    public void setFreeText(List<FreeTextItem> freeText){
        this.freeText = freeText;
    }

    public List<FreeTextItem> getFreeText(){
        return freeText;
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

	public void setSlug(String slug){
		this.slug = slug;
	}

	public String getSlug(){
		return slug;
	}

    public Hours getHours() {
        return hours;
    }

    public void setHours(Hours hours) {
        this.hours = hours;
    }

    public SocialMedia getSocialMedia() {
        return socialMedia;
    }

    public void setSocialMedia(SocialMedia socialMedia) {
        this.socialMedia = socialMedia;
    }

    @Override
 	public String toString(){
		return 
			"Resource{" +
			"eid = '" + eid + '\'' + 
			",addresses = '" + addresses + '\'' + 
			",contactInfo = '" + contactInfo + '\'' + 
			",description = '" + description + '\'' + 
			",photo = '" + photo + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			",title = '" + title + '\'' + 
			",category_eid = '" + categoryEid + '\'' + 
			",updated_at = '" + updatedAt + '\'' + 
			",__v = '" + V + '\'' +
            ",socialMedia = '" + socialMedia + '\'' +
            ",freeText = '" + freeText + '\'' +
            ",_active = '" + active + '\'' +
			",_id = '" + id + '\'' + 
			",slug = '" + slug + '\'' + 
			"}";
		}
}