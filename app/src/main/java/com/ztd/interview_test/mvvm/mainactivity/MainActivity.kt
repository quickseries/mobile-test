package com.ztd.interview_test.mvvm.mainactivity

import android.os.Bundle
import androidx.appcompat.app.AppCompatDelegate
import androidx.core.view.GravityCompat
import androidx.databinding.library.baseAdapters.BR
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.navigation.findNavController
import androidx.navigation.ui.NavigationUI.navigateUp
import androidx.navigation.ui.NavigationUI.setupWithNavController
import androidx.navigation.ui.setupActionBarWithNavController
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.ActivityMainBinding
import com.ztd.interview_test.mvvm.base.BaseActivity
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.support.HasSupportFragmentInjector
import kotlinx.android.synthetic.main.activity_main.*
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */

class MainActivity : BaseActivity<ActivityMainBinding, MainViewModel>(), MainNavigator, HasSupportFragmentInjector {


    @Inject
    lateinit var mainViewModelFactory: ViewModelProvider.Factory
    @Inject
    lateinit var fragmentDispatchingAndroidInjector: DispatchingAndroidInjector<Fragment>

    override val bindingVariable: Int
        get() = BR.vm
    override val layoutId: Int
        get() = R.layout.activity_main
    override val mViewModel: MainViewModel
        get() = ViewModelProviders.of(this, mainViewModelFactory).get(MainViewModel::class.java)

    private lateinit var mBinding: ActivityMainBinding


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        mBinding = viewDataBinding
        mViewModel.setNavigator(this)

        setSupportActionBar(mBinding.toolbar)
        setupNavigation()
    }


    override fun onSupportNavigateUp(): Boolean {
        return navigateUp(findNavController(R.id.nav_host_fragment), mBinding.drawerLayout)
    }


    override fun onBackPressed() {
        if (drawer_layout.isDrawerOpen(GravityCompat.START)) {
            drawer_layout.closeDrawer(GravityCompat.START)
        } else {
            super.onBackPressed()
        }
    }

    private fun setupNavigation() {
        val navController = findNavController(R.id.nav_host_fragment)

        setupActionBarWithNavController(navController, mBinding.drawerLayout)


        mBinding.navView.setNavigationItemSelectedListener { menuItem ->
            menuItem.isChecked = true
            mBinding.drawerLayout.closeDrawers()
            true
        }

        setupWithNavController(mBinding.navView, navController)
    }

    override fun supportFragmentInjector(): AndroidInjector<Fragment> {
        return fragmentDispatchingAndroidInjector
    }

}
