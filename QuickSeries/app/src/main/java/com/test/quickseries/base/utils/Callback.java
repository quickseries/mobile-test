package com.test.quickseries.base.utils;

/**
 * Created by elton on 2017-10-15.
 */

public interface Callback<T> {

    void onSuccess(T result);

    void onFailure(Throwable thowable);

}
