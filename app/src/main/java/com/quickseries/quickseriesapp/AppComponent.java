package com.quickseries.quickseriesapp;

import com.quickseries.quickseriesapp.network.api.ApiClient;
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper;
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper;
import com.quickseries.quickseriesapp.ui.BasePresenter;
import com.quickseries.quickseriesapp.ui.categories.categoryitem.CategoryItemPresenter;
import dagger.Component;
import org.jetbrains.annotations.NotNull;

import javax.inject.Singleton;

/**
 * Created by parth.gadhiya on 2018-10-26.
 */


@Singleton
@Component(modules = {AppModule.class})
public interface AppComponent {
    void inject(QuickSeriesApp target);

    void inject(@NotNull ApiClient apiClient);

    void inject(@NotNull RealmWrapper target);

    void inject(@NotNull ApiWrapper target);

    void inject(@NotNull CategoryItemPresenter target);

    void inject(@NotNull BasePresenter target);

}
