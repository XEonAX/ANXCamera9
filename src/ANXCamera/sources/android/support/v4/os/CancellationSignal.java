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
    public void cancel() {
        /*
        r5 = this;
        monitor-enter(r5);
        r0 = 0;
        r1 = r5.mIsCanceled;	 Catch:{ all -> 0x003f }
        if (r1 == 0) goto L_0x0008;
    L_0x0006:
        monitor-exit(r5);	 Catch:{ all -> 0x003f }
        return;
    L_0x0008:
        r1 = 1;
        r5.mIsCanceled = r1;	 Catch:{ all -> 0x003f }
        r5.mCancelInProgress = r1;	 Catch:{ all -> 0x003f }
        r1 = r5.mOnCancelListener;	 Catch:{ all -> 0x003f }
        r2 = r5.mCancellationSignalObj;	 Catch:{ all -> 0x0039 }
        r0 = r2;
        monitor-exit(r5);	 Catch:{ all -> 0x0039 }
        r2 = 0;
        if (r1 == 0) goto L_0x001c;
    L_0x0016:
        r1.onCancel();	 Catch:{ all -> 0x001a }
        goto L_0x001c;
    L_0x001a:
        r3 = move-exception;
        goto L_0x0022;
    L_0x001c:
        if (r0 == 0) goto L_0x002d;
    L_0x001e:
        android.support.v4.os.CancellationSignalCompatJellybean.cancel(r0);	 Catch:{ all -> 0x001a }
        goto L_0x002d;
    L_0x0022:
        monitor-enter(r5);
        r5.mCancelInProgress = r2;	 Catch:{ all -> 0x002a }
        r5.notifyAll();	 Catch:{ all -> 0x002a }
        monitor-exit(r5);	 Catch:{ all -> 0x002a }
        throw r3;
    L_0x002a:
        r2 = move-exception;
        monitor-exit(r5);	 Catch:{ all -> 0x002a }
        throw r2;
    L_0x002d:
        monitor-enter(r5);
        r5.mCancelInProgress = r2;	 Catch:{ all -> 0x0036 }
        r5.notifyAll();	 Catch:{ all -> 0x0036 }
        monitor-exit(r5);	 Catch:{ all -> 0x0036 }
        return;
    L_0x0036:
        r2 = move-exception;
        monitor-exit(r5);	 Catch:{ all -> 0x0036 }
        throw r2;
    L_0x0039:
        r2 = move-exception;
        r4 = r2;
        r2 = r0;
        r0 = r1;
        r1 = r4;
        goto L_0x0041;
    L_0x003f:
        r1 = move-exception;
        r2 = r0;
    L_0x0041:
        monitor-exit(r5);	 Catch:{ all -> 0x0043 }
        throw r1;
    L_0x0043:
        r1 = move-exception;
        goto L_0x0041;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.os.CancellationSignal.cancel():void");
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
