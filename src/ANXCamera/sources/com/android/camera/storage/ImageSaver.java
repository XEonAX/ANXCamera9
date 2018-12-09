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
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.watermark.WaterMarkData;
import com.android.camera2.ArcsoftDepthMap;
import com.android.gallery3d.exif.ExifInterface;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.PictureInfo;
import java.util.List;
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
    private static final String TAG = "ImageSaver";
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
    private Handler mHandler;
    private int mHostState;
    private volatile boolean mIsBusy;
    private boolean mIsCaptureIntent;
    private Uri mLastImageUri;
    private MemoryManager mMemoryManager;
    private Thumbnail mPendingThumbnail;
    private ParallelTaskData mStoredTaskData;
    private ThumbnailUpdater mUpdateThumbnail = new ThumbnailUpdater();
    private Object mUpdateThumbnailLock = new Object();

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

    public void addImage(byte[] bArr, boolean z, String str, String str2, long j, Uri uri, Location location, int i, int i2, ExifInterface exifInterface, int i3, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str3, PictureInfo pictureInfo) {
        Uri uri2;
        String str4 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isParallelProcess: ");
        boolean z7 = z6;
        stringBuilder.append(z7);
        stringBuilder.append(" uri=");
        stringBuilder.append(uri == null ? TEDefine.FACE_BEAUTY_NULL : uri);
        stringBuilder.append(" algo=");
        stringBuilder.append(str3);
        Log.e(str4, stringBuilder.toString());
        if (str2 == null || uri != null) {
            uri2 = uri;
        } else {
            uri2 = this.mLastImageUri;
        }
        Object obj = bArr;
        PerformanceTracker.trackImageSaver(obj, 0);
        addSaveRequest(new ImageSaveRequest(obj, z, str, str2, j, uri2, location, i, i2, exifInterface, i3, z2, z3, z4, z5, z7, str3, pictureInfo));
    }

    private void storeJpegData(ParallelTaskData parallelTaskData, int i, int i2) {
        this.mStoredTaskData = parallelTaskData;
        int shootOrientation = 360 - parallelTaskData.getShootOrientation();
        Bitmap createBitmap = Thumbnail.createBitmap(parallelTaskData.getJpegImageData(), (i2 + shootOrientation) + Util.getDisplayRotation(this.mActivity), false, Integer.highestOneBit((int) Math.floor(((double) i) / ((double) parallelTaskData.getPreviewWidth()))));
        if (createBitmap != null) {
            this.mActivity.getCameraScreenNail().renderBitmapToCanvas(createBitmap);
        }
    }

    public void saveStoredData() {
        int i;
        int i2;
        ParallelTaskData parallelTaskData = this.mStoredTaskData;
        String createJpegName = Util.createJpegName(System.currentTimeMillis());
        int pictureWidth = parallelTaskData.getPictureWidth();
        int pictureHeight = parallelTaskData.getPictureHeight();
        int orientation = Exif.getOrientation(this.mStoredTaskData.getJpegImageData());
        if ((parallelTaskData.getJpegRotation() + orientation) % 180 == 0) {
            i = pictureWidth;
            i2 = pictureHeight;
        } else {
            i2 = pictureWidth;
            i = pictureHeight;
        }
        addImage(this.mStoredTaskData.getJpegImageData(), parallelTaskData.isNeedCrateThumbnail(), createJpegName, null, System.currentTimeMillis(), null, parallelTaskData.getLocation(), i, i2, null, orientation, false, false, true, false, false, parallelTaskData.getAlgorithmName(), parallelTaskData.getPictureInfo());
    }

    public byte[] getStoredJpegData() {
        return this.mStoredTaskData.getJpegImageData();
    }

    private void insertPreviewShotTask(ParallelTaskData parallelTaskData) {
        addImage(parallelTaskData.getJpegImageData(), false, Util.getFileTitleFromPath(parallelTaskData.getSavePath()), null, System.currentTimeMillis(), null, parallelTaskData.getLocation(), parallelTaskData.getOutputWidth(), parallelTaskData.getOutputHeight(), null, 0, false, false, true, false, true, parallelTaskData.getAlgorithmName(), parallelTaskData.getPictureInfo());
    }

    private void insertSingTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        int i3;
        ImageSaver imageSaver;
        int i4;
        int i5;
        ParallelTaskData parallelTaskData2 = parallelTaskData;
        boolean hasEffect = EffectController.getInstance().hasEffect();
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        int pictureWidth = parallelTaskData.getPictureWidth();
        int pictureHeight = parallelTaskData.getPictureHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((parallelTaskData.getJpegRotation() + orientation) % 180 == 0) {
            i = pictureWidth;
            i2 = pictureHeight;
        } else {
            i2 = pictureWidth;
            i = pictureHeight;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(parallelTaskData.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (hasEffect) {
            i3 = orientation;
            DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, parallelTaskData.getPreviewWidth(), parallelTaskData.getPreviewHeight(), parallelTaskData.isNeedCrateThumbnail(), i, i2, parallelTaskData.getLocation(), stringBuilder2, parallelTaskData.getShootOrientation(), orientation, parallelTaskData.getShootRotation(), parallelTaskData.getAlgorithmName(), true, parallelTaskData.getFaceWaterMarkList(), false, parallelTaskData.getPictureInfo());
            imageSaver = this;
            imageSaver.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
            jpegImageData = drawJPEGAttribute.mData;
            pictureHeight = drawJPEGAttribute.mWidth;
            i4 = drawJPEGAttribute.mHeight;
            i5 = pictureHeight;
        } else {
            i3 = orientation;
            imageSaver = this;
            i5 = i;
            i4 = i2;
        }
        ParallelTaskData parallelTaskData3;
        if (parallelTaskData.getParallelType() == -2) {
            parallelTaskData3 = parallelTaskData;
            parallelTaskData3.refillJpegData(jpegImageData);
            imageSaver.storeJpegData(parallelTaskData3, i5, i3);
            return;
        }
        parallelTaskData3 = parallelTaskData;
        int i6 = i3;
        imageSaver.addImage(jpegImageData, parallelTaskData.isNeedCrateThumbnail(), stringBuilder2, null, System.currentTimeMillis(), null, parallelTaskData.getLocation(), i5, i4, null, i6, false, false, true, false, false, parallelTaskData.getAlgorithmName(), parallelTaskData.getPictureInfo());
    }

    private void insertLiveShotTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        String str;
        ImageSaver imageSaver;
        int i3;
        int i4;
        boolean hasEffect = EffectController.getInstance().hasEffect();
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] microVideoData = parallelTaskData.getMicroVideoData();
        long coverFrameTimestamp = parallelTaskData.getCoverFrameTimestamp();
        int pictureWidth = parallelTaskData.getPictureWidth();
        int pictureHeight = parallelTaskData.getPictureHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((parallelTaskData.getJpegRotation() + orientation) % 180 == 0) {
            i = pictureWidth;
            i2 = pictureHeight;
        } else {
            i2 = pictureWidth;
            i = pictureHeight;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(parallelTaskData.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (Util.createGooglePhotosCompatibleLiveShot()) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("MV");
            stringBuilder3.append(stringBuilder2);
            stringBuilder2 = stringBuilder3.toString();
        }
        String str2 = stringBuilder2;
        if (hasEffect) {
            str = str2;
            DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, parallelTaskData.getPreviewWidth(), parallelTaskData.getPreviewHeight(), parallelTaskData.isNeedCrateThumbnail(), i, i2, parallelTaskData.getLocation(), str2, parallelTaskData.getShootOrientation(), orientation, parallelTaskData.getShootRotation(), parallelTaskData.getAlgorithmName(), true, parallelTaskData.getFaceWaterMarkList(), false, parallelTaskData.getPictureInfo());
            imageSaver = this;
            imageSaver.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
            jpegImageData = drawJPEGAttribute.mData;
            int i5 = drawJPEGAttribute.mWidth;
            i3 = drawJPEGAttribute.mHeight;
            i4 = i5;
        } else {
            str = str2;
            imageSaver = this;
            i4 = i;
            i3 = i2;
        }
        if (parallelTaskData.getParallelType() == 1) {
            byte[] composeLiveShotPicture = Util.composeLiveShotPicture(imageSaver.mContext, jpegImageData, pictureWidth, pictureHeight, microVideoData, coverFrameTimestamp, parallelTaskData.isHasDualWaterMark(), parallelTaskData.getTimeWaterMarkString());
            if (composeLiveShotPicture == null || jpegImageData == null || composeLiveShotPicture.length < jpegImageData.length) {
                String str3 = TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("Failed to save LiveShot photo: ");
                stringBuilder4.append(str);
                Log.e(str3, stringBuilder4.toString());
                return;
            }
            imageSaver.addImage(composeLiveShotPicture, parallelTaskData.isNeedCrateThumbnail(), str, null, System.currentTimeMillis(), null, parallelTaskData.getLocation(), i4, i3, null, orientation, false, false, true, false, false, parallelTaskData.getAlgorithmName(), parallelTaskData.getPictureInfo());
            return;
        }
        throw new IllegalStateException("Only supported LiveShot capture processing");
    }

    private void insertNormalDualTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        ImageSaver imageSaver;
        byte[] bArr;
        byte[] bArr2;
        boolean hasEffect = EffectController.getInstance().hasEffect();
        boolean isDepthMapData = ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] portraitRawData = parallelTaskData.getPortraitRawData();
        byte[] portraitDepthData = parallelTaskData.getPortraitDepthData();
        int pictureWidth = parallelTaskData.getPictureWidth();
        int pictureHeight = parallelTaskData.getPictureHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        if ((parallelTaskData.getJpegRotation() + orientation) % 180 == 0) {
            i = pictureWidth;
            i2 = pictureHeight;
        } else {
            i2 = pictureWidth;
            i = pictureHeight;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
        stringBuilder.append(parallelTaskData.getSuffix());
        String stringBuilder2 = stringBuilder.toString();
        if (hasEffect) {
            byte[] bArr3;
            DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, parallelTaskData.getPreviewWidth(), parallelTaskData.getPreviewHeight(), parallelTaskData.isNeedCrateThumbnail(), i, i2, parallelTaskData.getLocation(), stringBuilder2, parallelTaskData.getShootOrientation(), orientation, parallelTaskData.getShootRotation(), parallelTaskData.getAlgorithmName(), true, parallelTaskData.getFaceWaterMarkList(), false, parallelTaskData.getPictureInfo());
            this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
            byte[] bArr4 = drawJPEGAttribute.mData;
            if (isDepthMapData) {
                bArr3 = bArr4;
                drawJPEGAttribute = getDrawJPEGAttribute(bArr4, parallelTaskData.getPreviewWidth(), parallelTaskData.getPreviewHeight(), parallelTaskData.isNeedCrateThumbnail(), i, i2, parallelTaskData.getLocation(), stringBuilder2, parallelTaskData.getShootOrientation(), orientation, parallelTaskData.getShootRotation(), parallelTaskData.getAlgorithmName(), false, parallelTaskData.getFaceWaterMarkList(), true, parallelTaskData.getPictureInfo());
                imageSaver = this;
                imageSaver.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                bArr = drawJPEGAttribute.mData;
            } else {
                bArr3 = bArr4;
                imageSaver = this;
                bArr = portraitRawData;
            }
            bArr2 = bArr3;
        } else {
            imageSaver = this;
            bArr2 = jpegImageData;
            bArr = portraitRawData;
        }
        if (isDepthMapData) {
            jpegImageData = Util.composeDepthMapPicture(bArr2, portraitDepthData, bArr, parallelTaskData.isHasDualWaterMark(), parallelTaskData.getLightingPattern(), parallelTaskData.getTimeWaterMarkString(), parallelTaskData.getOutputWidth(), parallelTaskData.getOutputHeight(), parallelTaskData.isMirror(), parallelTaskData.isBokehFrontCamera());
        } else {
            jpegImageData = bArr2;
        }
        imageSaver.addImage(jpegImageData, parallelTaskData.isNeedCrateThumbnail(), stringBuilder2, null, System.currentTimeMillis(), null, parallelTaskData.getLocation(), i, i2, null, orientation, false, false, true, false, false, parallelTaskData.getAlgorithmName(), parallelTaskData.getPictureInfo());
    }

    private void insertParallelDualTask(ParallelTaskData parallelTaskData) {
        byte[] composeDepthMapPicture;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addParallel: path=");
        stringBuilder.append(parallelTaskData.getSavePath());
        Log.d(str, stringBuilder.toString());
        reduceUsedMemory(parallelTaskData.getProcessUsedMemorySize());
        if (ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData())) {
            composeDepthMapPicture = Util.composeDepthMapPicture(parallelTaskData.getJpegImageData(), parallelTaskData.getPortraitDepthData(), parallelTaskData.getPortraitRawData(), parallelTaskData.isHasDualWaterMark(), parallelTaskData.getLightingPattern(), parallelTaskData.getTimeWaterMarkString(), parallelTaskData.getOutputWidth(), parallelTaskData.getOutputHeight(), parallelTaskData.isMirror(), parallelTaskData.isBokehFrontCamera());
        } else {
            composeDepthMapPicture = parallelTaskData.getJpegImageData();
        }
        addSaveRequest(new ParallelSaveRequest(composeDepthMapPicture, parallelTaskData.getTimeStamp(), parallelTaskData.getLocation(), parallelTaskData.getJpegRotation(), parallelTaskData.getSavePath(), parallelTaskData.getOutputWidth(), parallelTaskData.getOutputHeight()));
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
                return;
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
                return;
            }
            addSaveRequest(new VideoSaveRequest(str, contentValues, z));
        }
    }

    public Uri addVideoSync(String str, ContentValues contentValues, boolean z) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addVideo: host is being destroyed.");
                return null;
            }
            VideoSaveRequest videoSaveRequest = new VideoSaveRequest(str, contentValues, z);
            videoSaveRequest.setContextAndCallback(this.mContext, this);
            videoSaveRequest.save();
            Uri uri = videoSaveRequest.mUri;
            return uri;
        }
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
        if (this.mHostState == 2 && mSaveRequestQueue.size() <= 0) {
            if (this.mEffectProcessor != null) {
                this.mEffectProcessor.releaseIfNeeded();
                this.mEffectProcessor = null;
            }
            this.mStoredTaskData = null;
        }
    }

    private void updateThumbnail(boolean z) {
        Thumbnail thumbnail;
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
            this.mPendingThumbnail = thumbnail;
            this.mUpdateThumbnail.setNeedAnimation(z);
            this.mHandler.post(this.mUpdateThumbnail);
        }
    }

    public void updatePreviewThumbnailUri(Uri uri) {
        synchronized (this.mUpdateThumbnailLock) {
            this.mActivity.getThumbnailUpdater().updatePreviewThumbnailUri(uri);
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

    public void notifyNewImage(Uri uri, boolean z) {
        synchronized (this) {
            if (!this.mIsCaptureIntent) {
                Util.broadcastNewPicture(this.mContext, uri);
                this.mLastImageUri = uri;
                if (z) {
                    this.mActivity.addSecureUri(uri);
                }
            }
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

    public void notifyNewVideo(Uri uri) {
        if (!this.mIsCaptureIntent) {
            this.mContext.sendBroadcast(new Intent("android.hardware.action.NEW_VIDEO", uri));
            this.mActivity.addSecureUri(uri);
        }
    }

    private boolean isLastImageForThumbnail() {
        return true;
    }

    public void onParallelProcessFinish(ParallelTaskData parallelTaskData) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(parallelTaskData.getTimeStamp());
        stringBuilder.append("");
        Log.i("algo finish", stringBuilder.toString());
        if (this.mEffectProcessor == null) {
            this.mEffectProcessor = new SnapshotEffectRender(this.mActivity, this.mIsCaptureIntent);
            this.mEffectProcessor.setImageSaver(this);
            this.mEffectProcessor.setQuality(JpegEncodingQualityMappings.getQualityNumber(CameraSettings.getJpegQuality(false)));
        }
        int parallelType = parallelTaskData.getParallelType();
        if (parallelType != 6) {
            switch (parallelType) {
                case -2:
                case 0:
                    insertSingTask(parallelTaskData);
                    return;
                case -1:
                    insertPreviewShotTask(parallelTaskData);
                    return;
                case 1:
                    insertLiveShotTask(parallelTaskData);
                    return;
                case 2:
                    insertNormalDualTask(parallelTaskData);
                    return;
                default:
                    throw new RuntimeException("need fill logic");
            }
        }
        insertParallelDualTask(parallelTaskData);
    }

    private DrawJPEGAttribute getDrawJPEGAttribute(byte[] bArr, int i, int i2, boolean z, int i3, int i4, Location location, String str, int i5, int i6, float f, String str2, boolean z2, List<WaterMarkData> list, boolean z3, PictureInfo pictureInfo) {
        int max;
        Location location2;
        int i7 = i3;
        int i8 = i4;
        Location location3 = location;
        if (i7 > i8) {
            max = Math.max(i, i2);
        } else {
            max = Math.min(i, i2);
        }
        int i9 = max;
        if (i8 > i7) {
            max = Math.max(i, i2);
        } else {
            max = Math.min(i, i2);
        }
        int i10 = max;
        int effectForSaving = EffectController.getInstance().getEffectForSaving(false);
        EffectRectAttribute copyEffectRectAttribute = EffectController.getInstance().copyEffectRectAttribute();
        if (location3 == null) {
            location2 = null;
        } else {
            location2 = new Location(location3);
        }
        return new DrawJPEGAttribute(bArr, z, i9, i10, i7, i8, effectForSaving, copyEffectRectAttribute, location2, str, System.currentTimeMillis(), i5, i6, f, pictureInfo.isFrontMirror(), str2, z2, pictureInfo, list, CameraSettings.isDualCameraWaterMarkOpen(), CameraSettings.isTimeWaterMarkOpen() ? Util.getTimeWatermark() : null, z3);
    }
}
