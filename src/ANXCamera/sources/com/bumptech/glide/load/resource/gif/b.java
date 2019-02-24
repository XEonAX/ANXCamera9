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
    private static final int GRAVITY = 119;
    public static final int lA = -1;
    public static final int lB = 0;
    private boolean fZ;
    private boolean isRunning;
    private final a lC;
    private boolean lD;
    private boolean lE;
    private int lF;
    private boolean lG;
    private Rect lH;
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
        this.lE = true;
        this.lF = -1;
        this.lC = (a) com.bumptech.glide.util.i.checkNotNull(aVar);
    }

    @VisibleForTesting
    b(GifFrameLoader gifFrameLoader, Paint paint) {
        this(new a(gifFrameLoader));
        this.paint = paint;
    }

    public int getSize() {
        return this.lC.frameLoader.getSize();
    }

    public Bitmap cA() {
        return this.lC.frameLoader.cA();
    }

    public void a(i<Bitmap> iVar, Bitmap bitmap) {
        this.lC.frameLoader.a(iVar, bitmap);
    }

    public i<Bitmap> cB() {
        return this.lC.frameLoader.cB();
    }

    public ByteBuffer getBuffer() {
        return this.lC.frameLoader.getBuffer();
    }

    public int getFrameCount() {
        return this.lC.frameLoader.getFrameCount();
    }

    public int cC() {
        return this.lC.frameLoader.getCurrentIndex();
    }

    private void cD() {
        this.loopCount = 0;
    }

    public void cE() {
        com.bumptech.glide.util.i.a(this.isRunning ^ 1, "You cannot restart a currently running animation.");
        this.lC.frameLoader.cM();
        start();
    }

    public void start() {
        this.lD = true;
        cD();
        if (this.lE) {
            cF();
        }
    }

    public void stop() {
        this.lD = false;
        stopRunning();
    }

    private void cF() {
        com.bumptech.glide.util.i.a(this.fZ ^ true, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request.");
        if (this.lC.frameLoader.getFrameCount() == 1) {
            invalidateSelf();
        } else if (!this.isRunning) {
            this.isRunning = true;
            this.lC.frameLoader.a(this);
            invalidateSelf();
        }
    }

    private void stopRunning() {
        this.isRunning = false;
        this.lC.frameLoader.b(this);
    }

    public boolean setVisible(boolean z, boolean z2) {
        com.bumptech.glide.util.i.a(this.fZ ^ 1, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View's visibility.");
        this.lE = z;
        if (!z) {
            stopRunning();
        } else if (this.lD) {
            cF();
        }
        return super.setVisible(z, z2);
    }

    public int getIntrinsicWidth() {
        return this.lC.frameLoader.getWidth();
    }

    public int getIntrinsicHeight() {
        return this.lC.frameLoader.getHeight();
    }

    public boolean isRunning() {
        return this.isRunning;
    }

    void f(boolean z) {
        this.isRunning = z;
    }

    protected void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.lG = true;
    }

    public void draw(@NonNull Canvas canvas) {
        if (!this.fZ) {
            if (this.lG) {
                Gravity.apply(119, getIntrinsicWidth(), getIntrinsicHeight(), getBounds(), cG());
                this.lG = false;
            }
            canvas.drawBitmap(this.lC.frameLoader.cJ(), null, cG(), getPaint());
        }
    }

    public void setAlpha(int i) {
        getPaint().setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        getPaint().setColorFilter(colorFilter);
    }

    private Rect cG() {
        if (this.lH == null) {
            this.lH = new Rect();
        }
        return this.lH;
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
        if (this.lF != -1 && this.loopCount >= this.lF) {
            stop();
        }
    }

    public ConstantState getConstantState() {
        return this.lC;
    }

    public void recycle() {
        this.fZ = true;
        this.lC.frameLoader.clear();
    }

    boolean isRecycled() {
        return this.fZ;
    }

    public void setLoopCount(int i) {
        if (i <= 0 && i != -1 && i != 0) {
            throw new IllegalArgumentException("Loop count must be greater than 0, or equal to GlideDrawable.LOOP_FOREVER, or equal to GlideDrawable.LOOP_INTRINSIC");
        } else if (i == 0) {
            i = this.lC.frameLoader.getLoopCount();
            if (i == 0) {
                i = -1;
            }
            this.lF = i;
        } else {
            this.lF = i;
        }
    }
}
