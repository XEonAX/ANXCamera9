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
    private final Set<c> mD = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> mE = new ArrayList();
    private boolean mF;

    public void a(@NonNull c cVar) {
        this.mD.add(cVar);
        if (this.mF) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "Paused, delaying request");
            }
            this.mE.add(cVar);
            return;
        }
        cVar.begin();
    }

    @VisibleForTesting
    void addRequest(c cVar) {
        this.mD.add(cVar);
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.mD.remove(cVar);
        if (!(this.mE.remove(cVar) || remove)) {
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
        return this.mF;
    }

    public void w() {
        this.mF = true;
        for (c cVar : k.c(this.mD)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.mE.add(cVar);
            }
        }
    }

    public void x() {
        this.mF = true;
        for (c cVar : k.c(this.mD)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.mE.add(cVar);
            }
        }
    }

    public void z() {
        this.mF = false;
        for (c cVar : k.c(this.mD)) {
            if (!(cVar.isComplete() || cVar.isCancelled() || cVar.isRunning())) {
                cVar.begin();
            }
        }
        this.mE.clear();
    }

    public void cX() {
        for (c a : k.c(this.mD)) {
            a(a, false);
        }
        this.mE.clear();
    }

    public void cY() {
        for (c cVar : k.c(this.mD)) {
            if (!(cVar.isComplete() || cVar.isCancelled())) {
                cVar.pause();
                if (this.mF) {
                    this.mE.add(cVar);
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
        stringBuilder.append(this.mD.size());
        stringBuilder.append(", isPaused=");
        stringBuilder.append(this.mF);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
