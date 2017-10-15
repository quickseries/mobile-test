package com.anoulong.quickseries.screen.tab;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseAdapter;
import com.quickseries.restaurant.RestaurantContract;
import com.squareup.picasso.Picasso;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Anou on 2017-10-15.
 */

public class TabRestaurantAdapter extends BaseAdapter<RestaurantContract.Restaurant, TabRestaurantAdapter.ViewHolder> {

    private TabRestaurantAdapterClickListener clickListener;

    public TabRestaurantAdapter(Context context) {
        super(context);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_restaurant, parent, false);
        return new ViewHolder(view, clickListener);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        final RestaurantContract.Restaurant restaurant = getItem(position);
        Picasso.with(getContext()).load(restaurant.getPhoto()).into(viewHolder.itemRestaurantImage);
        viewHolder.itemRestaurantTitle.setText(restaurant.getTitle());
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        @BindView(R.id.item_restaurant_title)
        TextView itemRestaurantTitle;

        @BindView(R.id.item_restaurant_image)
        ImageView itemRestaurantImage;

        private TabRestaurantAdapterClickListener listener;

        public ViewHolder(View itemView, TabRestaurantAdapterClickListener listener) {
            super(itemView);
            ButterKnife.bind(this, itemView);

            this.listener = listener;

            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            final RestaurantContract.Restaurant r = getItem(getAdapterPosition());
            if (listener != null) {
                listener.onAdapterClicked(r);
            }
        }
    }

    public void setListener(TabRestaurantAdapterClickListener listener) {
        this.clickListener = listener;
    }

    public interface TabRestaurantAdapterClickListener {
        void onAdapterClicked(RestaurantContract.Restaurant restaurant);
    }
}