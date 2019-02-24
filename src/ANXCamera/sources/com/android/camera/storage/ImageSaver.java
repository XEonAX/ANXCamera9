package com.android.camera.storage;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.location.Location;
import android.net.Uri;
import android.os.Handler;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.Exif;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.watermark.WaterMarkData;
import com.android.camera2.ArcsoftDepthMap;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter;
import com.xiaomi.camera.core.PictureInfo;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class ImageSaver implements SaverCallback, ParallelCallback {
    private static final Executor CAMERA_SAVER_EXECUTOR;
    private static final int HOST_STATE_DESTROY = 2;
    private static final int HOST_STATE_PAUSE = 1;
    private static final int HOST_STATE_RESUME = 0;
    private static final int QUEUE_BUSY_SIZE = 40;
    private static final String TAG = ImageSaver.class.getSimpleName();
    private static final BlockingQueue<Runnable> mSaveRequestQueue = new LinkedBlockingQueue(128);
    private static final ThreadFactory sThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger(1);

        public Thread newThread(Runnable runnable) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("camera-saver-");
            stringBuilder.append(this.mCount.getAndIncrement());
            Thread thread = new Thread(runnable, stringBuilder.toString());
            thread.setPriority(10);
            return thread;
        }
    };
    private ActivityBase mActivity;
    private Context mContext;
    private SnapshotEffectRender mEffectProcessor;
    private final Object mEffectProcessorLock = new Object();
    private Handler mHandler;
    private int mHostState;
    private volatile boolean mIsBusy;
    private boolean mIsCaptureIntent;
    private Uri mLastImageUri;
    private MemoryManager mMemoryManager;
    private volatile boolean mPendingSave;
    private Thumbnail mPendingThumbnail;
    private ParallelTaskData mStoredTaskData;
    private ThumbnailUpdater mUpdateThumbnail = new ThumbnailUpdater();
    private final Object mUpdateThumbnailLock = new Object();

    private class ThumbnailUpdater implements Runnable {
        private boolean mNeedAnimation = true;

        public void setNeedAnimation(boolean z) {
            this.mNeedAnimation = z;
        }

        public void run() {
            ImageSaver.this.mActivity.getScreenHint().updateHint();
            ImageSaver.this.updateThumbnail(this.mNeedAnimation);
        }
    }

    static {
        Executor threadPoolExecutor = new ThreadPoolExecutor(4, 4, 10, TimeUnit.SECONDS, mSaveRequestQueue, sThreadFactory);
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        CAMERA_SAVER_EXECUTOR = threadPoolExecutor;
    }

    public ImageSaver(ActivityBase activityBase, Handler handler, boolean z) {
        this.mActivity = activityBase;
        this.mHandler = handler;
        this.mIsCaptureIntent = z;
        this.mMemoryManager = new MemoryManager();
        this.mMemoryManager.initMemory();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
    }

    public void addImage(byte[] bArr, boolean z, String str, String str2, long j, Uri uri, Location location, int i, int i2, ExifInterface exifInterface, int i3, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str3, PictureInfo pictureInfo, int i4) {
        Uri uri2 = uri;
        String str4 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isParallelProcess: parallel=");
        boolean z7 = z6;
        stringBuilder.append(z7);
        stringBuilder.append(" uri=");
        stringBuilder.append(uri2);
        stringBuilder.append(" algo=");
        stringBuilder.append(str3);
        Log.d(str4, stringBuilder.toString());
        if (str2 != null && uri2 == null) {
            uri2 = this.mLastImageUri;
        }
        Uri uri3 = uri2;
        Object obj = bArr;
        PerformanceTracker.trackImageSaver(obj, 0);
        addSaveRequest(new ImageSaveRequest(obj, z, str, str2, j, uri3, location, i, i2, exifInterface, i3, z2, z3, z4, z5, z7, str3, pictureInfo, i4));
    }

    private void storeJpegData(ParallelTaskData parallelTaskData, int i, int i2) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        this.mStoredTaskData = parallelTaskData;
        i = Integer.highestOneBit((int) Math.floor(((double) i) / ((double) dataParameter.getPreviewSize().getWidth())));
        int shootOrientation = 360 - dataParameter.getShootOrientation();
        Bitmap createBitmap = Thumbnail.createBitmap(parallelTaskData.getJpegImageData(), (i2 + shootOrientation) + Util.getDisplayRotation(this.mActivity), false, i);
        if (createBitmap != null) {
            this.mActivity.getCameraScreenNail().renderBitmapToCanvas(createBitmap);
        }
    }

    public void saveStoredData() {
        int i;
        int i2;
        ParallelTaskData parallelTaskData = this.mStoredTaskData;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String createJpegName = Util.createJpegName(System.currentTimeMillis());
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(this.mStoredTaskData.getJpegImageData());
        if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        addImage(this.mStoredTaskData.getJpegImageData(), parallelTaskData.isNeedThumbnail(), createJpegName, null, System.currentTimeMillis(), null, dataParameter.getLocation(), i, i2, null, orientation, false, false, true, false, false, dataParameter.getAlgorithmName(), dataParameter.getPictureInfo(), -1);
    }

    public byte[] getStoredJpegData() {
        return this.mStoredTaskData.getJpegImageData();
    }

    private void insertPreviewShotTask(ParallelTaskData parallelTaskData) {
        PictureInfo pictureInfo;
        int i;
        int i2;
        Location location;
        String str;
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        if (dataParameter != null) {
            int width = dataParameter.getOutputSize().getWidth();
            int height = dataParameter.getOutputSize().getHeight();
            Location location2 = dataParameter.getLocation();
            String algorithmName = dataParameter.getAlgorithmName();
            pictureInfo = dataParameter.getPictureInfo();
            i = width;
            i2 = height;
            location = location2;
            str = algorithmName;
        } else {
            i = 0;
            i2 = i;
            location = null;
            str = location;
            pictureInfo = str;
        }
        addImage(jpegImageData, false, Util.getFileTitleFromPath(parallelTaskData.getSavePath()), null, System.currentTimeMillis(), null, location, i, i2, null, 0, false, false, true, false, true, str, pictureInfo, -1);
    }

    private void insertSingleTask(ParallelTaskData parallelTaskData) {
        Object obj;
        int i;
        int i2;
        int i3;
        ParallelTaskDataParameter parallelTaskDataParameter;
        Throwable th;
        ParallelTaskData parallelTaskData2 = parallelTaskData;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        int filterId = dataParameter.getFilterId();
        if (EffectController.getInstance().hasEffect() || filterId != FilterInfo.FILTER_ID_NONE) {
            obj = 1;
        } else {
            obj = null;
        }
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(dataParameter.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (obj != null) {
            Object obj2 = this.mEffectProcessorLock;
            synchronized (obj2) {
                Object obj3;
                try {
                    if (this.mEffectProcessor != null) {
                        obj3 = obj2;
                        i3 = orientation;
                        parallelTaskDataParameter = dataParameter;
                        DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, dataParameter.getPreviewSize().getWidth(), dataParameter.getPreviewSize().getHeight(), filterId, parallelTaskData.isNeedThumbnail(), i, i2, dataParameter.getLocation(), stringBuilder2, dataParameter.getShootOrientation(), orientation, dataParameter.getShootRotation(), dataParameter.getAlgorithmName(), true, dataParameter.getTimeWaterMarkString(), dataParameter.getFaceWaterMarkList(), false, dataParameter.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), parallelTaskData.getPreviewThumbnailHash());
                        this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                        jpegImageData = drawJPEGAttribute.mData;
                        i = drawJPEGAttribute.mWidth;
                        i2 = drawJPEGAttribute.mHeight;
                    } else {
                        obj3 = obj2;
                        i3 = orientation;
                        parallelTaskDataParameter = dataParameter;
                        Log.d(TAG, "insertSingleTask(): mEffectProcessor is null");
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }
        i3 = orientation;
        parallelTaskDataParameter = dataParameter;
        int i4 = i;
        int i5 = i2;
        if (parallelTaskData.getParallelType() == -2 || parallelTaskData.getParallelType() == -3) {
            ParallelTaskData parallelTaskData3 = parallelTaskData;
            parallelTaskData3.refillJpegData(jpegImageData);
            storeJpegData(parallelTaskData3, i4, i3);
            return;
        }
        ParallelTaskDataParameter parallelTaskDataParameter2 = parallelTaskDataParameter;
        addImage(jpegImageData, parallelTaskData.isNeedThumbnail(), stringBuilder2, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i4, i5, null, i3, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), parallelTaskData.getPreviewThumbnailHash());
    }

    private void insertLiveShotTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        String str;
        ParallelTaskDataParameter parallelTaskDataParameter;
        Throwable th;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        boolean hasEffect = EffectController.getInstance().hasEffect();
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] microVideoData = parallelTaskData.getMicroVideoData();
        long coverFrameTimestamp = parallelTaskData.getCoverFrameTimestamp();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(dataParameter.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (Util.createGooglePhotosCompatibleLiveShot()) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("MV");
            stringBuilder3.append(stringBuilder2);
            stringBuilder2 = stringBuilder3.toString();
        }
        String str2 = stringBuilder2;
        if (hasEffect) {
            Object obj = this.mEffectProcessorLock;
            synchronized (obj) {
                Object obj2;
                try {
                    if (this.mEffectProcessor != null) {
                        obj2 = obj;
                        str = str2;
                        parallelTaskDataParameter = dataParameter;
                        DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, dataParameter.getPreviewSize().getWidth(), dataParameter.getPreviewSize().getHeight(), parallelTaskData.isNeedThumbnail(), i, i2, dataParameter.getLocation(), str2, dataParameter.getShootOrientation(), orientation, dataParameter.getShootRotation(), dataParameter.getAlgorithmName(), true, dataParameter.getTimeWaterMarkString(), dataParameter.getFaceWaterMarkList(), false, dataParameter.getPictureInfo(), parallelTaskData.getCurrentModuleIndex());
                        this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                        jpegImageData = drawJPEGAttribute.mData;
                        i = drawJPEGAttribute.mWidth;
                        i2 = drawJPEGAttribute.mHeight;
                    } else {
                        obj2 = obj;
                        str = str2;
                        parallelTaskDataParameter = dataParameter;
                        Log.d(TAG, "insertLiveShotTask(): mEffectProcessor is null");
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }
        str = str2;
        parallelTaskDataParameter = dataParameter;
        int i3 = i;
        int i4 = i2;
        if (parallelTaskData.getParallelType() == 1) {
            ParallelTaskDataParameter parallelTaskDataParameter2 = parallelTaskDataParameter;
            byte[] composeLiveShotPicture = Util.composeLiveShotPicture(jpegImageData, width, height, microVideoData, coverFrameTimestamp, parallelTaskDataParameter2.isHasDualWaterMark(), parallelTaskDataParameter2.getTimeWaterMarkString());
            if (composeLiveShotPicture == null || jpegImageData == null || composeLiveShotPicture.length < jpegImageData.length) {
                String str3 = TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("Failed to save LiveShot photo: ");
                stringBuilder4.append(str);
                Log.e(str3, stringBuilder4.toString());
                return;
            }
            addImage(composeLiveShotPicture, parallelTaskData.isNeedThumbnail(), str, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i3, i4, null, orientation, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), -1);
            return;
        }
        throw new IllegalStateException("Only supported LiveShot capture processing");
    }

    private void insertNormalDualTask(ParallelTaskData parallelTaskData) {
        Object obj;
        int i;
        int i2;
        ParallelTaskDataParameter parallelTaskDataParameter;
        Throwable th;
        ParallelTaskDataParameter parallelTaskDataParameter2;
        boolean isDepthMapData = ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] portraitRawData = parallelTaskData.getPortraitRawData();
        byte[] portraitDepthData = parallelTaskData.getPortraitDepthData();
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        int filterId = dataParameter.getFilterId();
        if (EffectController.getInstance().hasEffect() || filterId != FilterInfo.FILTER_ID_NONE) {
            obj = 1;
        } else {
            obj = null;
        }
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(dataParameter.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (obj != null) {
            Object obj2 = this.mEffectProcessorLock;
            synchronized (obj2) {
                Object obj3;
                try {
                    if (this.mEffectProcessor != null) {
                        byte[] bArr;
                        byte[] bArr2;
                        obj3 = obj2;
                        int i3 = filterId;
                        ParallelTaskDataParameter parallelTaskDataParameter3 = dataParameter;
                        DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, dataParameter.getPreviewSize().getWidth(), dataParameter.getPreviewSize().getHeight(), filterId, parallelTaskData.isNeedThumbnail(), i, i2, dataParameter.getLocation(), stringBuilder2, dataParameter.getShootOrientation(), orientation, dataParameter.getShootRotation(), dataParameter.getAlgorithmName(), true, dataParameter.getTimeWaterMarkString(), dataParameter.getFaceWaterMarkList(), false, dataParameter.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), -1);
                        this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                        byte[] bArr3 = drawJPEGAttribute.mData;
                        if (isDepthMapData) {
                            ParallelTaskDataParameter parallelTaskDataParameter4 = parallelTaskDataParameter3;
                            parallelTaskDataParameter = parallelTaskDataParameter4;
                            bArr = bArr3;
                            drawJPEGAttribute = getDrawJPEGAttribute(portraitRawData, parallelTaskDataParameter4.getPreviewSize().getWidth(), parallelTaskDataParameter4.getPreviewSize().getHeight(), i3, parallelTaskData.isNeedThumbnail(), i, i2, parallelTaskDataParameter4.getLocation(), stringBuilder2, parallelTaskDataParameter4.getShootOrientation(), orientation, parallelTaskDataParameter4.getShootRotation(), parallelTaskDataParameter4.getAlgorithmName(), false, parallelTaskDataParameter4.getTimeWaterMarkString(), parallelTaskDataParameter4.getFaceWaterMarkList(), true, parallelTaskDataParameter4.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), -1);
                            this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                            bArr2 = drawJPEGAttribute.mData;
                        } else {
                            bArr = bArr3;
                            parallelTaskDataParameter = parallelTaskDataParameter3;
                            bArr2 = portraitRawData;
                        }
                        portraitRawData = bArr2;
                        jpegImageData = bArr;
                    } else {
                        obj3 = obj2;
                        parallelTaskDataParameter = dataParameter;
                        Log.d(TAG, "insertNormalDualTask(): mEffectProcessor is null");
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }
        parallelTaskDataParameter = dataParameter;
        byte[] bArr4 = jpegImageData;
        byte[] bArr5 = portraitRawData;
        if (isDepthMapData) {
            parallelTaskDataParameter2 = parallelTaskDataParameter;
            jpegImageData = Util.composeDepthMapPicture(bArr4, portraitDepthData, bArr5, parallelTaskDataParameter2.isHasDualWaterMark(), parallelTaskDataParameter2.getLightingPattern(), parallelTaskDataParameter2.getTimeWaterMarkString(), parallelTaskDataParameter2.getOutputSize().getWidth(), parallelTaskDataParameter2.getOutputSize().getHeight(), parallelTaskDataParameter2.isMirror(), parallelTaskDataParameter2.isBokehFrontCamera(), parallelTaskDataParameter2.getPictureInfo());
        } else {
            parallelTaskDataParameter2 = parallelTaskDataParameter;
            jpegImageData = bArr4;
        }
        addImage(jpegImageData, parallelTaskData.isNeedThumbnail(), stringBuilder2, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i, i2, null, orientation, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), -1);
    }

    private void insertParallelDualTask(ParallelTaskData parallelTaskData) {
        byte[] composeDepthMapPicture;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addParallel: path=");
        stringBuilder.append(parallelTaskData.getSavePath());
        Log.d(str, stringBuilder.toString());
        if ((6 == parallelTaskData.getParallelType() || 8 == parallelTaskData.getParallelType() || 7 == parallelTaskData.getParallelType()) && ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData())) {
            composeDepthMapPicture = Util.composeDepthMapPicture(parallelTaskData.getJpegImageData(), parallelTaskData.getPortraitDepthData(), parallelTaskData.getPortraitRawData(), dataParameter.isHasDualWaterMark(), dataParameter.getLightingPattern(), dataParameter.getTimeWaterMarkString(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), dataParameter.isMirror(), dataParameter.isBokehFrontCamera(), dataParameter.getPictureInfo());
        } else {
            composeDepthMapPicture = parallelTaskData.getJpegImageData();
        }
        addSaveRequest(new ParallelSaveRequest(composeDepthMapPicture, parallelTaskData.getTimestamp(), dataParameter.getLocation(), dataParameter.getJpegRotation(), parallelTaskData.getSavePath(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), parallelTaskData.isNeedThumbnail(), dataParameter.getAlgorithmName(), dataParameter.getPictureInfo()));
    }

    private void insertParallelBurstTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("insertParallelBurstTask: path=");
        stringBuilder.append(parallelTaskData.getSavePath());
        Log.d(str, stringBuilder.toString());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        int jpegRotation = dataParameter.getJpegRotation();
        Log.d(TAG, String.format(Locale.ENGLISH, "insertParallelBurstTask: %d x %d, %d : %d", new Object[]{Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(jpegRotation), Integer.valueOf(orientation)}));
        if ((jpegRotation + orientation) % 180 == 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("insertParallelBurstTask: result = ");
        stringBuilder.append(i);
        stringBuilder.append("x");
        stringBuilder.append(i2);
        Log.d(str, stringBuilder.toString());
        String fileTitleFromPath = Util.getFileTitleFromPath(parallelTaskData.getSavePath());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("insertParallelBurstTask: ");
        stringBuilder.append(fileTitleFromPath);
        Log.d(str, stringBuilder.toString());
        addImage(jpegImageData, parallelTaskData.isNeedThumbnail(), fileTitleFromPath, null, System.currentTimeMillis(), null, dataParameter.getLocation(), i, i2, null, orientation, false, false, parallelTaskData.isNeedThumbnail(), false, true, dataParameter.getAlgorithmName(), dataParameter.getPictureInfo(), -1);
    }

    public void updateImage(String str, String str2) {
        SaveRequest imageSaveRequest = new ImageSaveRequest();
        imageSaveRequest.title = str;
        imageSaveRequest.oldTitle = str2;
        addSaveRequest(imageSaveRequest);
    }

    public int getBurstDelay() {
        return this.mMemoryManager.getBurstDelay();
    }

    public boolean isNeedStopCapture() {
        return this.mMemoryManager.isNeedStopCapture();
    }

    public synchronized boolean isSaveQueueFull() {
        boolean isSaveQueueFull;
        isSaveQueueFull = this.mMemoryManager.isSaveQueueFull();
        this.mIsBusy |= isSaveQueueFull;
        return isSaveQueueFull;
    }

    public boolean isNeedSlowDown() {
        return this.mMemoryManager.isNeedSlowDown();
    }

    public float getSuitableBurstShotSpeed() {
        return 0.66f;
    }

    public synchronized void addUsedMemory(int i) {
        this.mMemoryManager.addUsedMemory(i);
    }

    public synchronized void reduceUsedMemory(int i) {
        this.mMemoryManager.reduceUsedMemory(i);
    }

    private void addSaveRequest(SaveRequest saveRequest) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addSaveRequest: host is being destroyed.");
            }
            if (isSaveQueueFull()) {
                this.mIsBusy = true;
            }
            addUsedMemory(saveRequest.getSize());
            saveRequest.setContextAndCallback(this.mContext, this);
            try {
                CAMERA_SAVER_EXECUTOR.execute(saveRequest);
            } catch (RejectedExecutionException e) {
                this.mIsBusy = true;
                Log.w(TAG, "stop snapshot due to thread pool is full");
            }
        }
    }

    public void addVideo(String str, ContentValues contentValues, boolean z) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addVideo: host is being destroyed.");
            }
            addSaveRequest(new VideoSaveRequest(str, contentValues, z));
        }
    }

    public Uri addVideoSync(String str, ContentValues contentValues, boolean z) {
        Uri uri;
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addVideo: host is being destroyed.");
            }
            VideoSaveRequest videoSaveRequest = new VideoSaveRequest(str, contentValues, z);
            videoSaveRequest.setContextAndCallback(this.mContext, this);
            videoSaveRequest.save();
            uri = videoSaveRequest.mUri;
        }
        return uri;
    }

    public boolean isBusy() {
        return this.mIsBusy;
    }

    public void onHostResume(boolean z) {
        synchronized (this) {
            this.mIsCaptureIntent = z;
            this.mHostState = 0;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onHostResume: isCapture=");
            stringBuilder.append(this.mIsCaptureIntent);
            Log.v(str, stringBuilder.toString());
        }
    }

    public void onHostPause() {
        synchronized (this) {
            this.mHostState = 1;
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v(TAG, "onHostPause");
    }

    public void onModuleDestroy() {
        releaseEffectProcessor();
    }

    private void releaseEffectProcessor() {
        synchronized (this.mEffectProcessorLock) {
            if (!(this.mEffectProcessor == null || ModuleManager.isCapture() || ModuleManager.isPortraitModule())) {
                this.mEffectProcessor.releaseIfNeeded();
                this.mEffectProcessor = null;
            }
        }
    }

    public void onHostDestroy() {
        synchronized (this) {
            this.mHostState = 2;
            releaseResourcesIfQueueEmpty();
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v(TAG, "onHostDestroy");
    }

    private void releaseResourcesIfQueueEmpty() {
        releaseEffectProcessor();
        if (this.mHostState == 2 && mSaveRequestQueue.size() <= 0 && !this.mPendingSave) {
            synchronized (this.mEffectProcessorLock) {
                if (this.mEffectProcessor != null) {
                    this.mEffectProcessor.releaseIfNeeded();
                    this.mEffectProcessor = null;
                }
            }
            this.mStoredTaskData = null;
        }
    }

    private void updateThumbnail(boolean z) {
        Thumbnail thumbnail;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateThumbnail needAnimation:");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacks(this.mUpdateThumbnail);
            thumbnail = this.mPendingThumbnail;
            this.mPendingThumbnail = null;
        }
        if (thumbnail != null) {
            this.mActivity.getThumbnailUpdater().setThumbnail(thumbnail, true, z);
            if (this.mActivity.isActivityPaused()) {
                this.mActivity.getThumbnailUpdater().saveThumbnailToFile();
            }
        }
    }

    public boolean needThumbnail(boolean z) {
        synchronized (this) {
            if (z) {
                if (isLastImageForThumbnail() && !this.mIsCaptureIntent) {
                    z = true;
                }
            }
            z = false;
        }
        return z;
    }

    public void postUpdateThumbnail(Thumbnail thumbnail, boolean z) {
        synchronized (this.mUpdateThumbnailLock) {
            Log.d(TAG, "postUpdateThumbnail");
            this.mPendingThumbnail = thumbnail;
            this.mUpdateThumbnail.setNeedAnimation(z);
            this.mHandler.post(this.mUpdateThumbnail);
        }
    }

    public void updatePreviewThumbnailUri(int i, Uri uri) {
        synchronized (this.mUpdateThumbnailLock) {
            Thumbnail thumbnail = this.mActivity.getThumbnailUpdater().getThumbnail();
            if (thumbnail != null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("previewThumbnailHash:");
                stringBuilder.append(i);
                stringBuilder.append(" current thumbnail hash:");
                stringBuilder.append(thumbnail.hashCode());
                Log.d(str, stringBuilder.toString());
                if (i <= 0 || thumbnail.hashCode() == i) {
                    thumbnail.setUri(uri);
                }
            }
        }
    }

    public void postHideThumbnailProgressing() {
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                    if (actionProcessing != null) {
                        actionProcessing.updateLoading(true);
                    }
                }
            });
        }
    }

    public void onSaveFinish(int i) {
        synchronized (this) {
            reduceUsedMemory(i);
            if (!isSaveQueueFull() && mSaveRequestQueue.size() < 40) {
                this.mIsBusy = false;
            }
            releaseResourcesIfQueueEmpty();
        }
    }

    public void notifyNewMediaData(Uri uri, String str, int i) {
        if (!this.mIsCaptureIntent) {
            synchronized (this) {
                if (i == 21) {
                    this.mContext.sendBroadcast(new Intent("android.hardware.action.NEW_VIDEO", uri));
                    this.mActivity.onNewUriArrived(uri, str);
                } else if (i == 31) {
                    Util.broadcastNewPicture(this.mContext, uri);
                    this.mLastImageUri = uri;
                    this.mActivity.onNewUriArrived(uri, str);
                }
            }
        }
    }

    private boolean isLastImageForThumbnail() {
        return true;
    }

    public void onParallelProcessFinish(ParallelTaskData parallelTaskData) {
        this.mPendingSave = true;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("algo finish: path: ");
        stringBuilder.append(parallelTaskData.getSavePath());
        stringBuilder.append(" type:");
        stringBuilder.append(parallelTaskData.getParallelType());
        Log.i(str, stringBuilder.toString());
        synchronized (this.mEffectProcessorLock) {
            if (this.mEffectProcessor == null) {
                this.mEffectProcessor = new SnapshotEffectRender(this.mActivity, this.mIsCaptureIntent);
                this.mEffectProcessor.setImageSaver(this);
                this.mEffectProcessor.setQuality(JpegEncodingQualityMappings.getQualityNumber(CameraSettings.getJpegQuality(false)));
            }
        }
        switch (parallelTaskData.getParallelType()) {
            case -3:
            case -2:
            case 0:
                insertSingleTask(parallelTaskData);
                break;
            case -1:
                insertPreviewShotTask(parallelTaskData);
                break;
            case 1:
                insertLiveShotTask(parallelTaskData);
                break;
            case 2:
                insertNormalDualTask(parallelTaskData);
                break;
            case 5:
            case 6:
            case 7:
            case 8:
                insertParallelDualTask(parallelTaskData);
                break;
            case 9:
                insertParallelBurstTask(parallelTaskData);
                break;
            default:
                throw new RuntimeException("need fill logic");
        }
        this.mPendingSave = false;
    }

    private DrawJPEGAttribute getDrawJPEGAttribute(byte[] bArr, int i, int i2, boolean z, int i3, int i4, Location location, String str, int i5, int i6, float f, String str2, boolean z2, String str3, List<WaterMarkData> list, boolean z3, PictureInfo pictureInfo, int i7) {
        return getDrawJPEGAttribute(bArr, i, i2, EffectController.getInstance().getEffectForSaving(false), z, i3, i4, location, str, i5, i6, f, str2, z2, str3, list, z3, pictureInfo, i7, -1);
    }

    private DrawJPEGAttribute getDrawJPEGAttribute(byte[] bArr, int i, int i2, int i3, boolean z, int i4, int i5, Location location, String str, int i6, int i7, float f, String str2, boolean z2, String str3, List<WaterMarkData> list, boolean z3, PictureInfo pictureInfo, int i8, int i9) {
        Location location2;
        int i10 = i4;
        int i11 = i5;
        Location location3 = location;
        int max = i10 > i11 ? Math.max(i, i2) : Math.min(i, i2);
        int max2 = i11 > i10 ? Math.max(i, i2) : Math.min(i, i2);
        EffectRectAttribute copyEffectRectAttribute = EffectController.getInstance().copyEffectRectAttribute();
        if (location3 == null) {
            location2 = null;
        } else {
            location2 = new Location(location3);
        }
        return new DrawJPEGAttribute(bArr, z, max, max2, i10, i11, i3, copyEffectRectAttribute, location2, str, System.currentTimeMillis(), i6, i7, f, pictureInfo.isFrontMirror(), str2, z2, pictureInfo, list, CameraSettings.isDualCameraWaterMarkOpen(), CameraSettings.isTimeWaterMarkOpen() ? str3 : null, z3, i8, i9);
    }
}
