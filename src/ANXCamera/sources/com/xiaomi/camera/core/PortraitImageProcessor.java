package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Parcelable;
import android.util.Log;
import android.view.Surface;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.FrameData.FrameStatusCallback;
import com.xiaomi.engine.TaskSession.FrameCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class PortraitImageProcessor extends ImageProcessor {
    public static final int DEPTH_IMAGE_GROUP_ID = 3;
    public static final int EFFECT_IMAGE_GROUP_ID = 1;
    public static final int RAW_IMAGE_GROUP_ID = 2;
    private static final String TAG = PortraitImageProcessor.class.getSimpleName();
    private LinkedBlockingQueue<ICustomCaptureResult> mCaptureResultQueue = new LinkedBlockingQueue(10);
    private ImageReader mDepthImageReaderHolder;
    private ImageReader mEffectImageReaderHolder;
    private ImageReader mRawImageReaderHolder;
    private LinkedBlockingQueue<Image> mTeleCaptureImageQueue = new LinkedBlockingQueue(10);
    private LinkedBlockingQueue<Image> mWideCaptureImageQueue = new LinkedBlockingQueue(10);

    public PortraitImageProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback) {
        super(imageProcessorStatusCallback);
    }

    void onImageReceived(Image image, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onImageReceived: received a image");
        stringBuilder.append(image);
        stringBuilder.append("; target = ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        if (i == 1) {
            try {
                this.mWideCaptureImageQueue.put(image);
            } catch (Throwable e) {
                Log.w(TAG, "onImageReceived: failed!", e);
            }
        } else if (i == 0) {
            this.mTeleCaptureImageQueue.put(image);
        } else {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onImageReceived: unknown image target: ");
            stringBuilder2.append(i);
            Log.e(str2, stringBuilder2.toString());
        }
        processImage();
    }

    void onCaptureReceived(ICustomCaptureResult iCustomCaptureResult, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onCaptureReceived: received a capture result ");
        stringBuilder.append(iCustomCaptureResult);
        stringBuilder.append("-");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        try {
            this.mCaptureResultQueue.put(iCustomCaptureResult);
        } catch (Throwable e) {
            Log.w(TAG, "onCaptureReceived: failed!", e);
        }
        processImage();
    }

    void processImage() {
        if (!this.mCaptureResultQueue.isEmpty() && !this.mWideCaptureImageQueue.isEmpty() && !this.mTeleCaptureImageQueue.isEmpty()) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("processImage: mCaptureResultQueue size: ");
            stringBuilder.append(this.mCaptureResultQueue.size());
            Log.d(str, stringBuilder.toString());
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("processImage: mWideCaptureImageQueue size: ");
            stringBuilder.append(this.mWideCaptureImageQueue.size());
            Log.d(str, stringBuilder.toString());
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("processImage: mTeleCaptureImageQueue size: ");
            stringBuilder.append(this.mTeleCaptureImageQueue.size());
            Log.d(str, stringBuilder.toString());
            ICustomCaptureResult iCustomCaptureResult = (ICustomCaptureResult) this.mCaptureResultQueue.peek();
            Image image = (Image) this.mWideCaptureImageQueue.peek();
            Image image2 = (Image) this.mTeleCaptureImageQueue.peek();
            if (iCustomCaptureResult != null && image != null && image2 != null) {
                long timeStamp = iCustomCaptureResult.getTimeStamp();
                long timestamp = image.getTimestamp();
                long timestamp2 = image2.getTimestamp();
                if (timeStamp == timestamp && timeStamp == timestamp2) {
                    try {
                        this.mImageProcessorStatusCallback.onImageProcessStart(iCustomCaptureResult.getTimeStamp());
                        this.mCaptureResultQueue.poll(3000, TimeUnit.MICROSECONDS);
                        this.mWideCaptureImageQueue.poll(3000, TimeUnit.MICROSECONDS);
                        this.mTeleCaptureImageQueue.poll(3000, TimeUnit.MICROSECONDS);
                        PerformanceTracker.trackAlgorithmProcess("[ORIGINAL]", 0);
                        processCaptureResult(iCustomCaptureResult, image, 1);
                        processCaptureResult(iCustomCaptureResult, image2, 0);
                    } catch (InterruptedException e) {
                        Log.e(TAG, "onImageReceive: poll result time out!", e.getCause());
                    }
                    return;
                }
                stringBuilder = new StringBuilder();
                stringBuilder.append("TimeStamp is not matched: captureResult=");
                stringBuilder.append(timeStamp);
                stringBuilder.append(";wideImage=");
                stringBuilder.append(timestamp);
                stringBuilder.append(";teleImage=");
                stringBuilder.append(timestamp2);
                throw new RuntimeException(stringBuilder.toString());
            }
        }
    }

    private void processCaptureResult(ICustomCaptureResult iCustomCaptureResult, Image image, int i) {
        Parcelable results = iCustomCaptureResult.getResults();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("processCaptureResult: cameraMetadataNative = ");
        stringBuilder.append(results);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("processCaptureResult: image = ");
        stringBuilder.append(image.getPlanes());
        Log.d(str, stringBuilder.toString());
        FrameData frameData = new FrameData(i, iCustomCaptureResult.getFrameNumber(), results, image);
        frameData.setFrameCallback(new FrameStatusCallback() {
            public void onFrameImageClosed(Image image) {
                String access$000 = PortraitImageProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameImageClosed: ");
                stringBuilder.append(image);
                Log.d(access$000, stringBuilder.toString());
                if (PortraitImageProcessor.this.mImageProcessorStatusCallback != null) {
                    PortraitImageProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
            }
        });
        this.mTaskSession.processFrame(frameData, new FrameCallback() {
            public void onFrameProcessed(int i, String str, Object obj) {
                str = PortraitImageProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameProcessed: ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
            }
        });
    }

    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        List<OutputConfiguration> arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), this.mImageBufferQueueSize);
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[  EFFECT]", 1);
                String access$000 = PortraitImageProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: effectImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (PortraitImageProcessor.this.mImageProcessorStatusCallback != null) {
                    PortraitImageProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 1);
                }
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(1, this.mEffectImageReaderHolder.getSurface()));
        this.mRawImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), this.mImageBufferQueueSize);
        this.mRawImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[     RAW]", 1);
                String access$000 = PortraitImageProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: rawImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (PortraitImageProcessor.this.mImageProcessorStatusCallback != null) {
                    PortraitImageProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 2);
                }
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(2, this.mRawImageReaderHolder.getSurface()));
        this.mDepthImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth() / 2, bufferFormat.getBufferHeight() / 2, 540422489, this.mImageBufferQueueSize);
        this.mDepthImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[   DEPTH]", 1);
                String access$000 = PortraitImageProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: depthImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (PortraitImageProcessor.this.mImageProcessorStatusCallback != null) {
                    PortraitImageProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 3);
                }
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(3, this.mDepthImageReaderHolder.getSurface()));
        return arrayList;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        throw new RuntimeException("This method is not supported in Portrait mode!");
    }

    public void releaseResource() {
        if (this.mEffectImageReaderHolder != null) {
            this.mEffectImageReaderHolder.close();
            this.mEffectImageReaderHolder = null;
        }
        if (this.mRawImageReaderHolder != null) {
            this.mRawImageReaderHolder.close();
            this.mRawImageReaderHolder = null;
        }
        if (this.mDepthImageReaderHolder != null) {
            this.mDepthImageReaderHolder.close();
            this.mDepthImageReaderHolder = null;
        }
    }
}
