package ca.ivasenko.mobiletest.resources.ui;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.Collections;
import java.util.List;

import ca.ivasenko.mobiletest.R;
import ca.ivasenko.mobiletest.details.ui.DetailsActivity;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;

class ResourcesContentAdapter extends RecyclerView.Adapter<ResourcesContentAdapter.ResourcesViewHolder>
{
    class ResourcesViewHolder extends RecyclerView.ViewHolder
    {
        public TextView title;
        public TextView description;

        private ResourcesViewHolder(View itemView)
        {
            super(itemView);
            title = itemView.findViewById(R.id.title);
            description = itemView.findViewById(R.id.description);
        }
    }

    private final LayoutInflater mInflater;
    private List<ResourceObject> resources;

    ResourcesContentAdapter(Context context)
    {
        mInflater = LayoutInflater.from(context);
    }

    @NonNull
    @Override
    public ResourcesViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int i)
    {
        View itemView = mInflater.inflate(R.layout.base_item_holder, parent, false);
        return new ResourcesViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull ResourcesViewHolder holder, int position)
    {
        if (resources != null)
        {
            ResourceObject object = resources.get(position);
            holder.title.setText(object.getTitle());
            String description = object.getDescription();
            if (description != null && !description.isEmpty())
                holder.description.setText(Html.fromHtml(description).toString().trim());
            holder.itemView.setOnClickListener(view ->
            {
                Intent intent = new Intent(holder.itemView.getContext(), DetailsActivity.class);
                intent.putExtra(ResourcesActivity.EID_EXTRA, resources.get(holder.getAdapterPosition()).getCategory_eid());
                intent.putExtra(ResourcesActivity.RESOURCE_OBJECT_ID_EXTRA, resources.get(holder.getAdapterPosition()).getId());
                holder.itemView.getContext().startActivity(intent);
            });
        }
    }

    @Override
    public int getItemCount()
    {
        if (resources != null)
            return resources.size();
        else return 0;

    }

    void setResources(List<ResourceObject> data)
    {
        resources = data;
        notifyDataSetChanged();
    }

    public void sort(boolean sortOrderAlphabetical)
    {
        Collections.sort(resources, (lhs, rhs) ->
        {
            if (sortOrderAlphabetical)
                return lhs.getTitle().compareTo(rhs.getTitle());
            else
                return rhs.getTitle().compareTo((lhs.getTitle()));
        });
        notifyDataSetChanged();
    }
}
