package com.ss.android.medialib;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.support.annotation.Keep;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import android.view.Surface;
import com.bef.effectsdk.message.MessageCenter;
import com.bef.effectsdk.message.MessageCenter.Listener;
import com.ss.android.medialib.NativePort.NativeLibsLoader;
import com.ss.android.medialib.camera.TextureHolder;
import com.ss.android.medialib.common.Common.IOnOpenGLCallback;
import com.ss.android.medialib.common.LogUtil;
import com.ss.android.medialib.listener.FaceDetectListener;
import com.ss.android.medialib.listener.GLCallback;
import com.ss.android.medialib.listener.NativeInitListener;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.medialib.utils.Utils;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import org.a.a.c;
import org.a.a.d;

@Keep
public class TTRecorder implements Listener, AVCEncoderInterface, c {
    private static final String TAG = TTRecorder.class.getSimpleName();
    private static Listener sMessageListener;
    private static List<SlamDetectListener> sSlamDetectListeners = new ArrayList();
    private IOnOpenGLCallback glCallback = new IOnOpenGLCallback() {
        public void onOpenGLCreate() {
            LogUtil.d(TTRecorder.TAG, "onOpenGLCreate...");
            TTRecorder.this.textureHolder.onCreate(TTRecorder.this.mGLCallback != null ? TTRecorder.this.mGLCallback.onCreateTexture() : null);
            TTRecorder.this.textureHolder.setOnFrameAvailableListener(new OnFrameAvailableListener() {
                public void onFrameAvailable(SurfaceTexture surfaceTexture) {
                    if (TTRecorder.this.handle != 0) {
                        TTRecorder.this.nativeOnFrameAvailable(TTRecorder.this.handle, TTRecorder.this.textureHolder.getSurfaceTextureID(), TTRecorder.this.textureHolder.getMPV());
                    }
                    TTRecorder.this.onDrawFrameTime(TTRecorder.this.handle, TTRecorder.this.getDrawFrameTime(surfaceTexture.getTimestamp()));
                }
            });
            if (TTRecorder.this.mGLCallback != null) {
                TTRecorder.this.mGLCallback.onTextureCreated(TTRecorder.this.textureHolder.getTexture());
            }
        }

        public void onOpenGLDestroy() {
            LogUtil.d(TTRecorder.TAG, "onOpenGLDestroy...");
            TTRecorder.this.textureHolder.onDestroy(TTRecorder.this.mGLCallback != null ? TTRecorder.this.mGLCallback.onDestroy() : true);
        }

        public int onOpenGLRunning() {
            LogUtil.e(TTRecorder.TAG, "onOpenGLRunning...");
            if (TTRecorder.this.textureHolder.getSurfaceTexture() == null) {
                return -1;
            }
            try {
                TTRecorder.this.textureHolder.updateTexImage();
                return 0;
            } catch (RuntimeException e) {
                e.printStackTrace();
                Log.e(TTRecorder.TAG, e.getMessage());
                return -2;
            }
        }
    };
    private long handle;
    private AVCEncoder mAVCEncoder = null;
    private boolean mAudioInited;
    private boolean mAudioLoop = false;
    private d mAudioRecorder;
    private Context mContext;
    private GLCallback mGLCallback = null;
    private boolean mIsMusicChanged;
    private double mLastTimeStamp = -1.0d;
    private String mMusicPath;
    private long mMusicStart = 0;
    private NativeInitListener mNativeInitListener;
    private FaceDetectListener sFaceDetectListener;
    private TextureHolder textureHolder = new TextureHolder();

    public interface SlamDetectListener {
        void onSlam(boolean z);
    }

    public interface OnConcatFinishListener {
        void onConcatFinish(int i);
    }

    private native int nativeAddPCMData(long j, byte[] bArr, int i);

    private native int nativeClearFragFile(long j);

    private native int nativeCloseWavFile(long j);

    private native int nativeConcat(long j, String str, String str2, String str3, String str4);

    private native long nativeCreate();

    private native int nativeDeleteLastFrag(long j);

    private native int nativeDestroy(long j);

    private native long nativeGetEndFrameTime(long j);

    private native ArrayList<TimeSpeedModel> nativeGetSegments(long j);

    private native int nativeInit(long j, int i, int i2, String str, int i3, int i4, String str2);

    private native int nativeInitAudioPlayer(long j, String str, int i, int i2, long j2, boolean z);

    private native int nativeInitWavFile(long j, int i, int i2, double d);

    private native int nativeOnFrameAvailable(long j, int i, float[] fArr);

    private native int nativePauseEffectAudio(long j);

    private native int nativeResumeEffectAudio(long j);

    private native int nativeSave(long j);

    private native int nativeSetBeautyFace(long j, int i, String str);

    private native int nativeSetBeautyFaceIntensity(long j, float f, float f2);

    private native int nativeSetCameraInfo(long j, int i, boolean z);

    private native int nativeSetCodecConfig(long j, ByteBuffer byteBuffer, int i);

    private native int nativeSetColorFormat(long j, int i);

    private native int nativeSetDeviceRotation(long j, float[] fArr);

    private native int nativeSetFaceReshape(long j, String str, float f, float f2);

    private native int nativeSetFilter(long j, String str, float f);

    private native int nativeSetHardEncoderStatus(long j, boolean z);

    private native int nativeSetMusicTime(long j, long j2, long j3);

    private native void nativeSetPreviewSizeRatio(long j, float f);

    private native int nativeSetStickerPath(long j, String str);

    private native int nativeSetUseMusic(long j, int i);

    private native int nativeStartPreview(long j, Surface surface, int i, boolean z, String str);

    private native int nativeStartRecord(long j, double d, boolean z, int i, int i2, int i3);

    private native int nativeStopPreview(long j);

    private native int nativeStopRecord(long j);

    private native int nativeSwitchFilter(long j, String str, String str2, float f);

    private native int nativeTryRestore(long j);

    private native int nativeWriteFile(long j, ByteBuffer byteBuffer, int i, int i2, int i3);

    private native int nativeWriteFile2(long j, ByteBuffer byteBuffer, int i, long j2, long j3, int i2);

    private native int onDrawFrameTime(long j, double d);

    public native void nativeChooseSlamFace(long j, int i);

    public native int nativeEnableTTFaceDetect(long j, boolean z);

    public native int nativeGetSlamFaceCount(long j);

    public native int nativeProcessTouchEvent(long j, float f, float f2);

    public native int nativeSetSlamFace(long j, Bitmap bitmap);

    public native int nativeSlamDeviceConfig(long j, boolean z, int i, boolean z2, boolean z3, boolean z4, boolean z5, String str);

    public native int nativeSlamProcessIngestAcc(long j, double d, double d2, double d3, double d4);

    public native int nativeSlamProcessIngestGra(long j, double d, double d2, double d3, double d4);

    public native int nativeSlamProcessIngestGyr(long j, double d, double d2, double d3, double d4);

    public native int nativeSlamProcessIngestOri(long j, double[] dArr, double d);

    public native int nativeSlamProcessPanEvent(long j, float f, float f2, float f3, float f4, float f5);

    public native int nativeSlamProcessRotationEvent(long j, float f, float f2);

    public native int nativeSlamProcessScaleEvent(long j, float f, float f2);

    public native int nativeSlamProcessTouchEvent(long j, float f, float f2);

    public native int nativeSlamProcessTouchEventByType(long j, int i, float f, float f2, int i2);

    static {
        NativeLibsLoader.loadLibrary();
    }

    public TTRecorder(@NonNull Context context) {
        if (context != null) {
            this.mContext = context;
            this.handle = nativeCreate();
            return;
        }
        throw new NullPointerException("context can not be null");
    }

    private void initMessageCenter() {
        MessageCenter.init();
        MessageCenter.setListener(this);
    }

    private void destroyMessageCenter() {
        MessageCenter.destroy();
        sMessageListener = null;
    }

    public static void setEffectMessageListener(Listener listener) {
        sMessageListener = listener;
    }

    public synchronized void setMusicPath(String str) {
        int nativeSetUseMusic;
        if ((this.mMusicPath == null && str != null) || !(this.mMusicPath == null || this.mMusicPath.equals(str))) {
            this.mIsMusicChanged = true;
        }
        this.mMusicPath = str;
        if (TextUtils.isEmpty(this.mMusicPath) || this.handle == 0) {
            nativeSetUseMusic = nativeSetUseMusic(this.handle, 0);
        } else {
            nativeSetUseMusic = nativeSetUseMusic(this.handle, 1);
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setMusicPath result with:");
        stringBuilder.append(nativeSetUseMusic);
        Log.d(str2, stringBuilder.toString());
    }

    public void setAudioLoop(boolean z) {
        this.mAudioLoop = z;
    }

    public int init(int i, int i2, String str, int i3, int i4, String str2) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeInit(this.handle, i, i2, str, i3, i4, str2);
    }

    public int tryRestore() {
        if (this.handle == 0) {
            return -100;
        }
        return nativeTryRestore(this.handle);
    }

    public List<TimeSpeedModel> getSegmentInfo() {
        if (this.handle == 0) {
            return new ArrayList(0);
        }
        return nativeGetSegments(this.handle);
    }

    public int startPreview(Surface surface, int i, boolean z) {
        if (this.handle == 0) {
            return -100;
        }
        this.mAudioInited = false;
        initMessageCenter();
        return nativeStartPreview(this.handle, surface, i, z, Build.DEVICE);
    }

    public int startRecord(double d, boolean z, float f, int i, int i2) {
        if (this.handle == 0) {
            return -100;
        }
        setMusicStart(this.mMusicStart);
        initAudioIfNeed();
        int i3 = (int) (((float) 4000000) * f);
        i3 = nativeStartRecord(this.handle, d, z, i3 > 12000000 ? 12000000 : i3, i, i2);
        if (i3 == 0) {
            handleAudioRecord(d);
        }
        return i3;
    }

    public int stopRecord() {
        if (this.handle == 0) {
            return -100;
        }
        int nativeStopRecord = nativeStopRecord(this.handle);
        if (this.mAudioRecorder != null) {
            this.mAudioRecorder.stopRecording();
        }
        nativeSave(this.handle);
        return nativeStopRecord;
    }

    public int stopPreview() {
        if (this.handle == 0) {
            return -100;
        }
        destroyMessageCenter();
        return nativeStopPreview(this.handle);
    }

    public void destroy() {
        if (this.mAudioRecorder != null) {
            this.mAudioRecorder.unInit();
        }
        if (this.handle != 0) {
            nativeDestroy(this.handle);
        }
        this.handle = 0;
    }

    public void concat(final String str, final String str2, final OnConcatFinishListener onConcatFinishListener) {
        if (this.handle != 0) {
            new Thread(new Runnable() {
                public void run() {
                    int access$100 = TTRecorder.this.nativeConcat(TTRecorder.this.handle, str, str2, "", "");
                    if (onConcatFinishListener != null) {
                        onConcatFinishListener.onConcatFinish(access$100);
                    }
                }
            }, "ConcatThread").start();
        } else if (onConcatFinishListener != null) {
            onConcatFinishListener.onConcatFinish(-100);
        }
    }

    public int concatSyn(String str, String str2) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeConcat(this.handle, str, str2, "", "");
    }

    public void setPreviewSizeRatio(float f) {
        if (this.handle != 0) {
            nativeSetPreviewSizeRatio(this.handle, f);
        }
    }

    public void updateCameraInfo(int i, boolean z) {
        if (this.handle != 0) {
            nativeSetCameraInfo(this.handle, i, z);
        }
    }

    public void deleteLastFrag() {
        if (this.handle != 0) {
            nativeDeleteLastFrag(this.handle);
        }
    }

    public void clearEnv() {
        if (this.handle != 0) {
            nativeClearFragFile(this.handle);
        }
    }

    public long getEndFrameTime() {
        if (this.handle == 0) {
            return 0;
        }
        return nativeGetEndFrameTime(this.handle);
    }

    public int setMusicStart(long j) {
        if (this.handle == 0) {
            return -100;
        }
        this.mMusicStart = j;
        return nativeSetMusicTime(this.handle, j, (long) TimeSpeedModel.calculateRealTime(getSegmentInfo()));
    }

    public int pauseEffectAudio() {
        if (this.handle == 0) {
            return -100;
        }
        return nativePauseEffectAudio(this.handle);
    }

    public int resumeEffectAudio() {
        if (this.handle == 0) {
            return -100;
        }
        return nativeResumeEffectAudio(this.handle);
    }

    private synchronized void initAudioIfNeed() {
        if (!this.mAudioInited || this.mIsMusicChanged) {
            if (this.mAudioRecorder != null) {
                this.mAudioRecorder.unInit();
            }
            if (TextUtils.isEmpty(this.mMusicPath)) {
                this.mAudioRecorder = new d(this);
                this.mAudioRecorder.init(5);
                nativeSetUseMusic(this.handle, 0);
            } else {
                Pair systemAudioInfo = Utils.getSystemAudioInfo(this.mContext);
                nativeInitAudioPlayer(this.handle, this.mMusicPath, ((Integer) systemAudioInfo.first).intValue(), ((Integer) systemAudioInfo.second).intValue(), 0, this.mAudioLoop);
                nativeSetUseMusic(this.handle, 1);
            }
            this.mAudioInited = true;
            this.mIsMusicChanged = false;
        }
    }

    private void handleAudioRecord(double d) {
        if (this.mAudioRecorder != null) {
            this.mAudioRecorder.d(d);
        }
    }

    public SurfaceTexture getSurfaceTexture() {
        return this.textureHolder.getSurfaceTexture();
    }

    public int setSticker(String str) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetStickerPath(this.handle, str);
    }

    public int setDeviceRotation(float[] fArr) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetDeviceRotation(this.handle, fArr);
    }

    public int setBeautyFace(int i, String str) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetBeautyFace(this.handle, i, str);
    }

    public int setBeautyFaceIntensity(float f, float f2) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetBeautyFaceIntensity(this.handle, f, f2);
    }

    public int setFilter(String str, float f) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetFilter(this.handle, str, f);
    }

    public int setFilter(String str, String str2, float f) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSwitchFilter(this.handle, str, str2, f);
    }

    public int setFaceReshape(String str, float f, float f2) {
        if (this.handle == 0) {
            return -100;
        }
        return nativeSetFaceReshape(this.handle, str, f, f2);
    }

    public void onNativeCallback_Init(int i) {
        StringBuilder stringBuilder;
        if (i < 0) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("onNativeCallback_Init error = ");
            stringBuilder.append(i);
            Log.e("TTRecorder", stringBuilder.toString());
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("onNativeCallback_Init success = ");
            stringBuilder.append(i);
            Log.e("TTRecorder", stringBuilder.toString());
        }
        if (this.mNativeInitListener != null) {
            this.mNativeInitListener.onNativeInitCallBack(i);
        }
    }

    public void setColorFormat(int i) {
        nativeSetColorFormat(this.handle, i);
    }

    public Surface onInitHardEncoder(int i, int i2, int i3, int i4, boolean z) {
        if (this.mAVCEncoder == null) {
            this.mAVCEncoder = new AVCEncoder();
        }
        this.mAVCEncoder.setEncoderCaller(this);
        Surface initAVCEncoder = this.mAVCEncoder.initAVCEncoder(i, i2, i3, i4, z);
        if (initAVCEncoder == null) {
            this.mAVCEncoder = null;
            nativeSetHardEncoderStatus(this.handle, false);
            return null;
        }
        nativeSetHardEncoderStatus(this.handle, true);
        return initAVCEncoder;
    }

    public Surface onInitHardEncoder(int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        if (this.mAVCEncoder == null) {
            this.mAVCEncoder = new AVCEncoder();
        }
        this.mAVCEncoder.setEncoderCaller(this);
        Surface initAVCEncoder = this.mAVCEncoder.initAVCEncoder(i, i2, i3, i4, i5, i6, z);
        if (initAVCEncoder == null) {
            this.mAVCEncoder = null;
            nativeSetHardEncoderStatus(this.handle, false);
            return null;
        }
        nativeSetHardEncoderStatus(this.handle, true);
        return initAVCEncoder;
    }

    public int getProfile() {
        return this.mAVCEncoder.getProfile();
    }

    public void onUninitHardEncoder() {
        if (this.mAVCEncoder != null) {
            this.mAVCEncoder.uninitAVCEncoder();
            this.mAVCEncoder = null;
        }
    }

    public void onEncoderData(byte[] bArr, int i, boolean z) {
        if (this.mAVCEncoder != null) {
            this.mAVCEncoder.encode(bArr, i, z);
        }
    }

    public void onEncoderData(ByteBuffer byteBuffer, int i, boolean z) {
    }

    public int onEncoderData(int i, int i2, int i3, boolean z) {
        if (this.mAVCEncoder != null) {
            return this.mAVCEncoder.encode(i, i2, i3, z);
        }
        return 0;
    }

    public void onSetCodecConfig(ByteBuffer byteBuffer) {
        if (this.handle != 0) {
            nativeSetCodecConfig(this.handle, byteBuffer, byteBuffer.remaining());
        }
    }

    public void onWriteFile(ByteBuffer byteBuffer, int i, int i2, int i3) {
        if (this.handle != 0) {
            nativeWriteFile(this.handle, byteBuffer, byteBuffer.remaining(), i, i3);
        }
    }

    public void onWriteFile(ByteBuffer byteBuffer, long j, long j2, int i, int i2) {
        if (this.handle != 0) {
            nativeWriteFile2(this.handle, byteBuffer, byteBuffer.remaining(), j, j2, i2);
        }
    }

    public void onSwapGlBuffers() {
    }

    public Surface onNativeCallback_InitHardEncoder(int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        return onInitHardEncoder(i, i2, i3, i4, i5, i6, z);
    }

    public void onNativeCallback_InitHardEncoderRet(int i, int i2) {
        if (this.mNativeInitListener != null) {
            this.mNativeInitListener.onNativeInitHardEncoderRetCallback(i, i2);
        }
    }

    public int onNativeCallback_GetHardEncoderProfile() {
        if (this.mAVCEncoder != null) {
            return this.mAVCEncoder.getProfile();
        }
        return 0;
    }

    public void onNativeCallback_UninitHardEncoder() {
        onUninitHardEncoder();
    }

    public int onEncodeData(int i, int i2, boolean z) {
        return onEncoderData(i, i2, 0, z);
    }

    public void setGLCallback(GLCallback gLCallback) {
        this.mGLCallback = gLCallback;
    }

    public int onNativeCallback_encodeTexture(int i, int i2, boolean z) {
        onEncodeData(i, i2, z);
        return 0;
    }

    public void onNativeCallback_onOpenGLCreate() {
        if (this.glCallback != null) {
            this.glCallback.onOpenGLCreate();
        }
    }

    public int onNativeCallback_onOpenGLRunning(double d) {
        if (this.glCallback != null) {
            this.glCallback.onOpenGLRunning();
        }
        return 0;
    }

    public void onNativeCallback_onOpenGLDestroy() {
        if (this.glCallback != null) {
            this.glCallback.onOpenGLDestroy();
        }
    }

    public void onNativeCallback_onFaceDetect(int i, int i2) {
        if (this.sFaceDetectListener != null) {
            this.sFaceDetectListener.onResult(i, i2);
        }
    }

    public void setNativeInitListener(NativeInitListener nativeInitListener) {
        this.mNativeInitListener = nativeInitListener;
    }

    public void onMessageReceived(int i, int i2, int i3, String str) {
        if (sMessageListener != null) {
            sMessageListener.onMessageReceived(i, i2, i3, str);
        }
    }

    public void setFaceDetectListener(FaceDetectListener faceDetectListener) {
        this.sFaceDetectListener = faceDetectListener;
    }

    private long getTextureDeltaTime(boolean z) {
        return this.textureHolder.getSurfaceTexture() != null ? SystemClock.uptimeMillis() - ((this.textureHolder.getSurfaceTexture().getTimestamp() / 1000) / 1000) : -1;
    }

    public int initWavFile(int i, int i2, double d) {
        return nativeInitWavFile(this.handle, i, i2, d);
    }

    public int addPCMData(byte[] bArr, int i) {
        return nativeAddPCMData(this.handle, bArr, i);
    }

    public int closeWavFile() {
        return nativeCloseWavFile(this.handle);
    }

    private double getDrawFrameTime(long j) {
        long nanoTime = System.nanoTime();
        this.mLastTimeStamp = (double) (nanoTime - Math.min(Math.min(Math.abs(nanoTime - j), VERSION.SDK_INT >= 17 ? Math.abs(SystemClock.elapsedRealtimeNanos() - j) : Long.MAX_VALUE), Math.abs((SystemClock.uptimeMillis() * 1000000) - j)));
        return this.mLastTimeStamp / 1000000.0d;
    }

    public int enableTTFaceDetect(boolean z) {
        return nativeEnableTTFaceDetect(this.handle, z);
    }

    public int slamDeviceConfig(boolean z, int i, boolean z2, boolean z3, boolean z4, boolean z5, String str) {
        return nativeSlamDeviceConfig(this.handle, z, i, z2, z3, z4, z5, str);
    }

    public int slamProcessIngestAcc(double d, double d2, double d3, double d4) {
        return nativeSlamProcessIngestAcc(this.handle, d, d2, d3, d4);
    }

    public int slamProcessIngestGyr(double d, double d2, double d3, double d4) {
        return nativeSlamProcessIngestGyr(this.handle, d, d2, d3, d4);
    }

    public int slamProcessIngestGra(double d, double d2, double d3, double d4) {
        return nativeSlamProcessIngestGra(this.handle, d, d2, d3, d4);
    }

    public int slamProcessIngestOri(double[] dArr, double d) {
        return nativeSlamProcessIngestOri(this.handle, dArr, d);
    }

    public int slamProcessTouchEvent(float f, float f2) {
        return nativeSlamProcessTouchEvent(this.handle, f, f2);
    }

    public int processTouchEvent(float f, float f2) {
        return nativeProcessTouchEvent(this.handle, f, f2);
    }

    public int slamProcessTouchEventByType(int i, float f, float f2, int i2) {
        return nativeSlamProcessTouchEventByType(this.handle, i, f, f2, i2);
    }

    public int slamProcessPanEvent(float f, float f2, float f3, float f4, float f5) {
        return nativeSlamProcessPanEvent(this.handle, f, f2, f3, f4, f5);
    }

    public int slamProcessScaleEvent(float f, float f2) {
        return nativeSlamProcessScaleEvent(this.handle, f, f2);
    }

    public int slamProcessRotationEvent(float f, float f2) {
        return nativeSlamProcessRotationEvent(this.handle, f, f2);
    }

    public int setSlamFace(Bitmap bitmap) {
        return nativeSetSlamFace(this.handle, bitmap);
    }

    public int getSlamFaceCount() {
        return nativeGetSlamFaceCount(this.handle);
    }

    public void chooseSlamFace(int i) {
        nativeChooseSlamFace(this.handle, i);
    }

    public static synchronized void onNativeCallback_onSlamDetect(boolean z) {
        synchronized (TTRecorder.class) {
            for (SlamDetectListener slamDetectListener : sSlamDetectListeners) {
                if (slamDetectListener != null) {
                    slamDetectListener.onSlam(z);
                }
            }
        }
    }

    public static synchronized void addSlamDetectListener(SlamDetectListener slamDetectListener) {
        synchronized (TTRecorder.class) {
            if (slamDetectListener != null) {
                sSlamDetectListeners.add(slamDetectListener);
            }
        }
    }

    public static synchronized void removeSlamDetectListener(SlamDetectListener slamDetectListener) {
        synchronized (TTRecorder.class) {
            sSlamDetectListeners.remove(slamDetectListener);
        }
    }

    public static synchronized void clearSlamDetectListener() {
        synchronized (TTRecorder.class) {
            sSlamDetectListeners.clear();
        }
    }
}
