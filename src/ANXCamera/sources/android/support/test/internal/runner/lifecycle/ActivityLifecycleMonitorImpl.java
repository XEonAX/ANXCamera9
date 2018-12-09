package android.support.test.internal.runner.lifecycle;

import android.app.Activity;
import android.os.Looper;
import android.support.test.internal.util.Checks;
import android.support.test.runner.lifecycle.ActivityLifecycleCallback;
import android.support.test.runner.lifecycle.ActivityLifecycleMonitor;
import android.support.test.runner.lifecycle.Stage;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public final class ActivityLifecycleMonitorImpl implements ActivityLifecycleMonitor {
    private static final String TAG = "LifecycleMonitor";
    private List<ActivityStatus> mActivityStatuses;
    private final List<WeakReference<ActivityLifecycleCallback>> mCallbacks;
    private final boolean mDeclawThreadCheck;

    private static class ActivityStatus {
        private final WeakReference<Activity> mActivityRef;
        private Stage mLifecycleStage;

        ActivityStatus(Activity activity, Stage stage) {
            this.mActivityRef = new WeakReference((Activity) Checks.checkNotNull(activity));
            this.mLifecycleStage = (Stage) Checks.checkNotNull(stage);
        }
    }

    public ActivityLifecycleMonitorImpl() {
        this(false);
    }

    public ActivityLifecycleMonitorImpl(boolean z) {
        this.mCallbacks = new ArrayList();
        this.mActivityStatuses = new ArrayList();
        this.mDeclawThreadCheck = z;
    }

    public void addLifecycleCallback(ActivityLifecycleCallback activityLifecycleCallback) {
        Checks.checkNotNull(activityLifecycleCallback);
        synchronized (this.mCallbacks) {
            Object obj = 1;
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                ActivityLifecycleCallback activityLifecycleCallback2 = (ActivityLifecycleCallback) ((WeakReference) it.next()).get();
                if (activityLifecycleCallback2 == null) {
                    it.remove();
                } else if (activityLifecycleCallback2 == activityLifecycleCallback) {
                    obj = null;
                }
            }
            if (obj != null) {
                this.mCallbacks.add(new WeakReference(activityLifecycleCallback));
            }
        }
    }

    public void removeLifecycleCallback(ActivityLifecycleCallback activityLifecycleCallback) {
        Checks.checkNotNull(activityLifecycleCallback);
        synchronized (this.mCallbacks) {
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                ActivityLifecycleCallback activityLifecycleCallback2 = (ActivityLifecycleCallback) ((WeakReference) it.next()).get();
                if (activityLifecycleCallback2 == null) {
                    it.remove();
                } else if (activityLifecycleCallback2 == activityLifecycleCallback) {
                    it.remove();
                }
            }
        }
    }

    public Stage getLifecycleStageOf(Activity activity) {
        checkMainThread();
        Checks.checkNotNull(activity);
        Iterator it = this.mActivityStatuses.iterator();
        while (it.hasNext()) {
            ActivityStatus activityStatus = (ActivityStatus) it.next();
            Activity activity2 = (Activity) activityStatus.mActivityRef.get();
            if (activity2 == null) {
                it.remove();
            } else if (activity == activity2) {
                return activityStatus.mLifecycleStage;
            }
        }
        String valueOf = String.valueOf(activity);
        StringBuilder stringBuilder = new StringBuilder(18 + String.valueOf(valueOf).length());
        stringBuilder.append("Unknown activity: ");
        stringBuilder.append(valueOf);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public Collection<Activity> getActivitiesInStage(Stage stage) {
        checkMainThread();
        Checks.checkNotNull(stage);
        Collection arrayList = new ArrayList();
        Iterator it = this.mActivityStatuses.iterator();
        while (it.hasNext()) {
            ActivityStatus activityStatus = (ActivityStatus) it.next();
            Activity activity = (Activity) activityStatus.mActivityRef.get();
            if (activity == null) {
                it.remove();
            } else if (stage == activityStatus.mLifecycleStage) {
                arrayList.add(activity);
            }
        }
        return arrayList;
    }

    public void signalLifecycleChange(Stage stage, Activity activity) {
        String str = TAG;
        String valueOf = String.valueOf(activity);
        String valueOf2 = String.valueOf(stage);
        StringBuilder stringBuilder = new StringBuilder((30 + String.valueOf(valueOf).length()) + String.valueOf(valueOf2).length());
        stringBuilder.append("Lifecycle status change: ");
        stringBuilder.append(valueOf);
        stringBuilder.append(" in: ");
        stringBuilder.append(valueOf2);
        Log.d(str, stringBuilder.toString());
        Iterator it = this.mActivityStatuses.iterator();
        int i = 1;
        while (it.hasNext()) {
            ActivityStatus activityStatus = (ActivityStatus) it.next();
            Activity activity2 = (Activity) activityStatus.mActivityRef.get();
            if (activity2 == null) {
                it.remove();
            } else if (activity == activity2) {
                activityStatus.mLifecycleStage = stage;
                i = 0;
            }
        }
        if (i != 0) {
            this.mActivityStatuses.add(new ActivityStatus(activity, stage));
        }
        synchronized (this.mCallbacks) {
            Iterator it2 = this.mCallbacks.iterator();
            while (it2.hasNext()) {
                ActivityLifecycleCallback activityLifecycleCallback = (ActivityLifecycleCallback) ((WeakReference) it2.next()).get();
                if (activityLifecycleCallback == null) {
                    it2.remove();
                } else {
                    try {
                        String str2 = TAG;
                        String valueOf3 = String.valueOf(activityLifecycleCallback);
                        StringBuilder stringBuilder2 = new StringBuilder(18 + String.valueOf(valueOf3).length());
                        stringBuilder2.append("running callback: ");
                        stringBuilder2.append(valueOf3);
                        Log.d(str2, stringBuilder2.toString());
                        activityLifecycleCallback.onActivityLifecycleChanged(activity, stage);
                        str2 = TAG;
                        valueOf3 = String.valueOf(activityLifecycleCallback);
                        stringBuilder2 = new StringBuilder(20 + String.valueOf(valueOf3).length());
                        stringBuilder2.append("callback completes: ");
                        stringBuilder2.append(valueOf3);
                        Log.d(str2, stringBuilder2.toString());
                    } catch (Throwable e) {
                        Log.e(TAG, String.format("Callback threw exception! (callback: %s activity: %s stage: %s)", new Object[]{activityLifecycleCallback, activity, stage}), e);
                    }
                }
            }
        }
    }

    private void checkMainThread() {
        if (!this.mDeclawThreadCheck && !Thread.currentThread().equals(Looper.getMainLooper().getThread())) {
            throw new IllegalStateException("Querying activity state off main thread is not allowed.");
        }
    }
}
