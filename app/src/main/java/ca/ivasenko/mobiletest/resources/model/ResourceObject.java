package ca.ivasenko.mobiletest.resources.model;

import android.arch.persistence.room.ColumnInfo;
import android.arch.persistence.room.Entity;

import ca.ivasenko.mobiletest.model.BaseObject;

//TODO: address and social media
@Entity(tableName = "resources")
public class ResourceObject extends BaseObject
{
    @ColumnInfo(name = "categoryeid")
    private String category_eid;
    private String photo;

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
}
