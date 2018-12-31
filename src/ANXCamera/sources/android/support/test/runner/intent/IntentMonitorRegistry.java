package android.support.test.runner.intent;

import java.util.concurrent.atomic.AtomicReference;

public final class IntentMonitorRegistry {
    private static final AtomicReference<IntentMonitor> mMonitorRef = new AtomicReference(null);

    public static IntentMonitor getInstance() {
        IntentMonitor intentMonitor = (IntentMonitor) mMonitorRef.get();
        if (intentMonitor != null) {
            return intentMonitor;
        }
        throw new IllegalStateException("No intent monitor registered! Are you running under an Instrumentation which registers intent monitors?");
    }

    public static void registerInstance(IntentMonitor intentMonitor) {
        mMonitorRef.set(intentMonitor);
    }

    private IntentMonitorRegistry() {
    }
}
