package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.i;
import java.io.IOException;

/* compiled from: BitmapDrawableDecoder */
public class a<DataType> implements g<DataType, BitmapDrawable> {
    private final Resources jG;
    private final g<DataType, Bitmap> jR;

    public a(Context context, g<DataType, Bitmap> gVar) {
        this(context.getResources(), (g) gVar);
    }

    @Deprecated
    public a(Resources resources, d dVar, g<DataType, Bitmap> gVar) {
        this(resources, (g) gVar);
    }

    public a(@NonNull Resources resources, @NonNull g<DataType, Bitmap> gVar) {
        this.jG = (Resources) i.checkNotNull(resources);
        this.jR = (g) i.checkNotNull(gVar);
    }

    public boolean a(@NonNull DataType dataType, @NonNull f fVar) throws IOException {
        return this.jR.a(dataType, fVar);
    }

    public p<BitmapDrawable> a(@NonNull DataType dataType, int i, int i2, @NonNull f fVar) throws IOException {
        return s.a(this.jG, this.jR.a(dataType, i, i2, fVar));
    }
}
