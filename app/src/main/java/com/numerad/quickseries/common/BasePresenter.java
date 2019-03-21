package com.numerad.quickseries.common;

public interface BasePresenter <V extends BaseView> {
    void onViewAttached(V v);
    void onViewDetached();
    void onDestroyed();
}
