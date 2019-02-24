package com.bumptech.glide.load.a.a;

import java.io.File;

/* compiled from: FileService */
class a {
    a() {
    }

    public boolean exists(File file) {
        return file.exists();
    }

    public long d(File file) {
        return file.length();
    }

    public File h(String str) {
        return new File(str);
    }
}
