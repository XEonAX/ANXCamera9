package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private boolean lD;
    private final Set<i> mg = Collections.newSetFromMap(new WeakHashMap());
    private boolean mh;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.mg.add(iVar);
        if (this.mh) {
            iVar.onDestroy();
        } else if (this.lD) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.mg.remove(iVar);
    }

    void onStart() {
        this.lD = true;
        for (i onStart : k.c(this.mg)) {
            onStart.onStart();
        }
    }

    void onStop() {
        this.lD = false;
        for (i onStop : k.c(this.mg)) {
            onStop.onStop();
        }
    }

    void onDestroy() {
        this.mh = true;
        for (i onDestroy : k.c(this.mg)) {
            onDestroy.onDestroy();
        }
    }
}
