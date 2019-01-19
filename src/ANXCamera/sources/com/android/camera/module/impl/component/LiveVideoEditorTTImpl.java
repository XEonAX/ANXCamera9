package com.android.camera.module.impl.component;

import android.content.Context;
import android.view.SurfaceView;
import android.view.TextureView;
import com.android.camera.ActivityBase;
import com.android.camera.constant.DurationConstant;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.LiveVideoEditor;
import com.ss.android.vesdk.VECommonCallback;
import com.ss.android.vesdk.VEEditor;
import com.ss.android.vesdk.VEEditor.SCALE_MODE;
import com.ss.android.vesdk.VEEditor.SEEK_MODE;
import com.ss.android.vesdk.VEEditor.VIDEO_RATIO;
import com.ss.android.vesdk.VEVideoEncodeSettings.Builder;
import com.ss.android.vesdk.VEVideoEncodeSettings.COMPILE_TYPE;
import com.ss.android.vesdk.VEVideoEncodeSettings.ENCODE_BITRATE_MODE;

public class LiveVideoEditorTTImpl implements LiveVideoEditor {
    private static final String TAG = LiveVideoEditorTTImpl.class.getSimpleName();
    private Context mContext;
    private VEEditor mEditor;
    private int mEncodeHeight;
    private int mEncodeWidth;
    private boolean mNeedPrepare = true;
    private SurfaceView mSurfaceView;
    private String mVideoSavePath;

    private LiveVideoEditorTTImpl(ActivityBase activityBase) {
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
    }

    public static LiveVideoEditorTTImpl create(ActivityBase activityBase) {
        return new LiveVideoEditorTTImpl(activityBase);
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(209, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(209, this);
    }

    public boolean init(TextureView textureView, String str, String str2, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2) {
        Log.v(TAG, "VEEditor init");
        this.mEditor = new VEEditor(FileUtils.ROOT_DIR, textureView);
        int init = this.mEditor.init(new String[]{str}, null, !str2.equals("") ? new String[]{str2} : null, VIDEO_RATIO.VIDEO_OUT_RATIO_ORIGINAL);
        this.mEditor.setOnInfoListener(vECommonCallback);
        this.mEditor.setOnErrorListener(vECommonCallback2);
        if (init != 0) {
            str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Video editor init failed, ret = ");
            stringBuilder.append(init);
            Log.e(str2, stringBuilder.toString());
            if (this.mEditor != null) {
                this.mEditor.destroy();
                this.mEditor = null;
            }
            return false;
        }
        this.mEditor.setLoopPlay(false);
        this.mEditor.setScaleMode(SCALE_MODE.SCALE_MODE_CENTER_CROP);
        this.mEditor.prepare();
        this.mNeedPrepare = false;
        this.mEditor.addAudioTrack(str2, 0, DurationConstant.DURATION_VIDEO_RECORDING_FUN, true);
        this.mEditor.seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
        return true;
    }

    public void combineVideoAudio(String str, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2) {
        this.mNeedPrepare = true;
        this.mEditor.compile(str, null, new Builder().setCompileType(COMPILE_TYPE.COMPILE_TYPE_MP4).setVideoRes(this.mEncodeHeight, this.mEncodeWidth).setHwEnc(true).setGopSize(30).setVideoBitrate(ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR, 4194304).setFps(25).build());
    }

    public void setEncodeSize(int i, int i2) {
        this.mEncodeWidth = i;
        this.mEncodeHeight = i2;
    }

    public void startPlay() {
        if (this.mEditor != null) {
            if (this.mNeedPrepare) {
                this.mEditor.prepare();
                this.mNeedPrepare = false;
            }
            this.mEditor.setLoopPlay(true);
            this.mEditor.play();
        }
    }

    public void pausePlay() {
        if (this.mEditor != null) {
            this.mEditor.pause();
        }
    }

    public void resumePlay() {
        if (this.mEditor != null) {
            this.mEditor.seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
            this.mEditor.play();
        }
    }

    public void onDestory() {
        Log.v(TAG, "VEEditor onDestory");
        if (this.mEditor != null) {
            this.mEditor.destroy();
            this.mEditor = null;
        }
    }
}
