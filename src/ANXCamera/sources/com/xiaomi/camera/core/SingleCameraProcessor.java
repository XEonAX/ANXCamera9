package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.FrameData.FrameStatusCallback;
import com.xiaomi.engine.TaskSession.FrameCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class SingleCameraProcessor extends ImageProcessor {
    private static final String TAG = SingleCameraProcessor.class.getSimpleName();
    private ImageReader mEffectImageReaderHolder;

    SingleCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback) {
        super(imageProcessorStatusCallback);
    }

    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        List<OutputConfiguration> arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
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
            }
        }, getHandler());
        arrayList.add(this.mEffectImageReaderHolder.getSurface());
        return arrayList;
    }

    void processImage(CaptureDataBean captureDataBean) {
        processCaptureResult(captureDataBean.getResult(), captureDataBean.getMainImage());
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
                if (SingleCameraProcessor.this.mTaskSession != null) {
                    SingleCameraProcessor.this.mTaskSession.onTaskFinish(1);
                }
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
            }
        });
        this.mTaskSession.onTaskStart(1);
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

    public void releaseResource() {
        if (this.mEffectImageReaderHolder != null) {
            this.mEffectImageReaderHolder.close();
            this.mEffectImageReaderHolder = null;
        }
    }
}
