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
import com.quickseries.vacation.VacationContract;
import com.squareup.picasso.Picasso;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Anou on 2017-10-15.
 */

public class TabVacationAdapter extends BaseAdapter<VacationContract.Vacation, TabVacationAdapter.ViewHolder> {

    private TabVacationAdapterClickListener clickListener;

    public TabVacationAdapter(Context context) {
        super(context);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_vacation, parent, false);
        return new ViewHolder(view, clickListener);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        final VacationContract.Vacation vacation = getItem(position);
        Picasso.with(getContext()).load(vacation.getPhoto()).into(viewHolder.itemVacationImage);
        viewHolder.itemVacationTitle.setText(vacation.getTitle());
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        @BindView(R.id.item_vacation_title)
        TextView itemVacationTitle;

        @BindView(R.id.item_vacation_image)
        ImageView itemVacationImage;

        private TabVacationAdapterClickListener listener;

        public ViewHolder(View itemView, TabVacationAdapterClickListener listener) {
            super(itemView);
            ButterKnife.bind(this, itemView);

            this.listener = listener;

            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            final VacationContract.Vacation vacation = getItem(getAdapterPosition());
            if (listener != null) {
                listener.onAdapterClicked(vacation);
            }
        }
    }

    public void setListener(TabVacationAdapterClickListener listener) {
        this.clickListener = listener;
    }

    public interface TabVacationAdapterClickListener {
        void onAdapterClicked(VacationContract.Vacation vacation);
    }
}