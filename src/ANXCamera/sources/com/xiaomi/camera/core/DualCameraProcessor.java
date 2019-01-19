package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Parcelable;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.FrameData.FrameStatusCallback;
import com.xiaomi.engine.TaskSession.FrameCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class DualCameraProcessor extends ImageProcessor {
    private static final String TAG = DualCameraProcessor.class.getSimpleName();
    private ImageReader mDepthImageReaderHolder;
    private ImageReader mEffectImageReaderHolder;
    private ImageReader mRawImageReaderHolder;

    DualCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback) {
        super(imageProcessorStatusCallback);
    }

    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        List<OutputConfiguration> arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[  EFFECT]", 1);
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: effectImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(0, this.mEffectImageReaderHolder.getSurface()));
        this.mRawImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mRawImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[     RAW]", 1);
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: rawImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 1);
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
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: depthImage received: ");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 2);
                }
                acquireNextImage.close();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(2, this.mDepthImageReaderHolder.getSurface()));
        return arrayList;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        throw new RuntimeException("This method is not supported in Portrait mode!");
    }

    void processImage(CaptureDataBean captureDataBean) {
        ICustomCaptureResult result = captureDataBean.getResult();
        PerformanceTracker.trackAlgorithmProcess("[ORIGINAL]", 0);
        processCaptureResult(result, captureDataBean.getMainImage(), 0);
        processCaptureResult(result, captureDataBean.getSubImage(), 1);
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
        stringBuilder.append("processCaptureResult: processFrame image -- ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        FrameData frameData = new FrameData(i, iCustomCaptureResult.getSequenceId(), iCustomCaptureResult.getFrameNumber(), results, image);
        frameData.setFrameCallback(new FrameStatusCallback() {
            public void onFrameImageClosed(Image image) {
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameImageClosed: ");
                stringBuilder.append(image);
                Log.d(access$000, stringBuilder.toString());
                if (DualCameraProcessor.this.mTaskSession != null) {
                    DualCameraProcessor.this.mTaskSession.onTaskFinish(1);
                }
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
            }
        });
        this.mTaskSession.onTaskStart(1);
        this.mTaskSession.processFrame(frameData, new FrameCallback() {
            public void onFrameProcessed(int i, String str, Object obj) {
                str = DualCameraProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onFrameProcessed: ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
            }
        });
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
