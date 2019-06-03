package com.test.mobile_test.resources;

import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;
import com.test.mobile_test.R;
import com.test.mobile_test.common.OnItemClickListener;
import com.test.mobile_test.model.resource.ResourceModel;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class ResourceAdapter extends RecyclerView.Adapter<ResourceAdapter.ViewHolder> {

    private List<ResourceModel> mData;

    private OnItemClickListener<ResourceModel> onItemClickListener;

    public ResourceAdapter(OnItemClickListener<ResourceModel> onItemClickListener) {
        this.onItemClickListener = onItemClickListener;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(LayoutInflater.from(parent.getContext()).
                inflate(R.layout.fragment_resource_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        ResourceModel model = mData.get(position);
        if (model != null) {
            holder.name.setText(model.getTitle());
            holder.description.setText(Html.fromHtml(model.getDescription()));
            Picasso.get()
                    .load(model.getPhoto())
                    .placeholder(R.mipmap.ic_launcher)
                    .error(R.mipmap.ic_launcher)
                    .into(holder.resourceImgView);
        }
    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.size();
    }

    public void setData(List<ResourceModel> resourceModels) {
        this.mData = resourceModels;
        notifyDataSetChanged();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.resource_name)
        TextView name;
        @BindView(R.id.resource_desc)
        TextView description;
        @BindView(R.id.resource_img)
        ImageView resourceImgView;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    onItemClickListener.onItemClick(mData.get(getAdapterPosition()));
                }
            });
        }
    }
}
