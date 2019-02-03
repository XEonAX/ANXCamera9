package com.bumptech.glide;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.util.k;
import java.util.List;
import java.util.Queue;

/* compiled from: ListPreloader */
public class f<T> implements OnScrollListener {
    private final int W;
    private final d X;
    private final i Z;
    private final a<T> aa;
    private final b<T> ab;
    private int ac;
    private int ad;
    private int ae = -1;
    private int af;
    private boolean ag = true;

    /* compiled from: ListPreloader */
    public interface a<U> {
        @Nullable
        h<?> a(@NonNull U u);

        @NonNull
        List<U> c(int i);
    }

    /* compiled from: ListPreloader */
    public interface b<T> {
        @Nullable
        int[] b(@NonNull T t, int i, int i2);
    }

    /* compiled from: ListPreloader */
    private static final class c extends com.bumptech.glide.request.target.b<Object> {
        int ah;
        int ai;

        c() {
        }

        public void a(@NonNull Object obj, @Nullable com.bumptech.glide.request.a.f<? super Object> fVar) {
        }

        public void a(@NonNull m mVar) {
            mVar.m(this.ai, this.ah);
        }

        public void b(@NonNull m mVar) {
        }
    }

    /* compiled from: ListPreloader */
    private static final class d {
        private final Queue<c> queue;

        d(int i) {
            this.queue = k.U(i);
            for (int i2 = 0; i2 < i; i2++) {
                this.queue.offer(new c());
            }
        }

        public c b(int i, int i2) {
            c cVar = (c) this.queue.poll();
            this.queue.offer(cVar);
            cVar.ai = i;
            cVar.ah = i2;
            return cVar;
        }
    }

    public f(@NonNull i iVar, @NonNull a<T> aVar, @NonNull b<T> bVar, int i) {
        this.Z = iVar;
        this.aa = aVar;
        this.ab = bVar;
        this.W = i;
        this.X = new d(i + 1);
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        this.af = i3;
        if (i > this.ae) {
            a(i2 + i, true);
        } else if (i < this.ae) {
            a(i, false);
        }
        this.ae = i;
    }

    private void a(int i, boolean z) {
        if (this.ag != z) {
            this.ag = z;
            cancelAll();
        }
        a(i, (z ? this.W : -this.W) + i);
    }

    private void a(int i, int i2) {
        int max;
        int i3;
        if (i < i2) {
            max = Math.max(this.ac, i);
            i3 = i2;
        } else {
            i3 = Math.min(this.ad, i);
            max = i2;
        }
        i3 = Math.min(this.af, i3);
        max = Math.min(this.af, Math.max(0, max));
        if (i < i2) {
            for (i = max; i < i3; i++) {
                a(this.aa.c(i), i, true);
            }
        } else {
            for (i = i3 - 1; i >= max; i--) {
                a(this.aa.c(i), i, false);
            }
        }
        this.ad = max;
        this.ac = i3;
    }

    private void a(List<T> list, int i, boolean z) {
        int size = list.size();
        if (z) {
            for (int i2 = 0; i2 < size; i2++) {
                a(list.get(i2), i, i2);
            }
            return;
        }
        for (size--; size >= 0; size--) {
            a(list.get(size), i, size);
        }
    }

    private void a(@Nullable T t, int i, int i2) {
        if (t != null) {
            int[] b = this.ab.b(t, i, i2);
            if (b != null) {
                h a = this.aa.a(t);
                if (a != null) {
                    a.b(this.X.b(b[0], b[1]));
                }
            }
        }
    }

    private void cancelAll() {
        for (int i = 0; i < this.W; i++) {
            this.Z.d(this.X.b(0, 0));
        }
    }
}
