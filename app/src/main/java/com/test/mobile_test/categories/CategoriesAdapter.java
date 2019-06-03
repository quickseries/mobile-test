package com.test.mobile_test.categories;


import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.test.mobile_test.R;
import com.test.mobile_test.common.OnItemClickListener;
import com.test.mobile_test.model.CategoryListModel;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class CategoriesAdapter extends RecyclerView.Adapter<CategoriesAdapter.ViewHolder> {
    private List<CategoryListModel> mData;
    private OnItemClickListener<CategoryListModel> mOnItemClickListener;

    public CategoriesAdapter(OnItemClickListener<CategoryListModel> mOnItemClickListener) {
        this.mOnItemClickListener = mOnItemClickListener;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(LayoutInflater.from(parent.getContext())
                .inflate(R.layout.fragment_cateogry_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        CategoryListModel model = mData.get(position);
        if (model != null) {
            holder.name.setText(model.getTitle());
            holder.description.setText(model.getDescription());
        }
    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.category_name)
        TextView name;
        @BindView(R.id.category_desc)
        TextView description;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    mOnItemClickListener.onItemClick(mData.get(getAdapterPosition()));
                }
            });
        }
    }


    public void setData(List<CategoryListModel> mData) {
        this.mData = mData;
        notifyDataSetChanged();
    }
}
