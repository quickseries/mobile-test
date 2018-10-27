package ca.ivasenko.mobiletest.Utils;

import java.util.ArrayList;
import java.util.List;

import ca.ivasenko.mobiletest.categories.model.Category;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

public class FakeSource
{
    public static Category getFakeCategory()
    {
        Category result = new Category();
        result.set_id("some id");
        result.setTitle("some title");
        result.setDescription("some description");
        result.setSlug("some slug");
        result.setEid("some eid");
        result.setCustom_module_eid("some Custom_module_eid");
        result.set_active(false);
        result.set_v(0);
        return result;
    }

    public static List<Category> getFakeCategories(int quantity)
    {
        List<Category> result = new ArrayList<>();
        for(int i = 0; i < quantity; i++)
        {
            result.add(getFakeCategory());
        }
        return result;
    }

    public static ResourceObject getFakeResource()
    {
        ResourceObject result = new ResourceObject();
        result.set_id("some id");
        result.setTitle("some title");
        result.setDescription("some description");
        result.setSlug("some slug");
        result.setEid("some eid");
        result.setCustom_module_eid("some Custom_module_eid");
        result.set_active(false);
        result.set_v(0);
        result.setCategory_eid("category eid");
        result.setPhoto("fake photo link");
        return result;
    }

    public static List<ResourceObject> getFakeResources(int quantity)
    {
        List<ResourceObject> result = new ArrayList<>();
        for(int i = 0; i < quantity; i++)
        {
            result.add(getFakeResource());
        }
        return result;
    }
}
