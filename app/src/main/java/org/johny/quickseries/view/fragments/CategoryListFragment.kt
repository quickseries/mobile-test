package org.johny.quickseries.view.fragments

import android.os.Bundle
import android.view.*
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.navigation.Navigation.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.fragment_category.*
import org.johny.quickseries.R
import org.johny.quickseries.model.Category
import org.johny.quickseries.view.adapters.CategoryAdapter
import org.johny.quickseries.view.adapters.ClickListener
import org.johny.quickseries.view.fragments.CategoryListFragmentDirections.actionCategoryToSubcategory
import org.johny.quickseries.viewmodel.ListViewModel


open class CategoryListFragment : Fragment() {
    private var sorted = false

    val slug by lazy {
        this.arguments?.getString("slug") ?: "categories"
    }

    private val title by lazy {
        this.arguments?.getString("title") ?: getString(R.string.category_title)
    }

    private val clickListener: ClickListener = this::onCategoryClicked

    private val recyclerViewAdapter = CategoryAdapter(clickListener)
    private lateinit var viewModel: ListViewModel


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_category, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupRecyclerView()
        viewModel = ViewModelProviders.of(this).get(ListViewModel::class.java)
        viewModel.observableList.observe(this, Observer { categories ->
            categories?.let { render(categories) }
        })
    }

    override fun onResume() {
        super.onResume()
        activity?.title = title
        viewModel.load(slug)
    }

    private fun render(categoryList: List<Category>) {
        recyclerViewAdapter.updateCategories(categoryList)
    }


    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.menu_list, menu)
        super.onCreateOptionsMenu(menu, inflater)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return (when (item.itemId) {

            R.id.sortItems -> {
                sorted = !sorted
                if (sorted) viewModel.sort()
                else viewModel.reverseSort()
                true
            }
            else ->
                super.onOptionsItemSelected(item)
        })
    }

    open fun onCategoryClicked(category: Category) {
        val navDirections = actionCategoryToSubcategory(category.slug, category.title)
        view?.let {
            findNavController(it).navigate(navDirections)
        }
    }

    private fun setupRecyclerView() {
        categoriesRecyclerView.layoutManager = LinearLayoutManager(this.context)
        categoriesRecyclerView.adapter = recyclerViewAdapter
    }
}