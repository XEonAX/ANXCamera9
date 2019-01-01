package android.support.v4.os;

import android.os.Build.VERSION;

public final class CancellationSignal {
    private boolean mCancelInProgress;
    private Object mCancellationSignalObj;
    private boolean mIsCanceled;
    private OnCancelListener mOnCancelListener;

    public interface OnCancelListener {
        void onCancel();
    }

    public boolean isCanceled() {
        boolean z;
        synchronized (this) {
            z = this.mIsCanceled;
        }
        return z;
    }

    public void throwIfCanceled() {
        if (isCanceled()) {
            throw new OperationCanceledException();
        }
    }

    /* JADX WARNING: Missing block: B:12:0x0014, code:
            if (r1 == null) goto L_0x001c;
     */
    /* JADX WARNING: Missing block: B:14:?, code:
            r1.onCancel();
     */
    /* JADX WARNING: Missing block: B:16:0x001c, code:
            if (r0 == null) goto L_0x002d;
     */
    /* JADX WARNING: Missing block: B:17:0x001e, code:
            android.support.v4.os.CancellationSignalCompatJellybean.cancel(r0);
     */
    /* JADX WARNING: Missing block: B:18:0x0022, code:
            monitor-enter(r5);
     */
    /* JADX WARNING: Missing block: B:20:?, code:
            r5.mCancelInProgress = false;
            notifyAll();
     */
    /* JADX WARNING: Missing block: B:27:0x002d, code:
            monitor-enter(r5);
     */
    /* JADX WARNING: Missing block: B:29:?, code:
            r5.mCancelInProgress = false;
            notifyAll();
     */
    /* JADX WARNING: Missing block: B:30:0x0033, code:
            monitor-exit(r5);
     */
    /* JADX WARNING: Missing block: B:31:0x0035, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void cancel() {
        Throwable th;
        synchronized (this) {
            try {
                if (this.mIsCanceled) {
                    return;
                }
                this.mIsCanceled = true;
                this.mCancelInProgress = true;
                OnCancelListener listener = this.mOnCancelListener;
                try {
                    OnCancelListener listener2 = this.mCancellationSignalObj;
                } catch (Throwable th2) {
                    Throwable th3 = th2;
                    OnCancelListener onCancelListener = null;
                    th = th3;
                    while (true) {
                        try {
                            break;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                    }
                    throw th;
                }
            } catch (Throwable th5) {
                th = th5;
                Object obj = null;
                while (true) {
                    break;
                }
                throw th;
            }
        }
    }

    public void setOnCancelListener(OnCancelListener listener) {
        synchronized (this) {
            waitForCancelFinishedLocked();
            if (this.mOnCancelListener == listener) {
                return;
            }
            this.mOnCancelListener = listener;
            if (!this.mIsCanceled || listener == null) {
                return;
            }
            listener.onCancel();
        }
    }

    public Object getCancellationSignalObject() {
        if (VERSION.SDK_INT < 16) {
            return null;
        }
        Object obj;
        synchronized (this) {
            if (this.mCancellationSignalObj == null) {
                this.mCancellationSignalObj = CancellationSignalCompatJellybean.create();
                if (this.mIsCanceled) {
                    CancellationSignalCompatJellybean.cancel(this.mCancellationSignalObj);
                }
            }
            obj = this.mCancellationSignalObj;
        }
        return obj;
    }

    private void waitForCancelFinishedLocked() {
        while (this.mCancelInProgress) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
    }
}
