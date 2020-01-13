package com.quickseries.mobiletest.ui.resources

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProviders
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.domain.categories.model.Slug
import com.quickseries.mobiletest.ui.resources.list.ResourcesListFragment

class ResourcesActivity : AppCompatActivity() {

    private val slug by lazy {
        intent?.extras?.getSerializable(EXTRA_SLUG) as Slug
    }

    private val viewmodel by lazy {
        ViewModelProviders
            .of(this, ResourcesViewModel.Factory(slug))
            .get(ResourcesViewModel::class.java)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_resources)

        viewmodel.fetchResources()

        supportFragmentManager.beginTransaction()
            .replace(R.id.resources_container, ResourcesListFragment.newInstance())
            .commit()
    }

    companion object {
        private const val EXTRA_SLUG = "EXTRA_SLUG"

        fun newIntent(context: Context, slug: Slug) = Intent(context, ResourcesActivity::class.java).apply {
            putExtra(EXTRA_SLUG, slug)
        }
    }
}