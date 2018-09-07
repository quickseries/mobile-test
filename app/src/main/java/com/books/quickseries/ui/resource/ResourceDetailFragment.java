package com.books.quickseries.ui.resource;

import android.app.DialogFragment;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.books.quickseries.R;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.data.model.Restaurant;
import com.books.quickseries.utils.CommonUtils;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by zakir on 06/09/2018.
 */

public class ResourceDetailFragment extends DialogFragment {

    @BindView(R.id.resource_title)
    TextView title;

    @BindView(R.id.resource_desc)
    TextView desc;

    @BindView(R.id.phone_number)
    TextView phoneNumber;

    @BindView(R.id.toll_free_number)
    TextView tollFree;

    @BindView(R.id.email_address)
    TextView email;

    private static ResourceDetailFragment fragment;
    private Resource resource;

    static ResourceDetailFragment newInstance() {
        if (fragment == null) {
            fragment = new ResourceDetailFragment();
        }
        return fragment;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_resource_dialog, container, false);
        ButterKnife.bind(this, v);
        return v;
    }

    @Override
    public void onResume() {
        super.onResume();
    }
}
