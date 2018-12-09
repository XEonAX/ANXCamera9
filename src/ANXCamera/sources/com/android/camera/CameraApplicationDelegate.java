package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.android.camera.statistic.CameraStat;
import java.util.Stack;
import miui.external.ApplicationDelegate;

public class CameraApplicationDelegate extends ApplicationDelegate {
    private static CameraAppImpl sContext;
    private Stack<Activity> mActivities;
    private boolean mMainIntentActivityLaunched = false;
    private boolean mRestoreSetting = false;

    public CameraApplicationDelegate(CameraAppImpl cameraAppImpl) {
        sContext = cameraAppImpl;
    }

    public void onCreate() {
        super.onCreate();
        Util.initialize(this);
        CameraStat.initialize(getAndroidContext());
        this.mActivities = new Stack();
        this.mRestoreSetting = true;
    }

    public synchronized Activity getActivity(int i) {
        if (i >= 0) {
            if (i < getActivityCount()) {
                return (Activity) this.mActivities.get(i);
            }
        }
        return null;
    }

    public static Context getAndroidContext() {
        return sContext;
    }

    public void resetRestoreFlag() {
        this.mRestoreSetting = false;
    }

    public boolean getSettingsFlag() {
        return this.mRestoreSetting;
    }

    public synchronized int getActivityCount() {
        return this.mActivities.size();
    }

    public synchronized void addActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = true;
            }
            this.mActivities.push(activity);
        }
    }

    public synchronized void removeActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = false;
            }
            this.mActivities.remove(activity);
        }
    }

    public synchronized void closeAllActivitiesBut(Activity activity) {
        int i = 0;
        int i2 = 0;
        while (i < getActivityCount()) {
            Activity activity2 = getActivity(i2);
            if (activity2 == activity || "android.intent.action.MAIN".equals(activity2.getIntent().getAction())) {
                i2++;
            } else {
                activity2.finish();
                this.mActivities.remove(activity2);
            }
            i++;
        }
    }

    public synchronized boolean containsResumedCameraInStack() {
        for (int size = this.mActivities.size() - 1; size >= 0; size--) {
            Activity activity = (Activity) this.mActivities.get(size);
            if ((activity instanceof Camera) && !((Camera) activity).isActivityPaused()) {
                return true;
            }
        }
        return false;
    }

    public boolean isMainIntentActivityLaunched() {
        return this.mMainIntentActivityLaunched;
    }
}
