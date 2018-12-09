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
    private final int V;
    private final d W;
    private final i X;
    private final a<T> Z;
    private final b<T> aa;
    private int ab;
    private int ac;
    private int ad = -1;
    private int ae;
    private boolean af = true;

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
        int ag;
        int ah;

        c() {
        }

        public void a(@NonNull Object obj, @Nullable com.bumptech.glide.request.a.f<? super Object> fVar) {
        }

        public void a(@NonNull m mVar) {
            mVar.m(this.ah, this.ag);
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
            cVar.ah = i;
            cVar.ag = i2;
            return cVar;
        }
    }

    public f(@NonNull i iVar, @NonNull a<T> aVar, @NonNull b<T> bVar, int i) {
        this.X = iVar;
        this.Z = aVar;
        this.aa = bVar;
        this.V = i;
        this.W = new d(i + 1);
    }

    public void onScrollStateChanged(AbsListView absListView, int i) {
    }

    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        this.ae = i3;
        if (i > this.ad) {
            a(i2 + i, true);
        } else if (i < this.ad) {
            a(i, false);
        }
        this.ad = i;
    }

    private void a(int i, boolean z) {
        if (this.af != z) {
            this.af = z;
            cancelAll();
        }
        a(i, (z ? this.V : -this.V) + i);
    }

    private void a(int i, int i2) {
        int max;
        int i3;
        if (i < i2) {
            max = Math.max(this.ab, i);
            i3 = i2;
        } else {
            i3 = Math.min(this.ac, i);
            max = i2;
        }
        i3 = Math.min(this.ae, i3);
        max = Math.min(this.ae, Math.max(0, max));
        if (i < i2) {
            for (i = max; i < i3; i++) {
                a(this.Z.c(i), i, true);
            }
        } else {
            for (i = i3 - 1; i >= max; i--) {
                a(this.Z.c(i), i, false);
            }
        }
        this.ac = max;
        this.ab = i3;
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
            int[] b = this.aa.b(t, i, i2);
            if (b != null) {
                h a = this.Z.a(t);
                if (a != null) {
                    a.b(this.W.b(b[0], b[1]));
                }
            }
        }
    }

    private void cancelAll() {
        for (int i = 0; i < this.V; i++) {
            this.X.d(this.W.b(0, 0));
        }
    }
}
