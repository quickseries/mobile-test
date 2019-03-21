package com.numerad.quickseries.common;

import androidx.annotation.Nullable;

public interface BaseView<T extends BasePresenter> {
    void setPresenter(@Nullable T var1);

    void onViewAttached();
}
