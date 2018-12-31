package com.xiaomi.camera.imagecodec;

import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.ImageWriter;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.util.LongSparseArray;
import java.util.HashMap;
import java.util.Map;

public class ImagePool {
    public static final int MAX_IMAGES = 30;
    private static final String TAG = ImagePool.class.getSimpleName();
    private HandlerThread imageReaderHandlerThread = new HandlerThread("ImageReaderHandlerThread");
    private HandlerThread imageWriterHandlerThread = new HandlerThread("ImageWriterHandlerThread");
    private OnImageAvailableListener mImageAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader imageReader) {
            synchronized (ImagePool.this.objLock) {
                Image acquireNextImage = imageReader.acquireNextImage();
                long timestamp = acquireNextImage.getTimestamp();
                String access$100 = ImagePool.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: queued a image: ");
                stringBuilder.append(timestamp);
                Log.d(access$100, stringBuilder.toString());
                ImagePool.this.mImageLongSparseArray.append(timestamp, acquireNextImage);
                ImagePool.this.objLock.notify();
            }
        }
    };
    private LongSparseArray<Image> mImageLongSparseArray = new LongSparseArray();
    private Map<ImageFormat, ImageReader> mImageReaderMap = new HashMap();
    private Map<ImageFormat, ImageWriter> mImageWriterMap = new HashMap();
    private final Object objLock = new Object();

    public static class ImageFormat {
        private int mFormat;
        private int mHeight;
        private int mWidth;

        public ImageFormat(int i, int i2, int i3) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mFormat = i3;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public int getHeight() {
            return this.mHeight;
        }

        public int getFormat() {
            return this.mFormat;
        }

        public int hashCode() {
            return (((this.mWidth << 8) | (this.mWidth >>> 8)) ^ this.mFormat) ^ ((this.mHeight << 16) | (this.mHeight >>> 16));
        }

        public boolean equals(@Nullable Object obj) {
            if (!(obj instanceof ImageFormat)) {
                return super.equals(obj);
            }
            ImageFormat imageFormat = (ImageFormat) obj;
            boolean z = this.mWidth == imageFormat.getWidth() && this.mHeight == imageFormat.getHeight() && this.mFormat == imageFormat.getFormat();
            return z;
        }
    }

    static class ImagePoolHolder {
        static ImagePool sInstance = new ImagePool();

        ImagePoolHolder() {
        }

        static {
            sInstance.imageReaderHandlerThread.start();
            sInstance.imageWriterHandlerThread.start();
        }
    }

    public static ImagePool getInstance() {
        return ImagePoolHolder.sInstance;
    }

    public void queueImage(Image image) {
        long timestamp = image.getTimestamp();
        if (this.mImageLongSparseArray.get(timestamp) == null) {
            synchronized (this.objLock) {
                ImageWriter imageWriter = getImageWriter(new ImageFormat(image.getWidth(), image.getHeight(), image.getFormat()));
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("queueImage: start queueInputImage : ");
                stringBuilder.append(image.getTimestamp());
                Log.d(str, stringBuilder.toString());
                imageWriter.queueInputImage(image);
                try {
                    this.objLock.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Log.d(TAG, "queueImage: end");
            }
            return;
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Image has exist :");
        stringBuilder2.append(timestamp);
        throw new RuntimeException(stringBuilder2.toString());
    }

    public Image getImage(long j) {
        Image image = (Image) this.mImageLongSparseArray.get(j);
        this.mImageLongSparseArray.remove(j);
        return image;
    }

    public Image getAnEmptyImage(@NonNull ImageFormat imageFormat) {
        Image dequeueInputImage = getImageWriter(imageFormat).dequeueInputImage();
        dequeueInputImage.setTimestamp(System.currentTimeMillis());
        return dequeueInputImage;
    }

    public void clear() {
        int i = 0;
        while (i < this.mImageLongSparseArray.size()) {
            try {
                ((Image) this.mImageLongSparseArray.valueAt(i)).close();
                i++;
            } catch (Throwable e) {
                Log.e(TAG, "Clear ImagePool cause error: ", e);
                return;
            }
        }
        for (ImageReader close : this.mImageReaderMap.values()) {
            close.close();
        }
        for (ImageWriter close2 : this.mImageWriterMap.values()) {
            close2.close();
        }
    }

    private ImageWriter getImageWriter(@NonNull ImageFormat imageFormat) {
        if (this.mImageWriterMap.containsKey(imageFormat)) {
            return (ImageWriter) this.mImageWriterMap.get(imageFormat);
        }
        ImageReader newInstance = ImageReader.newInstance(imageFormat.getWidth(), imageFormat.getHeight(), imageFormat.getFormat(), 30);
        newInstance.setOnImageAvailableListener(this.mImageAvailableListener, new Handler(this.imageReaderHandlerThread.getLooper()));
        ImageWriter newInstance2 = ImageWriter.newInstance(newInstance.getSurface(), 30);
        newInstance2.setOnImageReleasedListener(null, new Handler(this.imageWriterHandlerThread.getLooper()));
        this.mImageReaderMap.put(imageFormat, newInstance);
        this.mImageWriterMap.put(imageFormat, newInstance2);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getImageWriter: mImageWriterMap.size = ");
        stringBuilder.append(this.mImageWriterMap.size());
        Log.d(str, stringBuilder.toString());
        if (this.mImageReaderMap.size() > 10) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("getImageWriter: there are too much ImageWriter and ImageReader instance in map, size is : ");
            stringBuilder.append(this.mImageReaderMap.size());
            Log.e(str, stringBuilder.toString());
        }
        return newInstance2;
    }
}
