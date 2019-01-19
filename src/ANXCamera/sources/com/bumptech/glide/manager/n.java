package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.request.c;
import com.bumptech.glide.util.k;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: RequestTracker */
public class n {
    private static final String TAG = "RequestTracker";
    private final Set<c> mC = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> mD = new ArrayList();
    private boolean mE;

    public void a(@NonNull c cVar) {
        this.mC.add(cVar);
        if (this.mE) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "Paused, delaying request");
            }
            this.mD.add(cVar);
            return;
        }
        cVar.begin();
    }

    @VisibleForTesting
    void addRequest(c cVar) {
        this.mC.add(cVar);
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.mC.remove(cVar);
        if (!(this.mD.remove(cVar) || remove)) {
            z2 = false;
        }
        if (z2) {
            cVar.clear();
            if (z) {
                cVar.recycle();
            }
        }
        return z2;
    }

    public boolean isPaused() {
        return this.mE;
    }

    public void w() {
        this.mE = true;
        for (c cVar : k.c(this.mC)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.mD.add(cVar);
            }
        }
    }

    public void x() {
        this.mE = true;
        for (c cVar : k.c(this.mC)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.mD.add(cVar);
            }
        }
    }

    public void z() {
        this.mE = false;
        for (c cVar : k.c(this.mC)) {
            if (!(cVar.isComplete() || cVar.isCancelled() || cVar.isRunning())) {
                cVar.begin();
            }
        }
        this.mD.clear();
    }

    public void cX() {
        for (c a : k.c(this.mC)) {
            a(a, false);
        }
        this.mD.clear();
    }

    public void cY() {
        for (c cVar : k.c(this.mC)) {
            if (!(cVar.isComplete() || cVar.isCancelled())) {
                cVar.pause();
                if (this.mE) {
                    this.mD.add(cVar);
                } else {
                    cVar.begin();
                }
            }
        }
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append("{numRequests=");
        stringBuilder.append(this.mC.size());
        stringBuilder.append(", isPaused=");
        stringBuilder.append(this.mE);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
