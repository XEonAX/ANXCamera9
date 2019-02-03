package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: TargetTracker */
public final class o implements i {
    private final Set<n<?>> mJ = Collections.newSetFromMap(new WeakHashMap());

    public void g(@NonNull n<?> nVar) {
        this.mJ.add(nVar);
    }

    public void h(@NonNull n<?> nVar) {
        this.mJ.remove(nVar);
    }

    public void onStart() {
        for (n onStart : k.c(this.mJ)) {
            onStart.onStart();
        }
    }

    public void onStop() {
        for (n onStop : k.c(this.mJ)) {
            onStop.onStop();
        }
    }

    public void onDestroy() {
        for (n onDestroy : k.c(this.mJ)) {
            onDestroy.onDestroy();
        }
    }

    @NonNull
    public List<n<?>> getAll() {
        return k.c(this.mJ);
    }

    public void clear() {
        this.mJ.clear();
    }
}
