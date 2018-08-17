package com.quickseriestest.Login;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface LoginView {

    void showProgress();

    void hideProgress();

    void setUsernameError();

    void setPasswordError();

    void navigateToCategory();
}
