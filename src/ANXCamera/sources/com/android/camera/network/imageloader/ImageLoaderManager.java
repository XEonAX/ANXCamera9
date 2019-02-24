package com.android.camera.network.imageloader;

import android.content.Context;
import android.widget.ImageView;
import com.android.volley.toolbox.C0056ImageLoader;
import com.android.volley.toolbox.C0068Volley;

public class ImageLoaderManager {
    private static ImageLoaderManager sInstance;
    private C0056ImageLoader mImageLoader;

    public static ImageLoaderManager getInstance() {
        if (sInstance == null) {
            synchronized (ImageLoaderManager.class) {
                if (sInstance == null) {
                    sInstance = new ImageLoaderManager();
                }
            }
        }
        return sInstance;
    }

    private ImageLoaderManager() {
    }

    public void initRequestQueue(Context context) {
        this.mImageLoader = new C0056ImageLoader(C0068Volley.newRequestQueue(context.getApplicationContext()), new LruImageCache());
    }

    public void loadImage(ImageView imageView, String str) {
        if (this.mImageLoader == null) {
            initRequestQueue(imageView.getContext());
        }
        this.mImageLoader.get(str, C0056ImageLoader.getImageListener(imageView, 0, 0));
    }
}
