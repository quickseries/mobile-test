package com.ztd.interview_test.infrustructure;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/11/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0017\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u000e\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\bH\u0016J\u000e\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\bH\u0016J\u000e\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\bH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"}, d2 = {"Lcom/ztd/interview_test/infrustructure/AppDataManager;", "Lcom/ztd/interview_test/infrustructure/DataManager;", "assetHelper", "Lcom/ztd/interview_test/infrustructure/data/AssetHelper;", "gson", "Lcom/google/gson/Gson;", "(Lcom/ztd/interview_test/infrustructure/data/AssetHelper;Lcom/google/gson/Gson;)V", "getAllCategories", "", "Lcom/ztd/interview_test/infrustructure/data/models/category/CategoryModel;", "getAllRestaurants", "Lcom/ztd/interview_test/infrustructure/data/models/restaurant/Restaurant;", "getAllVacationSpots", "Lcom/ztd/interview_test/infrustructure/data/models/vacationspot/VacationSpot;", "app_debug"})
public final class AppDataManager implements com.ztd.interview_test.infrustructure.DataManager {
    private final com.ztd.interview_test.infrustructure.data.AssetHelper assetHelper = null;
    private final com.google.gson.Gson gson = null;
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public java.util.List<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel> getAllCategories() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public java.util.List<com.ztd.interview_test.infrustructure.data.models.restaurant.Restaurant> getAllRestaurants() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public java.util.List<com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpot> getAllVacationSpots() {
        return null;
    }
    
    @javax.inject.Inject()
    public AppDataManager(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.infrustructure.data.AssetHelper assetHelper, @org.jetbrains.annotations.NotNull()
    com.google.gson.Gson gson) {
        super();
    }
}