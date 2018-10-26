package com.quickseries.quickseriesapp.ui

import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.support.v7.app.AppCompatActivity
import android.view.View
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.network.localdao.QSCategories
import com.quickseries.quickseriesapp.ui.categories.FragmentParent
import kotlinx.android.synthetic.main.activity_main.*

class BaseActivity : AppCompatActivity(), BaseContract.View {

    lateinit var presenter: BaseContract.Presenter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        presenter = BasePresenter(this)
        presenter.load(true)
    }


    override fun showProgress(show: Boolean) {
        runOnUiThread {
            if (show)
                progressBar.visibility = View.VISIBLE
            else
                progressBar.visibility = View.GONE
        }
    }

    override fun showError(message: String) {
        runOnUiThread {
            AlertDialog.Builder(this)
                .setTitle("Uh-oh!")
                .setMessage(message)
                .setPositiveButton("Ok", null)
                .show()
        }
    }

    override fun updateRecentList(data: List<QSCategories>) {
        data.let { list ->
            list.forEach { qsCategories: QSCategories ->
                (fragmentParent as FragmentParent).addPage(
                    qsCategories.title,
                    if (qsCategories.slug == "vacation-spots") "vacation-spot" else qsCategories.slug
                )
            }
        }
    }

}
