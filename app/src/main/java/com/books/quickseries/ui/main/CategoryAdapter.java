package com.books.quickseries.ui.main;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.books.quickseries.R;
import com.books.quickseries.data.model.Category;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

/**
 * Created by zakir on 06/09/2018.
 */

public class CategoryAdapter extends RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder> {


    private final List<Category> mCategories;
    private Callback callback;

    public CategoryAdapter(List<Category> categories) {
        mCategories = categories;
    }

    @NonNull
    @Override
    public CategoryViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View v = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_category_view, parent, false);


        return new CategoryViewHolder(v, callback);
    }

    @Override
    public void onBindViewHolder(@NonNull CategoryViewHolder holder, final int position) {
        final Category category = mCategories.get(position);

        holder.mCategoryTitle.setText(category.getTitle());
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                callback.onCategoryItemClicked(position);
            }
        });
    }

    public void addItems(List<Category> categories) {
        mCategories.addAll(categories);
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        return mCategories.size();
    }

    public void setCallback(Callback callback) {
        this.callback = callback;
    }

    public static class CategoryViewHolder extends RecyclerView.ViewHolder {


        @BindView(R.id.category_title)
        TextView mCategoryTitle;

        View itemView;

//        @BindView(R.id.category_desc) // hiding this desc is not there for vacation spots
//        TextView mCategoryDesc;


        public CategoryViewHolder(View itemView, final Callback callback) {
            super(itemView);
            this.itemView = itemView;
            ButterKnife.bind(this, itemView);
        }

    }

    public interface Callback {
        void onCategoryItemClicked(int position);
    }
}
