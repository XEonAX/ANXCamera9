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
    private final Set<n<?>> mK = Collections.newSetFromMap(new WeakHashMap());

    public void g(@NonNull n<?> nVar) {
        this.mK.add(nVar);
    }

    public void h(@NonNull n<?> nVar) {
        this.mK.remove(nVar);
    }

    public void onStart() {
        for (n onStart : k.c(this.mK)) {
            onStart.onStart();
        }
    }

    public void onStop() {
        for (n onStop : k.c(this.mK)) {
            onStop.onStop();
        }
    }

    public void onDestroy() {
        for (n onDestroy : k.c(this.mK)) {
            onDestroy.onDestroy();
        }
    }

    @NonNull
    public List<n<?>> getAll() {
        return k.c(this.mK);
    }

    public void clear() {
        this.mK.clear();
    }
}
