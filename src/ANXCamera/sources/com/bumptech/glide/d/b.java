package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.ImageHeaderParser;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ImageHeaderParserRegistry */
public final class b {
    private final List<ImageHeaderParser> dM = new ArrayList();

    @NonNull
    public synchronized List<ImageHeaderParser> dc() {
        return this.dM;
    }

    public synchronized void b(@NonNull ImageHeaderParser imageHeaderParser) {
        this.dM.add(imageHeaderParser);
    }
}
