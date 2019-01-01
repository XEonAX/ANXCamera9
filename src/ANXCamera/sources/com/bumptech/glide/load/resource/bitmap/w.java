package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.os.Build;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.util.i;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* compiled from: TransformationUtils */
public final class w {
    private static final String TAG = "TransformationUtils";
    public static final int lc = 6;
    private static final Paint ld = new Paint(6);
    private static final int le = 7;
    private static final Paint lf = new Paint(7);
    private static final Paint lg = new Paint(7);
    private static final Set<String> lh = new HashSet(Arrays.asList(new String[]{"XT1085", "XT1092", "XT1093", "XT1094", "XT1095", "XT1096", "XT1097", "XT1098", "XT1031", "XT1028", "XT937C", "XT1032", "XT1008", "XT1033", "XT1035", "XT1034", "XT939G", "XT1039", "XT1040", "XT1042", "XT1045", "XT1063", "XT1064", "XT1068", "XT1069", "XT1072", "XT1077", "XT1078", "XT1079"}));
    private static final Lock li = (lh.contains(Build.MODEL) ? new ReentrantLock() : new a());

    /* compiled from: TransformationUtils */
    private static final class a implements Lock {
        a() {
        }

        public void lock() {
        }

        public void lockInterruptibly() throws InterruptedException {
        }

        public boolean tryLock() {
            return true;
        }

        public boolean tryLock(long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
            return true;
        }

        public void unlock() {
        }

        @NonNull
        public Condition newCondition() {
            throw new UnsupportedOperationException("Should not be called");
        }
    }

    static {
        lg.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
    }

    private w() {
    }

    public static Lock cu() {
        return li;
    }

    public static Bitmap a(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        if (bitmap.getWidth() == i && bitmap.getHeight() == i2) {
            return bitmap;
        }
        float height;
        float width;
        Matrix matrix = new Matrix();
        float f = 0.0f;
        if (bitmap.getWidth() * i2 > bitmap.getHeight() * i) {
            height = ((float) i2) / ((float) bitmap.getHeight());
            width = (((float) i) - (((float) bitmap.getWidth()) * height)) * 0.5f;
        } else {
            height = ((float) i) / ((float) bitmap.getWidth());
            f = (((float) i2) - (((float) bitmap.getHeight()) * height)) * 0.5f;
            width = 0.0f;
        }
        matrix.setScale(height, height);
        matrix.postTranslate((float) ((int) (width + 0.5f)), (float) ((int) (f + 0.5f)));
        Bitmap b = dVar.b(i, i2, m(bitmap));
        a(bitmap, b);
        a(bitmap, b, matrix);
        return b;
    }

    public static Bitmap b(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        if (bitmap.getWidth() == i && bitmap.getHeight() == i2) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "requested target size matches input, returning input");
            }
            return bitmap;
        }
        float min = Math.min(((float) i) / ((float) bitmap.getWidth()), ((float) i2) / ((float) bitmap.getHeight()));
        int round = Math.round(((float) bitmap.getWidth()) * min);
        int round2 = Math.round(((float) bitmap.getHeight()) * min);
        if (bitmap.getWidth() == round && bitmap.getHeight() == round2) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "adjusted target size matches input, returning input");
            }
            return bitmap;
        }
        Bitmap b = dVar.b((int) (((float) bitmap.getWidth()) * min), (int) (((float) bitmap.getHeight()) * min), m(bitmap));
        a(bitmap, b);
        if (Log.isLoggable(TAG, 2)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("request: ");
            stringBuilder.append(i);
            stringBuilder.append("x");
            stringBuilder.append(i2);
            Log.v(str, stringBuilder.toString());
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("toFit:   ");
            stringBuilder2.append(bitmap.getWidth());
            stringBuilder2.append("x");
            stringBuilder2.append(bitmap.getHeight());
            Log.v(str2, stringBuilder2.toString());
            str2 = TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("toReuse: ");
            stringBuilder2.append(b.getWidth());
            stringBuilder2.append("x");
            stringBuilder2.append(b.getHeight());
            Log.v(str2, stringBuilder2.toString());
            str2 = TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("minPct:   ");
            stringBuilder2.append(min);
            Log.v(str2, stringBuilder2.toString());
        }
        Matrix matrix = new Matrix();
        matrix.setScale(min, min);
        a(bitmap, b, matrix);
        return b;
    }

    public static Bitmap c(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        if (bitmap.getWidth() > i || bitmap.getHeight() > i2) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "requested target size too big for input, fit centering instead");
            }
            return b(dVar, bitmap, i, i2);
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "requested target size larger or equal to input, returning input");
        }
        return bitmap;
    }

    public static void a(Bitmap bitmap, Bitmap bitmap2) {
        bitmap2.setHasAlpha(bitmap.hasAlpha());
    }

    public static Bitmap a(@NonNull Bitmap bitmap, int i) {
        if (i == 0) {
            return bitmap;
        }
        try {
            Matrix matrix = new Matrix();
            matrix.setRotate((float) i);
            return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
        } catch (Throwable e) {
            if (!Log.isLoggable(TAG, 6)) {
                return bitmap;
            }
            Log.e(TAG, "Exception when trying to orient image", e);
            return bitmap;
        }
    }

    public static int A(int i) {
        switch (i) {
            case 3:
            case 4:
                return 180;
            case 5:
            case 6:
                return 90;
            case 7:
            case 8:
                return 270;
            default:
                return 0;
        }
    }

    public static Bitmap a(@NonNull d dVar, @NonNull Bitmap bitmap, int i) {
        if (!B(i)) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        initializeMatrixForRotation(i, matrix);
        RectF rectF = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
        matrix.mapRect(rectF);
        Bitmap b = dVar.b(Math.round(rectF.width()), Math.round(rectF.height()), m(bitmap));
        matrix.postTranslate(-rectF.left, -rectF.top);
        a(bitmap, b, matrix);
        return b;
    }

    public static boolean B(int i) {
        switch (i) {
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                return true;
            default:
                return false;
        }
    }

    public static Bitmap d(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        i = Math.min(i, i2);
        float f = (float) i;
        float f2 = f / 2.0f;
        float width = (float) bitmap.getWidth();
        float height = (float) bitmap.getHeight();
        float max = Math.max(f / width, f / height);
        width *= max;
        max *= height;
        height = (f - width) / 2.0f;
        f = (f - max) / 2.0f;
        RectF rectF = new RectF(height, f, width + height, max + f);
        Bitmap b = b(dVar, bitmap);
        Bitmap b2 = dVar.b(i, i, l(bitmap));
        b2.setHasAlpha(true);
        li.lock();
        Object bitmap2;
        try {
            Canvas canvas = new Canvas(b2);
            canvas.drawCircle(f2, f2, f2, lf);
            canvas.drawBitmap(b, null, rectF, lg);
            a(canvas);
            if (!b.equals(bitmap2)) {
                dVar.d(b);
            }
            return b2;
        } finally {
            bitmap2 = li;
            bitmap2.unlock();
        }
    }

    private static Bitmap b(@NonNull d dVar, @NonNull Bitmap bitmap) {
        Config l = l(bitmap);
        if (l.equals(bitmap.getConfig())) {
            return bitmap;
        }
        Bitmap b = dVar.b(bitmap.getWidth(), bitmap.getHeight(), l);
        new Canvas(b).drawBitmap(bitmap, 0.0f, 0.0f, null);
        return b;
    }

    @NonNull
    private static Config l(@NonNull Bitmap bitmap) {
        if (VERSION.SDK_INT < 26 || !Config.RGBA_F16.equals(bitmap.getConfig())) {
            return Config.ARGB_8888;
        }
        return Config.RGBA_F16;
    }

    @Deprecated
    public static Bitmap a(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2, int i3) {
        return b(dVar, bitmap, i3);
    }

    public static Bitmap b(@NonNull d dVar, @NonNull Bitmap bitmap, int i) {
        i.a(i > 0, "roundingRadius must be greater than 0.");
        Config l = l(bitmap);
        Bitmap b = b(dVar, bitmap);
        Bitmap b2 = dVar.b(b.getWidth(), b.getHeight(), l);
        b2.setHasAlpha(true);
        Shader bitmapShader = new BitmapShader(b, TileMode.CLAMP, TileMode.CLAMP);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setShader(bitmapShader);
        RectF rectF = new RectF(0.0f, 0.0f, (float) b2.getWidth(), (float) b2.getHeight());
        li.lock();
        Object bitmap2;
        try {
            Canvas canvas = new Canvas(b2);
            canvas.drawColor(0, Mode.CLEAR);
            float f = (float) i;
            canvas.drawRoundRect(rectF, f, f, paint);
            a(canvas);
            if (!b.equals(bitmap2)) {
                dVar.d(b);
            }
            return b2;
        } finally {
            bitmap2 = li;
            bitmap2.unlock();
        }
    }

    private static void a(Canvas canvas) {
        canvas.setBitmap(null);
    }

    @NonNull
    private static Config m(@NonNull Bitmap bitmap) {
        return bitmap.getConfig() != null ? bitmap.getConfig() : Config.ARGB_8888;
    }

    private static void a(@NonNull Bitmap bitmap, @NonNull Bitmap bitmap2, Matrix matrix) {
        li.lock();
        try {
            Canvas canvas = new Canvas(bitmap2);
            canvas.drawBitmap(bitmap, matrix, ld);
            a(canvas);
        } finally {
            li.unlock();
        }
    }

    @VisibleForTesting
    static void initializeMatrixForRotation(int i, Matrix matrix) {
        switch (i) {
            case 2:
                matrix.setScale(-1.0f, 1.0f);
                return;
            case 3:
                matrix.setRotate(180.0f);
                return;
            case 4:
                matrix.setRotate(180.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 5:
                matrix.setRotate(90.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 6:
                matrix.setRotate(90.0f);
                return;
            case 7:
                matrix.setRotate(-90.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 8:
                matrix.setRotate(-90.0f);
                return;
            default:
                return;
        }
    }
}
