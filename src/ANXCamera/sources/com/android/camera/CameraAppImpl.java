package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.android.camera.network.util.NetworkUtils;
import com.miui.filtersdk.BeautificationSDK;
import miui.external.Application;

public class CameraAppImpl extends Application {
    private static CameraApplicationDelegate sApplicationDelegate;
    private boolean sLaunched = true;

    public CameraApplicationDelegate onCreateApplicationDelegate() {
        if (sApplicationDelegate == null) {
            sApplicationDelegate = new CameraApplicationDelegate(this);
        }
        CrashHandler.getInstance().init(this);
        NetworkUtils.bind(this);
        BeautificationSDK.init(this);
        return sApplicationDelegate;
    }

    public static Context getAndroidContext() {
        return CameraApplicationDelegate.getAndroidContext();
    }

    public Activity getActivity(int i) {
        return sApplicationDelegate.getActivity(i);
    }

    public void resetRestoreFlag() {
        sApplicationDelegate.resetRestoreFlag();
    }

    public boolean isNeedRestore() {
        return sApplicationDelegate.getSettingsFlag();
    }

    public int getActivityCount() {
        return sApplicationDelegate.getActivityCount();
    }

    public void addActivity(Activity activity) {
        sApplicationDelegate.addActivity(activity);
    }

    public void removeActivity(Activity activity) {
        sApplicationDelegate.removeActivity(activity);
    }

    public void closeAllActivitiesBut(Activity activity) {
        sApplicationDelegate.closeAllActivitiesBut(activity);
    }

    public boolean containsResumedCameraInStack() {
        return sApplicationDelegate.containsResumedCameraInStack();
    }

    public boolean isMainIntentActivityLaunched() {
        return sApplicationDelegate.isMainIntentActivityLaunched();
    }

    public boolean isApplicationFirstLaunched() {
        if (!this.sLaunched) {
            return this.sLaunched;
        }
        this.sLaunched ^= 1;
        return this.sLaunched ^ 1;
    }
}
