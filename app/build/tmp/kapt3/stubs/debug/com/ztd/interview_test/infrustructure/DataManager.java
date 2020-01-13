package com.ztd.interview_test.infrustructure;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/11/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u000e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H&J\u000e\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003H&J\u000e\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0003H&\u00a8\u0006\t"}, d2 = {"Lcom/ztd/interview_test/infrustructure/DataManager;", "", "getAllCategories", "", "Lcom/ztd/interview_test/infrustructure/data/models/category/CategoryModel;", "getAllRestaurants", "Lcom/ztd/interview_test/infrustructure/data/models/restaurant/RestaurantModel;", "getAllVacationSpots", "Lcom/ztd/interview_test/infrustructure/data/models/vacationspot/VacationSpotModel;", "app_debug"})
public abstract interface DataManager {
    
    @org.jetbrains.annotations.NotNull()
    public abstract java.util.List<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel> getAllCategories();
    
    @org.jetbrains.annotations.NotNull()
    public abstract java.util.List<com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel> getAllRestaurants();
    
    @org.jetbrains.annotations.NotNull()
    public abstract java.util.List<com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel> getAllVacationSpots();
}