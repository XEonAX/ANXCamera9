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
    private final RectF os;
    private final RectF ot;
    private Drawable ou;
    private a ov;
    private boolean ow;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState ox;
        final int width;

        a(a aVar) {
            this(aVar.ox, aVar.width, aVar.height);
        }

        a(ConstantState constantState, int i, int i2) {
            this.ox = constantState;
            this.width = i;
            this.height = i2;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.ox.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.ox.newDrawable(resources));
        }

        public int getChangingConfigurations() {
            return 0;
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.ov = (a) i.checkNotNull(aVar);
        this.ou = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.os = new RectF(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.ot = new RectF();
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.ot.set((float) i, (float) i2, (float) i3, (float) i4);
        em();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.ot.set(rect);
        em();
    }

    private void em() {
        this.matrix.setRectToRect(this.os, this.ot, ScaleToFit.CENTER);
    }

    public void setChangingConfigurations(int i) {
        this.ou.setChangingConfigurations(i);
    }

    public int getChangingConfigurations() {
        return this.ou.getChangingConfigurations();
    }

    @Deprecated
    public void setDither(boolean z) {
        this.ou.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.ou.setFilterBitmap(z);
    }

    public Callback getCallback() {
        return this.ou.getCallback();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.ou.getAlpha();
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.ou.setColorFilter(i, mode);
    }

    public void clearColorFilter() {
        this.ou.clearColorFilter();
    }

    @NonNull
    public Drawable getCurrent() {
        return this.ou.getCurrent();
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.ou.setVisible(z, z2);
    }

    public int getIntrinsicWidth() {
        return this.ov.width;
    }

    public int getIntrinsicHeight() {
        return this.ov.height;
    }

    public int getMinimumWidth() {
        return this.ou.getMinimumWidth();
    }

    public int getMinimumHeight() {
        return this.ou.getMinimumHeight();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.ou.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.ou.invalidateSelf();
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.ou.unscheduleSelf(runnable);
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.ou.scheduleSelf(runnable, j);
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.ou.draw(canvas);
        canvas.restore();
    }

    public void setAlpha(int i) {
        this.ou.setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.ou.setColorFilter(colorFilter);
    }

    public int getOpacity() {
        return this.ou.getOpacity();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.ow && super.mutate() == this) {
            this.ou = this.ou.mutate();
            this.ov = new a(this.ov);
            this.ow = true;
        }
        return this;
    }

    public ConstantState getConstantState() {
        return this.ov;
    }
}
