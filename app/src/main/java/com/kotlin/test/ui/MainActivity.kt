package com.kotlin.test.ui

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import butterknife.BindView
import com.kotlin.test.R
import com.kotlin.test.adapters.CategoriesAdapter
import com.kotlin.test.models.Category
import com.kotlin.test.utils.JsonFileType
import com.kotlin.test.utils.SampleClass
import java.util.ArrayList

class MainActivity : BaseActivity(), CategoriesAdapter.CategoriesClickListener  {

    @BindView(R.id.rv_categories)
    internal var categoriesRV: RecyclerView? = null

    private var categoriesAdapter: CategoriesAdapter? = null
    private var categoryList: MutableList<Category>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        categoryList = ArrayList()
        activityComponent!!.inject(this)


        categoryList = SampleClass.getInstance().returnList(activityComponent!!.context, JsonFileType.CATEGORIES)

        setCategoriesAdapter()
    }

    private fun setCategoriesAdapter() {
        if (categoryList != null) {
            categoriesAdapter = CategoriesAdapter(this, categoryList!!, this)
            categoriesRV!!.setHasFixedSize(true)
            categoriesRV!!.layoutManager = LinearLayoutManager(this)
            categoriesRV!!.adapter = categoriesAdapter
        }
    }

    override fun onCategoryItem(category: Category) {

    }
}
