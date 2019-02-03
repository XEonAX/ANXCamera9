package com.bumptech.glide.request.target;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import android.view.WindowManager;
import com.bumptech.glide.request.c;
import com.bumptech.glide.util.i;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class ViewTarget<T extends View, Z> extends b<Z> {
    private static final String TAG = "ViewTarget";
    private static boolean oD;
    @Nullable
    private static Integer oE;
    private final SizeDeterminer oF;
    @Nullable
    private OnAttachStateChangeListener oG;
    private boolean oH;
    private boolean oI;
    protected final T view;

    @VisibleForTesting
    static final class SizeDeterminer {
        @Nullable
        @VisibleForTesting
        static Integer maxDisplayLength;
        private static final int oK = 0;
        private final List<m> fN = new ArrayList();
        boolean oL;
        @Nullable
        private a oM;
        private final View view;

        private static final class a implements OnPreDrawListener {
            private final WeakReference<SizeDeterminer> oN;

            a(@NonNull SizeDeterminer sizeDeterminer) {
                this.oN = new WeakReference(sizeDeterminer);
            }

            public boolean onPreDraw() {
                if (Log.isLoggable(ViewTarget.TAG, 2)) {
                    String str = ViewTarget.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("OnGlobalLayoutListener called attachStateListener=");
                    stringBuilder.append(this);
                    Log.v(str, stringBuilder.toString());
                }
                SizeDeterminer sizeDeterminer = (SizeDeterminer) this.oN.get();
                if (sizeDeterminer != null) {
                    sizeDeterminer.et();
                }
                return true;
            }
        }

        SizeDeterminer(@NonNull View view) {
            this.view = view;
        }

        private static int k(@NonNull Context context) {
            if (maxDisplayLength == null) {
                Display defaultDisplay = ((WindowManager) i.checkNotNull((WindowManager) context.getSystemService("window"))).getDefaultDisplay();
                Point point = new Point();
                defaultDisplay.getSize(point);
                maxDisplayLength = Integer.valueOf(Math.max(point.x, point.y));
            }
            return maxDisplayLength.intValue();
        }

        private void n(int i, int i2) {
            Iterator it = new ArrayList(this.fN).iterator();
            while (it.hasNext()) {
                ((m) it.next()).m(i, i2);
            }
        }

        void et() {
            if (!this.fN.isEmpty()) {
                int ew = ew();
                int ev = ev();
                if (o(ew, ev)) {
                    n(ew, ev);
                    eu();
                }
            }
        }

        void a(@NonNull m mVar) {
            int ew = ew();
            int ev = ev();
            if (o(ew, ev)) {
                mVar.m(ew, ev);
                return;
            }
            if (!this.fN.contains(mVar)) {
                this.fN.add(mVar);
            }
            if (this.oM == null) {
                ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
                this.oM = new a(this);
                viewTreeObserver.addOnPreDrawListener(this.oM);
            }
        }

        void b(@NonNull m mVar) {
            this.fN.remove(mVar);
        }

        void eu() {
            ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this.oM);
            }
            this.oM = null;
            this.fN.clear();
        }

        private boolean o(int i, int i2) {
            return R(i) && R(i2);
        }

        private int ev() {
            int paddingTop = this.view.getPaddingTop() + this.view.getPaddingBottom();
            LayoutParams layoutParams = this.view.getLayoutParams();
            return b(this.view.getHeight(), layoutParams != null ? layoutParams.height : 0, paddingTop);
        }

        private int ew() {
            int paddingLeft = this.view.getPaddingLeft() + this.view.getPaddingRight();
            LayoutParams layoutParams = this.view.getLayoutParams();
            return b(this.view.getWidth(), layoutParams != null ? layoutParams.width : 0, paddingLeft);
        }

        private int b(int i, int i2, int i3) {
            int i4 = i2 - i3;
            if (i4 > 0) {
                return i4;
            }
            if (this.oL && this.view.isLayoutRequested()) {
                return 0;
            }
            i -= i3;
            if (i > 0) {
                return i;
            }
            if (this.view.isLayoutRequested() || i2 != -2) {
                return 0;
            }
            if (Log.isLoggable(ViewTarget.TAG, 4)) {
                Log.i(ViewTarget.TAG, "Glide treats LayoutParams.WRAP_CONTENT as a request for an image the size of this device's screen dimensions. If you want to load the original image and are ok with the corresponding memory cost and OOMs (depending on the input size), use .override(Target.SIZE_ORIGINAL). Otherwise, use LayoutParams.MATCH_PARENT, set layout_width and layout_height to fixed dimension, or use .override() with fixed dimensions.");
            }
            return k(this.view.getContext());
        }

        private boolean R(int i) {
            return i > 0 || i == Integer.MIN_VALUE;
        }
    }

    public ViewTarget(@NonNull T t) {
        this.view = (View) i.checkNotNull(t);
        this.oF = new SizeDeterminer(t);
    }

    @Deprecated
    public ViewTarget(@NonNull T t, boolean z) {
        this(t);
        if (z) {
            eq();
        }
    }

    @NonNull
    public final ViewTarget<T, Z> en() {
        if (this.oG != null) {
            return this;
        }
        this.oG = new OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View view) {
                ViewTarget.this.eo();
            }

            public void onViewDetachedFromWindow(View view) {
                ViewTarget.this.ep();
            }
        };
        er();
        return this;
    }

    void eo() {
        c dj = dj();
        if (dj != null && dj.isPaused()) {
            dj.begin();
        }
    }

    void ep() {
        c dj = dj();
        if (dj != null && !dj.isCancelled() && !dj.isPaused()) {
            this.oH = true;
            dj.pause();
            this.oH = false;
        }
    }

    @NonNull
    public final ViewTarget<T, Z> eq() {
        this.oF.oL = true;
        return this;
    }

    @CallSuper
    public void e(@Nullable Drawable drawable) {
        super.e(drawable);
        er();
    }

    private void er() {
        if (this.oG != null && !this.oI) {
            this.view.addOnAttachStateChangeListener(this.oG);
            this.oI = true;
        }
    }

    private void es() {
        if (this.oG != null && this.oI) {
            this.view.removeOnAttachStateChangeListener(this.oG);
            this.oI = false;
        }
    }

    @NonNull
    public T getView() {
        return this.view;
    }

    @CallSuper
    public void a(@NonNull m mVar) {
        this.oF.a(mVar);
    }

    @CallSuper
    public void b(@NonNull m mVar) {
        this.oF.b(mVar);
    }

    @CallSuper
    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        this.oF.eu();
        if (!this.oH) {
            es();
        }
    }

    public void j(@Nullable c cVar) {
        setTag(cVar);
    }

    @Nullable
    public c dj() {
        Object tag = getTag();
        if (tag == null) {
            return null;
        }
        if (tag instanceof c) {
            return (c) tag;
        }
        throw new IllegalArgumentException("You must not call setTag() on a view Glide is targeting");
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Target for: ");
        stringBuilder.append(this.view);
        return stringBuilder.toString();
    }

    private void setTag(@Nullable Object obj) {
        if (oE == null) {
            oD = true;
            this.view.setTag(obj);
            return;
        }
        this.view.setTag(oE.intValue(), obj);
    }

    @Nullable
    private Object getTag() {
        if (oE == null) {
            return this.view.getTag();
        }
        return this.view.getTag(oE.intValue());
    }

    public static void Q(int i) {
        if (oE != null || oD) {
            throw new IllegalArgumentException("You cannot set the tag id more than once or change the tag id after the first request has been made");
        }
        oE = Integer.valueOf(i);
    }
}
