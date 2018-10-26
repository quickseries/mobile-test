package ca.ivasenko.mobiletest.categories.model;

import android.arch.persistence.room.Entity;

import ca.ivasenko.mobiletest.model.BaseObject;

@Entity(tableName = "categories")
public class Category extends BaseObject
{
    public Category()
    {
    }
}
