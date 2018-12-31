package com.android.camera.ui;

public interface MessageDispatcher {
    public static final int MSG_DISMISS_DONE = 12;
    public static final int MSG_EV_ADJUST = 1;
    public static final int MSG_EV_VIEW_CAPTURE = 2;
    public static final int MSG_INDICATOR_CLICK_ACTION = 9;
    public static final int MSG_INDICATOR_SELECT_CHANGED = 6;
    public static final int MSG_MUTEX_VIEW_VISIBLE_CHANGE = 4;
    public static final int MSG_POPUP_CLICK = 7;
    public static final int MSG_POPUP_VISIBLE_CHANGE = 3;
    public static final int MSG_RESET_OTHER = 8;
    public static final int MSG_SHOW_DONE = 11;
    public static final int MSG_SHOW_POPUP = 5;
    public static final int MSG_SUB_INDICATOR_CLICK_ACTION = 10;
    public static final int MSG_VIEW_CLICK = 0;

    boolean dispatchMessage(int i, int i2, int i3, Object obj, Object obj2);
}
