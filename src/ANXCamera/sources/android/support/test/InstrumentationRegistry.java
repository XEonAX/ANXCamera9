package android.support.test;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import java.util.concurrent.atomic.AtomicReference;

public final class InstrumentationRegistry {
    private static final AtomicReference<Bundle> sArguments = new AtomicReference(null);
    private static final AtomicReference<Instrumentation> sInstrumentationRef = new AtomicReference(null);

    public static Instrumentation getInstrumentation() {
        Instrumentation instrumentation = (Instrumentation) sInstrumentationRef.get();
        if (instrumentation != null) {
            return instrumentation;
        }
        throw new IllegalStateException("No instrumentation registered! Must run under a registering instrumentation.");
    }

    public static Bundle getArguments() {
        Bundle bundle = (Bundle) sArguments.get();
        if (bundle != null) {
            return new Bundle(bundle);
        }
        throw new IllegalStateException("No instrumentation arguments registered! Are you running under an Instrumentation which registers arguments?");
    }

    public static Context getContext() {
        return getInstrumentation().getContext();
    }

    public static Context getTargetContext() {
        return getInstrumentation().getTargetContext();
    }

    public static void registerInstance(Instrumentation instrumentation, Bundle bundle) {
        sInstrumentationRef.set(instrumentation);
        sArguments.set(new Bundle(bundle));
    }

    private InstrumentationRegistry() {
    }
}
