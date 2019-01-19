package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.b.a;
import com.bumptech.glide.b.c;
import com.bumptech.glide.b.d;
import com.bumptech.glide.b.e;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.k;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Queue;

public class ByteBufferGifDecoder implements g<ByteBuffer, b> {
    private static final String TAG = "BufferGifDecoder";
    private static final GifDecoderFactory lv = new GifDecoderFactory();
    private static final GifHeaderParserPool lw = new GifHeaderParserPool();
    private final Context context;
    private final List<ImageHeaderParser> dL;
    private final GifHeaderParserPool lx;
    private final GifDecoderFactory ly;
    private final a lz;

    @VisibleForTesting
    static class GifDecoderFactory {
        GifDecoderFactory() {
        }

        a a(a.a aVar, c cVar, ByteBuffer byteBuffer, int i) {
            return new e(aVar, cVar, byteBuffer, i);
        }
    }

    @VisibleForTesting
    static class GifHeaderParserPool {
        private final Queue<d> hl = k.U(0);

        GifHeaderParserPool() {
        }

        synchronized d e(ByteBuffer byteBuffer) {
            d dVar;
            dVar = (d) this.hl.poll();
            if (dVar == null) {
                dVar = new d();
            }
            return dVar.a(byteBuffer);
        }

        synchronized void a(d dVar) {
            dVar.clear();
            this.hl.offer(dVar);
        }
    }

    public ByteBufferGifDecoder(Context context) {
        this(context, com.bumptech.glide.c.b(context).l().q(), com.bumptech.glide.c.b(context).e(), com.bumptech.glide.c.b(context).f());
    }

    public ByteBufferGifDecoder(Context context, List<ImageHeaderParser> list, com.bumptech.glide.load.engine.bitmap_recycle.d dVar, b bVar) {
        this(context, list, dVar, bVar, lw, lv);
    }

    @VisibleForTesting
    ByteBufferGifDecoder(Context context, List<ImageHeaderParser> list, com.bumptech.glide.load.engine.bitmap_recycle.d dVar, b bVar, GifHeaderParserPool gifHeaderParserPool, GifDecoderFactory gifDecoderFactory) {
        this.context = context.getApplicationContext();
        this.dL = list;
        this.ly = gifDecoderFactory;
        this.lz = new a(dVar, bVar);
        this.lx = gifHeaderParserPool;
    }

    public boolean a(@NonNull ByteBuffer byteBuffer, @NonNull f fVar) throws IOException {
        return !((Boolean) fVar.a(g.lX)).booleanValue() && com.bumptech.glide.load.b.a(this.dL, byteBuffer) == ImageType.GIF;
    }

    /* renamed from: b */
    public d a(@NonNull ByteBuffer byteBuffer, int i, int i2, @NonNull f fVar) {
        d e = this.lx.e(byteBuffer);
        try {
            d a = a(byteBuffer, i, i2, e, fVar);
            return a;
        } finally {
            this.lx.a(e);
        }
    }

    @Nullable
    private d a(ByteBuffer byteBuffer, int i, int i2, d dVar, f fVar) {
        long eE = com.bumptech.glide.util.e.eE();
        StringBuilder stringBuilder;
        try {
            c W = dVar.W();
            String str;
            if (W.V() <= 0 || W.getStatus() != 0) {
                if (Log.isLoggable(TAG, 2)) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Decoded GIF from stream in ");
                    stringBuilder.append(com.bumptech.glide.util.e.e(eE));
                    Log.v(str, stringBuilder.toString());
                }
                return null;
            }
            Config config = fVar.a(g.kE) == DecodeFormat.PREFER_RGB_565 ? Config.RGB_565 : Config.ARGB_8888;
            int i3 = i;
            int i4 = i2;
            a a = this.ly.a(this.lz, W, byteBuffer, a(W, i3, i4));
            a.a(config);
            a.advance();
            Bitmap U = a.U();
            if (U == null) {
                if (Log.isLoggable(TAG, 2)) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Decoded GIF from stream in ");
                    stringBuilder.append(com.bumptech.glide.util.e.e(eE));
                    Log.v(str, stringBuilder.toString());
                }
                return null;
            }
            d dVar2 = new d(new b(this.context, a, com.bumptech.glide.load.resource.b.cf(), i3, i4, U));
            if (Log.isLoggable(TAG, 2)) {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Decoded GIF from stream in ");
                stringBuilder2.append(com.bumptech.glide.util.e.e(eE));
                Log.v(str2, stringBuilder2.toString());
            }
            return dVar2;
        } catch (Throwable th) {
            if (Log.isLoggable(TAG, 2)) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Decoded GIF from stream in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(eE));
                Log.v(TAG, stringBuilder.toString());
            }
        }
    }

    private static int a(c cVar, int i, int i2) {
        int min = Math.min(cVar.getHeight() / i2, cVar.getWidth() / i);
        min = Math.max(1, min == 0 ? 0 : Integer.highestOneBit(min));
        if (Log.isLoggable(TAG, 2) && min > 1) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Downsampling GIF, sampleSize: ");
            stringBuilder.append(min);
            stringBuilder.append(", target dimens: [");
            stringBuilder.append(i);
            stringBuilder.append("x");
            stringBuilder.append(i2);
            stringBuilder.append("], actual dimens: [");
            stringBuilder.append(cVar.getWidth());
            stringBuilder.append("x");
            stringBuilder.append(cVar.getHeight());
            stringBuilder.append("]");
            Log.v(str, stringBuilder.toString());
        }
        return min;
    }
}
