package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.FrameData.FrameStatusCallback;
import com.xiaomi.engine.TaskSession.FrameCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class SingleCameraProcessor extends ImageProcessor {
    private static final String TAG = SingleCameraProcessor.class.getSimpleName();
    private AtomicInteger mNeedProcessImageSize = new AtomicInteger(0);

    SingleCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback, boolean z) {
        super(imageProcessorStatusCallback, z);
    }

    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        List<OutputConfiguration> arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[  EFFECT]", 1);
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: effectImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                access$000 = SingleCameraProcessor.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: effectImage closed: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(0, this.mEffectImageReaderHolder.getSurface()));
        if (this.mIsBokehMode) {
            this.mRawImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
            this.mRawImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    PerformanceTracker.trackAlgorithmProcess("[     RAW]", 1);
                    String access$000 = SingleCameraProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onImageAvailable: rawImage received: ");
                    stringBuilder.append(acquireNextImage);
                    Log.d(access$000, stringBuilder.toString());
                    if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                        SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 1);
                    }
                    acquireNextImage.close();
                }
            }, getHandler());
            arrayList.add(new OutputConfiguration(1, this.mRawImageReaderHolder.getSurface()));
            this.mDepthImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth() / 2, bufferFormat.getBufferHeight() / 2, 540422489, getImageBufferQueueSize());
            this.mDepthImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    PerformanceTracker.trackAlgorithmProcess("[   DEPTH]", 1);
                    String access$000 = SingleCameraProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onImageAvailable: depthImage received: ");
                    stringBuilder.append(acquireNextImage);
                    Log.d(access$000, stringBuilder.toString());
                    if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                        SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 2);
                    }
                    acquireNextImage.close();
                }
            }, getHandler());
            arrayList.add(new OutputConfiguration(2, this.mDepthImageReaderHolder.getSurface()));
        }
        return arrayList;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        List<Surface> arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Log.d(SingleCameraProcessor.TAG, "configOutputSurfaces onImageAvailable: effectImage received");
                Image acquireNextImage = imageReader.acquireNextImage();
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                acquireNextImage.close();
                SingleCameraProcessor.this.mNeedProcessImageSize.getAndDecrement();
                SingleCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(this.mEffectImageReaderHolder.getSurface());
        return arrayList;
    }

    void processImage(CaptureDataBean captureDataBean) {
        this.mNeedProcessImageSize.getAndIncrement();
        processCaptureResult(captureDataBean.getResult(), captureDataBean.getMainImage());
    }

    boolean isIdle() {
        return this.mNeedProcessImageSize.get() == 0;
    }

    private void processCaptureResult(ICustomCaptureResult iCustomCaptureResult, Image image) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("processCaptureResult: processFrame image -- ");
        stringBuilder.append(image);
        Log.d(str, stringBuilder.toString());
        FrameData frameData = new FrameData(0, iCustomCaptureResult.getSequenceId(), iCustomCaptureResult.getFrameNumber(), iCustomCaptureResult.getResults(), image);
        frameData.setFrameCallback(new FrameStatusCallback() {
            public void onFrameImageClosed(Image image) {
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameImageClosed: ");
                stringBuilder.append(image);
                Log.d(access$000, stringBuilder.toString());
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
                ImagePool.getInstance().releaseImage(image);
            }
        });
        this.mTaskSession.processFrame(frameData, new FrameCallback() {
            public void onFrameProcessed(int i, String str, Object obj) {
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameProcessed: [");
                stringBuilder.append(i);
                stringBuilder.append("]:{");
                stringBuilder.append(str);
                stringBuilder.append("}");
                Log.d(access$000, stringBuilder.toString());
            }
        });
    }
}
