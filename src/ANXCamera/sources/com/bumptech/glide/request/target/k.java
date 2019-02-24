package com.bumptech.glide.request.target;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.i;
import com.bumptech.glide.request.a.f;

/* compiled from: PreloadTarget */
public final class k<Z> extends l<Z> {
    private static final int oA = 1;
    private static final Handler oB = new Handler(Looper.getMainLooper(), new Callback() {
        public boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ((k) message.obj).clear();
            return true;
        }
    });
    private final i Z;

    public static <Z> k<Z> b(i iVar, int i, int i2) {
        return new k(iVar, i, i2);
    }

    private k(i iVar, int i, int i2) {
        super(i, i2);
        this.Z = iVar;
    }

    public void a(@NonNull Z z, @Nullable f<? super Z> fVar) {
        oB.obtainMessage(1, this).sendToTarget();
    }

    void clear() {
        this.Z.d((n) this);
    }
}
