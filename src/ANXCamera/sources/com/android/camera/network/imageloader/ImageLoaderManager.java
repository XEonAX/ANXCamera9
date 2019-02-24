package com.android.camera.network.imageloader;

import android.content.Context;
import android.widget.ImageView;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.Volley;

public class ImageLoaderManager {
    private static ImageLoaderManager sInstance;
    private ImageLoader mImageLoader;

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
        this.mImageLoader = new ImageLoader(Volley.newRequestQueue(context.getApplicationContext()), new LruImageCache());
    }

    public void loadImage(ImageView imageView, String str) {
        if (this.mImageLoader == null) {
            initRequestQueue(imageView.getContext());
        }
        this.mImageLoader.get(str, ImageLoader.getImageListener(imageView, 0, 0));
    }
}
