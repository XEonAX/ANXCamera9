package android.arch.lifecycle;

import android.arch.lifecycle.Lifecycle.Event;

class FullLifecycleObserverAdapter implements GenericLifecycleObserver {
    private final FullLifecycleObserver mObserver;

    FullLifecycleObserverAdapter(FullLifecycleObserver fullLifecycleObserver) {
        this.mObserver = fullLifecycleObserver;
    }

    public void onStateChanged(LifecycleOwner lifecycleOwner, Event event) {
        switch (event) {
            case ON_CREATE:
                this.mObserver.onCreate(lifecycleOwner);
                return;
            case ON_START:
                this.mObserver.onStart(lifecycleOwner);
                return;
            case ON_RESUME:
                this.mObserver.onResume(lifecycleOwner);
                return;
            case ON_PAUSE:
                this.mObserver.onPause(lifecycleOwner);
                return;
            case ON_STOP:
                this.mObserver.onStop(lifecycleOwner);
                return;
            case ON_DESTROY:
                this.mObserver.onDestroy(lifecycleOwner);
                return;
            case ON_ANY:
                throw new IllegalArgumentException("ON_ANY must not been send by anybody");
            default:
                return;
        }
    }
}
