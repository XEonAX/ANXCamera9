package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private boolean lE;
    private final Set<i> mh = Collections.newSetFromMap(new WeakHashMap());
    private boolean mi;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.mh.add(iVar);
        if (this.mi) {
            iVar.onDestroy();
        } else if (this.lE) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.mh.remove(iVar);
    }

    void onStart() {
        this.lE = true;
        for (i onStart : k.c(this.mh)) {
            onStart.onStart();
        }
    }

    void onStop() {
        this.lE = false;
        for (i onStop : k.c(this.mh)) {
            onStop.onStop();
        }
    }

    void onDestroy() {
        this.mi = true;
        for (i onDestroy : k.c(this.mh)) {
            onDestroy.onDestroy();
        }
    }
}
