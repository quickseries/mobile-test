package com.derek.quickseriestest.mobile_test.entities;

/**
 * Created by ddibblee on 8/14/2017.
 * This class holds business hour information
 */

public class BizHours {

    private Sunday sunday;
    private Monday monday;

    public Sunday getSunday() {
        return sunday;
    }

    public void setSunday(Sunday sunday) {
        this.sunday = sunday;
    }

    public Monday getMonday() {
        return monday;
    }

    public void setMonday(Monday monday) {
        this.monday = monday;
    }
}
