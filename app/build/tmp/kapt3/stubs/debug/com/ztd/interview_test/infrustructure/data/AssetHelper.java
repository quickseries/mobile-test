package com.ztd.interview_test.infrustructure.data;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/11/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H&J\n\u0010\u0004\u001a\u0004\u0018\u00010\u0003H&J\n\u0010\u0005\u001a\u0004\u0018\u00010\u0003H&\u00a8\u0006\u0006"}, d2 = {"Lcom/ztd/interview_test/infrustructure/data/AssetHelper;", "", "loadCategoriesJson", "", "loadRestaurantsJson", "loadVacationSpotsJson", "app_debug"})
public abstract interface AssetHelper {
    
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.String loadCategoriesJson();
    
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.String loadRestaurantsJson();
    
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.String loadVacationSpotsJson();
}