package com.android.camera.ui;

public interface RollAdapter {
    int getCenterIndex();

    String getItem(int i);

    int getItemIndexByValue(Object obj);

    int getItemValue(int i);

    int getItemsCount();

    int getMaxItem();

    int getMaxValue();

    int getMaximumLength();

    int getMinValue();
}
