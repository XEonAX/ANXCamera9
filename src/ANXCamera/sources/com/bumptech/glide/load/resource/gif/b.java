package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.view.Gravity;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.i;
import java.nio.ByteBuffer;

/* compiled from: GifDrawable */
public class b extends Drawable implements Animatable, com.bumptech.glide.load.resource.gif.GifFrameLoader.a {
    public static final int lA = -1;
    public static final int lB = 0;
    private static final int lC = 119;
    private boolean fZ;
    private boolean isRunning;
    private final a lD;
    private boolean lE;
    private boolean lF;
    private int lG;
    private boolean lH;
    private Rect lI;
    private int loopCount;
    private Paint paint;

    /* compiled from: GifDrawable */
    static final class a extends ConstantState {
        @VisibleForTesting
        final GifFrameLoader frameLoader;

        a(GifFrameLoader gifFrameLoader) {
            this.frameLoader = gifFrameLoader;
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return newDrawable();
        }

        @NonNull
        public Drawable newDrawable() {
            return new b(this);
        }

        public int getChangingConfigurations() {
            return 0;
        }
    }

    @Deprecated
    public b(Context context, com.bumptech.glide.b.a aVar, d dVar, i<Bitmap> iVar, int i, int i2, Bitmap bitmap) {
        this(context, aVar, iVar, i, i2, bitmap);
    }

    public b(Context context, com.bumptech.glide.b.a aVar, i<Bitmap> iVar, int i, int i2, Bitmap bitmap) {
        this(new a(new GifFrameLoader(c.b(context), aVar, i, i2, iVar, bitmap)));
    }

    b(a aVar) {
        this.lF = true;
        this.lG = -1;
        this.lD = (a) com.bumptech.glide.util.i.checkNotNull(aVar);
    }

    @VisibleForTesting
    b(GifFrameLoader gifFrameLoader, Paint paint) {
        this(new a(gifFrameLoader));
        this.paint = paint;
    }

    public int getSize() {
        return this.lD.frameLoader.getSize();
    }

    public Bitmap cA() {
        return this.lD.frameLoader.cA();
    }

    public void a(i<Bitmap> iVar, Bitmap bitmap) {
        this.lD.frameLoader.a(iVar, bitmap);
    }

    public i<Bitmap> cB() {
        return this.lD.frameLoader.cB();
    }

    public ByteBuffer getBuffer() {
        return this.lD.frameLoader.getBuffer();
    }

    public int getFrameCount() {
        return this.lD.frameLoader.getFrameCount();
    }

    public int cC() {
        return this.lD.frameLoader.getCurrentIndex();
    }

    private void cD() {
        this.loopCount = 0;
    }

    public void cE() {
        com.bumptech.glide.util.i.a(this.isRunning ^ 1, "You cannot restart a currently running animation.");
        this.lD.frameLoader.cM();
        start();
    }

    public void start() {
        this.lE = true;
        cD();
        if (this.lF) {
            cF();
        }
    }

    public void stop() {
        this.lE = false;
        stopRunning();
    }

    private void cF() {
        com.bumptech.glide.util.i.a(this.fZ ^ true, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request.");
        if (this.lD.frameLoader.getFrameCount() == 1) {
            invalidateSelf();
        } else if (!this.isRunning) {
            this.isRunning = true;
            this.lD.frameLoader.a(this);
            invalidateSelf();
        }
    }

    private void stopRunning() {
        this.isRunning = false;
        this.lD.frameLoader.b(this);
    }

    public boolean setVisible(boolean z, boolean z2) {
        com.bumptech.glide.util.i.a(this.fZ ^ 1, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View's visibility.");
        this.lF = z;
        if (!z) {
            stopRunning();
        } else if (this.lE) {
            cF();
        }
        return super.setVisible(z, z2);
    }

    public int getIntrinsicWidth() {
        return this.lD.frameLoader.getWidth();
    }

    public int getIntrinsicHeight() {
        return this.lD.frameLoader.getHeight();
    }

    public boolean isRunning() {
        return this.isRunning;
    }

    void f(boolean z) {
        this.isRunning = z;
    }

    protected void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.lH = true;
    }

    public void draw(@NonNull Canvas canvas) {
        if (!this.fZ) {
            if (this.lH) {
                Gravity.apply(119, getIntrinsicWidth(), getIntrinsicHeight(), getBounds(), cG());
                this.lH = false;
            }
            canvas.drawBitmap(this.lD.frameLoader.cJ(), null, cG(), getPaint());
        }
    }

    public void setAlpha(int i) {
        getPaint().setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        getPaint().setColorFilter(colorFilter);
    }

    private Rect cG() {
        if (this.lI == null) {
            this.lI = new Rect();
        }
        return this.lI;
    }

    private Paint getPaint() {
        if (this.paint == null) {
            this.paint = new Paint(2);
        }
        return this.paint;
    }

    public int getOpacity() {
        return -2;
    }

    private Callback cH() {
        Callback callback = getCallback();
        while (callback instanceof Drawable) {
            callback = ((Drawable) callback).getCallback();
        }
        return callback;
    }

    public void cI() {
        if (cH() == null) {
            stop();
            invalidateSelf();
            return;
        }
        invalidateSelf();
        if (cC() == getFrameCount() - 1) {
            this.loopCount++;
        }
        if (this.lG != -1 && this.loopCount >= this.lG) {
            stop();
        }
    }

    public ConstantState getConstantState() {
        return this.lD;
    }

    public void recycle() {
        this.fZ = true;
        this.lD.frameLoader.clear();
    }

    boolean isRecycled() {
        return this.fZ;
    }

    public void setLoopCount(int i) {
        if (i <= 0 && i != -1 && i != 0) {
            throw new IllegalArgumentException("Loop count must be greater than 0, or equal to GlideDrawable.LOOP_FOREVER, or equal to GlideDrawable.LOOP_INTRINSIC");
        } else if (i == 0) {
            i = this.lD.frameLoader.getLoopCount();
            if (i == 0) {
                i = -1;
            }
            this.lG = i;
        } else {
            this.lG = i;
        }
    }
}
