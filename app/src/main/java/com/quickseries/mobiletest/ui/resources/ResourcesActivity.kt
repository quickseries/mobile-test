package com.quickseries.mobiletest.ui.resources

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProviders
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.domain.categories.model.Slug
import com.quickseries.mobiletest.ui.resources.details.ResourceDetailsFragment
import com.quickseries.mobiletest.ui.resources.list.ResourcesListFragment
import com.quickseries.mobiletest.ui.resources.model.ResourceItem


class ResourcesActivity : AppCompatActivity(), ResourcesListFragment.Listener {

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

        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        viewmodel.fetchResources()

        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(R.id.resources_container, ResourcesListFragment.newInstance())
                .commit()
        }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            android.R.id.home -> {
                onBackPressed()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    override fun onResourceItemClick(resourceItem: ResourceItem) {
        supportFragmentManager.beginTransaction()
            .replace(R.id.resources_container, ResourceDetailsFragment.newInstance())
            .addToBackStack(null)
            .commit()
    }

    companion object {
        private const val EXTRA_SLUG = "EXTRA_SLUG"

        fun newIntent(context: Context, slug: Slug) = Intent(context, ResourcesActivity::class.java).apply {
            putExtra(EXTRA_SLUG, slug)
        }
    }
}