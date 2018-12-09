package android.support.test.runner.lifecycle;

import java.util.concurrent.atomic.AtomicReference;

public final class ActivityLifecycleMonitorRegistry {
    private static final AtomicReference<ActivityLifecycleMonitor> sLifecycleMonitor = new AtomicReference(null);

    private ActivityLifecycleMonitorRegistry() {
    }

    public static ActivityLifecycleMonitor getInstance() {
        ActivityLifecycleMonitor activityLifecycleMonitor = (ActivityLifecycleMonitor) sLifecycleMonitor.get();
        if (activityLifecycleMonitor != null) {
            return activityLifecycleMonitor;
        }
        throw new IllegalStateException("No lifecycle monitor registered! Are you running under an Instrumentation which registers lifecycle monitors?");
    }

    public static void registerInstance(ActivityLifecycleMonitor activityLifecycleMonitor) {
        sLifecycleMonitor.set(activityLifecycleMonitor);
    }
}
