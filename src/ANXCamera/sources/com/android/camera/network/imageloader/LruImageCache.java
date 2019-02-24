package com.android.camera.network.imageloader;

import android.graphics.Bitmap;
import android.util.LruCache;
import com.android.volley.toolbox.ImageLoader.C0054ImageCache;

class LruImageCache implements C0054ImageCache {
    private LruCache<String, Bitmap> lruCache = new LruCache<String, Bitmap>(this.max) {
        protected int sizeOf(String str, Bitmap bitmap) {
            return bitmap.getRowBytes() * bitmap.getHeight();
        }
    };
    private int max = 5242880;

    public Bitmap getBitmap(String str) {
        return (Bitmap) this.lruCache.get(str);
    }

    public void putBitmap(String str, Bitmap bitmap) {
        this.lruCache.put(str, bitmap);
    }
}
