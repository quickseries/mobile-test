package ca.ivasenko.mobiletest.categories.ui;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

import ca.ivasenko.mobiletest.R;
import ca.ivasenko.mobiletest.categories.model.Category;
import ca.ivasenko.mobiletest.resources.ui.ResourcesActivity;

class CategoriesContentAdapter extends RecyclerView.Adapter<CategoriesContentAdapter.CategoryViewHolder>
{
    class CategoryViewHolder extends RecyclerView.ViewHolder
    {
        public TextView title;
        public TextView description;

        private CategoryViewHolder(View itemView)
        {
            super(itemView);
            title = itemView.findViewById(R.id.title);
            description = itemView.findViewById(R.id.description);
        }
    }

    private final LayoutInflater mInflater;
    private List<Category> categories;

    CategoriesContentAdapter(Context context)
    {
        mInflater = LayoutInflater.from(context);
    }

    @NonNull
    @Override
    public CategoryViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int i)
    {
        View itemView = mInflater.inflate(R.layout.base_item_holder, parent, false);
        return new CategoryViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull CategoryViewHolder holder, int position)
    {
        if (categories != null)
        {
            Category category = categories.get(position);
            holder.title.setText(category.getTitle());
            String description = category.getDescription();
            if (description != null && !description.isEmpty())
                holder.description.setText(Html.fromHtml(description).toString().trim());
            holder.itemView.setOnClickListener(view ->
            {
                Intent intent = new Intent(holder.itemView.getContext(), ResourcesActivity.class);
                intent.putExtra(ResourcesActivity.EID_EXTRA, categories.get(holder.getAdapterPosition()).getEid());
                holder.itemView.getContext().startActivity(intent);
            });
        }
    }

    @Override
    public int getItemCount()
    {
        if (categories != null)
            return categories.size();
        else return 0;

    }

    void setCategories(List<Category> data)
    {
        categories = data;
        notifyDataSetChanged();
    }
}
