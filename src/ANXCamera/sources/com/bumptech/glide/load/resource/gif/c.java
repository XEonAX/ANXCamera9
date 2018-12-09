package com.bumptech.glide.load.resource.gif;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.util.a;
import java.io.File;

/* compiled from: GifDrawableEncoder */
public class c implements h<b> {
    private static final String TAG = "GifEncoder";

    @NonNull
    public EncodeStrategy b(@NonNull f fVar) {
        return EncodeStrategy.SOURCE;
    }

    public boolean a(@NonNull p<b> pVar, @NonNull File file, @NonNull f fVar) {
        try {
            a.a(((b) pVar.get()).getBuffer(), file);
            return true;
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Failed to encode GIF drawable data", e);
            }
            return false;
        }
    }
}
