package com.quickseriestest.Login;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface LoginPresenter {
    void validateCredentials(String username, String password);

    void onDestroy();
}
