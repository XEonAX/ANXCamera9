package com.ss.android.ttve.utils;

import android.app.Activity;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.hardware.Camera.Area;
import android.hardware.Camera.AutoFocusCallback;
import android.hardware.Camera.CameraInfo;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.Size;
import android.os.Build;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.Keep;
import android.text.TextUtils;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.ss.android.medialib.Result.Error;
import com.ss.android.ttve.common.TELogUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Keep
public class CameraInstance {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String ASSERT_MSG = "检测到CameraDevice 为 null! 请检查";
    public static final int DEFAULT_PREVIEW_RATE = 30;
    public static final String TAG = "CameraInstance";
    private static CameraInstance mThisInstance;
    private Comparator<Size> comparatorBigger = new Comparator<Size>() {
        public int compare(Size size, Size size2) {
            int i = size2.width - size.width;
            if (i == 0) {
                return size2.height - size.height;
            }
            return i;
        }
    };
    private Comparator<Size> comparatorSmaller = new Comparator<Size>() {
        public int compare(Size size, Size size2) {
            int i = size.width - size2.width;
            if (i == 0) {
                return size.height - size2.height;
            }
            return i;
        }
    };
    private Camera mCameraDevice;
    private int mDefaultCameraID = -1;
    private int mFacing = 0;
    private boolean mIsPreviewing = false;
    private Parameters mParams;
    private int mPictureHeight = Util.LIMIT_SURFACE_WIDTH;
    private int mPictureWidth = 1280;
    private int mPreferPreviewHeight = Util.LIMIT_SURFACE_WIDTH;
    private int mPreferPreviewWidth = 1280;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private int mRotation;

    public interface CameraOpenCallback {
        void cameraReady();
    }

    public static synchronized CameraInstance getInstance() {
        CameraInstance cameraInstance;
        synchronized (CameraInstance.class) {
            if (mThisInstance == null) {
                mThisInstance = new CameraInstance();
            }
            cameraInstance = mThisInstance;
        }
        return cameraInstance;
    }

    public boolean isPreviewing() {
        return this.mIsPreviewing;
    }

    public int previewWidth() {
        return this.mPreviewWidth;
    }

    public int previewHeight() {
        return this.mPreviewHeight;
    }

    public int pictureWidth() {
        return this.mPictureWidth;
    }

    public int pictureHeight() {
        return this.mPictureHeight;
    }

    public void setPreferPreviewSize(int i, int i2) {
        this.mPreferPreviewHeight = i;
        this.mPreferPreviewWidth = i2;
    }

    public boolean tryOpenCamera(CameraOpenCallback cameraOpenCallback) {
        return tryOpenCamera(cameraOpenCallback, 0);
    }

    public int getCameraFacing() {
        return this.mFacing;
    }

    public boolean isUsingFrontCamera() {
        return this.mFacing == 1;
    }

    public int getRotation() {
        return this.mRotation;
    }

    private void setCameraDisplayOrientation(Activity activity) {
        int i = 0;
        switch (activity.getWindowManager().getDefaultDisplay().getRotation()) {
            case 1:
                i = 90;
                break;
            case 2:
                i = 180;
                break;
            case 3:
                i = 270;
                break;
        }
        this.mRotation = setOrientationDegrees(i);
    }

    public int setOrientationDegrees(int i) {
        CameraInfo cameraInfo = new CameraInfo();
        Camera.getCameraInfo(this.mDefaultCameraID, cameraInfo);
        if (cameraInfo.facing == 1) {
            i = ((360 - ((cameraInfo.orientation + i) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT)) + 180) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        } else {
            i = ((cameraInfo.orientation - i) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        try {
            this.mCameraDevice.setDisplayOrientation(i);
        } catch (Exception e) {
        }
        return i;
    }

    /* JADX WARNING: Missing block: B:33:0x0082, code:
            return true;
     */
    public synchronized boolean tryOpenCamera(com.ss.android.ttve.utils.CameraInstance.CameraOpenCallback r7, int r8) {
        /*
        r6 = this;
        monitor-enter(r6);
        r0 = "CameraInstance";
        r1 = "try open camera...";
        com.ss.android.ttve.common.TELogUtil.i(r0, r1);	 Catch:{ all -> 0x009e }
        r0 = 0;
        r1 = 0;
        r2 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x008f }
        r3 = 8;
        if (r2 <= r3) goto L_0x002a;
    L_0x0010:
        r2 = android.hardware.Camera.getNumberOfCameras();	 Catch:{ Exception -> 0x008f }
        r3 = new android.hardware.Camera$CameraInfo;	 Catch:{ Exception -> 0x008f }
        r3.<init>();	 Catch:{ Exception -> 0x008f }
        r4 = r1;
    L_0x001a:
        if (r4 >= r2) goto L_0x002a;
    L_0x001c:
        android.hardware.Camera.getCameraInfo(r4, r3);	 Catch:{ Exception -> 0x008f }
        r5 = r3.facing;	 Catch:{ Exception -> 0x008f }
        if (r5 != r8) goto L_0x0027;
    L_0x0023:
        r6.mDefaultCameraID = r4;	 Catch:{ Exception -> 0x008f }
        r6.mFacing = r8;	 Catch:{ Exception -> 0x008f }
    L_0x0027:
        r4 = r4 + 1;
        goto L_0x001a;
    L_0x002a:
        r6.stopPreview();	 Catch:{ Exception -> 0x008f }
        r8 = r6.mCameraDevice;	 Catch:{ Exception -> 0x008f }
        if (r8 == 0) goto L_0x0036;
    L_0x0031:
        r8 = r6.mCameraDevice;	 Catch:{ Exception -> 0x008f }
        r8.release();	 Catch:{ Exception -> 0x008f }
    L_0x0036:
        r8 = r6.mDefaultCameraID;	 Catch:{ Exception -> 0x008f }
        if (r8 < 0) goto L_0x0043;
    L_0x003a:
        r8 = r6.mDefaultCameraID;	 Catch:{ Exception -> 0x008f }
        r8 = android.hardware.Camera.open(r8);	 Catch:{ Exception -> 0x008f }
        r6.mCameraDevice = r8;	 Catch:{ Exception -> 0x008f }
        goto L_0x004b;
    L_0x0043:
        r8 = android.hardware.Camera.open();	 Catch:{ Exception -> 0x008f }
        r6.mCameraDevice = r8;	 Catch:{ Exception -> 0x008f }
        r6.mFacing = r1;	 Catch:{ Exception -> 0x008f }
    L_0x004b:
        r8 = r6.setOrientationDegrees(r1);	 Catch:{ Exception -> 0x008f }
        r6.mRotation = r8;	 Catch:{ Exception -> 0x008f }
        r8 = "CameraInstance";
        r2 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x008f }
        r2.<init>();	 Catch:{ Exception -> 0x008f }
        r3 = "Camera rotation = ";
        r2.append(r3);	 Catch:{ Exception -> 0x008f }
        r3 = r6.mRotation;	 Catch:{ Exception -> 0x008f }
        r2.append(r3);	 Catch:{ Exception -> 0x008f }
        r2 = r2.toString();	 Catch:{ Exception -> 0x008f }
        com.ss.android.ttve.common.TELogUtil.d(r8, r2);	 Catch:{ Exception -> 0x008f }
        r8 = r6.mCameraDevice;	 Catch:{ all -> 0x009e }
        if (r8 == 0) goto L_0x008d;
    L_0x006e:
        r8 = "CameraInstance";
        r2 = "Camera opened!";
        com.ss.android.ttve.common.TELogUtil.i(r8, r2);	 Catch:{ all -> 0x009e }
        r8 = 30;
        r6.initCamera(r8);	 Catch:{ Exception -> 0x0083 }
        if (r7 == 0) goto L_0x0080;
    L_0x007d:
        r7.cameraReady();	 Catch:{ all -> 0x009e }
    L_0x0080:
        monitor-exit(r6);
        r7 = 1;
        return r7;
    L_0x0083:
        r7 = move-exception;
        r7 = r6.mCameraDevice;	 Catch:{ all -> 0x009e }
        r7.release();	 Catch:{ all -> 0x009e }
        r6.mCameraDevice = r0;	 Catch:{ all -> 0x009e }
        monitor-exit(r6);
        return r1;
    L_0x008d:
        monitor-exit(r6);
        return r1;
    L_0x008f:
        r7 = move-exception;
        r8 = "CameraInstance";
        r2 = "Open Camera Failed!";
        com.ss.android.ttve.common.TELogUtil.e(r8, r2);	 Catch:{ all -> 0x009e }
        r7.printStackTrace();	 Catch:{ all -> 0x009e }
        r6.mCameraDevice = r0;	 Catch:{ all -> 0x009e }
        monitor-exit(r6);
        return r1;
    L_0x009e:
        r7 = move-exception;
        monitor-exit(r6);
        throw r7;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ttve.utils.CameraInstance.tryOpenCamera(com.ss.android.ttve.utils.CameraInstance$CameraOpenCallback, int):boolean");
    }

    public synchronized void stopCamera() {
        TELogUtil.i(TAG, "stopCamera...");
        if (this.mCameraDevice != null) {
            this.mIsPreviewing = false;
            this.mCameraDevice.stopPreview();
            try {
                this.mCameraDevice.setPreviewTexture(null);
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.mCameraDevice.release();
            this.mCameraDevice = null;
        }
    }

    public boolean isCameraOpened() {
        return this.mCameraDevice != null;
    }

    public synchronized void startPreview(SurfaceTexture surfaceTexture) {
        TELogUtil.i(TAG, "Camera startPreview...");
        if (this.mIsPreviewing) {
            TELogUtil.w(TAG, "Camera is previewing...");
        } else if (this.mCameraDevice != null) {
            try {
                this.mCameraDevice.setPreviewTexture(surfaceTexture);
                this.mCameraDevice.startPreview();
                this.mIsPreviewing = true;
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("startPreview: Error ");
                stringBuilder.append(e.getMessage());
                TELogUtil.e(str, stringBuilder.toString());
                this.mIsPreviewing = false;
                try {
                    this.mCameraDevice.release();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                this.mCameraDevice = null;
            }
        }
    }

    public synchronized void stopPreview() {
        TELogUtil.d(TAG, "Camera stopPreview...");
        if (this.mIsPreviewing && this.mCameraDevice != null) {
            this.mIsPreviewing = false;
            this.mCameraDevice.stopPreview();
            TELogUtil.i(TAG, "Camera stopped!");
        }
    }

    public synchronized Parameters getParams() {
        if (this.mCameraDevice == null) {
            return null;
        }
        return this.mCameraDevice.getParameters();
    }

    public synchronized void setParams(Parameters parameters) {
        if (this.mCameraDevice != null) {
            this.mParams = parameters;
            this.mCameraDevice.setParameters(this.mParams);
        }
    }

    public Camera getCameraDevice() {
        return this.mCameraDevice;
    }

    public void initCamera(int i) {
        if (this.mCameraDevice == null) {
            TELogUtil.e(TAG, "initCamera: Camera is not opened!");
            return;
        }
        int intValue;
        this.mParams = this.mCameraDevice.getParameters();
        for (Integer intValue2 : this.mParams.getSupportedPictureFormats()) {
            intValue = intValue2.intValue();
            TELogUtil.i(TAG, String.format("Picture Format: %x", new Object[]{Integer.valueOf(intValue)}));
        }
        this.mParams.setPictureFormat(256);
        List<Size> supportedPictureSizes = this.mParams.getSupportedPictureSizes();
        Collections.sort(supportedPictureSizes, this.comparatorBigger);
        Size size = null;
        Size size2 = null;
        for (Size size3 : supportedPictureSizes) {
            if (size2 == null || (size3.width >= this.mPictureWidth && size3.height >= this.mPictureHeight)) {
                size2 = size3;
            }
        }
        supportedPictureSizes = this.mParams.getSupportedPreviewSizes();
        Collections.sort(supportedPictureSizes, this.comparatorBigger);
        for (Size size32 : supportedPictureSizes) {
            TELogUtil.d(TAG, String.format("Supported preview size: %d x %d", new Object[]{Integer.valueOf(size32.width), Integer.valueOf(size32.height)}));
            if (size == null || (size32.width >= this.mPreferPreviewWidth && size32.height >= this.mPreferPreviewHeight)) {
                size = size32;
            }
        }
        List<Integer> supportedPreviewFrameRates = this.mParams.getSupportedPreviewFrameRates();
        this.mParams.setPreviewSize(size.width, size.height);
        this.mParams.setPictureSize(size2.width, size2.height);
        if (this.mParams.getSupportedFocusModes().contains(AutoFocus.LEGACY_CONTINUOUS_VIDEO)) {
            this.mParams.setFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO);
        }
        int i2 = (i * 2) / 3;
        i = (i * 4) / 3;
        int i3 = 30;
        intValue = 0;
        for (Integer num : supportedPreviewFrameRates) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Supported frame rate: ");
            stringBuilder.append(num);
            TELogUtil.v(str, stringBuilder.toString());
            if (intValue < num.intValue()) {
                intValue = num.intValue();
            }
            if (i3 > num.intValue()) {
                i3 = num.intValue();
            }
        }
        int max = Math.max(i3, i2);
        i = Math.min(i, intValue);
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("FpsRange = [");
        stringBuilder2.append(max);
        stringBuilder2.append(", ");
        stringBuilder2.append(i);
        stringBuilder2.append("]");
        TELogUtil.i(str2, stringBuilder2.toString());
        this.mParams.setPreviewFpsRange(max * 1000, i * 1000);
        int[] iArr = new int[2];
        this.mParams.getPreviewFpsRange(iArr);
        String str3 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("FpsRange = [");
        stringBuilder3.append(iArr[0] / 1000);
        stringBuilder3.append(", ");
        stringBuilder3.append(iArr[1] / 1000);
        stringBuilder3.append("]");
        TELogUtil.i(str3, stringBuilder3.toString());
        try {
            this.mCameraDevice.setParameters(this.mParams);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mParams = this.mCameraDevice.getParameters();
        Size pictureSize = this.mParams.getPictureSize();
        Size previewSize = this.mParams.getPreviewSize();
        this.mPreviewWidth = previewSize.width;
        this.mPreviewHeight = previewSize.height;
        this.mPictureWidth = pictureSize.width;
        this.mPictureHeight = pictureSize.height;
        TELogUtil.i(TAG, String.format("Camera Picture Size: %d x %d", new Object[]{Integer.valueOf(pictureSize.width), Integer.valueOf(pictureSize.height)}));
        TELogUtil.i(TAG, String.format("Camera Preview Size: %d x %d", new Object[]{Integer.valueOf(previewSize.width), Integer.valueOf(previewSize.height)}));
    }

    /* JADX WARNING: Missing block: B:11:0x0021, code:
            return;
     */
    public synchronized void setFocusMode(java.lang.String r2) {
        /*
        r1 = this;
        monitor-enter(r1);
        r0 = r1.mCameraDevice;	 Catch:{ all -> 0x0022 }
        if (r0 != 0) goto L_0x0007;
    L_0x0005:
        monitor-exit(r1);
        return;
    L_0x0007:
        r0 = r1.mCameraDevice;	 Catch:{ all -> 0x0022 }
        r0 = r0.getParameters();	 Catch:{ all -> 0x0022 }
        r1.mParams = r0;	 Catch:{ all -> 0x0022 }
        r0 = r1.mParams;	 Catch:{ all -> 0x0022 }
        r0 = r0.getSupportedFocusModes();	 Catch:{ all -> 0x0022 }
        r0 = r0.contains(r2);	 Catch:{ all -> 0x0022 }
        if (r0 == 0) goto L_0x0020;
    L_0x001b:
        r0 = r1.mParams;	 Catch:{ all -> 0x0022 }
        r0.setFocusMode(r2);	 Catch:{ all -> 0x0022 }
    L_0x0020:
        monitor-exit(r1);
        return;
    L_0x0022:
        r2 = move-exception;
        monitor-exit(r1);
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ttve.utils.CameraInstance.setFocusMode(java.lang.String):void");
    }

    public synchronized void setPictureSize(int i, int i2, boolean z) {
        if (this.mCameraDevice == null) {
            this.mPictureWidth = i;
            this.mPictureHeight = i2;
            return;
        }
        this.mParams = this.mCameraDevice.getParameters();
        List<Size> supportedPictureSizes = this.mParams.getSupportedPictureSizes();
        Size size = null;
        if (z) {
            Collections.sort(supportedPictureSizes, this.comparatorBigger);
            for (Size size2 : supportedPictureSizes) {
                if (size == null || (size2.width >= i && size2.height >= i2)) {
                    size = size2;
                }
            }
        } else {
            Collections.sort(supportedPictureSizes, this.comparatorSmaller);
            for (Size size22 : supportedPictureSizes) {
                if (size == null || (size22.width <= i && size22.height <= i2)) {
                    size = size22;
                }
            }
        }
        this.mPictureWidth = size.width;
        this.mPictureHeight = size.height;
        try {
            this.mParams.setPictureSize(this.mPictureWidth, this.mPictureHeight);
            this.mCameraDevice.setParameters(this.mParams);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return;
    }

    public void focusAtPoint(float f, float f2) {
        focusAtPoint(f, f2, 0.08f);
    }

    public synchronized void focusAtPoint(float f, float f2, float f3) {
        if (this.mCameraDevice == null) {
            TELogUtil.e(TAG, "Error: focus after release.");
            return;
        }
        this.mParams = this.mCameraDevice.getParameters();
        if (this.mParams.getMaxNumMeteringAreas() > 0) {
            Rect calculateTapArea = calculateTapArea(f, f2, f3, this.mRotation);
            TELogUtil.d(TAG, String.format("FocusAreas: [%d, %d, %d, %d]", new Object[]{Integer.valueOf(calculateTapArea.left), Integer.valueOf(calculateTapArea.top), Integer.valueOf(calculateTapArea.right), Integer.valueOf(calculateTapArea.bottom)}));
            List arrayList = new ArrayList();
            arrayList.add(new Area(calculateTapArea, 1000));
            try {
                this.mCameraDevice.cancelAutoFocus();
                if (!(TextUtils.equals(Build.BRAND, "Multilaser") || TextUtils.equals(Build.BRAND, "MS40"))) {
                    this.mParams.setFocusAreas(arrayList);
                }
                this.mParams.setMeteringAreas(arrayList);
                this.mParams.setFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO);
                this.mCameraDevice.setParameters(this.mParams);
                this.mCameraDevice.autoFocus(new AutoFocusCallback() {
                    public void onAutoFocus(boolean z, Camera camera) {
                        if (z) {
                            TELogUtil.i(CameraInstance.TAG, "Camera Focus Succeed!");
                            return;
                        }
                        TELogUtil.i(CameraInstance.TAG, "Camera Focus Failed!");
                        try {
                            Parameters parameters = camera.getParameters();
                            parameters.setFocusMode("auto");
                            camera.setParameters(parameters);
                        } catch (Exception e) {
                        }
                    }
                });
            } catch (Exception e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Error: focusAtPoint failed: ");
                stringBuilder.append(e.toString());
                TELogUtil.e(str, stringBuilder.toString());
            }
        } else {
            TELogUtil.i(TAG, "The device does not support metering areas...");
        }
    }

    public Rect calculateTapArea(float f, float f2, float f3, int i) {
        int intValue = Float.valueOf(f3 * 1000.0f).intValue();
        int i2 = ((int) (f2 * 2000.0f)) - 1000;
        int i3 = intValue / 2;
        int clamp = clamp((((int) (f * 2000.0f)) - 1000) - i3, Error.SYN_INIT_FAILED, 1000);
        i2 = clamp(i2 - i3, Error.SYN_INIT_FAILED, 1000);
        RectF rectF = new RectF((float) clamp, (float) i2, (float) clamp(clamp + intValue), (float) clamp(i2 + intValue));
        Rect rect = new Rect(Math.round(rectF.left), Math.round(rectF.top), Math.round(rectF.right), Math.round(rectF.bottom));
        rotateRectForOrientation(i, new Rect(Error.SYN_INIT_FAILED, Error.SYN_INIT_FAILED, 1000, 1000), rect);
        Rect rect2 = new Rect(rect.left - 1000, rect.top - 1000, rect.right - 1000, rect.bottom - 1000);
        rect2.left = clamp(rect2.left);
        rect2.right = clamp(rect2.right);
        rect2.top = clamp(rect2.top);
        rect2.bottom = clamp(rect2.bottom);
        return rect2;
    }

    private static int clamp(int i, int i2, int i3) {
        if (i > i3) {
            return i3;
        }
        if (i < i2) {
            return i2;
        }
        return i;
    }

    private static int clamp(int i) {
        return clamp(i, Error.SYN_INIT_FAILED, 1000);
    }

    private void rotateRectForOrientation(int i, Rect rect, Rect rect2) {
        Matrix matrix = new Matrix();
        matrix.setRotate((float) (-i));
        RectF rectF = new RectF(rect);
        RectF rectF2 = new RectF(rect2);
        matrix.mapRect(rectF);
        matrix.mapRect(rectF2);
        matrix.reset();
        matrix.setTranslate(-rectF.left, -rectF.top);
        matrix.mapRect(rectF);
        matrix.mapRect(rectF2);
        rect.set((int) rectF.left, (int) rectF.top, (int) rectF.right, (int) rectF.bottom);
        rect2.set((int) rectF2.left, (int) rectF2.top, (int) rectF2.right, (int) rectF2.bottom);
    }
}
