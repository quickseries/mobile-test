package com.numerad.quickseries.dagger;

import com.numerad.quickseries.main.MainActivity;
import javax.inject.Singleton;
import dagger.Component;

@Singleton
@Component(modules = { AppModule.class, MainModule.class })
public interface MainComponent {

    void inject(MainActivity activity);

}
