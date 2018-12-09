package android.support.test.runner.lifecycle;

import java.util.concurrent.atomic.AtomicReference;

public final class ApplicationLifecycleMonitorRegistry {
    private static final AtomicReference<ApplicationLifecycleMonitor> sLifecycleMonitor = new AtomicReference(null);

    private ApplicationLifecycleMonitorRegistry() {
    }

    public static ApplicationLifecycleMonitor getInstance() {
        ApplicationLifecycleMonitor applicationLifecycleMonitor = (ApplicationLifecycleMonitor) sLifecycleMonitor.get();
        if (applicationLifecycleMonitor != null) {
            return applicationLifecycleMonitor;
        }
        throw new IllegalStateException("No lifecycle monitor registered! Are you running under an Instrumentation which registers lifecycle monitors?");
    }

    public static void registerInstance(ApplicationLifecycleMonitor applicationLifecycleMonitor) {
        sLifecycleMonitor.set(applicationLifecycleMonitor);
    }
}
