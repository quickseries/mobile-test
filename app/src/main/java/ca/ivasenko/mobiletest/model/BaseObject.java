package ca.ivasenko.mobiletest.model;

import android.arch.persistence.room.ColumnInfo;
import android.arch.persistence.room.PrimaryKey;

//TODO: use typeconverter for the date
public class BaseObject
{
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    private int id;
    @ColumnInfo(name = "jsonid")
    private String _id;
    @ColumnInfo(name = "updatedat")
    private String updated_at;
    private String slug;
    @ColumnInfo(name = "custommoduleeid")
    private String custom_module_eid;
    private String eid;
    private String title;
    private String description;
    @ColumnInfo(name = "v")
    private int _v;
    @ColumnInfo(name = "active")
    private boolean _active;
    @ColumnInfo(name = "createdat")
    private String created_at;

    public BaseObject()
    {
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String get_id()
    {
        return _id;
    }

    public void set_id(String _id)
    {
        this._id = _id;
    }

    public String getUpdated_at()
    {
        return updated_at;
    }

    public void setUpdated_at(String updated_at)
    {
        this.updated_at = updated_at;
    }

    public String getSlug()
    {
        return slug;
    }

    public void setSlug(String slug)
    {
        this.slug = slug;
    }

    public String getCustom_module_eid()
    {
        return custom_module_eid;
    }

    public void setCustom_module_eid(String custom_module_eid)
    {
        this.custom_module_eid = custom_module_eid;
    }

    public String getEid()
    {
        return eid;
    }

    public void setEid(String eid)
    {
        this.eid = eid;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public int get_v()
    {
        return _v;
    }

    public void set_v(int _v)
    {
        this._v = _v;
    }

    public boolean is_active()
    {
        return _active;
    }

    public void set_active(boolean _active)
    {
        this._active = _active;
    }

    public String getCreated_at()
    {
        return created_at;
    }

    public void setCreated_at(String created_at)
    {
        this.created_at = created_at;
    }
}
