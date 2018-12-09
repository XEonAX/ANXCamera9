package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import android.support.annotation.Nullable;
import android.util.DisplayMetrics;
import android.util.Log;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.load.e;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.SampleSizeRounding;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Queue;
import java.util.Set;

/* compiled from: Downsampler */
public final class n {
    static final String TAG = "Downsampler";
    private static final int cR = 10485760;
    public static final e<DecodeFormat> kE = e.a("com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeFormat", DecodeFormat.cB);
    @Deprecated
    public static final e<DownsampleStrategy> kF = DownsampleStrategy.kA;
    public static final e<Boolean> kG = e.a("com.bumptech.glide.load.resource.bitmap.Downsampler.FixBitmapSize", Boolean.valueOf(false));
    public static final e<Boolean> kH = e.g("com.bumtpech.glide.load.resource.bitmap.Downsampler.AllowHardwareDecode");
    private static final String kI = "image/vnd.wap.wbmp";
    private static final String kJ = "image/x-ico";
    private static final Set<String> kK = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[]{kI, kJ})));
    private static final a kL = new a() {
        public void cn() {
        }

        public void a(d dVar, Bitmap bitmap) {
        }
    };
    private static final Set<ImageType> kM = Collections.unmodifiableSet(EnumSet.of(ImageType.JPEG, ImageType.PNG_A, ImageType.PNG));
    private static final Queue<Options> kN = k.U(0);
    private final List<ImageHeaderParser> dL;
    private final b du;
    private final DisplayMetrics hM;
    private final d i;
    private final r kO = r.cp();

    /* compiled from: Downsampler */
    public interface a {
        void a(d dVar, Bitmap bitmap) throws IOException;

        void cn();
    }

    public n(List<ImageHeaderParser> list, DisplayMetrics displayMetrics, d dVar, b bVar) {
        this.dL = list;
        this.hM = (DisplayMetrics) i.checkNotNull(displayMetrics);
        this.i = (d) i.checkNotNull(dVar);
        this.du = (b) i.checkNotNull(bVar);
    }

    public boolean e(InputStream inputStream) {
        return true;
    }

    public boolean c(ByteBuffer byteBuffer) {
        return true;
    }

    public p<Bitmap> a(InputStream inputStream, int i, int i2, f fVar) throws IOException {
        return a(inputStream, i, i2, fVar, kL);
    }

    public p<Bitmap> a(InputStream inputStream, int i, int i2, f fVar, a aVar) throws IOException {
        boolean z;
        f fVar2 = fVar;
        i.a(inputStream.markSupported(), "You must provide an InputStream that supports mark()");
        byte[] bArr = (byte[]) this.du.a(65536, byte[].class);
        Options cm = cm();
        cm.inTempStorage = bArr;
        DecodeFormat decodeFormat = (DecodeFormat) fVar2.a(kE);
        DownsampleStrategy downsampleStrategy = (DownsampleStrategy) fVar2.a(DownsampleStrategy.kA);
        boolean booleanValue = ((Boolean) fVar2.a(kG)).booleanValue();
        if (fVar2.a(kH) == null || !((Boolean) fVar2.a(kH)).booleanValue()) {
            z = false;
        } else {
            z = true;
        }
        try {
            p<Bitmap> a = f.a(a(inputStream, cm, downsampleStrategy, decodeFormat, decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE ? false : z, i, i2, booleanValue, aVar), this.i);
            return a;
        } finally {
            c(cm);
            this.du.put(bArr);
        }
    }

    private Bitmap a(InputStream inputStream, Options options, DownsampleStrategy downsampleStrategy, DecodeFormat decodeFormat, boolean z, int i, int i2, boolean z2, a aVar) throws IOException {
        int i3;
        InputStream inputStream2 = inputStream;
        Options options2 = options;
        a aVar2 = aVar;
        long eE = com.bumptech.glide.util.e.eE();
        int[] a = a(inputStream2, options2, aVar2, this.i);
        int i4 = 0;
        int i5 = a[0];
        int i6 = a[1];
        String str = options2.outMimeType;
        boolean z3 = (i5 == -1 || i6 == -1) ? false : z;
        int b = com.bumptech.glide.load.b.b(this.dL, inputStream2, this.du);
        int A = w.A(b);
        boolean B = w.B(b);
        int i7 = i;
        int i8 = i7 == Integer.MIN_VALUE ? i5 : i7;
        int i9 = i2;
        int i10 = i9 == Integer.MIN_VALUE ? i6 : i9;
        ImageType a2 = com.bumptech.glide.load.b.a(this.dL, inputStream2, this.du);
        ImageType imageType = a2;
        a(a2, inputStream2, aVar2, this.i, downsampleStrategy, A, i5, i6, i8, i10, options2);
        i7 = b;
        String str2 = str;
        int i11 = i6;
        int i12 = 1;
        int i13 = i5;
        a aVar3 = aVar2;
        Options options3 = options2;
        a(inputStream2, decodeFormat, z3, B, options2, i8, i10);
        if (VERSION.SDK_INT >= 19) {
            i4 = i12;
        }
        if ((options3.inSampleSize == i12 || i4 != 0) && a(imageType)) {
            int ceil;
            if (i13 < 0 || i11 < 0 || !z2 || i4 == 0) {
                float f = a(options) ? ((float) options3.inTargetDensity) / ((float) options3.inDensity) : 1.0f;
                i6 = options3.inSampleSize;
                float f2 = (float) i6;
                ceil = (int) Math.ceil((double) (((float) i13) / f2));
                i5 = (int) Math.ceil((double) (((float) i11) / f2));
                ceil = Math.round(((float) ceil) * f);
                i5 = Math.round(((float) i5) * f);
                if (Log.isLoggable(TAG, 2)) {
                    String str3 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Calculated target [");
                    stringBuilder.append(ceil);
                    stringBuilder.append("x");
                    stringBuilder.append(i5);
                    stringBuilder.append("] for source [");
                    stringBuilder.append(i13);
                    stringBuilder.append("x");
                    stringBuilder.append(i11);
                    stringBuilder.append("], sampleSize: ");
                    stringBuilder.append(i6);
                    stringBuilder.append(", targetDensity: ");
                    stringBuilder.append(options3.inTargetDensity);
                    stringBuilder.append(", density: ");
                    stringBuilder.append(options3.inDensity);
                    stringBuilder.append(", density multiplier: ");
                    stringBuilder.append(f);
                    Log.v(str3, stringBuilder.toString());
                }
            } else {
                ceil = i8;
                i5 = i10;
            }
            if (ceil > 0 && i5 > 0) {
                a(options3, this.i, ceil, i5);
            }
        }
        Bitmap b2 = b(inputStream, options3, aVar3, this.i);
        aVar3.a(this.i, b2);
        if (Log.isLoggable(TAG, 2)) {
            i3 = i7;
            a(i13, i11, str2, options3, b2, i, i2, eE);
        } else {
            i3 = i7;
        }
        Bitmap bitmap = null;
        if (b2 != null) {
            b2.setDensity(this.hM.densityDpi);
            bitmap = w.a(this.i, b2, i3);
            if (!b2.equals(bitmap)) {
                this.i.d(b2);
            }
        }
        return bitmap;
    }

    private static void a(ImageType imageType, InputStream inputStream, a aVar, d dVar, DownsampleStrategy downsampleStrategy, int i, int i2, int i3, int i4, int i5, Options options) throws IOException {
        ImageType imageType2 = imageType;
        DownsampleStrategy downsampleStrategy2 = downsampleStrategy;
        int i6 = i;
        int i7 = i2;
        int i8 = i3;
        int i9 = i4;
        int i10 = i5;
        Options options2 = options;
        String str;
        if (i7 <= 0 || i8 <= 0) {
            if (Log.isLoggable(TAG, 3)) {
                str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to determine dimensions for: ");
                stringBuilder.append(imageType2);
                stringBuilder.append(" with target [");
                stringBuilder.append(i9);
                stringBuilder.append("x");
                stringBuilder.append(i10);
                stringBuilder.append("]");
                Log.d(str, stringBuilder.toString());
            }
            return;
        }
        float a;
        if (i6 == 90 || i6 == 270) {
            a = downsampleStrategy2.a(i8, i7, i9, i10);
        } else {
            a = downsampleStrategy2.a(i7, i8, i9, i10);
        }
        if (a > 0.0f) {
            SampleSizeRounding b = downsampleStrategy2.b(i7, i8, i9, i10);
            if (b != null) {
                int i11;
                int ceil;
                int ceil2;
                float f = (float) i7;
                float f2 = (float) i8;
                int c = i7 / c((double) (a * f));
                int c2 = i8 / c((double) (a * f2));
                if (b == SampleSizeRounding.MEMORY) {
                    c = Math.max(c, c2);
                } else {
                    c = Math.min(c, c2);
                }
                if (VERSION.SDK_INT > 23 || !kK.contains(options2.outMimeType)) {
                    c = Math.max(1, Integer.highestOneBit(c));
                    i11 = (b != SampleSizeRounding.MEMORY || ((float) c) >= 1.0f / a) ? c : c << 1;
                } else {
                    i11 = 1;
                }
                options2.inSampleSize = i11;
                float min;
                if (imageType2 == ImageType.JPEG) {
                    min = (float) Math.min(i11, 8);
                    ceil = (int) Math.ceil((double) (f / min));
                    ceil2 = (int) Math.ceil((double) (f2 / min));
                    c = i11 / 8;
                    if (c > 0) {
                        ceil /= c;
                        ceil2 /= c;
                    }
                } else if (imageType2 == ImageType.PNG || imageType2 == ImageType.PNG_A) {
                    min = (float) i11;
                    ceil = (int) Math.floor((double) (f / min));
                    ceil2 = (int) Math.floor((double) (f2 / min));
                } else if (imageType2 == ImageType.WEBP || imageType2 == ImageType.WEBP_A) {
                    if (VERSION.SDK_INT >= 24) {
                        min = (float) i11;
                        ceil = Math.round(f / min);
                        ceil2 = Math.round(f2 / min);
                    } else {
                        min = (float) i11;
                        ceil = (int) Math.floor((double) (f / min));
                        ceil2 = (int) Math.floor((double) (f2 / min));
                    }
                } else if (i7 % i11 == 0 && i8 % i11 == 0) {
                    ceil = i7 / i11;
                    ceil2 = i8 / i11;
                } else {
                    int[] a2 = a(inputStream, options2, aVar, dVar);
                    ceil = a2[0];
                    ceil2 = a2[1];
                }
                double a3 = (double) downsampleStrategy2.a(ceil, ceil2, i9, i10);
                if (VERSION.SDK_INT >= 19) {
                    options2.inTargetDensity = a(a3);
                    options2.inDensity = b(a3);
                }
                if (a(options)) {
                    options2.inScaled = true;
                } else {
                    options2.inTargetDensity = 0;
                    options2.inDensity = 0;
                }
                if (Log.isLoggable(TAG, 2)) {
                    str = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Calculate scaling, source: [");
                    stringBuilder2.append(i7);
                    stringBuilder2.append("x");
                    stringBuilder2.append(i8);
                    stringBuilder2.append("], target: [");
                    stringBuilder2.append(i9);
                    stringBuilder2.append("x");
                    stringBuilder2.append(i10);
                    stringBuilder2.append("], power of two scaled: [");
                    stringBuilder2.append(ceil);
                    stringBuilder2.append("x");
                    stringBuilder2.append(ceil2);
                    stringBuilder2.append("], exact scale factor: ");
                    stringBuilder2.append(a);
                    stringBuilder2.append(", power of 2 sample size: ");
                    stringBuilder2.append(i11);
                    stringBuilder2.append(", adjusted scale factor: ");
                    stringBuilder2.append(a3);
                    stringBuilder2.append(", target density: ");
                    stringBuilder2.append(options2.inTargetDensity);
                    stringBuilder2.append(", density: ");
                    stringBuilder2.append(options2.inDensity);
                    Log.v(str, stringBuilder2.toString());
                }
                return;
            }
            throw new IllegalArgumentException("Cannot round with null rounding");
        }
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("Cannot scale with factor: ");
        stringBuilder3.append(a);
        stringBuilder3.append(" from: ");
        stringBuilder3.append(downsampleStrategy2);
        stringBuilder3.append(", source: [");
        stringBuilder3.append(i7);
        stringBuilder3.append("x");
        stringBuilder3.append(i8);
        stringBuilder3.append("], target: [");
        stringBuilder3.append(i9);
        stringBuilder3.append("x");
        stringBuilder3.append(i10);
        stringBuilder3.append("]");
        throw new IllegalArgumentException(stringBuilder3.toString());
    }

    private static int a(double d) {
        int b = b(d);
        int c = c(((double) b) * d);
        return c((d / ((double) (((float) c) / ((float) b)))) * ((double) c));
    }

    private static int b(double d) {
        if (d > 1.0d) {
            d = 1.0d / d;
        }
        return (int) Math.round(2.147483647E9d * d);
    }

    private static int c(double d) {
        return (int) (d + 0.5d);
    }

    private boolean a(ImageType imageType) {
        if (VERSION.SDK_INT >= 19) {
            return true;
        }
        return kM.contains(imageType);
    }

    private void a(InputStream inputStream, DecodeFormat decodeFormat, boolean z, boolean z2, Options options, int i, int i2) {
        if (!this.kO.a(i, i2, options, decodeFormat, z, z2)) {
            if (decodeFormat == DecodeFormat.PREFER_ARGB_8888 || decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE || VERSION.SDK_INT == 16) {
                options.inPreferredConfig = Config.ARGB_8888;
                return;
            }
            boolean hasAlpha;
            try {
                hasAlpha = com.bumptech.glide.load.b.a(this.dL, inputStream, this.du).hasAlpha();
            } catch (Throwable e) {
                if (Log.isLoggable(TAG, 3)) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Cannot determine whether the image has alpha or not from header, format ");
                    stringBuilder.append(decodeFormat);
                    Log.d(str, stringBuilder.toString(), e);
                }
                hasAlpha = false;
            }
            options.inPreferredConfig = hasAlpha ? Config.ARGB_8888 : Config.RGB_565;
            if (options.inPreferredConfig == Config.RGB_565) {
                options.inDither = true;
            }
        }
    }

    private static int[] a(InputStream inputStream, Options options, a aVar, d dVar) throws IOException {
        options.inJustDecodeBounds = true;
        b(inputStream, options, aVar, dVar);
        options.inJustDecodeBounds = false;
        return new int[]{options.outWidth, options.outHeight};
    }

    private static Bitmap b(InputStream inputStream, Options options, a aVar, d dVar) throws IOException {
        Throwable a;
        if (options.inJustDecodeBounds) {
            inputStream.mark(cR);
        } else {
            aVar.cn();
        }
        int i = options.outWidth;
        int i2 = options.outHeight;
        String str = options.outMimeType;
        w.cu().lock();
        try {
            Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
            w.cu().unlock();
            if (options.inJustDecodeBounds) {
                inputStream.reset();
            }
            return decodeStream;
        } catch (IOException e) {
            throw a;
        } catch (IllegalArgumentException e2) {
            a = a(e2, i, i2, str, options);
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to decode with inBitmap, trying again without Bitmap re-use", a);
            }
            if (options.inBitmap != null) {
                inputStream.reset();
                dVar.d(options.inBitmap);
                options.inBitmap = null;
                Bitmap b = b(inputStream, options, aVar, dVar);
                w.cu().unlock();
                return b;
            }
            throw a;
        } catch (Throwable th) {
            w.cu().unlock();
        }
    }

    private static boolean a(Options options) {
        return options.inTargetDensity > 0 && options.inDensity > 0 && options.inTargetDensity != options.inDensity;
    }

    private static void a(int i, int i2, String str, Options options, Bitmap bitmap, int i3, int i4, long j) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Decoded ");
        stringBuilder.append(g(bitmap));
        stringBuilder.append(" from [");
        stringBuilder.append(i);
        stringBuilder.append("x");
        stringBuilder.append(i2);
        stringBuilder.append("] ");
        stringBuilder.append(str);
        stringBuilder.append(" with inBitmap ");
        stringBuilder.append(b(options));
        stringBuilder.append(" for [");
        stringBuilder.append(i3);
        stringBuilder.append("x");
        stringBuilder.append(i4);
        stringBuilder.append("], sample size: ");
        stringBuilder.append(options.inSampleSize);
        stringBuilder.append(", density: ");
        stringBuilder.append(options.inDensity);
        stringBuilder.append(", target density: ");
        stringBuilder.append(options.inTargetDensity);
        stringBuilder.append(", thread: ");
        stringBuilder.append(Thread.currentThread().getName());
        stringBuilder.append(", duration: ");
        stringBuilder.append(com.bumptech.glide.util.e.e(j));
        Log.v(str2, stringBuilder.toString());
    }

    private static String b(Options options) {
        return g(options.inBitmap);
    }

    @Nullable
    @TargetApi(19)
    private static String g(Bitmap bitmap) {
        if (bitmap == null) {
            return null;
        }
        String stringBuilder;
        if (VERSION.SDK_INT >= 19) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(" (");
            stringBuilder2.append(bitmap.getAllocationByteCount());
            stringBuilder2.append(")");
            stringBuilder = stringBuilder2.toString();
        } else {
            stringBuilder = "";
        }
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("[");
        stringBuilder3.append(bitmap.getWidth());
        stringBuilder3.append("x");
        stringBuilder3.append(bitmap.getHeight());
        stringBuilder3.append("] ");
        stringBuilder3.append(bitmap.getConfig());
        stringBuilder3.append(stringBuilder);
        return stringBuilder3.toString();
    }

    private static IOException a(IllegalArgumentException illegalArgumentException, int i, int i2, String str, Options options) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Exception decoding bitmap, outWidth: ");
        stringBuilder.append(i);
        stringBuilder.append(", outHeight: ");
        stringBuilder.append(i2);
        stringBuilder.append(", outMimeType: ");
        stringBuilder.append(str);
        stringBuilder.append(", inBitmap: ");
        stringBuilder.append(b(options));
        return new IOException(stringBuilder.toString(), illegalArgumentException);
    }

    @TargetApi(26)
    private static void a(Options options, d dVar, int i, int i2) {
        Config config;
        if (VERSION.SDK_INT < 26) {
            config = null;
        } else if (options.inPreferredConfig != Config.HARDWARE) {
            config = options.outConfig;
        } else {
            return;
        }
        if (config == null) {
            config = options.inPreferredConfig;
        }
        options.inBitmap = dVar.g(i, i2, config);
    }

    private static synchronized Options cm() {
        Options options;
        synchronized (n.class) {
            synchronized (kN) {
                options = (Options) kN.poll();
            }
            if (options == null) {
                options = new Options();
                d(options);
            }
        }
        return options;
    }

    private static void c(Options options) {
        d(options);
        synchronized (kN) {
            kN.offer(options);
        }
    }

    private static void d(Options options) {
        options.inTempStorage = null;
        options.inDither = false;
        options.inScaled = false;
        options.inSampleSize = 1;
        options.inPreferredConfig = null;
        options.inJustDecodeBounds = false;
        options.inDensity = 0;
        options.inTargetDensity = 0;
        options.outWidth = 0;
        options.outHeight = 0;
        options.outMimeType = null;
        options.inBitmap = null;
        options.inMutable = true;
    }
}
