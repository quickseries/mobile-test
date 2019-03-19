package com.mvckx.elistique.ui.placedetail

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.activity_place_detail.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class PlaceDetailActivity : AppCompatActivity() {

    private val viewModel = viewModel<PlaceDetailViewModel>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_place_detail)
        setupViewModel()
    }

    private fun setupViewModel() {
        val vm = viewModel.value
        vm.placeLiveData().observe(this, Observer {
            renderViewState(it)
        })
        vm.setPlace(intent.getStringExtra(EXTRA_PLACE_ID), intent.getStringExtra(EXTRA_CATEGORY_ID))
    }

    private fun renderViewState(vs: PlaceDetailViewState) {
        progressBar.visibility = if (vs.loading) View.VISIBLE else View.GONE
        scrollView.visibility = if (vs.loading) View.GONE else View.VISIBLE
        vs.placeDetailItem?.let {

        }
    }

    companion object {
        private const val EXTRA_PLACE_ID = "PLACE_ID"
        private const val EXTRA_CATEGORY_ID = "CATEGORY_ID"

        fun intent(context: Context, placeId: String, categoryId: String): Intent {
            val intent = Intent(context, PlaceDetailActivity::class.java)
            intent.putExtra(EXTRA_PLACE_ID, placeId)
            intent.putExtra(EXTRA_CATEGORY_ID, categoryId)
            return intent
        }
    }
}