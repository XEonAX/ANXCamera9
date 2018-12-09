package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.util.k;
import java.util.HashMap;
import java.util.Map;

/* compiled from: BitmapPreFiller */
public final class a {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final d i;
    private final DecodeFormat iA;
    private BitmapPreFillRunner iB;
    private final j k;

    public a(j jVar, d dVar, DecodeFormat decodeFormat) {
        this.k = jVar;
        this.i = dVar;
        this.iA = decodeFormat;
    }

    public void b(com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        if (this.iB != null) {
            this.iB.cancel();
        }
        c[] cVarArr = new c[aVarArr.length];
        for (int i = 0; i < aVarArr.length; i++) {
            com.bumptech.glide.load.engine.prefill.c.a aVar = aVarArr[i];
            if (aVar.getConfig() == null) {
                Config config = (this.iA == DecodeFormat.PREFER_ARGB_8888 || this.iA == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE) ? Config.ARGB_8888 : Config.RGB_565;
                aVar.e(config);
            }
            cVarArr[i] = aVar.bQ();
        }
        this.iB = new BitmapPreFillRunner(this.i, this.k, generateAllocationOrder(cVarArr));
        this.handler.post(this.iB);
    }

    @VisibleForTesting
    b generateAllocationOrder(c... cVarArr) {
        long maxSize = (this.k.getMaxSize() - this.k.bz()) + this.i.getMaxSize();
        int i = 0;
        int i2 = 0;
        int i3 = i2;
        while (i2 < cVarArr.length) {
            i3 += cVarArr[i2].getWeight();
            i2++;
        }
        float f = ((float) maxSize) / ((float) i3);
        Map hashMap = new HashMap();
        int length = cVarArr.length;
        while (i < length) {
            c cVar = cVarArr[i];
            hashMap.put(cVar, Integer.valueOf(Math.round(((float) cVar.getWeight()) * f) / a(cVar)));
            i++;
        }
        return new b(hashMap);
    }

    private static int a(c cVar) {
        return k.i(cVar.getWidth(), cVar.getHeight(), cVar.getConfig());
    }
}
