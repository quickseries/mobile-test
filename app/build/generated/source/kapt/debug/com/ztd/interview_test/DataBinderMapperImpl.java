package com.ztd.interview_test;

import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import androidx.databinding.DataBinderMapper;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import com.ztd.interview_test.databinding.ActivityMainBindingImpl;
import com.ztd.interview_test.databinding.FragmentCategoryDetailBindingImpl;
import com.ztd.interview_test.databinding.FragmentDetailBindingImpl;
import com.ztd.interview_test.databinding.FragmentHomeBindingImpl;
import com.ztd.interview_test.databinding.LayoutItemCategoryBindingImpl;
import com.ztd.interview_test.databinding.LayoutItemContactBindingImpl;
import com.ztd.interview_test.databinding.LayoutItemRestaurantBindingImpl;
import com.ztd.interview_test.databinding.LayoutItemVacationSpotBindingImpl;
import java.lang.IllegalArgumentException;
import java.lang.Integer;
import java.lang.Object;
import java.lang.Override;
import java.lang.RuntimeException;
import java.lang.String;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DataBinderMapperImpl extends DataBinderMapper {
  private static final int LAYOUT_ACTIVITYMAIN = 1;

  private static final int LAYOUT_FRAGMENTCATEGORYDETAIL = 2;

  private static final int LAYOUT_FRAGMENTDETAIL = 3;

  private static final int LAYOUT_FRAGMENTHOME = 4;

  private static final int LAYOUT_LAYOUTITEMCATEGORY = 5;

  private static final int LAYOUT_LAYOUTITEMCONTACT = 6;

  private static final int LAYOUT_LAYOUTITEMRESTAURANT = 7;

  private static final int LAYOUT_LAYOUTITEMVACATIONSPOT = 8;

  private static final SparseIntArray INTERNAL_LAYOUT_ID_LOOKUP = new SparseIntArray(8);

  static {
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.activity_main, LAYOUT_ACTIVITYMAIN);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.fragment_category_detail, LAYOUT_FRAGMENTCATEGORYDETAIL);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.fragment_detail, LAYOUT_FRAGMENTDETAIL);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.fragment_home, LAYOUT_FRAGMENTHOME);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.layout_item_category, LAYOUT_LAYOUTITEMCATEGORY);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.layout_item_contact, LAYOUT_LAYOUTITEMCONTACT);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.layout_item_restaurant, LAYOUT_LAYOUTITEMRESTAURANT);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.ztd.interview_test.R.layout.layout_item_vacation_spot, LAYOUT_LAYOUTITEMVACATIONSPOT);
  }

  @Override
  public ViewDataBinding getDataBinder(DataBindingComponent component, View view, int layoutId) {
    int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
    if(localizedLayoutId > 0) {
      final Object tag = view.getTag();
      if(tag == null) {
        throw new RuntimeException("view must have a tag");
      }
      switch(localizedLayoutId) {
        case  LAYOUT_ACTIVITYMAIN: {
          if ("layout/activity_main_0".equals(tag)) {
            return new ActivityMainBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_main is invalid. Received: " + tag);
        }
        case  LAYOUT_FRAGMENTCATEGORYDETAIL: {
          if ("layout/fragment_category_detail_0".equals(tag)) {
            return new FragmentCategoryDetailBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for fragment_category_detail is invalid. Received: " + tag);
        }
        case  LAYOUT_FRAGMENTDETAIL: {
          if ("layout/fragment_detail_0".equals(tag)) {
            return new FragmentDetailBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for fragment_detail is invalid. Received: " + tag);
        }
        case  LAYOUT_FRAGMENTHOME: {
          if ("layout/fragment_home_0".equals(tag)) {
            return new FragmentHomeBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for fragment_home is invalid. Received: " + tag);
        }
        case  LAYOUT_LAYOUTITEMCATEGORY: {
          if ("layout/layout_item_category_0".equals(tag)) {
            return new LayoutItemCategoryBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for layout_item_category is invalid. Received: " + tag);
        }
        case  LAYOUT_LAYOUTITEMCONTACT: {
          if ("layout/layout_item_contact_0".equals(tag)) {
            return new LayoutItemContactBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for layout_item_contact is invalid. Received: " + tag);
        }
        case  LAYOUT_LAYOUTITEMRESTAURANT: {
          if ("layout/layout_item_restaurant_0".equals(tag)) {
            return new LayoutItemRestaurantBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for layout_item_restaurant is invalid. Received: " + tag);
        }
        case  LAYOUT_LAYOUTITEMVACATIONSPOT: {
          if ("layout/layout_item_vacation_spot_0".equals(tag)) {
            return new LayoutItemVacationSpotBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for layout_item_vacation_spot is invalid. Received: " + tag);
        }
      }
    }
    return null;
  }

  @Override
  public ViewDataBinding getDataBinder(DataBindingComponent component, View[] views, int layoutId) {
    if(views == null || views.length == 0) {
      return null;
    }
    int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
    if(localizedLayoutId > 0) {
      final Object tag = views[0].getTag();
      if(tag == null) {
        throw new RuntimeException("view must have a tag");
      }
      switch(localizedLayoutId) {
      }
    }
    return null;
  }

  @Override
  public int getLayoutId(String tag) {
    if (tag == null) {
      return 0;
    }
    Integer tmpVal = InnerLayoutIdLookup.sKeys.get(tag);
    return tmpVal == null ? 0 : tmpVal;
  }

  @Override
  public String convertBrIdToString(int localId) {
    String tmpVal = InnerBrLookup.sKeys.get(localId);
    return tmpVal;
  }

  @Override
  public List<DataBinderMapper> collectDependencies() {
    ArrayList<DataBinderMapper> result = new ArrayList<DataBinderMapper>(1);
    result.add(new androidx.databinding.library.baseAdapters.DataBinderMapperImpl());
    return result;
  }

  private static class InnerBrLookup {
    static final SparseArray<String> sKeys = new SparseArray<String>(3);

    static {
      sKeys.put(0, "_all");
      sKeys.put(1, "vm");
    }
  }

  private static class InnerLayoutIdLookup {
    static final HashMap<String, Integer> sKeys = new HashMap<String, Integer>(8);

    static {
      sKeys.put("layout/activity_main_0", com.ztd.interview_test.R.layout.activity_main);
      sKeys.put("layout/fragment_category_detail_0", com.ztd.interview_test.R.layout.fragment_category_detail);
      sKeys.put("layout/fragment_detail_0", com.ztd.interview_test.R.layout.fragment_detail);
      sKeys.put("layout/fragment_home_0", com.ztd.interview_test.R.layout.fragment_home);
      sKeys.put("layout/layout_item_category_0", com.ztd.interview_test.R.layout.layout_item_category);
      sKeys.put("layout/layout_item_contact_0", com.ztd.interview_test.R.layout.layout_item_contact);
      sKeys.put("layout/layout_item_restaurant_0", com.ztd.interview_test.R.layout.layout_item_restaurant);
      sKeys.put("layout/layout_item_vacation_spot_0", com.ztd.interview_test.R.layout.layout_item_vacation_spot);
    }
  }
}
