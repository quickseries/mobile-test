package com.test.quickseries.base;

/**
 * Created by elton on 2017-10-14.
 */

public abstract class BasePresenter {

    private boolean viewActive = false;
    private Runnable pendingAction;

    protected boolean isViewActive() {
        return viewActive;
    }

    protected void setViewActive(boolean viewActive) {
        this.viewActive = viewActive;
    }

    protected void post(Runnable runnable) {
        if (isViewActive())
            runnable.run();
        else
            pendingAction = runnable;
    }

    private void executePendingAction() {
        if (pendingAction != null) {
            pendingAction.run();
        }
        pendingAction = null;
    }

    public void onStart() {
        setViewActive(true);
        executePendingAction();
    }

    public void onStop() {
        setViewActive(false);
    }

    public void onDestroy() {
        pendingAction = null;
    }

}
