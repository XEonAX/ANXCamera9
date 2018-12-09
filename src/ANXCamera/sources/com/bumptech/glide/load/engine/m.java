package com.bumptech.glide.load.engine;

import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.c;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* compiled from: Jobs */
final class m {
    private final Map<c, EngineJob<?>> ge = new HashMap();
    private final Map<c, EngineJob<?>> gf = new HashMap();

    m() {
    }

    @VisibleForTesting
    Map<c, EngineJob<?>> getAll() {
        return Collections.unmodifiableMap(this.ge);
    }

    EngineJob<?> c(c cVar, boolean z) {
        return (EngineJob) e(z).get(cVar);
    }

    void a(c cVar, EngineJob<?> engineJob) {
        e(engineJob.aS()).put(cVar, engineJob);
    }

    void b(c cVar, EngineJob<?> engineJob) {
        Map e = e(engineJob.aS());
        if (engineJob.equals(e.get(cVar))) {
            e.remove(cVar);
        }
    }

    private Map<c, EngineJob<?>> e(boolean z) {
        return z ? this.gf : this.ge;
    }
}
