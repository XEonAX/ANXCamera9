package com.ss.android.vesdk;

import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.LifecycleObserver;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.OnLifecycleEvent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback2;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.ss.android.ttve.common.TECommonCallback;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.model.FilterBean;
import com.ss.android.ttve.monitor.TEMonitor;
import com.ss.android.ttve.monitor.TEMonitorKeys;
import com.ss.android.ttve.nativePort.NativeCallbacks.IOpenGLCallback;
import com.ss.android.ttve.nativePort.TEInterface;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.ugc.effectmanager.common.utils.FileUtils;
import com.ss.android.vesdk.runtime.VEEditorResManager;
import com.ss.android.vesdk.runtime.VERuntime;
import java.io.File;
import java.nio.Buffer;
import java.nio.ByteBuffer;

public class VEEditor implements LifecycleObserver, OnFrameAvailableListener {
    private static final String AUDIO_VOLUME = "audio volume";
    private static final String EFFECT_RES_PATH = "effect res path";
    private static final int ENGINE_PREPARE_FOR_COMPILE = 1;
    private static final int ENGINE_PREPARE_FOR_PLAYBACK = 0;
    private static final String FILTER_INTENSITY = "filter intensity";
    private static final String FILTER_PATH_LEFT = "left filter";
    private static final String FILTER_PATH_RIGHT = "right filter";
    private static final String FILTER_POSITION = "filter position";
    private static final String TAG = "VEEditor";
    private static final int TEFilterType_Audio = 1;
    private static final int TEFilterType_Caption = 4;
    private static final int TEFilterType_Color = 2;
    private static final int TEFilterType_Effect_Color = 7;
    private static final int TEFilterType_Effect_Filter = 8;
    private static final int TEFilterType_Sticker = 0;
    private static final int TEFilterType_TimeEffect = 6;
    private static final int TEFilterType_TransForm = 3;
    private static final int TEFilterType_WaterMark = 5;
    private static final int TETrackProperty_BGM = 1;
    private static final int TETrackProperty_OriginalSound = 0;
    public static final int TETrackType_Audio = 1;
    public static final int TETrackType_Video = 0;
    private int mAudioEffectfilterIndex;
    private boolean mBReversePlay;
    @ColorInt
    private int mBackGroundColor;
    private int mColorFilterIndex;
    private FilterBean mCurColorFilter;
    private int mInPoint;
    private int mInitDisplayHeight;
    private int mInitDisplayWidth;
    private VESize mInitSize;
    private volatile boolean mIsGLReady;
    private volatile boolean mIsSurfaceCreated;
    private int mMasterTrackIndex;
    private String mModelsDir;
    private IOpenGLCallback mOpenGLCallback;
    private int mOutPoint;
    private String mOutputFile;
    private VEEditorResManager mResManager;
    private boolean mReverseDone;
    private Surface mSurface;
    private Callback2 mSurfaceCallback;
    private int mSurfaceHeight;
    private SurfaceTexture mSurfaceTexture;
    private SurfaceView mSurfaceView;
    private int mSurfaceWidth;
    private final SurfaceTextureListener mTextureListener;
    private TextureView mTextureView;
    private TEInterface mVideoEditor;
    private VIDEO_RATIO mVideoOutRes;
    private Boolean mbSeparateAV;
    private int miFrameCount;
    private long mlCompileStartTime;
    private long mlCurTimeMS;
    private long mlLastTimeMS;

    public enum SCALE_MODE {
        SCALE_MODE_CENTER_INSIDE,
        SCALE_MODE_CENTER_CROP
    }

    public enum SEEK_MODE {
        EDITOR_SEEK_FLAG_OnGoing,
        EDITOR_SEEK_FLAG_LastSeek
    }

    public enum VEState {
        ANY(SupportMenu.USER_MASK),
        ERROR(0),
        NOTHING(1048576),
        IDLE(1),
        INITIALIZED(2),
        PREPARED(4),
        STARTED(8),
        PAUSED(16),
        SEEKING(32),
        STOPPED(64),
        COMPLETED(128);
        
        private int mValue;

        private VEState(int i) {
            this.mValue = i;
        }

        public static VEState valueOf(int i) {
            if (i == 4) {
                return PREPARED;
            }
            if (i == 8) {
                return STARTED;
            }
            if (i == 16) {
                return PAUSED;
            }
            if (i == 32) {
                return SEEKING;
            }
            if (i == 64) {
                return STOPPED;
            }
            if (i == 128) {
                return COMPLETED;
            }
            if (i == SupportMenu.USER_MASK) {
                return ANY;
            }
            if (i == 1048576) {
                return NOTHING;
            }
            switch (i) {
                case 0:
                    return ERROR;
                case 1:
                    return IDLE;
                case 2:
                    return INITIALIZED;
                default:
                    return null;
            }
        }

        public int getValue() {
            return this.mValue;
        }
    }

    public enum VIDEO_RATIO {
        VIDEO_OUT_RATIO_1_1,
        VIDEO_OUT_RATIO_4_3,
        VIDEO_OUT_RATIO_3_4,
        VIDEO_OUT_RATIO_16_9,
        VIDEO_OUT_RATIO_9_16,
        VIDEO_OUT_RATIO_ORIGINAL
    }

    static /* synthetic */ int access$804(VEEditor vEEditor) {
        int i = vEEditor.miFrameCount + 1;
        vEEditor.miFrameCount = i;
        return i;
    }

    private void onSurfaceDestroyed() {
        TELogUtil.d(TAG, "surfaceDestroyed...");
        this.mIsSurfaceCreated = false;
        this.mVideoEditor.releasePreviewSurface();
    }

    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        TELogUtil.v(TAG, "onFrameAvailable...");
    }

    private void onSurfaceCreated(Surface surface) {
        TELogUtil.i(TAG, "surfaceCreated...");
        this.mVideoEditor.setPreviewSurface(surface);
    }

    private void onMonitorCompile() {
        TEMonitor.perfLong(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_TIME, System.currentTimeMillis() - this.mlCompileStartTime);
        if (FileUtils.checkFileExists(this.mOutputFile)) {
            int[] iArr = new int[10];
            if (TEVideoUtils.getVideoFileInfo(this.mOutputFile, iArr) == 0) {
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_SIZE, (((double) new File(this.mOutputFile).length()) / 1024.0d) / 1024.0d);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_DURATION, (double) iArr[3]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_BIT_RATE, (double) iArr[6]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FPS, (double) iArr[7]);
            }
        }
        TEMonitor.report(TEMonitor.MONITOR_ACTION_COMPILE);
    }

    public VEEditor(String str) throws VEException {
        this.mInitSize = new VESize(-1, -1);
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.mInitDisplayWidth = 0;
        this.mInitDisplayHeight = 0;
        this.mbSeparateAV = Boolean.valueOf(false);
        this.mAudioEffectfilterIndex = -1;
        this.mMasterTrackIndex = 0;
        this.mVideoEditor = TEInterface.createEngine();
        this.mIsSurfaceCreated = false;
        this.mIsGLReady = false;
        this.miFrameCount = 0;
        this.mlCurTimeMS = 0;
        this.mlLastTimeMS = 0;
        this.mReverseDone = false;
        this.mColorFilterIndex = -1;
        this.mOutputFile = null;
        this.mlCompileStartTime = 0;
        this.mBReversePlay = false;
        this.mBackGroundColor = ViewCompat.MEASURED_STATE_MASK;
        this.mTextureListener = new SurfaceTextureListener() {
            public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
                if (VEEditor.this.mSurfaceTexture == surfaceTexture) {
                    VEEditor.this.onSurfaceCreated(VEEditor.this.mSurface);
                } else {
                    VEEditor.this.mSurface = new Surface(surfaceTexture);
                    VEEditor.this.onSurfaceCreated(VEEditor.this.mSurface);
                }
                VEEditor.this.mSurfaceTexture = surfaceTexture;
            }

            public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
                VEEditor.this.mSurfaceWidth = i;
                VEEditor.this.mSurfaceHeight = i2;
                VEEditor.this.updateInitDisplaySize();
            }

            public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
                VEEditor.this.onSurfaceDestroyed();
                VEEditor.this.mSurface.release();
                return true;
            }

            public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
            }
        };
        this.mSurfaceCallback = new Callback2() {
            public void surfaceRedrawNeeded(SurfaceHolder surfaceHolder) {
                TELogUtil.d(VEEditor.TAG, "surfaceRedrawNeeded...");
            }

            public void surfaceCreated(SurfaceHolder surfaceHolder) {
                VEEditor.this.onSurfaceCreated(surfaceHolder.getSurface());
            }

            public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                TELogUtil.d(VEEditor.TAG, String.format("surfaceChanged: pixel format [%d], size [%d, %d]", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3)}));
                VEEditor.this.mSurfaceWidth = i2;
                VEEditor.this.mSurfaceHeight = i3;
                VEEditor.this.updateInitDisplaySize();
            }

            public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                VEEditor.this.onSurfaceDestroyed();
            }
        };
        this.mOpenGLCallback = new IOpenGLCallback() {
            public int onOpenGLCreate(int i) {
                String str = VEEditor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onOpenGLCreate: ret = ");
                stringBuilder.append(i);
                TELogUtil.d(str, stringBuilder.toString());
                VEEditor.this.mIsGLReady = true;
                return 0;
            }

            public int onOpenGLDrawBefore(int i, double d) {
                return 0;
            }

            public int onOpenGLDrawAfter(int i, double d) {
                String str = VEEditor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onOpenGLDrawing: tex = ");
                stringBuilder.append(i);
                stringBuilder.append(" timeStamp = ");
                stringBuilder.append(d);
                TELogUtil.v(str, stringBuilder.toString());
                VEEditor.access$804(VEEditor.this);
                if (VEEditor.this.miFrameCount == 30) {
                    VEEditor.this.mlCurTimeMS = System.currentTimeMillis();
                    float access$900 = 30000.0f / ((float) (VEEditor.this.mlCurTimeMS - VEEditor.this.mlLastTimeMS));
                    String str2 = VEEditor.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Render FPS = ");
                    stringBuilder2.append(access$900);
                    TELogUtil.d(str2, stringBuilder2.toString());
                    VEEditor.this.mlLastTimeMS = VEEditor.this.mlCurTimeMS;
                    VEEditor.this.miFrameCount = 0;
                }
                return 0;
            }

            public int onOpenGLDestroy(int i) {
                String str = VEEditor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onOpenGLDestroy: ret = ");
                stringBuilder.append(i);
                TELogUtil.d(str, stringBuilder.toString());
                VEEditor.this.mIsGLReady = false;
                return 0;
            }

            public int onPreviewSurface(int i) {
                return 0;
            }
        };
        if (TextUtils.isEmpty(str)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("workspace is: ");
            stringBuilder.append(str);
            throw new VEException(-100, stringBuilder.toString());
        }
        this.mResManager = new VEEditorResManager(str);
    }

    public VEEditor(String str, SurfaceView surfaceView) {
        this.mInitSize = new VESize(-1, -1);
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.mInitDisplayWidth = 0;
        this.mInitDisplayHeight = 0;
        this.mbSeparateAV = Boolean.valueOf(false);
        this.mAudioEffectfilterIndex = -1;
        this.mMasterTrackIndex = 0;
        this.mVideoEditor = TEInterface.createEngine();
        this.mIsSurfaceCreated = false;
        this.mIsGLReady = false;
        this.miFrameCount = 0;
        this.mlCurTimeMS = 0;
        this.mlLastTimeMS = 0;
        this.mReverseDone = false;
        this.mColorFilterIndex = -1;
        this.mOutputFile = null;
        this.mlCompileStartTime = 0;
        this.mBReversePlay = false;
        this.mBackGroundColor = ViewCompat.MEASURED_STATE_MASK;
        this.mTextureListener = /* anonymous class already generated */;
        this.mSurfaceCallback = /* anonymous class already generated */;
        this.mOpenGLCallback = /* anonymous class already generated */;
        if (TextUtils.isEmpty(str)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("workspace is: ");
            stringBuilder.append(str);
            throw new VEException(-100, stringBuilder.toString());
        }
        TELogUtil.i(TAG, "VEEditor surfaceView");
        this.mResManager = new VEEditorResManager(str);
        this.mSurfaceView = surfaceView;
        surfaceView.getHolder().addCallback(this.mSurfaceCallback);
        this.mVideoEditor.setOpenGLListeners(this.mOpenGLCallback);
    }

    public VEEditor(String str, SurfaceView surfaceView, @NonNull LifecycleOwner lifecycleOwner) {
        this(str, surfaceView);
        TELogUtil.i(TAG, "VEEditor surfaceView LifecycleOwner");
        lifecycleOwner.getLifecycle().addObserver(this);
    }

    public VEEditor(String str, TextureView textureView) throws VEException {
        this.mInitSize = new VESize(-1, -1);
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.mInitDisplayWidth = 0;
        this.mInitDisplayHeight = 0;
        this.mbSeparateAV = Boolean.valueOf(false);
        this.mAudioEffectfilterIndex = -1;
        this.mMasterTrackIndex = 0;
        this.mVideoEditor = TEInterface.createEngine();
        this.mIsSurfaceCreated = false;
        this.mIsGLReady = false;
        this.miFrameCount = 0;
        this.mlCurTimeMS = 0;
        this.mlLastTimeMS = 0;
        this.mReverseDone = false;
        this.mColorFilterIndex = -1;
        this.mOutputFile = null;
        this.mlCompileStartTime = 0;
        this.mBReversePlay = false;
        this.mBackGroundColor = ViewCompat.MEASURED_STATE_MASK;
        this.mTextureListener = /* anonymous class already generated */;
        this.mSurfaceCallback = /* anonymous class already generated */;
        this.mOpenGLCallback = /* anonymous class already generated */;
        if (TextUtils.isEmpty(str)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("workspace is: ");
            stringBuilder.append(str);
            throw new VEException(-100, stringBuilder.toString());
        }
        TELogUtil.i(TAG, "VEEditor textureView");
        this.mResManager = new VEEditorResManager(str);
        this.mTextureView = textureView;
        textureView.setSurfaceTextureListener(this.mTextureListener);
        this.mVideoEditor.setOpenGLListeners(this.mOpenGLCallback);
    }

    public VEEditor(String str, TextureView textureView, @NonNull LifecycleOwner lifecycleOwner) {
        this(str, textureView);
        TELogUtil.i(TAG, "VEEditor TextureView LifecycleOwner");
        lifecycleOwner.getLifecycle().addObserver(this);
    }

    public void setOnErrorListener(@NonNull final VECommonCallback vECommonCallback) {
        TECommonCallback anonymousClass4 = new TECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                vECommonCallback.onCallback(i, i2, f, str);
            }
        };
        TELogUtil.i(TAG, "setOnErrorListener...");
        this.mVideoEditor.setErrorListener(anonymousClass4);
    }

    public void setOnInfoListener(@NonNull final VECommonCallback vECommonCallback) {
        TECommonCallback anonymousClass5 = new TECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                if (i == 4103) {
                    VEEditor.this.onMonitorCompile();
                }
                vECommonCallback.onCallback(i, i2, f, str);
            }
        };
        TELogUtil.i(TAG, "setOnInfoListener...");
        this.mVideoEditor.setInfoListener(anonymousClass5);
    }

    public void setDisplayPos(int i, int i2, int i3, int i4) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setDisplayPos... ");
        stringBuilder.append(i);
        stringBuilder.append(" ");
        stringBuilder.append(i2);
        stringBuilder.append(" ");
        stringBuilder.append(i3);
        stringBuilder.append(" ");
        stringBuilder.append(i4);
        TELogUtil.i(str, stringBuilder.toString());
        setDisplayState(((float) i3) / ((float) this.mInitDisplayWidth), ((float) i4) / ((float) this.mInitDisplayHeight), 0.0f, -(((this.mSurfaceWidth / 2) - (i3 / 2)) - i), ((this.mSurfaceHeight / 2) - (i4 / 2)) - i2);
    }

    public VESize getInitSize() {
        return new VESize(this.mInitDisplayWidth, this.mInitDisplayHeight);
    }

    public void setDisplayState(float f, float f2, float f3, int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setDisplayState... ");
        stringBuilder.append(f);
        stringBuilder.append(" ");
        stringBuilder.append(f2);
        stringBuilder.append(" ");
        stringBuilder.append(f3);
        stringBuilder.append(" ");
        stringBuilder.append(i);
        stringBuilder.append(" ");
        stringBuilder.append(i2);
        TELogUtil.i(str, stringBuilder.toString());
        this.mVideoEditor.setDisplayState(f, f2, f3, 0.0f, i, i2, false);
    }

    public Bitmap getCurrDisplayImage() {
        VERect displayRect = this.mVideoEditor.getDisplayRect();
        Buffer allocateDirect = ByteBuffer.allocateDirect((displayRect.width * displayRect.height) * 4);
        int displayImage = this.mVideoEditor.getDisplayImage(allocateDirect.array());
        if (displayImage != 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getDisplayImage failed ");
            stringBuilder.append(displayImage);
            TELogUtil.e(str, stringBuilder.toString());
            return null;
        }
        Bitmap createBitmap = Bitmap.createBitmap(displayRect.width, displayRect.height, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(allocateDirect);
        return createBitmap;
    }

    public void setBackgroundColor(int i) {
        this.mBackGroundColor = i;
        this.mVideoEditor.setBackGroundColor(((float) ((i >> 16) & 255)) / 255.0f, ((float) ((i >> 8) & 255)) / 255.0f, ((float) (i & 255)) / 255.0f, ((float) ((i >> 24) & 255)) / 255.0f);
    }

    public void invalidate() {
        this.mVideoEditor.setDisplayState(-1.0f, -1.0f, -1.0f, -1.0f, -80000, -80000, true);
    }

    public int setInOut(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInOut... ");
        stringBuilder.append(i);
        stringBuilder.append(" ");
        stringBuilder.append(i2);
        TELogUtil.i(str, stringBuilder.toString());
        this.mInPoint = i;
        this.mOutPoint = i2;
        this.mVideoEditor.stop();
        return this.mVideoEditor.prepareEngine(i, i2, 0, this.mModelsDir);
    }

    public int init(String[] strArr, String[] strArr2, String[] strArr3, VIDEO_RATIO video_ratio) throws VEException {
        TELogUtil.i(TAG, "init...");
        int createScene = this.mVideoEditor.createScene(strArr, strArr3, strArr2, (String[][]) null, video_ratio.ordinal());
        if (createScene != 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Create Scene failed, ret = ");
            stringBuilder.append(createScene);
            TELogUtil.e(str, stringBuilder.toString());
            return createScene;
        }
        this.mReverseDone = false;
        this.mVideoOutRes = video_ratio;
        this.mResManager.mAudioPaths = strArr3;
        this.mResManager.mVideoPaths = strArr;
        this.mResManager.mTransitions = strArr2;
        boolean z = (strArr3 == null || strArr3.length == 0) ? false : true;
        this.mbSeparateAV = Boolean.valueOf(z);
        this.mMasterTrackIndex = 0;
        this.mInPoint = 0;
        this.mOutPoint = getDuration();
        try {
            this.mModelsDir = VERuntime.getInstance().getEnv().getDetectModelsDir();
            this.mColorFilterIndex = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"color filter"}, new int[]{0}, new int[]{this.mOutPoint}, new int[]{0}, new int[]{7})[0];
            return createScene;
        } catch (NullPointerException e) {
            throw new VEException(-1, "init failed: VESDK need to be init");
        }
    }

    public int prepare() {
        TELogUtil.i(TAG, "prepare...");
        if (TextUtils.isEmpty(this.mModelsDir)) {
            this.mModelsDir = "";
            TELogUtil.w(TAG, "model dir is empty");
        }
        int prepareEngine = this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
        int[] initResolution = this.mVideoEditor.getInitResolution();
        this.mInitSize.width = initResolution[0];
        this.mInitSize.height = initResolution[1];
        setBackgroundColor(this.mBackGroundColor);
        return prepareEngine;
    }

    public void setLoopPlay(boolean z) {
        this.mVideoEditor.setLooping(z);
    }

    public void setCrop(int i, int i2, int i3, int i4) {
        this.mVideoEditor.setCrop(i, i2, i3, i4);
    }

    @OnLifecycleEvent(Event.ON_DESTROY)
    public void destroy() {
        TELogUtil.i(TAG, "onDestroy...");
        if (this.mSurfaceView != null) {
            this.mSurfaceView.getHolder().removeCallback(this.mSurfaceCallback);
        } else if (this.mTextureView != null && this.mTextureView.getSurfaceTextureListener() == this.mTextureListener) {
            this.mTextureView.setSurfaceTextureListener(null);
        }
        this.mSurfaceView = null;
        this.mTextureView = null;
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setOpenGLListeners(null);
            this.mVideoEditor.setInfoListener(null);
            this.mVideoEditor.setErrorListener(null);
            this.mVideoEditor.destroyEngine();
        }
        this.mResManager = null;
    }

    public VEState getState() throws VEException {
        if (this.mVideoEditor != null) {
            int curState = this.mVideoEditor.getCurState();
            if (curState != -1) {
                return VEState.valueOf(curState);
            }
            throw new VEException(VEResult.TER_INVALID_STAT, " native video editor is null");
        }
        throw new VEException(VEResult.TER_INVALID_STAT, "video editor is null");
    }

    public int enableReversePlay(boolean z) {
        if (!this.mReverseDone) {
            return -100;
        }
        if (this.mResManager.mReverseVideoPath == null || this.mResManager.mReverseVideoPath.length <= 0) {
            return VEResult.TER_INVALID_STAT;
        }
        String[] strArr;
        this.mVideoEditor.stop();
        if (z) {
            strArr = this.mResManager.mReverseVideoPath;
        } else {
            strArr = this.mResManager.mVideoPaths;
        }
        int updateTrackClips = this.mVideoEditor.updateTrackClips(0, 0, strArr);
        if (updateTrackClips != 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Create Scene failed, ret = ");
            stringBuilder.append(updateTrackClips);
            TELogUtil.e(str, stringBuilder.toString());
            return updateTrackClips;
        }
        this.mVideoEditor.updateTrackFilter(0, 0, z != this.mBReversePlay);
        this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
        seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
        this.mBReversePlay = z;
        return 0;
    }

    public String[] getReverseVideoPaths() {
        if (this.mReverseDone) {
            return this.mResManager.mReverseVideoPath;
        }
        return null;
    }

    public int setReverseVideoPaths(String[] strArr) {
        if (strArr == null || strArr.length <= 0) {
            return -100;
        }
        if (this.mResManager != null) {
            this.mResManager.mReverseVideoPath = strArr;
            this.mReverseDone = true;
        }
        return VEResult.TER_INVALID_STAT;
    }

    public int play() {
        TELogUtil.w(TAG, "play...");
        return this.mVideoEditor.start();
    }

    public int pause() {
        TELogUtil.w(TAG, "pause...");
        return this.mVideoEditor.pause();
    }

    public int setScaleMode(SCALE_MODE scale_mode) {
        TELogUtil.w(TAG, "setScaleMode...");
        this.mVideoEditor.setScaleMode(scale_mode.ordinal());
        return 0;
    }

    public int seek(int i, SEEK_MODE seek_mode) {
        TELogUtil.w(TAG, "seek...");
        return this.mVideoEditor.seek(i, this.mSurfaceWidth, this.mSurfaceHeight, seek_mode.ordinal());
    }

    public int getDuration() {
        return this.mVideoEditor.getDuration();
    }

    public int getCurPosition() {
        return this.mVideoEditor.getCurPosition();
    }

    public int addAudioTrack(String str, int i, int i2, boolean z) {
        TELogUtil.w(TAG, "addAudioTrack...");
        if (TextUtils.isEmpty(str) || i2 <= i || i < 0) {
            return -100;
        }
        return this.mVideoEditor.addAudioTrack(str, 0, i2 - i, i, i2, z);
    }

    public int updateAudioTrack(int i, int i2, int i3, boolean z) {
        TELogUtil.w(TAG, "updateAudioTrack...");
        if (i < 0 || i3 <= i2 || i2 < 0) {
            return -100;
        }
        return this.mVideoEditor.updateAudioTrack(i, 0, i3 - i2, i2, i3, z);
    }

    public int deleteAudioTrack(int i) {
        TELogUtil.w(TAG, "deleteAudioTrack...");
        if (i >= 0) {
            return this.mVideoEditor.deleteAudioTrack(i);
        }
        return -100;
    }

    public int[] addSegmentVolume(int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, float[] fArr) {
        int length = iArr3.length;
        String[] strArr = new String[length];
        int[] iArr5 = new int[length];
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            strArr[i2] = "audio volume filter";
            iArr5[i2] = 1;
        }
        iArr = this.mVideoEditor.addFilters(iArr, strArr, iArr3, iArr4, iArr2, iArr5);
        while (i < length) {
            TEInterface tEInterface = this.mVideoEditor;
            int i3 = iArr[i];
            String str = AUDIO_VOLUME;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("");
            stringBuilder.append(fArr[i]);
            tEInterface.setFilterParam(i3, str, stringBuilder.toString());
            i++;
        }
        return iArr;
    }

    public int updateSegmentVolume(int i, float f) {
        if (i < 0) {
            return -100;
        }
        if (f < 0.0f) {
            f = 0.0f;
        }
        if (f > 1.0f) {
            f = 1.0f;
        }
        TEInterface tEInterface = this.mVideoEditor;
        String str = AUDIO_VOLUME;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f);
        return tEInterface.setFilterParam(i, str, stringBuilder.toString());
    }

    public int removeSegmentVolume(int i) {
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.removeFilter(new int[]{i});
    }

    public boolean setVolume(int i, int i2, float f) {
        TELogUtil.w(TAG, "setVolume...");
        return this.mVideoEditor.setTrackVolume(i2, i, f);
    }

    public float getVolume(int i, int i2, int i3) {
        TELogUtil.w(TAG, "getVolume...");
        if (i3 < 0 || i3 > getDuration()) {
            return -100.0f;
        }
        return this.mVideoEditor.getTrackVolume(i2, i, i3);
    }

    public int setStickerAnimator(int i, @NonNull VEStickerAnimator vEStickerAnimator) {
        TELogUtil.w(TAG, "addAnimator...");
        if (i < 0 || vEStickerAnimator == null) {
            return -100;
        }
        i = this.mVideoEditor.getStickerFilterIndex(i);
        if (i < 0) {
            return i;
        }
        return this.mVideoEditor.setFilterParam(i, "animator", vEStickerAnimator);
    }

    private int addSticker(Bitmap bitmap, VESize vESize, int i, int i2) {
        return 0;
    }

    public int addSticker(String str, int i, int i2, float f, float f2, float f3, float f4) {
        int i3 = i;
        int i4 = i2;
        TELogUtil.w(TAG, "addSticker...");
        if (i3 > i4 || i3 < 0 || TextUtils.isEmpty(str)) {
            return -100;
        }
        return this.mVideoEditor.addSticker(new String[]{str}, null, new int[]{i3}, new int[]{i4}, (double) f3, (double) f4, (double) f, (double) f2);
    }

    public int deleteSticker(int i) {
        TELogUtil.w(TAG, "deleteSticker...");
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.deleteSticker(i);
    }

    private int addWaterMark(Bitmap[] bitmapArr, int i, VESize vESize, int i2, int i3) {
        return 0;
    }

    public int addWaterMark(String str, double d, double d2, double d3, double d4) {
        TELogUtil.w(TAG, "addWaterMark...");
        return this.mVideoEditor.addWaterMark(new String[]{str}, null, new int[]{0}, new int[]{this.mVideoEditor.getDuration()}, d3, d4, d, d2);
    }

    public int setColorFilter(String str, float f) {
        if (this.mColorFilterIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        if (f < 0.0f || str == null) {
            return -100;
        }
        if (f > 1.0f) {
            f = 1.0f;
        }
        if (this.mCurColorFilter == null) {
            this.mCurColorFilter = new FilterBean();
        }
        if (str.equals(this.mCurColorFilter.getLeftResPath()) && this.mCurColorFilter.getRightResPath().length() == 0 && this.mCurColorFilter.getIntensity() == f && this.mCurColorFilter.getPosition() == 1.0f) {
            return 0;
        }
        this.mCurColorFilter.setLeftResPath(str);
        this.mCurColorFilter.setRightResPath("");
        this.mCurColorFilter.setPosition(1.0f);
        this.mCurColorFilter.setIntensity(f);
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_LEFT, str);
        TEInterface tEInterface = this.mVideoEditor;
        int i = this.mColorFilterIndex;
        String str2 = FILTER_INTENSITY;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f);
        tEInterface.setFilterParam(i, str2, stringBuilder.toString());
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_RIGHT, "");
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_POSITION, "1.0");
        return 0;
    }

    public int setColorFilter(String str, String str2, float f, float f2) {
        if (this.mColorFilterIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        if (f2 < 0.0f || f < 0.0f || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return -100;
        }
        if (f2 > 1.0f) {
            f2 = 1.0f;
        }
        if (f > 1.0f) {
            f = 1.0f;
        }
        if (this.mCurColorFilter == null) {
            this.mCurColorFilter = new FilterBean();
        }
        if (str.equals(this.mCurColorFilter.getLeftResPath()) && str2.equals(this.mCurColorFilter.getRightResPath()) && this.mCurColorFilter.getIntensity() == f2 && this.mCurColorFilter.getPosition() == f) {
            return 0;
        }
        String str3 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("leftFilterPath: ");
        stringBuilder.append(str);
        stringBuilder.append("\nrightFilterPath: ");
        stringBuilder.append(str2);
        stringBuilder.append(" position: ");
        stringBuilder.append(f);
        stringBuilder.append(" intensity: ");
        stringBuilder.append(f2);
        TELogUtil.d(str3, stringBuilder.toString());
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_LEFT, str);
        TEInterface tEInterface = this.mVideoEditor;
        int i = this.mColorFilterIndex;
        String str4 = FILTER_INTENSITY;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("");
        stringBuilder2.append(f2);
        tEInterface.setFilterParam(i, str4, stringBuilder2.toString());
        this.mVideoEditor.setFilterParam(this.mColorFilterIndex, FILTER_PATH_RIGHT, str2);
        tEInterface = this.mVideoEditor;
        int i2 = this.mColorFilterIndex;
        String str5 = FILTER_POSITION;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("");
        stringBuilder3.append(f);
        tEInterface.setFilterParam(i2, str5, stringBuilder3.toString());
        return 0;
    }

    public int enableFilterEffect(int i, String str) {
        if (i < 0 || i > getDuration() || TextUtils.isEmpty(str)) {
            return -100;
        }
        int duration = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"video effect"}, new int[]{i}, new int[]{duration}, new int[]{0}, new int[]{8});
        this.mVideoEditor.setFilterParam(addFilters[0], EFFECT_RES_PATH, str);
        return addFilters[0];
    }

    public int disableFilterEffect(int i, int i2) {
        if (i < 0 || i2 < 0) {
            return -100;
        }
        return this.mVideoEditor.adjustFilterInOut(i, -1, i2);
    }

    public int[] addFilterEffects(int[] iArr, int[] iArr2, String[] strArr) {
        int length = iArr.length;
        int[] iArr3 = new int[length];
        int[] iArr4 = new int[length];
        int[] iArr5 = new int[length];
        String[] strArr2 = new String[length];
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            iArr3[i2] = 0;
            iArr4[i2] = 0;
            strArr2[i2] = "filter effect";
            iArr5[i2] = 8;
        }
        iArr = this.mVideoEditor.addFilters(iArr3, strArr2, iArr, iArr2, iArr4, iArr5);
        while (i < length) {
            this.mVideoEditor.setFilterParam(iArr[i], EFFECT_RES_PATH, strArr[i]);
            i++;
        }
        return iArr;
    }

    public int deleteFilterEffects(int[] iArr) {
        return this.mVideoEditor.removeFilter(iArr);
    }

    public int enableAudioEffect(int i, int i2, int i3, VEAudioEffectBean vEAudioEffectBean) {
        TELogUtil.w(TAG, "enableAudioEffect...");
        int duration = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio effect"}, new int[]{i3}, new int[]{duration}, new int[]{i2}, new int[]{1});
        this.mAudioEffectfilterIndex = addFilters[0];
        setAudioEffectParam(i, i2, addFilters[0], vEAudioEffectBean);
        return addFilters[0];
    }

    public int addRepeatEffect(int i, int i2, int i3, int i4, int i5) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addRepeatEffect... ");
        stringBuilder.append(i);
        stringBuilder.append(" ");
        stringBuilder.append(i2);
        stringBuilder.append(" ");
        stringBuilder.append(i3);
        stringBuilder.append(" ");
        stringBuilder.append(i4);
        stringBuilder.append(" ");
        stringBuilder.append(i5);
        TELogUtil.w(str, stringBuilder.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("pauseSync failed, ret ");
            stringBuilder2.append(pauseSync);
            TELogUtil.i(str2, stringBuilder2.toString());
            return -1;
        }
        pauseSync = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"timeEffect repeating"}, new int[]{i3}, new int[]{pauseSync}, new int[]{i2}, new int[]{6});
        this.mAudioEffectfilterIndex = addFilters[0];
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(i5);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect repeating duration", stringBuilder.toString());
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("");
        stringBuilder3.append(i4);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect repeating times", stringBuilder3.toString());
        this.mVideoEditor.createTimeline();
        return addFilters[0];
    }

    public int deleteRepeatEffect(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("deleteRepeatEffect... ");
        stringBuilder.append(i);
        TELogUtil.w(str, stringBuilder.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("pauseSync failed, ret ");
            stringBuilder.append(pauseSync);
            TELogUtil.i(str2, stringBuilder.toString());
            return -1;
        }
        i = this.mVideoEditor.removeFilter(new int[]{i});
        this.mVideoEditor.createTimeline();
        return i;
    }

    public int addSlowMotionEffect(int i, int i2, int i3, int i4, float f, float f2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addSlowMotionEffect... ");
        stringBuilder.append(i);
        stringBuilder.append(" ");
        stringBuilder.append(i2);
        stringBuilder.append(" ");
        stringBuilder.append(i3);
        stringBuilder.append(" ");
        stringBuilder.append(i4);
        stringBuilder.append(" ");
        stringBuilder.append(f);
        stringBuilder.append(" ");
        stringBuilder.append(f2);
        TELogUtil.w(str, stringBuilder.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("pauseSync failed, ret ");
            stringBuilder2.append(pauseSync);
            TELogUtil.w(str2, stringBuilder2.toString());
            return -1;
        }
        pauseSync = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"timeEffect slow motion"}, new int[]{i3}, new int[]{pauseSync}, new int[]{i2}, new int[]{6});
        this.mAudioEffectfilterIndex = addFilters[0];
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(i4);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion duration", stringBuilder.toString());
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("");
        stringBuilder3.append(f);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion speed", stringBuilder3.toString());
        StringBuilder stringBuilder4 = new StringBuilder();
        stringBuilder4.append("");
        stringBuilder4.append(f2);
        this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect fast motion speed", stringBuilder4.toString());
        this.mVideoEditor.createTimeline();
        return addFilters[0];
    }

    public int deleteSlowEffect(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("deleteSlowEffect... ");
        stringBuilder.append(i);
        TELogUtil.w(str, stringBuilder.toString());
        int pauseSync = this.mVideoEditor.pauseSync();
        if (pauseSync != 0) {
            String str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("pauseSync failed, ret ");
            stringBuilder.append(pauseSync);
            TELogUtil.w(str2, stringBuilder.toString());
            return -1;
        }
        i = this.mVideoEditor.removeFilter(new int[]{i});
        this.mVideoEditor.createTimeline();
        return i;
    }

    public int[] addAudioEffects(int i, int i2, int[] iArr, int[] iArr2, VEAudioEffectBean[] vEAudioEffectBeanArr) {
        TELogUtil.w(TAG, "addAudioEffects...");
        int length = iArr.length;
        int[] iArr3 = new int[length];
        int[] iArr4 = new int[length];
        int[] iArr5 = new int[length];
        String[] strArr = new String[length];
        int i3 = 0;
        for (int i4 = 0; i4 < length; i4++) {
            iArr3[i4] = i;
            iArr4[i4] = i2;
            strArr[i4] = "audio effect";
            iArr5[i4] = 1;
        }
        iArr = this.mVideoEditor.addFilters(iArr3, strArr, iArr, iArr2, iArr4, iArr5);
        while (i3 < length) {
            setAudioEffectParam(i, i2, iArr[i3], vEAudioEffectBeanArr[i3]);
            i3++;
        }
        return iArr;
    }

    private void setAudioEffectParam(int i, int i2, int i3, VEAudioEffectBean vEAudioEffectBean) {
        TELogUtil.w(TAG, "setAudioEffectParam...");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.type);
        this.mVideoEditor.setFilterParam(i3, "audioEffectType", stringBuilder.toString());
        this.mVideoEditor.setFilterParam(i3, "formatShiftOn", vEAudioEffectBean.formatShiftOn ? "1" : "0");
        this.mVideoEditor.setFilterParam(i3, "smoothOn", vEAudioEffectBean.smoothOn ? "1" : "0");
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.processChMode);
        this.mVideoEditor.setFilterParam(i3, "processChMode", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.transientDetectMode);
        this.mVideoEditor.setFilterParam(i3, "transientDetectMode", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.phaseResetMode);
        this.mVideoEditor.setFilterParam(i3, "phaseResetMode", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.phaseAdjustMethod);
        this.mVideoEditor.setFilterParam(i3, "phaseAdjustMethod", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.windowMode);
        this.mVideoEditor.setFilterParam(i3, "windowMode", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.pitchTunerMode);
        this.mVideoEditor.setFilterParam(i3, "pitchTunerMode", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.blockSize);
        this.mVideoEditor.setFilterParam(i3, "blockSize", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.centtone);
        this.mVideoEditor.setFilterParam(i3, "centtone", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.semiton);
        this.mVideoEditor.setFilterParam(i3, "semiton", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.octative);
        this.mVideoEditor.setFilterParam(i3, "octative", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(vEAudioEffectBean.speedRatio);
        this.mVideoEditor.setFilterParam(i3, "speedRatio", stringBuilder.toString());
    }

    @Deprecated
    public int enableAudioEffect(int i, VEAudioEffectBean vEAudioEffectBean) {
        TELogUtil.w(TAG, "enableAudioEffect...");
        this.mAudioEffectfilterIndex = enableAudioEffect(0, this.mbSeparateAV.booleanValue(), i, vEAudioEffectBean);
        return this.mAudioEffectfilterIndex;
    }

    public int disableAudioEffect(int i, int i2) {
        TELogUtil.w(TAG, "disableAudioEffect...");
        if (i == -1) {
            return -100;
        }
        return this.mVideoEditor.adjustFilterInOut(i, -1, i2);
    }

    public int addEqualizer(int i, int i2, int i3, int i4, int i5) {
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio equalizer"}, new int[]{i4}, new int[]{i5}, new int[]{i2}, new int[]{1});
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(i3);
        this.mVideoEditor.setFilterParam(addFilters[0], "preset_id", stringBuilder.toString());
        return addFilters[0];
    }

    public int addReverb(int i, int i2, float f, float f2, float f3, float f4, float f5, int i3, int i4) {
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio reverb"}, new int[]{i3}, new int[]{i4}, new int[]{i2}, new int[]{1});
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f);
        this.mVideoEditor.setFilterParam(addFilters[0], "room_size", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f2);
        this.mVideoEditor.setFilterParam(addFilters[0], "hfDamping", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f3);
        this.mVideoEditor.setFilterParam(addFilters[0], "stereoDepth", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f4);
        this.mVideoEditor.setFilterParam(addFilters[0], "dry", stringBuilder.toString());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("");
        stringBuilder2.append(f5);
        this.mVideoEditor.setFilterParam(addFilters[0], "wet", stringBuilder2.toString());
        return addFilters[0];
    }

    public int addPitchTempo(int i, int i2, float f, float f2, int i3, int i4) {
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{i}, new String[]{"audio pitch tempo"}, new int[]{i3}, new int[]{i4}, new int[]{i2}, new int[]{1});
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(f);
        this.mVideoEditor.setFilterParam(addFilters[0], "pitch_scale", stringBuilder.toString());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("");
        stringBuilder2.append(f2);
        this.mVideoEditor.setFilterParam(addFilters[0], "time_ratio", stringBuilder2.toString());
        return addFilters[0];
    }

    public int deleteAudioFilters(int[] iArr) {
        TELogUtil.w(TAG, "deleteAudioFilter...");
        return this.mVideoEditor.removeFilter(iArr);
    }

    public int deleteWaterMark(int i) {
        return 0;
    }

    public void compile(String str, String str2, VEVideoEncodeSettings vEVideoEncodeSettings) {
        this.mOutputFile = str;
        this.mlCompileStartTime = System.currentTimeMillis();
        TELogUtil.w(TAG, "compile...");
        this.mVideoEditor.stop();
        switch (vEVideoEncodeSettings.getCompileType()) {
            case COMPILE_TYPE_MP4:
                this.mVideoEditor.setCompileType(1);
                break;
            case COMPILE_TYPE_GIF:
                this.mVideoEditor.setCompileType(2);
                break;
            default:
                this.mVideoEditor.setCompileType(1);
                break;
        }
        this.mVideoEditor.setCompileFps(vEVideoEncodeSettings.getFps());
        this.mVideoEditor.setVideoCompileBitrate(vEVideoEncodeSettings.getBitrateMode().ordinal(), vEVideoEncodeSettings.getBitrateValue());
        this.mVideoEditor.setEngineCompilePath(str, str2);
        this.mVideoEditor.setResizer(vEVideoEncodeSettings.getResizeMode(), vEVideoEncodeSettings.getResizeX(), vEVideoEncodeSettings.getResizeY());
        this.mVideoEditor.setUsrRotate(vEVideoEncodeSettings.getRotate());
        this.mVideoEditor.setUseHwEnc(vEVideoEncodeSettings.isHwEnc());
        this.mVideoEditor.setEncGopSize(vEVideoEncodeSettings.getGopSize());
        this.mVideoEditor.setWidthHeight(vEVideoEncodeSettings.getVideoRes().width, vEVideoEncodeSettings.getVideoRes().height);
        if (this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 1, this.mModelsDir) == 0) {
            this.mVideoEditor.start();
        }
    }

    private void updateInitDisplaySize() {
        if (((float) this.mInitSize.width) / ((float) this.mInitSize.height) > ((float) this.mSurfaceWidth) / ((float) this.mSurfaceHeight)) {
            this.mInitDisplayWidth = this.mSurfaceWidth;
            this.mInitDisplayHeight = (int) (((float) this.mSurfaceWidth) / (((float) this.mInitSize.width) / ((float) this.mInitSize.height)));
            return;
        }
        this.mInitDisplayHeight = this.mSurfaceHeight;
        this.mInitDisplayWidth = (int) (((float) this.mSurfaceHeight) / (((float) this.mInitSize.height) / ((float) this.mInitSize.width)));
    }
}
