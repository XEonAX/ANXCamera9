package android.support.test.internal.runner.lifecycle;

import android.app.Application;
import android.support.test.internal.util.Checks;
import android.support.test.runner.lifecycle.ApplicationLifecycleCallback;
import android.support.test.runner.lifecycle.ApplicationLifecycleMonitor;
import android.support.test.runner.lifecycle.ApplicationStage;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ApplicationLifecycleMonitorImpl implements ApplicationLifecycleMonitor {
    private static final String TAG = "ApplicationLifecycleMonitorImpl";
    private final List<WeakReference<ApplicationLifecycleCallback>> mCallbacks = new ArrayList();

    public void addLifecycleCallback(ApplicationLifecycleCallback applicationLifecycleCallback) {
        Checks.checkNotNull(applicationLifecycleCallback);
        synchronized (this.mCallbacks) {
            Object obj = 1;
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                ApplicationLifecycleCallback applicationLifecycleCallback2 = (ApplicationLifecycleCallback) ((WeakReference) it.next()).get();
                if (applicationLifecycleCallback2 == null) {
                    it.remove();
                } else if (applicationLifecycleCallback2 == applicationLifecycleCallback) {
                    obj = null;
                }
            }
            if (obj != null) {
                this.mCallbacks.add(new WeakReference(applicationLifecycleCallback));
            }
        }
    }

    public void removeLifecycleCallback(ApplicationLifecycleCallback applicationLifecycleCallback) {
        Checks.checkNotNull(applicationLifecycleCallback);
        synchronized (this.mCallbacks) {
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                ApplicationLifecycleCallback applicationLifecycleCallback2 = (ApplicationLifecycleCallback) ((WeakReference) it.next()).get();
                if (applicationLifecycleCallback2 == null) {
                    it.remove();
                } else if (applicationLifecycleCallback2 == applicationLifecycleCallback) {
                    it.remove();
                }
            }
        }
    }

    public void signalLifecycleChange(Application application, ApplicationStage applicationStage) {
        synchronized (this.mCallbacks) {
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                ApplicationLifecycleCallback applicationLifecycleCallback = (ApplicationLifecycleCallback) ((WeakReference) it.next()).get();
                if (applicationLifecycleCallback == null) {
                    it.remove();
                } else {
                    try {
                        String str = TAG;
                        String valueOf = String.valueOf(applicationLifecycleCallback);
                        StringBuilder stringBuilder = new StringBuilder(18 + String.valueOf(valueOf).length());
                        stringBuilder.append("running callback: ");
                        stringBuilder.append(valueOf);
                        Log.d(str, stringBuilder.toString());
                        applicationLifecycleCallback.onApplicationLifecycleChanged(application, applicationStage);
                        str = TAG;
                        valueOf = String.valueOf(applicationLifecycleCallback);
                        stringBuilder = new StringBuilder(20 + String.valueOf(valueOf).length());
                        stringBuilder.append("callback completes: ");
                        stringBuilder.append(valueOf);
                        Log.d(str, stringBuilder.toString());
                    } catch (Throwable e) {
                        Log.e(TAG, String.format("Callback threw exception! (callback: %s stage: %s)", new Object[]{applicationLifecycleCallback, applicationStage}), e);
                    }
                }
            }
        }
    }
}
