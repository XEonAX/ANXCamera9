package com.android.camera.module.impl.component;

import android.content.Context;
import android.view.SurfaceView;
import android.view.TextureView;
import com.android.camera.ActivityBase;
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

    public void init(TextureView textureView, String str, String str2, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2) {
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
            return;
        }
        this.mEditor.setLoopPlay(false);
        this.mEditor.setScaleMode(SCALE_MODE.SCALE_MODE_CENTER_CROP);
        this.mEditor.prepare();
        this.mNeedPrepare = false;
        this.mEditor.addAudioTrack(str2, 0, 15000, true);
        this.mEditor.seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
    }

    public void combineVideoAudio(String str, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2) {
        this.mEditor.compile(str, null, new Builder().setCompileType(COMPILE_TYPE.COMPILE_TYPE_MP4).setVideoRes(576, 1024).setHwEnc(true).setGopSize(30).setVideoBitrate(ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR, 4194304).setFps(25).build());
    }

    public void onResume() {
        if (this.mNeedPrepare) {
            this.mEditor.prepare();
            this.mNeedPrepare = false;
            this.mEditor.play();
        }
    }

    public void startPlay() {
        if (this.mEditor != null) {
            this.mEditor.play();
        }
    }

    public void pausePlay() {
        if (this.mEditor != null) {
            this.mEditor.destroy();
        }
    }

    public void onDestory() {
        if (this.mEditor != null) {
            this.mEditor.destroy();
            this.mEditor = null;
        }
    }
}
