package com.ztd.interview_test.infrustructure.di;

import androidx.fragment.app.Fragment;
import com.ztd.interview_test.mvvm.homefragment.HomeFragment;
import com.ztd.interview_test.mvvm.homefragment.HomeModule;
import dagger.Binds;
import dagger.Module;
import dagger.Subcomponent;
import dagger.android.AndroidInjector;
import dagger.android.support.FragmentKey;
import dagger.multibindings.IntoMap;

@Module(subcomponents = ActivityBuilder_ProvideHomeFragmentFactory.HomeFragmentSubcomponent.class)
public abstract class ActivityBuilder_ProvideHomeFragmentFactory {
  private ActivityBuilder_ProvideHomeFragmentFactory() {}

  @Binds
  @IntoMap
  @FragmentKey(HomeFragment.class)
  abstract AndroidInjector.Factory<? extends Fragment> bindAndroidInjectorFactory(
      HomeFragmentSubcomponent.Builder builder);

  @Subcomponent(modules = HomeModule.class)
  public interface HomeFragmentSubcomponent extends AndroidInjector<HomeFragment> {
    @Subcomponent.Builder
    abstract class Builder extends AndroidInjector.Builder<HomeFragment> {}
  }
}
