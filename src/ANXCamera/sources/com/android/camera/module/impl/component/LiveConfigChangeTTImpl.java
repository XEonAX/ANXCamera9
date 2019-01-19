package com.android.camera.module.impl.component;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
import android.hardware.SensorManager;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Pair;
import android.view.Surface;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.beauty.LiveBeautyFilterFragment.LiveFilterItem;
import com.android.camera.log.Log;
import com.android.camera.module.LiveModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.gallery3d.ui.ExtTexture;
import com.ss.android.medialib.TTRecorder.SlamDetectListener;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.ttve.oauth.TEOAuthResult;
import com.ss.android.vesdk.IRenderCallback;
import com.ss.android.vesdk.TERecorder;
import com.ss.android.vesdk.Texture;
import com.ss.android.vesdk.VEAudioEncodeSettings;
import com.ss.android.vesdk.VEException;
import com.ss.android.vesdk.VEListener.VERecorderStateListener;
import com.ss.android.vesdk.VEPreviewSettings;
import com.ss.android.vesdk.VEPreviewSettings.CAMERA_FACING_ID;
import com.ss.android.vesdk.VESDK;
import com.ss.android.vesdk.VESize;
import com.ss.android.vesdk.VEVideoEncodeSettings;
import com.ss.android.vesdk.VEVideoEncodeSettings.Builder;
import com.ss.android.vesdk.VEVideoEncodeSettings.ENCODE_PROFILE;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class LiveConfigChangeTTImpl implements LiveConfigChanges {
    private static final String APPID = "100024";
    private static final String LICENSE = "1449eb247881d7452b662746d329a48755efdda8eab980d11c86626450eca036c9195afca03e8af8c096583bcce73bca1ab2308603ef6fc31f8b9441b95cd9ba";
    private static final long MIN_RECORD_TIME = 100000;
    private static final long START_OFFSET_MS = 450;
    private static final String TAG = LiveConfigChangeTTImpl.class.getSimpleName();
    private static final float WHITE_INTENSITY = 0.2f;
    private final float[] SPEEDS = new float[]{0.33f, 0.5f, 1.0f, 2.0f, 3.0f};
    private ActivityBase mActivity;
    private VEAudioEncodeSettings mAudioEncodeSettings;
    private TEOAuthResult mAuthResult;
    private String mBGMPath;
    private OnFaceBeautyChangedProtocol mBeautyImpl;
    private String mConcatVideoPath;
    private String mConcatWavPath;
    private Context mContext;
    private CountDownTimer mCountDownTimer;
    private List<TimeSpeedModel> mDurings = new ArrayList();
    private FilterProtocol mFilterImpl;
    private boolean mInitialized;
    private boolean mInputSurfaceReady;
    private SurfaceTexture mInputSurfaceTexture;
    private boolean mIsFrontCamera;
    private int mMaxVideoDurationInMs;
    private boolean mMediaRecorderRecording = false;
    private boolean mMediaRecorderRecordingPaused;
    private VEPreviewSettings mPreviewSettings;
    private Surface mPreviewSurface;
    private TERecorder mRecorder;
    private final Object mRecorderLock = new Object();
    private float mSpeed;
    private long mStartTime;
    private StickerProtocol mStickerImpl;
    private String mStickerPath;
    private boolean mTTNativeIsInit = false;
    private long mTotalRecordingTime = 0;
    private VEVideoEncodeSettings mVideoEncodeSettings;

    private LiveConfigChangeTTImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
        this.mRecorder = new TERecorder(FileUtils.ROOT_DIR, this.mContext);
        this.mFilterImpl = new LiveFilterChangeImpl(this.mRecorder);
        this.mBeautyImpl = new LiveBeautyChangeImpl(this.mRecorder);
        this.mStickerImpl = new LiveStickerChangeImpl(this.mRecorder);
        this.mInputSurfaceTexture = new SurfaceTexture(false);
        this.mMaxVideoDurationInMs = DurationConstant.DURATION_LIVE_RECORD;
    }

    public static LiveConfigChangeTTImpl create(ActivityBase activityBase) {
        return new LiveConfigChangeTTImpl(activityBase);
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(201, this);
        this.mStickerImpl.registerProtocol();
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(201, this);
        this.mStickerImpl.unRegisterProtocol();
        release();
    }

    public void setBeautify(boolean z, float f) {
        if (this.mRecorder != null && this.mTTNativeIsInit) {
            if (z) {
                this.mRecorder.setBeautyFace(3, FileUtils.BEAUTY_12_DIR);
                this.mRecorder.setBeautyFaceIntensity(f, WHITE_INTENSITY);
            } else {
                this.mRecorder.setBeautyFace(0, "");
                this.mRecorder.setBeautyFaceIntensity(0.0f, 0.0f);
            }
        }
    }

    public void setBeautyFaceReshape(boolean z, float f, float f2) {
        if (z) {
            this.mRecorder.setFaceReshape(FileUtils.RESHAPE_DIR_NAME, f, f2);
        } else {
            this.mRecorder.setFaceReshape("", 0.0f, 0.0f);
        }
    }

    private void deleteLastSegment() {
        if (this.mRecorder != null) {
            this.mRecorder.deleteLastFrag();
        }
    }

    public void initPreview(int i, int i2, boolean z, int i3) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(i3);
        stringBuilder.append("");
        Log.e("live initPreview:", stringBuilder.toString());
        this.mIsFrontCamera = z;
        this.mPreviewSettings = new VEPreviewSettings(z ? CAMERA_FACING_ID.FACING_FRONT : CAMERA_FACING_ID.FACING_BACK, i3, new VESize(i, i2));
        this.mInputSurfaceTexture.setDefaultBufferSize(i, i2);
        if (this.mInitialized) {
            this.mRecorder.updatePreviewSettings(this.mPreviewSettings);
        } else {
            this.mVideoEncodeSettings = new Builder(1).setHwEnc(true).setEncodeProfile(ENCODE_PROFILE.ENCODE_PROFILE_MAIN).setVideoRes(i2, i).build();
            this.mRecorder.init(this.mVideoEncodeSettings, null, this.mPreviewSettings);
            this.mRecorder.tryRestore();
            if (DataRepository.dataItemRunning().getLiveConfigIsNeedRestore()) {
                this.mDurings = this.mRecorder.getSegmentInfo();
                this.mTotalRecordingTime = (long) TimeSpeedModel.calculateRealTime(this.mDurings);
                this.mMediaRecorderRecordingPaused = true;
                this.mMediaRecorderRecording = false;
            } else {
                this.mRecorder.clearEnv();
            }
            this.mInitialized = true;
        }
        resumeEffect();
    }

    private void resumeEffect() {
        String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
        if (!currentLiveMusic[0].isEmpty()) {
            onBGMChanged(currentLiveMusic[0]);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
        stringBuilder.append(CameraSettings.getCurrentLiveSticker());
        this.mStickerPath = stringBuilder.toString();
        setRecordSpeed(Integer.valueOf(CameraSettings.getCurrentLiveSpeed()).intValue());
    }

    public void startPreview(Surface surface, SlamDetectListener slamDetectListener) {
        if (this.mInputSurfaceReady) {
            Log.d(TAG, "startPreview return");
            return;
        }
        this.mPreviewSurface = surface;
        IRenderCallback anonymousClass1 = new IRenderCallback() {
            public Texture onCreateTexture() {
                Log.d(LiveConfigChangeTTImpl.TAG, "TTRenderCallback, onCreateTexture");
                LiveConfigChangeTTImpl.this.mInputSurfaceReady = true;
                ExtTexture extTexture = new ExtTexture();
                extTexture.onBind(null);
                LiveConfigChangeTTImpl.this.mInputSurfaceTexture.attachToGLContext(extTexture.getId());
                return new Texture(extTexture.getId(), LiveConfigChangeTTImpl.this.mInputSurfaceTexture);
            }

            public void onTextureCreated(Texture texture) {
            }

            public boolean onDestroy() {
                Log.d(LiveConfigChangeTTImpl.TAG, "TTRenderCallback onDestroy");
                try {
                    LiveConfigChangeTTImpl.this.mInputSurfaceTexture.detachFromGLContext();
                } catch (Exception e) {
                    String access$000 = LiveConfigChangeTTImpl.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("detachFromGLContext exception ");
                    stringBuilder.append(e.getMessage());
                    Log.e(access$000, stringBuilder.toString());
                }
                LiveConfigChangeTTImpl.this.mInputSurfaceReady = false;
                return false;
            }
        };
        this.mRecorder.setRecrodStateCallback(new VERecorderStateListener() {
            public void onNativeInit(int i, String str) {
                LiveConfigChangeTTImpl.this.mTTNativeIsInit = true;
                TERecorder access$500 = LiveConfigChangeTTImpl.this.mRecorder;
                boolean access$400 = LiveConfigChangeTTImpl.this.mIsFrontCamera;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(FileUtils.MODELS_DIR);
                stringBuilder.append("/slammodel/");
                stringBuilder.append(FileUtils.PHONEPARAM);
                i = access$500.slamDeviceConfig(access$400, 0, true, true, true, true, stringBuilder.toString());
                String access$000 = LiveConfigChangeTTImpl.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("slam config result = ");
                stringBuilder2.append(i);
                Log.e(access$000, stringBuilder2.toString());
                if (LiveConfigChangeTTImpl.this.mStickerPath != null) {
                    LiveConfigChangeTTImpl.this.mRecorder.switchEffect(LiveConfigChangeTTImpl.this.mStickerPath);
                }
                LiveFilterItem findLiveFilter = EffectController.getInstance().findLiveFilter(LiveConfigChangeTTImpl.this.mContext, DataRepository.dataItemRunning().getLiveFilter());
                LiveConfigChangeTTImpl.this.setFilter(true, findLiveFilter != null ? findLiveFilter.directoryName : "");
                LiveConfigChangeTTImpl.this.updateBeauty();
            }

            public void onHardEncoderInit(boolean z) {
            }
        });
        this.mRecorder.setRenderCallback(anonymousClass1);
        this.mRecorder.startPreview(surface);
        TERecorder.addSlamDetectListener(slamDetectListener);
    }

    public SurfaceTexture getInputSurfaceTexture() {
        return this.mInputSurfaceTexture;
    }

    public void release() {
        synchronized (this.mRecorderLock) {
            if (this.mRecorder != null) {
                this.mRecorder.stopPreview();
                this.mRecorder.setRecrodStateCallback(null);
                this.mRecorder.setRenderCallback(null);
                this.mRecorder.destroy();
                this.mInputSurfaceReady = false;
                this.mInputSurfaceTexture.release();
                this.mRecorder = null;
            }
        }
    }

    public boolean isRecording() {
        return this.mMediaRecorderRecording;
    }

    public boolean isRecordingPaused() {
        return this.mMediaRecorderRecordingPaused;
    }

    public void initResource() {
        VESDK.setExternalMonitorListener(MyOwnMonitor.Instance);
        VESDK.init(this.mContext, FileUtils.ROOT_DIR);
        this.mAuthResult = VESDK.activate(this.mContext, LICENSE, APPID, DataRepository.dataItemLive().getActivation());
        String str;
        StringBuilder stringBuilder;
        if (this.mAuthResult == TEOAuthResult.OK || this.mAuthResult == TEOAuthResult.TBD) {
            DataRepository.dataItemLive().setActivation(VESDK.getActivationCode());
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("activation success: ");
            stringBuilder.append(this.mAuthResult.name());
            Log.d(str, stringBuilder.toString());
        } else {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("activation failed: ");
            stringBuilder.append(this.mAuthResult.name());
            Log.d(str, stringBuilder.toString());
        }
        if (!FileUtils.hasDir(FileUtils.ROOT_DIR)) {
            FileUtils.delDir(FileUtils.ROOT_DIR);
            try {
                FileUtils.makeDir(FileUtils.FILTER_DIR);
                FileUtils.makeDir(FileUtils.RESOURCE_DIR);
                FileUtils.makeDir(FileUtils.RESHAPE_DIR_NAME);
                FileUtils.makeDir(FileUtils.VIDEO_TMP);
                FileUtils.makeDir(FileUtils.MUSIC_LOCAL);
                FileUtils.makeDir(FileUtils.MUSIC_ONLINE);
                FileUtils.makeSureNoMedia(FileUtils.ROOT_DIR);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            Util.verifyAssetZip(this.mContext, "live/music.zip", FileUtils.MUSIC_LOCAL, 32768);
            FileUtils.makeDir(FileUtils.MUSIC_ONLINE);
            for (String str2 : FileUtils.ResourcesList) {
                Context context = this.mContext;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("live/");
                stringBuilder2.append(str2);
                stringBuilder2.append(FileUtils.SUFFIX);
                String stringBuilder3 = stringBuilder2.toString();
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append(FileUtils.STICKER_RESOURCE_DIR);
                stringBuilder4.append(str2);
                Util.verifyAssetZip(context, stringBuilder3, stringBuilder4.toString(), 32768);
            }
            Util.verifyAssetZip(this.mContext, "live/Beauty_12.zip", FileUtils.BEAUTY_12_DIR, 32768);
            StringBuilder stringBuilder5 = new StringBuilder();
            stringBuilder5.append(FileUtils.RESOURCE_DIR);
            stringBuilder5.append("filter");
            Util.verifyAssetZip(this.mContext, "live/filter.zip", stringBuilder5.toString(), 32768);
            Util.verifyAssetZip(this.mContext, "live/FaceReshape_V2.zip", FileUtils.RESHAPE_DIR_NAME, 32768);
        } catch (Throwable e2) {
            Log.e(TAG, "verify asset zip failed...", e2);
        }
        if (VESDK.needUpdateEffectModelFiles()) {
            VESDK.updateEffectModelFiles();
        }
    }

    public TEOAuthResult getAuthResult() {
        return this.mAuthResult;
    }

    public void onRecordStart() {
        if (this.mRecorder != null) {
            DataRepository.dataItemRunning().setLiveConfigIsNeedRestore(true);
            this.mRecorder.startRecord(this.mSpeed);
            if (this.mBGMPath != null) {
                this.mRecorder.setRecordBGM(this.mBGMPath, 0, DurationConstant.DURATION_VIDEO_RECORDING_FUN, 1);
            }
            this.mMediaRecorderRecordingPaused = false;
            this.mMediaRecorderRecording = true;
            updateRecordingTime();
        }
    }

    public void closeBGM() {
        if (this.mRecorder != null) {
            this.mBGMPath = null;
            this.mRecorder.setRecordBGM("", 0, 0, 1);
            CameraSettings.setCurrentLiveMusic(null, null);
        }
    }

    public void onRecordPause() {
        if (this.mRecorder != null && !this.mMediaRecorderRecordingPaused) {
            DataRepository.dataItemRunning().setLiveConfigIsNeedRestore(true);
            this.mRecorder.stopRecord();
            long endFrameTime = this.mRecorder.getEndFrameTime();
            if (endFrameTime > MIN_RECORD_TIME || endFrameTime < 0) {
                this.mDurings = this.mRecorder.getSegmentInfo();
                this.mTotalRecordingTime = (long) (((double) this.mTotalRecordingTime) + ((((double) (System.currentTimeMillis() - this.mStartTime)) * 1.0d) / ((double) this.mSpeed)));
            } else {
                deleteLastSegment();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("recording time = ");
                stringBuilder.append(endFrameTime);
                stringBuilder.append(", it's too short");
                Log.d(str, stringBuilder.toString());
            }
            this.mMediaRecorderRecordingPaused = true;
            this.mMediaRecorderRecording = false;
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
        }
    }

    public void onRecordResume() {
        if (this.mRecorder != null && this.mMediaRecorderRecordingPaused) {
            this.mMediaRecorderRecordingPaused = false;
            this.mMediaRecorderRecording = true;
            this.mRecorder.startRecord(this.mSpeed);
            updateRecordingTime();
        }
    }

    public void onRecordReverse() {
        Log.d(TAG, "delete last frag !!!");
        if (this.mRecorder != null) {
            this.mDurings = this.mRecorder.getSegmentInfo();
            if (this.mDurings.size() > 0) {
                TimeSpeedModel timeSpeedModel = (TimeSpeedModel) this.mDurings.remove(this.mDurings.size() - 1);
                this.mTotalRecordingTime = (long) TimeSpeedModel.calculateRealTime(this.mDurings);
                updateRecordingTime(Math.min(((long) this.mMaxVideoDurationInMs) - this.mTotalRecordingTime, 15000));
            }
            this.mRecorder.deleteLastFrag();
        }
    }

    public void onBGMChanged(String str) {
        if (this.mRecorder != null) {
            this.mBGMPath = str;
            this.mRecorder.setRecordBGM(str, 0, DurationConstant.DURATION_VIDEO_RECORDING_FUN, 1);
        }
    }

    public void onRecordStop() {
        if (this.mRecorder != null) {
            DataRepository.dataItemRunning().setLiveConfigIsNeedRestore(false);
            onRecordPause();
            this.mTotalRecordingTime = 0;
            this.mDurings.clear();
            this.mMediaRecorderRecordingPaused = false;
            this.mMediaRecorderRecording = false;
            this.mRecorder.clearEnv();
        }
    }

    public boolean onRecordConcat() {
        if (hasSegments()) {
            try {
                String[] concat = this.mRecorder.concat();
                this.mConcatVideoPath = concat[0];
                this.mConcatWavPath = concat[1];
                return true;
            } catch (VEException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("concat failed: ");
                stringBuilder.append(e.getMsgDes());
                Log.e(str, stringBuilder.toString());
                return false;
            }
        }
        Log.e(TAG, "record segments is empty, stop concat");
        return false;
    }

    public void onDeviceRotationChange(float[] fArr) {
        synchronized (this.mRecorderLock) {
            if (this.mRecorder == null) {
                return;
            }
            this.mRecorder.setDeviceRotation(fArr);
        }
    }

    private double getTimestamp(SensorEvent sensorEvent) {
        long nanoTime = System.nanoTime();
        return (double) (nanoTime - Math.min(Math.abs(nanoTime - sensorEvent.timestamp), Math.abs(SystemClock.elapsedRealtimeNanos() - sensorEvent.timestamp)));
    }

    /* JADX WARNING: Missing block: B:24:0x0088, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onSensorChanged(SensorEvent sensorEvent) {
        synchronized (this.mRecorderLock) {
            if (this.mRecorder == null) {
                return;
            }
            double timestamp = getTimestamp(sensorEvent);
            int type = sensorEvent.sensor.getType();
            int i = 0;
            if (type == 1) {
                this.mRecorder.slamProcessIngestAcc((double) sensorEvent.values[0], (double) sensorEvent.values[1], (double) sensorEvent.values[2], timestamp);
            } else if (type == 4) {
                this.mRecorder.slamProcessIngestGyr((double) sensorEvent.values[0], (double) sensorEvent.values[1], (double) sensorEvent.values[2], timestamp);
            } else if (type == 9) {
                this.mRecorder.slamProcessIngestGra((double) sensorEvent.values[0], (double) sensorEvent.values[1], (double) sensorEvent.values[2], timestamp);
            } else if (type == 15) {
                float[] fArr = new float[9];
                SensorManager.getRotationMatrixFromVector(fArr, sensorEvent.values);
                double[] dArr = new double[9];
                while (i < fArr.length) {
                    dArr[i] = (double) fArr[i];
                    i++;
                }
                this.mRecorder.slamProcessIngestOri(dArr, timestamp);
            }
        }
    }

    public void updateRecordingTime() {
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            this.mCountDownTimer = new CountDownTimer((long) (((float) (((long) this.mMaxVideoDurationInMs) - this.mTotalRecordingTime)) * this.mSpeed), (long) (1000.0f * this.mSpeed)) {
                public void onTick(long j) {
                    LiveConfigChangeTTImpl.this.updateRecordingTime(j);
                }

                public void onFinish() {
                    ((LiveModule) LiveConfigChangeTTImpl.this.mActivity.getCurrentModule()).stopVideoRecording(true, false);
                }
            };
            this.mStartTime = System.currentTimeMillis();
            this.mCountDownTimer.start();
        }
    }

    private void updateRecordingTime(long j) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null) {
            actionProcessing.updateRecordingTime(Util.millisecondToTimeString((long) ((((float) j) * 1.0f) / this.mSpeed), false));
        }
    }

    public int getSegments() {
        return this.mDurings.size();
    }

    public boolean hasSegments() {
        return (this.mDurings == null || this.mDurings.isEmpty()) ? false : true;
    }

    public Pair<String, String> getConcatResult() {
        Object obj = this.mConcatWavPath;
        if (this.mBGMPath != null) {
            obj = this.mBGMPath;
        }
        return new Pair(this.mConcatVideoPath, obj);
    }

    public void setRecordSpeed(int i) {
        this.mSpeed = this.SPEEDS[i];
    }

    public float getRecordSpeed() {
        return this.mSpeed;
    }

    public String getTimeValue() {
        return Util.millisecondToTimeString(Util.clamp(this.mTotalRecordingTime, 1000, 15000), false);
    }

    public long getTotalRecordingTime() {
        return this.mTotalRecordingTime;
    }

    public long getStartRecordingTime() {
        return this.mStartTime;
    }

    public void setFilter(boolean z, String str) {
        if (!z || TextUtils.isEmpty(str)) {
            this.mRecorder.setFilter("", 1.0f);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.FILTER_DIR);
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        this.mRecorder.setFilter(stringBuilder.toString(), 1.0f);
    }

    private void updateBeauty() {
        float faceBeautyRatio = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SHRINK_FACE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio2 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_ENLARGE_EYE_RATIO, 40)) / 100.0f;
        float faceBeautyRatio3 = ((float) CameraSettings.getFaceBeautyRatio(CameraSettings.KEY_LIVE_SMOOTH_STRENGTH, 40)) / 100.0f;
        if (faceBeautyRatio > 0.0f || faceBeautyRatio2 > 0.0f || faceBeautyRatio3 > 0.0f) {
            setBeautyFaceReshape(true, faceBeautyRatio2, faceBeautyRatio);
            setBeautify(true, faceBeautyRatio3);
            return;
        }
        setBeautyFaceReshape(false, 0.0f, 0.0f);
        setBeautify(false, 0.0f);
    }
}
