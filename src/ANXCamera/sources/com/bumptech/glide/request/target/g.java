package com.bumptech.glide.request.target;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.bumptech.glide.util.i;

/* compiled from: FixedSizeDrawable */
public class g extends Drawable {
    private final Matrix matrix;
    private final RectF or;
    private final RectF os;
    private Drawable ot;
    private a ou;
    private boolean ov;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState ow;
        final int width;

        a(a aVar) {
            this(aVar.ow, aVar.width, aVar.height);
        }

        a(ConstantState constantState, int i, int i2) {
            this.ow = constantState;
            this.width = i;
            this.height = i2;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.ow.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.ow.newDrawable(resources));
        }

        public int getChangingConfigurations() {
            return 0;
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.ou = (a) i.checkNotNull(aVar);
        this.ot = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.or = new RectF(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.os = new RectF();
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.os.set((float) i, (float) i2, (float) i3, (float) i4);
        em();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.os.set(rect);
        em();
    }

    private void em() {
        this.matrix.setRectToRect(this.or, this.os, ScaleToFit.CENTER);
    }

    public void setChangingConfigurations(int i) {
        this.ot.setChangingConfigurations(i);
    }

    public int getChangingConfigurations() {
        return this.ot.getChangingConfigurations();
    }

    @Deprecated
    public void setDither(boolean z) {
        this.ot.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.ot.setFilterBitmap(z);
    }

    public Callback getCallback() {
        return this.ot.getCallback();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.ot.getAlpha();
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.ot.setColorFilter(i, mode);
    }

    public void clearColorFilter() {
        this.ot.clearColorFilter();
    }

    @NonNull
    public Drawable getCurrent() {
        return this.ot.getCurrent();
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.ot.setVisible(z, z2);
    }

    public int getIntrinsicWidth() {
        return this.ou.width;
    }

    public int getIntrinsicHeight() {
        return this.ou.height;
    }

    public int getMinimumWidth() {
        return this.ot.getMinimumWidth();
    }

    public int getMinimumHeight() {
        return this.ot.getMinimumHeight();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.ot.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.ot.invalidateSelf();
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.ot.unscheduleSelf(runnable);
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.ot.scheduleSelf(runnable, j);
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.ot.draw(canvas);
        canvas.restore();
    }

    public void setAlpha(int i) {
        this.ot.setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.ot.setColorFilter(colorFilter);
    }

    public int getOpacity() {
        return this.ot.getOpacity();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.ov && super.mutate() == this) {
            this.ot = this.ot.mutate();
            this.ou = new a(this.ou);
            this.ov = true;
        }
        return this;
    }

    public ConstantState getConstantState() {
        return this.ou;
    }
}
