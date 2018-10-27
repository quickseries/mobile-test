package ca.ivasenko.mobiletest.resources.model;

import android.arch.persistence.room.ColumnInfo;
import android.arch.persistence.room.Entity;
import android.arch.persistence.room.TypeConverters;

import java.util.List;

import ca.ivasenko.mobiletest.Utils.Converters;
import ca.ivasenko.mobiletest.model.BaseObject;

@Entity(tableName = "resources")
@TypeConverters(Converters.class)
public class ResourceObject extends BaseObject
{
    @ColumnInfo(name = "categoryeid")
    private String category_eid;
    private String photo;

    private BusinessHours bizHours = null;
    private SocialMedia socialMedia = null;
    private List<Address> addresses = null;
    private List<FreeText> freeText = null;
    private ContactInfo contactInfo = null;

    public ResourceObject()
    {
    }

    public String getCategory_eid()
    {
        return category_eid;
    }

    public void setCategory_eid(String category_eid)
    {
        this.category_eid = category_eid;
    }

    public String getPhoto()
    {
        return photo;
    }

    public void setPhoto(String photo)
    {
        this.photo = photo;
    }

    public BusinessHours getBizHours()
    {
        return bizHours;
    }

    public void setBizHours(BusinessHours bizHours)
    {
        this.bizHours = bizHours;
    }

    public SocialMedia getSocialMedia()
    {
        return socialMedia;
    }

    public void setSocialMedia(SocialMedia socialMedia)
    {
        this.socialMedia = socialMedia;
    }

    public List<Address> getAddresses()
    {
        return addresses;
    }

    public void setAddresses(List<Address> addresses)
    {
        this.addresses = addresses;
    }

    public List<FreeText> getFreeText()
    {
        return freeText;
    }

    public void setFreeText(List<FreeText> freeText)
    {
        this.freeText = freeText;
    }

    public ContactInfo getContactInfo()
    {
        return contactInfo;
    }

    public void setContactInfo(ContactInfo contactInfo)
    {
        this.contactInfo = contactInfo;
    }
}
