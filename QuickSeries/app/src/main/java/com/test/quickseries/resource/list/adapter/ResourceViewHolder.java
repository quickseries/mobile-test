package com.test.quickseries.resource.list.adapter;

import android.databinding.DataBindingUtil;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.test.quickseries.databinding.ResourceItemBinding;

/**
 * Created by elton on 2017-10-15.
 */

public class ResourceViewHolder extends RecyclerView.ViewHolder {

    ResourceItemBinding binding;

    public ResourceViewHolder(View itemView) {
        super(itemView);
        binding = DataBindingUtil.bind(itemView);
    }
}
