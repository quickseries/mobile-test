package com.numerad.quickseries.domain;

/**
 * Read write things to persistent storage
 */
public interface Storage {

    void clear();
    boolean isEmpty();
    int getPreferencesVersion();

    int getNumDiscs();
    void setNumDiscs(int value);
}
