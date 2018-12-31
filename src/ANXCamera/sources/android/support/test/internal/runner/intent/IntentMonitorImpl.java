package android.support.test.internal.runner.intent;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.test.runner.intent.IntentCallback;
import android.support.test.runner.intent.IntentMonitor;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public final class IntentMonitorImpl implements IntentMonitor {
    private static final String TAG = "IntentMonitorImpl";
    List<WeakReference<IntentCallback>> mCallbacks = Collections.synchronizedList(new ArrayList());

    public void addIntentCallback(@NonNull IntentCallback intentCallback) {
        if (intentCallback != null) {
            Object obj = 1;
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                IntentCallback intentCallback2 = (IntentCallback) ((WeakReference) it.next()).get();
                if (intentCallback2 == null) {
                    it.remove();
                } else if (intentCallback2 == intentCallback) {
                    obj = null;
                }
            }
            if (obj != null) {
                this.mCallbacks.add(new WeakReference(intentCallback));
                return;
            }
            return;
        }
        throw new NullPointerException("callback cannot be null!");
    }

    public void removeIntentCallback(@NonNull IntentCallback intentCallback) {
        if (intentCallback != null) {
            Iterator it = this.mCallbacks.iterator();
            while (it.hasNext()) {
                IntentCallback intentCallback2 = (IntentCallback) ((WeakReference) it.next()).get();
                if (intentCallback2 == null) {
                    it.remove();
                } else if (intentCallback2 == intentCallback) {
                    it.remove();
                }
            }
            return;
        }
        throw new NullPointerException("callback cannot be null!");
    }

    public void signalIntent(Intent intent) {
        Iterator it = this.mCallbacks.iterator();
        while (it.hasNext()) {
            IntentCallback intentCallback = (IntentCallback) ((WeakReference) it.next()).get();
            if (intentCallback == null) {
                it.remove();
            } else {
                try {
                    intentCallback.onIntentSent(new Intent(intent));
                } catch (Throwable e) {
                    Log.e(TAG, String.format("Callback threw exception! (callback: %s intent: %s)", new Object[]{intentCallback, intent}), e);
                }
            }
        }
    }
}
