package com.quickseries.mobiletest.fragments.categoryDetail


import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.database.sqlite.SQLiteDatabase
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.util.Extras
import com.quickseries.mobiletestcore.util.UUIDUtil
import com.quickseries.mobiletestcore.viewModels.CategoryDetailViewModel
import kotlinx.android.synthetic.main.fragment_category_detail.*
import java.util.*
import com.quickseries.mobiletest.util.TextUtil

class CategoryDetailFragment : Fragment() {

    private var categoryId: UUID = UUIDUtil.emptyUUID()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_category_detail, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        this.arguments?.let {
            categoryId = UUID.fromString(it.getString(Extras.EXTRA_ID, UUIDUtil.emptyUUID().toString()))
        }

        val viewModel = ViewModelProviders.of(this).get(CategoryDetailViewModel::class.java)
        viewModel.getCategory().observe(this, Observer { category ->
            if (category != null) {
                titleTextView.text = category.title
                descriptionTextView.text = TextUtil.textFromHtml(category.description)
                descriptionLayout.visibility = if (category.description.isBlank()) View.GONE else View.VISIBLE
                creationDateTextView.text = TextUtil.formatDateTime(category.createdAt)
            }
        })
        viewModel.setCategoryId(categoryId)
    }
}
