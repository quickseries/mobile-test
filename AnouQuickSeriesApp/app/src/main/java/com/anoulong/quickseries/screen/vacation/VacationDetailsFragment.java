package com.anoulong.quickseries.screen.vacation;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseFragment;
import com.quickseries.vacation.VacationContract;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class VacationDetailsFragment extends BaseFragment{

    private static final String TAG = VacationDetailsFragment.class.getSimpleName();
    public static final String KEY_VACATION = TAG + "_KEY_VACATION";

    @Inject
    Retrofit retrofit;

    private VacationContract.Vacation vacation;

    @BindView(R.id.fragment_vacation_title)
    TextView fragmentVacationTitle;

    public static VacationDetailsFragment newInstance(VacationContract.Vacation vacation) {
        Bundle args = new Bundle();
        args.putSerializable(KEY_VACATION, vacation);
        VacationDetailsFragment fragment = new VacationDetailsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        if (getArguments() != null) {
            vacation = (VacationContract.Vacation)getArguments().getSerializable(KEY_VACATION);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_details_vacation, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.setupView();
    }

    private void setupView() {
        if(vacation != null) {
            fragmentVacationTitle.setText(vacation.getTitle());
        }

    }

    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_restaurant);
    }

    @Override
    protected String getFragmentTag() {
        return TAG;
    }

}
