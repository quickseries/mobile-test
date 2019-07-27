package com.android.kotlin.ui

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ProgressBar
import com.android.kotlin.MobileTestApplication
import com.android.kotlin.di.components.DaggerActivityComponent
import com.android.kotlin.di.modules.ActivityModule
import com.android.kotlin.utils.SchedulerProvider
import com.android.kotlindemo.R
import com.jjoe64.graphview.GraphView
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import javax.inject.Inject
import com.jjoe64.graphview.series.LineGraphSeries
import com.jjoe64.graphview.series.DataPoint


class BlockChainGraphActivity : AppCompatActivity() {

    @Inject
    lateinit var mainViewModel: MainActivityViewModel
    private lateinit var compositeDisposable: CompositeDisposable
    private var disposable: Disposable? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_block_chain_graph)
        val activityComponent = DaggerActivityComponent.builder()
                .appComponent(MobileTestApplication.get(this).component())
                .activityModule(ActivityModule(SchedulerProvider()))
                .build()
        activityComponent.inject(this)
        val progressBar : ProgressBar = findViewById(R.id.activity_restaurants_progress_bar)
        val graphView : GraphView = findViewById(R.id.activity_block_chain_graph)
        progressBar.visibility = View.VISIBLE
        disposable = mainViewModel.provideBitcoinPrice("5weeks","8hours")
                ?.subscribe({ result ->
                    val series = LineGraphSeries<DataPoint>( )
                    graphView.addSeries(series)
                    progressBar.visibility = View.GONE
                    mainViewModel.setIsLoading(false)
                }, { e -> e.printStackTrace() })
    }

    override fun onPause() {
        super.onPause()
        if (compositeDisposable.size() > 0) {
            compositeDisposable.clear()
        }
    }

    override fun onResume() {
        super.onResume()
        if (disposable != null) {
            compositeDisposable.add(disposable!!)
        }
    }
}
