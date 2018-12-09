package com.android.camera.ui;

import android.content.Context;
import android.view.View;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class PopupManager {
    public static final int LEVEL_ONE = 1;
    public static final int LEVEL_TWO = 2;
    private static HashMap<Context, PopupManager> sMap = new HashMap();
    private OnOtherPopupShowedListener mLastListener;
    private ArrayList<OnOtherPopupShowedListener> mListeners = new ArrayList();

    public interface OnOtherPopupShowedListener {
        boolean onOtherPopupShowed(int i);

        void recoverIfNeeded();
    }

    private PopupManager() {
    }

    public void notifyShowPopup(View view, int i) {
        Iterator it = this.mListeners.iterator();
        while (it.hasNext()) {
            OnOtherPopupShowedListener onOtherPopupShowedListener = (OnOtherPopupShowedListener) it.next();
            if (((View) onOtherPopupShowedListener) != view && onOtherPopupShowedListener.onOtherPopupShowed(i)) {
                this.mLastListener = onOtherPopupShowedListener;
            }
        }
    }

    public void notifyDismissPopup() {
        if (this.mLastListener != null) {
            this.mLastListener.recoverIfNeeded();
            this.mLastListener = null;
        }
    }

    public void clearRecoveredPopupListenerIfNeeded(OnOtherPopupShowedListener onOtherPopupShowedListener) {
        if (this.mLastListener == onOtherPopupShowedListener) {
            this.mLastListener = null;
        }
    }

    public void setOnOtherPopupShowedListener(OnOtherPopupShowedListener onOtherPopupShowedListener) {
        if (!this.mListeners.contains(onOtherPopupShowedListener)) {
            this.mListeners.add(onOtherPopupShowedListener);
        }
    }

    public OnOtherPopupShowedListener getLastOnOtherPopupShowedListener() {
        return this.mLastListener;
    }

    public void removeOnOtherPopupShowedListener(OnOtherPopupShowedListener onOtherPopupShowedListener) {
        this.mListeners.remove(onOtherPopupShowedListener);
    }

    public static PopupManager getInstance(Context context) {
        PopupManager popupManager = (PopupManager) sMap.get(context);
        if (popupManager != null) {
            return popupManager;
        }
        popupManager = new PopupManager();
        sMap.put(context, popupManager);
        return popupManager;
    }

    public static void removeInstance(Context context) {
        if (((PopupManager) sMap.get(context)) != null) {
            sMap.remove(context);
        }
    }
}
