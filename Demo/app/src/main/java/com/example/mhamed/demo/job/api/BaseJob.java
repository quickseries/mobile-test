package com.example.mhamed.demo.job.api;

import android.support.annotation.NonNull;

import com.birbit.android.jobqueue.Job;
import com.birbit.android.jobqueue.Params;
import com.birbit.android.jobqueue.RetryConstraint;
import com.example.mhamed.demo.di.AppComponent;
import com.google.gson.Gson;

import org.greenrobot.eventbus.EventBus;

import javax.inject.Inject;

/**
 * @author mhamed
 * @since 2018-11-10
 */
public abstract class BaseJob extends Job {

	/**
	 * Number of times to retry to run the job before cancelling.
	 */
	private int DEFAULT_RETRY_LIMIT = 3;

	public  int UI_HIGH_PRIORITY = 10;
	public int BACKGROUND_PRIORITY = 0;


	@Inject
	protected transient EventBus eventBus;
	@Inject
	protected transient Gson gson;


	public BaseJob(Params params) {
		super(params);
	}


	@Override
	protected RetryConstraint shouldReRunOnThrowable(@NonNull Throwable throwable, int runCount, int maxRunCount) {
		if (runCount > maxRunCount)
			return RetryConstraint.CANCEL;
		else
			return getPriority() == UI_HIGH_PRIORITY? RetryConstraint.RETRY : RetryConstraint.createExponentialBackoff(runCount, 1000);
	}

	public void inject(AppComponent appComponent) {
		appComponent.inject(this);
	}

}
