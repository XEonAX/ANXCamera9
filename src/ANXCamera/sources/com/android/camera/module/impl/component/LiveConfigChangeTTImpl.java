package com.android.camera.module.impl.component;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.SurfaceTexture;
import android.os.CountDownTimer;
import android.preference.PreferenceManager;
import android.util.Pair;
import android.view.Surface;
import com.android.camera.ActivityBase;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.LiveModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.gallery3d.ui.ExtTexture;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.ttve.oauth.TEOAuthResult;
import com.ss.android.vesdk.IRenderCallback;
import com.ss.android.vesdk.TERecorder;
import com.ss.android.vesdk.Texture;
import com.ss.android.vesdk.VEAudioEncodeSettings;
import com.ss.android.vesdk.VEListener.VERecorderStateListener;
import com.ss.android.vesdk.VEPreviewSettings;
import com.ss.android.vesdk.VEPreviewSettings.CAMERA_FACING_ID;
import com.ss.android.vesdk.VESDK;
import com.ss.android.vesdk.VESize;
import com.ss.android.vesdk.VEVideoEncodeSettings;
import com.ss.android.vesdk.VEVideoEncodeSettings.Builder;
import com.ss.android.vesdk.VEVideoEncodeSettings.ENCODE_PROFILE;
import java.util.ArrayList;
import java.util.List;

public class LiveConfigChangeTTImpl implements LiveConfigChanges {
    private static final String APPID = "100012";
    private static final String LICENSE = "36ed10517245d52898e49b5e9cff6184dbaed4d373bf673cadeccd2322c1f0c0ea34824b4c3be2a18823fedfff368e2670e7361fc9f6b32e27c7bd16445821f6";
    private static final long START_OFFSET_MS = 450;
    private static final String TAG = LiveConfigChangeTTImpl.class.getSimpleName();
    private final float[] BEAUTY_LEVEL = new float[]{0.2f, 0.4f, 0.6f, 0.8f, 1.0f};
    private final float[] SPEEDS = new float[]{3.0f, 2.0f, 1.0f, 0.5f, 0.33f};
    private ActivityBase mActivity;
    private VEAudioEncodeSettings mAudioEncodeSettings;
    private String mBGMPath;
    private OnFaceBeautyChangedProtocol mBeautyImpl;
    private String[] mConcatPaths;
    private String mConcatVideoPath;
    private String mConcatWavPath;
    private Context mContext;
    private CountDownTimer mCountDownTimer;
    private List<TimeSpeedModel> mDurings = new ArrayList();
    private FilterProtocol mFilterImpl;
    private boolean mInitialized;
    private boolean mInputSurfaceReady;
    private SurfaceTexture mInputSurfaceTexture;
    private int mMaxVideoDurationInMs;
    private boolean mMediaRecorderRecording = false;
    private boolean mMediaRecorderRecordingPaused;
    private VEPreviewSettings mPreviewSettings;
    private TERecorder mRecorder;
    private float mSpeed;
    private long mStartTime;
    private StickerProtocol mStickerImpl;
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
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.MUSIC);
        stringBuilder.append((String) FileUtils.musicList.get(2));
        this.mBGMPath = stringBuilder.toString();
        this.mMaxVideoDurationInMs = 15000;
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

    public void setSticker(int i) {
        if (this.mRecorder != null && this.mTTNativeIsInit) {
            TERecorder tERecorder = this.mRecorder;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
            stringBuilder.append((String) FileUtils.ResourcesList.get(i));
            tERecorder.switchEffect(stringBuilder.toString());
        }
    }

    public void setBeautyLevel(int i) {
        if (this.mRecorder != null && this.mTTNativeIsInit) {
            this.mRecorder.setBeautyFace(3, FileUtils.BEAUTY_12_DIR);
            this.mRecorder.setBeautyFaceIntensity(this.BEAUTY_LEVEL[i], this.BEAUTY_LEVEL[i]);
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
        this.mPreviewSettings = new VEPreviewSettings(z ? CAMERA_FACING_ID.FACING_FRONT : CAMERA_FACING_ID.FACING_BACK, i3, new VESize(i, i2));
        this.mInputSurfaceTexture.setDefaultBufferSize(i, i2);
        if (this.mInitialized) {
            this.mRecorder.updatePreviewSettings(this.mPreviewSettings);
            return;
        }
        this.mVideoEncodeSettings = new Builder().setUsage(1).isUseCloudConfig(false).setHwEnc(true).setEncodeProfile(ENCODE_PROFILE.ENCODE_PROFILE_MAIN).setVideoRes(576, 1024).build();
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
        onBGMChanged("");
        this.mInitialized = true;
    }

    public void startPreview(Surface surface) {
        if (!this.mInputSurfaceReady) {
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
                    LiveConfigChangeTTImpl.this.mInputSurfaceTexture.detachFromGLContext();
                    return false;
                }
            };
            this.mRecorder.setRecrodStateCallback(new VERecorderStateListener() {
                public void onNativeInit(int i, String str) {
                    LiveConfigChangeTTImpl.this.mTTNativeIsInit = true;
                    LiveConfigChangeTTImpl.this.mRecorder.setBeautyFace(3, FileUtils.BEAUTY_12_DIR);
                    LiveConfigChangeTTImpl.this.mRecorder.setBeautyFaceIntensity(0.55f, 0.55f);
                }

                public void onHardEncoderInit(boolean z) {
                }
            });
            this.mRecorder.setRecordBGM(this.mBGMPath, 0, 15000, 1);
            this.mRecorder.setRenderCallback(anonymousClass1);
            this.mRecorder.startPreview(surface);
        }
    }

    public SurfaceTexture getInputSurfaceTexture() {
        return this.mInputSurfaceTexture;
    }

    public void release() {
        if (this.mRecorder != null) {
            if (this.mMediaRecorderRecording) {
                onRecordPause();
            }
            this.mRecorder.stopPreview();
            this.mRecorder.setRecrodStateCallback(null);
            this.mRecorder.setRenderCallback(null);
            this.mRecorder.destroy();
            this.mInputSurfaceTexture.release();
            this.mRecorder = null;
        }
    }

    public boolean isRecording() {
        return this.mMediaRecorderRecording;
    }

    public boolean isRecordingPaused() {
        return this.mMediaRecorderRecordingPaused;
    }

    public void initResource() {
        Log.e("live test :", "01");
        VESDK.init(this.mContext, FileUtils.ROOT_DIR);
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this.mContext);
        TEOAuthResult activate = VESDK.activate(this.mContext, LICENSE, APPID, defaultSharedPreferences.getString("activationCode", ""));
        if (activate == TEOAuthResult.OK || activate == TEOAuthResult.TBD) {
            defaultSharedPreferences.edit().putString("activationCode", VESDK.getActivationCode()).apply();
            Log.e("live active:", "success");
        } else {
            Log.e("live active:", "failed");
        }
        VESDK.needUpdateEffectModelFiles();
        if (!FileUtils.hasDir(FileUtils.ROOT_DIR)) {
            FileUtils.delDir(FileUtils.ROOT_DIR);
            Log.e("live test :", "02");
            try {
                FileUtils.makeDir(FileUtils.FILTER_DIR);
                FileUtils.makeDir(FileUtils.RESOURCE_DIR);
                FileUtils.makeDir(FileUtils.RESHAPE_DIR_NAME);
                FileUtils.makeDir(FileUtils.VIDEO_TMP);
                FileUtils.makeDir(FileUtils.MUSIC);
                FileUtils.makeSureNoMedia(FileUtils.ROOT_DIR);
                FileUtils.copyFileIfNeed(this.mContext, FileUtils.MUSIC, "music00001.mp3");
                FileUtils.copyFileIfNeed(this.mContext, FileUtils.MUSIC, "music00002.mp3");
                FileUtils.copyFileIfNeed(this.mContext, FileUtils.MUSIC, "music00003.mp3");
                FileUtils.copyFileIfNeed(this.mContext, FileUtils.MUSIC, "music00004.mp3");
                for (String str : FileUtils.ResourcesList) {
                    Context context = this.mContext;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(str);
                    stringBuilder.append(FileUtils.SUFFIX);
                    FileUtils.UnZipAssetFolder(context, stringBuilder.toString(), FileUtils.STICKER_RESOURCE_DIR);
                }
                FileUtils.UnZipAssetFolder(this.mContext, FileUtils.BEAUTY_12_FILENAME, FileUtils.RESOURCE_DIR);
                FileUtils.UnZipAssetFolder(this.mContext, "filter.zip", FileUtils.RESOURCE_DIR);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void onRecordStart() {
        if (this.mRecorder != null) {
            DataRepository.dataItemRunning().setLiveConfigIsNeedRestore(true);
            this.mRecorder.startRecord(this.mSpeed);
            this.mMediaRecorderRecordingPaused = false;
            this.mMediaRecorderRecording = true;
            updateRecordingTime();
        }
    }

    public void onRecordPause() {
        if (this.mRecorder != null && !this.mMediaRecorderRecordingPaused) {
            this.mRecorder.stopRecord();
            long endFrameTime = this.mRecorder.getEndFrameTime();
            if (endFrameTime > 10 || endFrameTime < 0) {
                this.mDurings = this.mRecorder.getSegmentInfo();
                this.mTotalRecordingTime = (long) (((double) this.mTotalRecordingTime) + ((((double) (System.currentTimeMillis() - this.mStartTime)) * 1.0d) / ((double) this.mSpeed)));
            } else {
                deleteLastSegment();
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
        android.util.Log.d(TAG, "delete last frag !!!");
        if (this.mRecorder != null) {
            this.mDurings = this.mRecorder.getSegmentInfo();
            if (this.mDurings.size() > 0) {
                TimeSpeedModel timeSpeedModel = (TimeSpeedModel) this.mDurings.remove(this.mDurings.size() - 1);
                this.mTotalRecordingTime = (long) TimeSpeedModel.calculateRealTime(this.mDurings);
            }
            this.mRecorder.deleteLastFrag();
        }
    }

    public void onBGMChanged(String str) {
        if (this.mRecorder != null) {
            this.mBGMPath = str;
            this.mRecorder.setRecordBGM(str, 0, 15000, 1);
        }
    }

    public void onRecordStop() {
        if (this.mRecorder != null) {
            DataRepository.dataItemRunning().setLiveConfigIsNeedRestore(false);
            onRecordPause();
            this.mMediaRecorderRecordingPaused = false;
            this.mMediaRecorderRecording = false;
        }
    }

    public void onRecordConcat() {
        String[] concat = this.mRecorder.concat();
        this.mConcatVideoPath = concat[0];
        this.mConcatWavPath = concat[1];
    }

    public void updateRecordingTime() {
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            this.mCountDownTimer = new CountDownTimer((long) (((float) (((long) this.mMaxVideoDurationInMs) - this.mTotalRecordingTime)) * this.mSpeed), (long) (1000.0f * this.mSpeed)) {
                public void onTick(long j) {
                    String millisecondToTimeString = Util.millisecondToTimeString((((long) ((((float) j) * 1.0f) / LiveConfigChangeTTImpl.this.mSpeed)) + 950) - LiveConfigChangeTTImpl.START_OFFSET_MS, false);
                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                    if (actionProcessing != null) {
                        actionProcessing.updateRecordingTime(millisecondToTimeString);
                    }
                }

                public void onFinish() {
                    ((LiveModule) LiveConfigChangeTTImpl.this.mActivity.getCurrentModule()).stopVideoRecording(true, false);
                }
            };
            this.mStartTime = System.currentTimeMillis();
            this.mCountDownTimer.start();
        }
    }

    public Pair<String, String> getConcatResult() {
        return new Pair(this.mConcatVideoPath, this.mBGMPath);
    }

    public void setRecordSpeed(int i) {
        this.mSpeed = this.SPEEDS[i];
    }

    public float getRecordSpeed() {
        return this.mSpeed;
    }

    public long getTotalRecordintTime() {
        return this.mTotalRecordingTime;
    }

    public long getStartRecordintTime() {
        return this.mStartTime;
    }
}
