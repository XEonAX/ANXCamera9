package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.support.annotation.WorkerThread;
import android.util.Log;
import android.view.Surface;
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

public class SingleCameraProcessor extends ImageProcessor {
    private static final String TAG = SingleCameraProcessor.class.getSimpleName();
    private LinkedBlockingQueue<Image> mImageQueue = new LinkedBlockingQueue(10);
    private boolean mIsCaptureResultReady = false;
    private boolean mIsImageReady = false;
    private LinkedBlockingQueue<ICustomCaptureResult> mResultQueue = new LinkedBlockingQueue(10);

    public SingleCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback) {
        super(imageProcessorStatusCallback);
    }

    @WorkerThread
    void onImageReceived(Image image, int i) {
        Log.d(TAG, "putWideCameraImage: received a wide image");
        try {
            this.mImageQueue.put(image);
            this.mIsImageReady = true;
        } catch (Throwable e) {
            Log.w(TAG, "onImageReceived: failed!", e);
        }
        processImage();
    }

    @WorkerThread
    void onCaptureReceived(ICustomCaptureResult iCustomCaptureResult, int i) {
        try {
            this.mResultQueue.put(iCustomCaptureResult);
            this.mIsCaptureResultReady = true;
        } catch (Throwable e) {
            Log.w(TAG, "onCaptureReceived: failed!", e);
        }
        processImage();
    }

    @Deprecated
    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        return null;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        List<Surface> arrayList = new ArrayList();
        final ImageReader newInstance = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), this.mImageBufferQueueSize);
        newInstance.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    Image acquireNextImage = newInstance.acquireNextImage();
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                    acquireNextImage.close();
                }
            }
        }, getHandler());
        this.mImageReaderList.add(newInstance);
        arrayList.add(newInstance.getSurface());
        return arrayList;
    }

    @WorkerThread
    void processImage() {
        if (this.mIsImageReady && this.mIsCaptureResultReady) {
            ICustomCaptureResult iCustomCaptureResult = (ICustomCaptureResult) this.mResultQueue.peek();
            Image image = (Image) this.mImageQueue.peek();
            if (iCustomCaptureResult != null && image != null) {
                long timeStamp = iCustomCaptureResult.getTimeStamp();
                try {
                    if (image.getTimestamp() == timeStamp) {
                        this.mResultQueue.poll(3000, TimeUnit.MICROSECONDS);
                        this.mImageQueue.poll(3000, TimeUnit.MICROSECONDS);
                        processCaptureResult(iCustomCaptureResult, image);
                        this.mImageProcessorStatusCallback.onImageProcessStart(iCustomCaptureResult.getTimeStamp());
                        this.mIsImageReady = false;
                        this.mIsCaptureResultReady = false;
                    } else if (image.getTimestamp() < timeStamp) {
                        this.mImageQueue.poll(3000, TimeUnit.MICROSECONDS);
                        this.mIsImageReady = false;
                    } else if (image.getTimestamp() > timeStamp) {
                        this.mResultQueue.poll(3000, TimeUnit.MICROSECONDS);
                        this.mIsCaptureResultReady = false;
                    }
                } catch (InterruptedException e) {
                    Log.e(TAG, "onImageReceive: poll result time out!", e.getCause());
                }
            }
        }
    }

    private void processCaptureResult(ICustomCaptureResult iCustomCaptureResult, Image image) {
        FrameData frameData = new FrameData(0, iCustomCaptureResult.getFrameNumber(), iCustomCaptureResult.getResults(), image);
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

    public void releaseResource() {
    }
}
