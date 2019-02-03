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
    private Map<Image, ImageFormat> mHoldImages = new HashMap();
    private OnImageAvailableListener mImageAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader imageReader) {
            synchronized (ImagePool.this.mImageLock) {
                Image acquireNextImage = imageReader.acquireNextImage();
                ImagePool.this.mImageLongSparseArray.append(acquireNextImage.getTimestamp(), acquireNextImage);
                ImagePool.this.mImageLock.notify();
            }
        }
    };
    private final Object mImageLock = new Object();
    private LongSparseArray<Image> mImageLongSparseArray = new LongSparseArray();
    private Map<ImageFormat, Integer> mImageQueueSizeMap = new HashMap();
    private HandlerThread mImageReaderHandlerThread = new HandlerThread("ImageReaderHandlerThread");
    private Map<ImageFormat, ImageReader> mImageReaderMap = new HashMap();
    private HandlerThread mImageWriterHandlerThread = new HandlerThread("ImageWriterHandlerThread");
    private Map<ImageFormat, ImageWriter> mImageWriterMap = new HashMap();
    private final Object mQueueSizeLock = new Object();

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
            sInstance.mImageReaderHandlerThread.start();
            sInstance.mImageWriterHandlerThread.start();
        }
    }

    public static ImagePool getInstance() {
        return ImagePoolHolder.sInstance;
    }

    public void queueImage(Image image) {
        long timestamp = image.getTimestamp();
        if (this.mImageLongSparseArray.get(timestamp) == null) {
            synchronized (this.mImageLock) {
                ImageWriter imageWriter = getImageWriter(toImageQueueKey(image));
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("queueImage: start. image: ");
                stringBuilder.append(image);
                stringBuilder.append(" | ");
                stringBuilder.append(image.getTimestamp());
                Log.d(str, stringBuilder.toString());
                imageWriter.queueInputImage(image);
                try {
                    this.mImageLock.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Log.d(TAG, "queueImage: end");
            }
            return;
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Image has exist: ");
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

    public void holdImage(Image image) {
        synchronized (this.mQueueSizeLock) {
            if (image != null) {
                ImageFormat toImageQueueKey = toImageQueueKey(image);
                this.mHoldImages.put(image, toImageQueueKey);
                int changeImageQueueSizeLocked = changeImageQueueSizeLocked(toImageQueueKey, 1);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("holdImage: image: ");
                stringBuilder.append(image);
                stringBuilder.append(" | ");
                stringBuilder.append(image.getTimestamp());
                stringBuilder.append(" qSize: ");
                stringBuilder.append(changeImageQueueSizeLocked);
                Log.d(str, stringBuilder.toString());
                this.mQueueSizeLock.notifyAll();
            }
        }
    }

    public void releaseImage(Image image) {
        synchronized (this.mQueueSizeLock) {
            if (image != null) {
                ImageFormat imageFormat = (ImageFormat) this.mHoldImages.get(image);
                if (imageFormat != null) {
                    this.mHoldImages.remove(image);
                    int changeImageQueueSizeLocked = changeImageQueueSizeLocked(imageFormat, -1);
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("releaseImage: image: ");
                    stringBuilder.append(image);
                    stringBuilder.append(" qSize: ");
                    stringBuilder.append(changeImageQueueSizeLocked);
                    Log.d(str, stringBuilder.toString());
                    this.mQueueSizeLock.notifyAll();
                } else {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("releaseImage: not hold image ");
                    stringBuilder2.append(image);
                    Log.w(str2, stringBuilder2.toString());
                }
            }
        }
    }

    public boolean isImageQueueFull(ImageFormat imageFormat, int i) {
        boolean z;
        synchronized (this.mQueueSizeLock) {
            z = false;
            if (getImageQueueSizeLocked(imageFormat) >= Math.max(0, 30 - i)) {
                z = true;
            }
        }
        return z;
    }

    public void waitIfImageQueueFull(ImageFormat imageFormat, int i, int i2) {
        i = Math.max(0, 30 - i);
        synchronized (this.mQueueSizeLock) {
            while (getImageQueueSizeLocked(imageFormat) >= i) {
                if (i2 > 0) {
                    try {
                        this.mQueueSizeLock.wait((long) i2);
                    } catch (Throwable e) {
                        Log.e(TAG, e.getMessage(), e);
                    }
                } else {
                    this.mQueueSizeLock.wait();
                }
            }
        }
    }

    private int getImageQueueSizeLocked(ImageFormat imageFormat) {
        if (imageFormat != null) {
            Integer num = (Integer) this.mImageQueueSizeMap.get(imageFormat);
            if (num != null) {
                return num.intValue();
            }
        }
        return 0;
    }

    private int changeImageQueueSizeLocked(ImageFormat imageFormat, int i) {
        Integer num = (Integer) this.mImageQueueSizeMap.get(imageFormat);
        if (num == null) {
            num = Integer.valueOf(0);
        }
        Integer valueOf = Integer.valueOf(num.intValue() + i);
        if (valueOf.intValue() < 0) {
            valueOf = Integer.valueOf(0);
        }
        this.mImageQueueSizeMap.put(imageFormat, valueOf);
        return valueOf.intValue();
    }

    public ImageFormat toImageQueueKey(Image image) {
        if (image != null) {
            return new ImageFormat(image.getWidth(), image.getHeight(), image.getFormat());
        }
        return null;
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
        this.mImageQueueSizeMap.clear();
    }

    private ImageWriter getImageWriter(@NonNull ImageFormat imageFormat) {
        if (this.mImageWriterMap.containsKey(imageFormat)) {
            return (ImageWriter) this.mImageWriterMap.get(imageFormat);
        }
        ImageReader newInstance = ImageReader.newInstance(imageFormat.getWidth(), imageFormat.getHeight(), imageFormat.getFormat(), 30);
        newInstance.setOnImageAvailableListener(this.mImageAvailableListener, new Handler(this.mImageReaderHandlerThread.getLooper()));
        ImageWriter newInstance2 = ImageWriter.newInstance(newInstance.getSurface(), 30);
        newInstance2.setOnImageReleasedListener(null, new Handler(this.mImageWriterHandlerThread.getLooper()));
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
