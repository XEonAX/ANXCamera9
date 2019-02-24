package com.ss.android.vesdk;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback2;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.android.camera.CameraSettings;
import com.ss.android.medialib.FFMpegInvoker;
import com.ss.android.ttve.common.TECommonCallback;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.model.FilterBean;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.monitor.TEMonitor;
import com.ss.android.ttve.monitor.TEMonitorKeys;
import com.ss.android.ttve.nativePort.NativeCallbacks.IOpenGLCallback;
import com.ss.android.ttve.nativePort.TEInterface;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.vesdk.keyvaluepair.VEKeyValue;
import com.ss.android.vesdk.runtime.VEEditorResManager;
import com.ss.android.vesdk.runtime.VERuntime;
import java.io.File;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class VEEditor implements OnFrameAvailableListener {
    private static final String AUDIO_VOLUME = "audio volume";
    private static final String EFFECT_RES_PATH = "effect res path";
    private static final int ENGINE_PREPARE_FOR_COMPILE = 1;
    private static final int ENGINE_PREPARE_FOR_COMPILE_WITHWATERMARK = 2;
    private static final int ENGINE_PREPARE_FOR_PLAYBACK = 0;
    private static final String ENTITY_ALPHA = "entity alpha";
    private static final String ENTITY_END_TIME = "entity end time";
    private static final String ENTITY_LAYER = "entity layer";
    private static final String ENTITY_PATH = "entity path";
    private static final String ENTITY_POSITION_X = "entity position x";
    private static final String ENTITY_POSITION_Y = "entity position y";
    private static final String ENTITY_ROTATION = "entity rotation";
    private static final String ENTITY_SCALE_X = "entity scale x";
    private static final String ENTITY_SCALE_Y = "entity scale y";
    private static final String ENTITY_START_TIME = "entity start time";
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
    private int mAudioEffectfilterIndex = -1;
    private boolean mBCompileHighQualityGif = false;
    private boolean mBReversePlay = false;
    @ColorInt
    private int mBackGroundColor = ViewCompat.MEASURED_STATE_MASK;
    private boolean mCancelReverse = false;
    private int mColorFilterIndex = -1;
    private String mCompileType = "mp4";
    private FilterBean mCurColorFilter;
    private int mInPoint;
    private int mInitDisplayHeight = 0;
    private int mInitDisplayWidth = 0;
    private VESize mInitSize = new VESize(-1, -1);
    private int mMasterTrackIndex = 0;
    private String mModelsDir;
    private IOpenGLCallback mOpenGLCallback = new IOpenGLCallback() {
        public int onOpenGLCreate(int i) {
            String str = VEEditor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onOpenGLCreate: ret = ");
            stringBuilder.append(i);
            TELogUtil.d(str, stringBuilder.toString());
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
            return 0;
        }

        public int onPreviewSurface(int i) {
            return 0;
        }
    };
    private int mOutPoint;
    private String mOutputFile = null;
    private ExecutorService mPool = Executors.newCachedThreadPool();
    private VEEditorResManager mResManager;
    private boolean mReverseDone = false;
    private Surface mSurface;
    private Callback2 mSurfaceCallback = new Callback2() {
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
            VEEditor.this.onSurfaceChanged(i2, i3);
        }

        public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
            VEEditor.this.onSurfaceDestroyed();
        }
    };
    private int mSurfaceHeight = 0;
    private SurfaceTexture mSurfaceTexture;
    private SurfaceView mSurfaceView;
    private int mSurfaceWidth = 0;
    private final SurfaceTextureListener mTextureListener = new SurfaceTextureListener() {
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
    private TextureView mTextureView;
    private TEInterface mVideoEditor = TEInterface.createEngine();
    private VIDEO_RATIO mVideoOutRes;
    private Boolean mbSeparateAV = Boolean.valueOf(false);
    private int miFrameCount = 0;
    private long mlCompileStartTime = 0;
    private long mlCurTimeMS = 0;
    private long mlLastTimeMS = 0;
    private Mp4ToHighQualityGIFConverter mp4ToGIFConverter = null;
    private String waterMarkFile;
    private double waterMarkHeight;
    private double waterMarkOffsetX;
    private double waterMarkOffsetY;
    private double waterMarkWidth;

    private class Mp4ToHighQualityGIFConverter implements Runnable {
        VECommonCallback mCallback;
        String mInputFile;
        boolean mIsRunning;
        String mOutputFile;
        String mPaletteFile;
        private String waterMarkFile;
        private int waterMarkHeight;
        private int waterMarkOffsetX;
        private int waterMarkOffsetY;
        private int waterMarkWidth;

        Mp4ToHighQualityGIFConverter() {
            this.mIsRunning = false;
            this.waterMarkFile = null;
            this.waterMarkWidth = 50;
            this.waterMarkHeight = 50;
            this.waterMarkOffsetX = 100;
            this.waterMarkOffsetY = 100;
            this.mPaletteFile = null;
            this.mInputFile = null;
            this.mOutputFile = null;
            this.mCallback = null;
        }

        Mp4ToHighQualityGIFConverter(String str, String str2, VECommonCallback vECommonCallback) {
            this.mIsRunning = false;
            this.waterMarkFile = null;
            this.waterMarkWidth = 50;
            this.waterMarkHeight = 50;
            this.waterMarkOffsetX = 100;
            this.waterMarkOffsetY = 100;
            this.mInputFile = str;
            this.mOutputFile = str2;
            this.mCallback = vECommonCallback;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mOutputFile);
            stringBuilder.append(".png");
            this.mPaletteFile = stringBuilder.toString();
        }

        public void setWaterMarkFile(String str) {
            this.waterMarkFile = str;
        }

        public void setWaterMarkWidth(int i) {
            this.waterMarkWidth = i;
        }

        public void setWaterMarkHeight(int i) {
            this.waterMarkHeight = i;
        }

        public void setWaterMarkOffsetX(int i) {
            this.waterMarkOffsetX = i;
        }

        public void setWaterMarkOffsetY(int i) {
            this.waterMarkOffsetY = i;
        }

        public void setInputFile(String str) {
            this.mInputFile = str;
        }

        public void setOutputFile(String str) {
            this.mOutputFile = str;
            if (TextUtils.isEmpty(this.mOutputFile)) {
                this.mPaletteFile = null;
                return;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(new File(this.mOutputFile).getParent());
            stringBuilder.append(File.separatorChar);
            stringBuilder.append("palette.png");
            this.mPaletteFile = stringBuilder.toString();
        }

        public void setCallback(VECommonCallback vECommonCallback) {
            this.mCallback = vECommonCallback;
        }

        public void run() {
            if (TextUtils.isEmpty(this.mInputFile) || TextUtils.isEmpty(this.mOutputFile) || this.mIsRunning) {
                if (this.mCallback != null) {
                    this.mCallback.onCallback(4103, VEResult.TER_BAD_FILE, 0.0f, "");
                }
                return;
            }
            this.mIsRunning = true;
            int executeFFmpegCommand = TEVideoUtils.executeFFmpegCommand(String.format("ffmpeg -y -i %s -vf palettegen %s", new Object[]{this.mInputFile, this.mPaletteFile}), null);
            if (executeFFmpegCommand != 0) {
                this.mIsRunning = false;
                if (this.mCallback != null) {
                    this.mCallback.onCallback(4103, executeFFmpegCommand, 0.0f, "");
                }
                return;
            }
            String format;
            if (this.waterMarkFile != null) {
                format = String.format(Locale.US, "ffmpeg -y -i %s -i %s -i %s -filter_complex [2:v]scale=w=%d:h=%d[o0];[0:v][o0]overlay=x=%d-w/2:y=%d-h/2[o1];[o1][1:v]paletteuse -f gif %s", new Object[]{this.mInputFile, this.mPaletteFile, this.waterMarkFile, Integer.valueOf(this.waterMarkWidth), Integer.valueOf(this.waterMarkHeight), Integer.valueOf(this.waterMarkOffsetX), Integer.valueOf(this.waterMarkOffsetY), this.mOutputFile});
            } else {
                format = String.format(Locale.US, "ffmpeg -y -i %s -i %s -lavfi paletteuse -f gif %s", new Object[]{this.mInputFile, this.mPaletteFile, this.mOutputFile});
            }
            int executeFFmpegCommand2 = TEVideoUtils.executeFFmpegCommand(format, null);
            if (this.mCallback != null) {
                this.mCallback.onCallback(4103, executeFFmpegCommand2, 0.0f, "");
            }
            this.mIsRunning = false;
        }
    }

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
        this.mVideoEditor.releasePreviewSurface();
    }

    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        TELogUtil.v(TAG, "onFrameAvailable...");
    }

    private void onSurfaceCreated(Surface surface) {
        TELogUtil.i(TAG, "surfaceCreated...");
        this.mVideoEditor.setPreviewSurface(surface);
    }

    private void onSurfaceChanged(int i, int i2) {
        TELogUtil.i(TAG, "onSurfaceChanged...");
        if (i != 0 && i2 != 0) {
            this.mVideoEditor.setSurfaceSize(i, i2);
        }
    }

    private void onMonitorCompile() {
        TEMonitor.perfLong(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_TIME, System.currentTimeMillis() - this.mlCompileStartTime);
        if (checkFileExists(this.mOutputFile)) {
            int[] iArr = new int[10];
            if (TEVideoUtils.getVideoFileInfo(this.mOutputFile, iArr) == 0) {
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_SIZE, (((double) new File(this.mOutputFile).length()) / 1024.0d) / 1024.0d);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FILE_DURATION, (double) iArr[3]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_BIT_RATE, (double) iArr[6]);
                TEMonitor.perfDouble(TEMonitorKeys.TETRACKER_KEY_COMPOSITION_FPS, (double) iArr[7]);
                String str = TEMonitorKeys.TETRACKER_KEY_COMPOSITION_RESOLUTION;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("");
                stringBuilder.append(iArr[0]);
                stringBuilder.append("x");
                stringBuilder.append(iArr[1]);
                TEMonitor.perfString(str, stringBuilder.toString());
            }
        }
        TEMonitor.report(TEMonitor.MONITOR_ACTION_COMPILE);
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_composition_finish_file", this.mCompileType).add("iesve_veeditor_composition_finish_result", "succ").add("iesve_veeditor_composition_finish_reason", "");
        MonitorUtils.monitorStatistics("iesve_veeditor_composition_finish", 1, vEKeyValue);
    }

    public VEEditor(@NonNull String str) throws VEException {
        if (TextUtils.isEmpty(str)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("workspace is: ");
            stringBuilder.append(str);
            throw new VEException(-100, stringBuilder.toString());
        }
        TELogUtil.i(TAG, "VEEditor no surface");
        this.mResManager = new VEEditorResManager(str);
        MonitorUtils.monitorStatistics("iesve_veeditor_offscreen", 1, null);
    }

    public VEEditor(@NonNull String str, @NonNull SurfaceView surfaceView) {
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

    public VEEditor(@NonNull String str, @NonNull TextureView textureView) throws VEException {
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

    public void setOnErrorListener(@NonNull final VECommonCallback vECommonCallback) {
        TECommonCallback anonymousClass4 = new TECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                vECommonCallback.onCallback(i, i2, f, str);
            }
        };
        TELogUtil.i(TAG, "setOnErrorListener...");
        synchronized (this) {
            if (this.mVideoEditor.getNativeHandler() == 0) {
                return;
            }
            this.mVideoEditor.setErrorListener(anonymousClass4);
        }
    }

    public void setOnInfoListener(@NonNull final VECommonCallback vECommonCallback) {
        TECommonCallback anonymousClass5 = new TECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                if (i != 4103) {
                    vECommonCallback.onCallback(i, i2, f, str);
                } else if (VEEditor.this.mBCompileHighQualityGif) {
                    VEEditor.this.mp4ToGIFConverter.setCallback(vECommonCallback);
                    new Thread(VEEditor.this.mp4ToGIFConverter).start();
                    VEEditor.this.mBCompileHighQualityGif = false;
                } else {
                    if (i2 == 0) {
                        VEEditor.this.onMonitorCompile();
                    }
                    vECommonCallback.onCallback(i, i2, f, str);
                }
            }
        };
        TELogUtil.i(TAG, "setOnInfoListener...");
        synchronized (this) {
            if (this.mVideoEditor.getNativeHandler() == 0) {
                return;
            }
            this.mVideoEditor.setInfoListener(anonymousClass5);
        }
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
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_video_scale_width", f).add("iesve_veeditor_video_scale_heigh", f2);
        MonitorUtils.monitorStatistics("iesve_veeditor_video_scale", 1, vEKeyValue);
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

    public void clearDisplay(int i) {
        this.mVideoEditor.clearDisplay(i);
    }

    public void invalidate() {
        this.mVideoEditor.setDisplayState(-1.0f, -1.0f, -1.0f, -1.0f, -80000, -80000, true);
    }

    public int setInOut(int i, int i2) {
        synchronized (this) {
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_cut_duration", i2 - i);
            MonitorUtils.monitorStatistics("iesve_veeditor_cut_duration", 1, vEKeyValue);
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
            i = this.mVideoEditor.prepareEngine(i, i2, 0, this.mModelsDir);
        }
        return i;
    }

    public int init(String[] strArr, String[] strArr2, String[] strArr3, VIDEO_RATIO video_ratio) throws VEException {
        synchronized (this) {
            TELogUtil.i(TAG, "init...");
            int createScene = this.mVideoEditor.createScene(this.mResManager.getWorkspace(), strArr, strArr3, strArr2, (String[][]) null, video_ratio.ordinal());
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
    }

    public void setExpandLastFrame(boolean z) {
        this.mVideoEditor.setExpandLastFrame(z);
    }

    public int init2(String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, String[] strArr3, int[] iArr3, int[] iArr4, VIDEO_RATIO video_ratio) throws VEException {
        String[] strArr4 = strArr3;
        synchronized (this) {
            TELogUtil.i(TAG, "init...");
            int createScene2 = this.mVideoEditor.createScene2(strArr, iArr, iArr2, strArr4, iArr3, iArr4, strArr2, (String[][]) null, video_ratio.ordinal());
            if (createScene2 != 0) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Create Scene failed, ret = ");
                stringBuilder.append(createScene2);
                TELogUtil.e(str, stringBuilder.toString());
                return createScene2;
            }
            this.mReverseDone = false;
            this.mVideoOutRes = video_ratio;
            this.mResManager.mAudioPaths = strArr4;
            this.mResManager.mVideoPaths = strArr;
            this.mResManager.mTransitions = strArr2;
            boolean z = (strArr4 == null || strArr4.length == 0) ? false : true;
            this.mbSeparateAV = Boolean.valueOf(z);
            this.mMasterTrackIndex = 0;
            this.mInPoint = 0;
            this.mOutPoint = getDuration();
            try {
                this.mModelsDir = VERuntime.getInstance().getEnv().getDetectModelsDir();
                this.mColorFilterIndex = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"color filter"}, new int[]{0}, new int[]{this.mOutPoint}, new int[]{0}, new int[]{7})[0];
                return createScene2;
            } catch (NullPointerException e) {
                throw new VEException(-1, "init failed: VESDK need to be init");
            }
        }
    }

    public int changeRes(String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, String[] strArr3, int[] iArr3, int[] iArr4, VIDEO_RATIO video_ratio) throws VEException {
        TELogUtil.i(TAG, "reInit...");
        int stop = this.mVideoEditor.stop();
        if (stop != 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("stop in changeRes failed, ret = ");
            stringBuilder.append(stop);
            TELogUtil.i(str, stringBuilder.toString());
            return -1;
        }
        int init2 = init2(strArr, iArr, iArr2, strArr2, strArr3, iArr3, iArr4, video_ratio);
        if (init2 != 0) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("init2 in changeRes failed, ret = ");
            stringBuilder2.append(init2);
            TELogUtil.e(str2, stringBuilder2.toString());
            return init2;
        }
        this.mVideoEditor.createTimeline();
        this.mInPoint = 0;
        this.mOutPoint = this.mVideoEditor.getDuration();
        return this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, -1, this.mModelsDir);
    }

    @Nullable
    public VEEditorModel save() {
        String save = this.mVideoEditor.save();
        if (TextUtils.isEmpty(save) || !checkFileExists(save)) {
            return null;
        }
        VEEditorModel vEEditorModel = new VEEditorModel();
        vEEditorModel.projectXML = save;
        vEEditorModel.inPoint = this.mInPoint;
        vEEditorModel.outputPoint = this.mOutPoint;
        vEEditorModel.reverseDone = this.mReverseDone;
        vEEditorModel.videoOutRes = this.mVideoOutRes;
        vEEditorModel.separateAV = this.mbSeparateAV.booleanValue();
        vEEditorModel.masterTrackIndex = this.mMasterTrackIndex;
        vEEditorModel.audioEffectFilterIndex = this.mAudioEffectfilterIndex;
        vEEditorModel.modelDir = this.mModelsDir;
        vEEditorModel.colorFilterIndex = this.mColorFilterIndex;
        vEEditorModel.videoPaths = this.mResManager.mVideoPaths;
        vEEditorModel.audioPaths = this.mResManager.mAudioPaths;
        vEEditorModel.transitions = this.mResManager.mTransitions;
        vEEditorModel.backgroundColor = this.mBackGroundColor;
        vEEditorModel.outputFile = this.mOutputFile;
        vEEditorModel.watermarkFile = this.waterMarkFile;
        vEEditorModel.watermarkWidth = this.waterMarkWidth;
        vEEditorModel.watermarkHeight = this.waterMarkHeight;
        vEEditorModel.watermarkOffsetX = this.waterMarkOffsetX;
        vEEditorModel.watermarkOffsetY = this.waterMarkOffsetY;
        if (this.mCurColorFilter != null) {
            vEEditorModel.colorFilterLeftPath = this.mCurColorFilter.getLeftResPath();
            vEEditorModel.colorFilterRightPath = this.mCurColorFilter.getRightResPath();
            vEEditorModel.colorFilterPosition = this.mCurColorFilter.getPosition();
            vEEditorModel.colorFilterIntensity = this.mCurColorFilter.getIntensity();
        }
        return vEEditorModel;
    }

    public boolean restore(@NonNull VEEditorModel vEEditorModel) {
        String str = vEEditorModel.projectXML;
        String str2;
        if (checkFileExists(str)) {
            int restore = this.mVideoEditor.restore(str);
            if (restore < 0) {
                str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("video editor restore failed: result: ");
                stringBuilder.append(restore);
                stringBuilder.append(", project xml: ");
                stringBuilder.append(str);
                TELogUtil.e(str2, stringBuilder.toString());
                return false;
            }
            this.mInPoint = vEEditorModel.inPoint;
            this.mOutPoint = vEEditorModel.outputPoint;
            this.mReverseDone = vEEditorModel.reverseDone;
            this.mVideoOutRes = vEEditorModel.videoOutRes;
            this.mbSeparateAV = Boolean.valueOf(vEEditorModel.separateAV);
            this.mMasterTrackIndex = vEEditorModel.masterTrackIndex;
            this.mAudioEffectfilterIndex = vEEditorModel.audioEffectFilterIndex;
            this.mModelsDir = vEEditorModel.modelDir;
            this.mColorFilterIndex = vEEditorModel.colorFilterIndex;
            this.mResManager.mVideoPaths = vEEditorModel.videoPaths;
            this.mResManager.mAudioPaths = vEEditorModel.audioPaths;
            this.mResManager.mTransitions = vEEditorModel.transitions;
            this.mBackGroundColor = vEEditorModel.backgroundColor;
            this.mOutputFile = vEEditorModel.outputFile;
            this.waterMarkFile = vEEditorModel.watermarkFile;
            this.waterMarkWidth = vEEditorModel.watermarkWidth;
            this.waterMarkHeight = vEEditorModel.watermarkHeight;
            this.waterMarkOffsetX = vEEditorModel.watermarkOffsetX;
            this.waterMarkOffsetY = vEEditorModel.watermarkOffsetY;
            if (TextUtils.isEmpty(vEEditorModel.colorFilterRightPath)) {
                setColorFilter(vEEditorModel.colorFilterLeftPath, vEEditorModel.colorFilterIntensity);
            } else {
                setColorFilter(vEEditorModel.colorFilterLeftPath, vEEditorModel.colorFilterRightPath, vEEditorModel.colorFilterPosition, vEEditorModel.colorFilterIntensity);
            }
            return true;
        }
        str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("projectXML not exists: ");
        stringBuilder2.append(str);
        TELogUtil.e(str2, stringBuilder2.toString());
        return false;
    }

    public int prepare() {
        int prepareEngine;
        synchronized (this) {
            TELogUtil.i(TAG, "prepare...");
            if (TextUtils.isEmpty(this.mModelsDir)) {
                this.mModelsDir = "";
                TELogUtil.w(TAG, "model dir is empty");
            }
            prepareEngine = this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
            int[] initResolution = this.mVideoEditor.getInitResolution();
            this.mInitSize.width = initResolution[0];
            this.mInitSize.height = initResolution[1];
            setBackgroundColor(this.mBackGroundColor);
        }
        return prepareEngine;
    }

    public void setLoopPlay(boolean z) {
        TELogUtil.i(TAG, "setLoopPlay");
        this.mVideoEditor.setLooping(z);
    }

    public void setCrop(int i, int i2, int i3, int i4) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veeditor_cut_scale", i4 / i3);
        MonitorUtils.monitorStatistics("iesve_veeditor_cut_scale", 1, vEKeyValue);
        this.mVideoEditor.setCrop(i, i2, i3, i4);
    }

    public void destroy() {
        synchronized (this) {
            TELogUtil.i(TAG, "onDestroy...");
            if (this.mVideoEditor.getNativeHandler() == 0) {
                return;
            }
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

    /* JADX WARNING: Missing block: B:30:0x0086, code:
            return 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int enableReversePlay(boolean z) {
        synchronized (this) {
            if (!this.mReverseDone) {
                return -100;
            } else if (this.mResManager == null || this.mResManager.mReverseVideoPath == null || this.mResManager.mReverseVideoPath.length <= 0) {
                return VEResult.TER_INVALID_STAT;
            } else {
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
                this.mVideoEditor.createTimeline();
                this.mVideoEditor.prepareEngine(0, this.mVideoEditor.getDuration(), 0, this.mModelsDir);
                seek(0, SEEK_MODE.EDITOR_SEEK_FLAG_LastSeek);
                this.mBReversePlay = z;
                if (z) {
                    VEKeyValue vEKeyValue = new VEKeyValue();
                    vEKeyValue.add("iesve_veeditor_time_effect_id", "reverse");
                    MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
                }
            }
        }
    }

    public int genReverseVideo() throws VEException {
        TELogUtil.d(TAG, "reverse...");
        if (this.mResManager.mVideoPaths == null || this.mResManager.mVideoPaths.length <= 0) {
            return -100;
        }
        FFMpegInvoker fFMpegInvoker = new FFMpegInvoker();
        this.mResManager.mReverseVideoPath = new String[this.mResManager.mVideoPaths.length];
        int i = 0;
        while (i < this.mResManager.mVideoPaths.length) {
            String genReverseVideoPath = this.mResManager.genReverseVideoPath(i);
            int addFastReverseVideo = fFMpegInvoker.addFastReverseVideo(this.mResManager.mVideoPaths[i], genReverseVideoPath);
            if (this.mCancelReverse) {
                this.mCancelReverse = false;
                return -1;
            } else if (addFastReverseVideo == 0) {
                this.mResManager.mReverseVideoPath[i] = genReverseVideoPath;
                i++;
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("reverse mResManager.mVideoPaths[i] failed: ");
                stringBuilder.append(addFastReverseVideo);
                throw new VEException(-1, stringBuilder.toString());
            }
        }
        this.mReverseDone = true;
        return 0;
    }

    public void genReverseVideoAsync(@NonNull final VEReverseCallback vEReverseCallback) {
        TELogUtil.d(TAG, "reverse async...");
        this.mPool.execute(new Runnable() {
            public void run() {
                if (VEEditor.this.mResManager.mVideoPaths == null || VEEditor.this.mResManager.mVideoPaths.length <= 0) {
                    TELogUtil.e(VEEditor.TAG, "reverse failed, invalid params!");
                    vEReverseCallback.onReverseFinish(-100);
                }
                FFMpegInvoker fFMpegInvoker = new FFMpegInvoker();
                VEEditor.this.mResManager.mReverseVideoPath = new String[VEEditor.this.mResManager.mVideoPaths.length];
                for (int i = 0; i < VEEditor.this.mResManager.mVideoPaths.length; i++) {
                    String genReverseVideoPath = VEEditor.this.mResManager.genReverseVideoPath(i);
                    int addFastReverseVideo = fFMpegInvoker.addFastReverseVideo(VEEditor.this.mResManager.mVideoPaths[i], genReverseVideoPath);
                    if (VEEditor.this.mCancelReverse) {
                        TELogUtil.e(VEEditor.TAG, "reverse failed, reverse has been canceled");
                        VEEditor.this.mCancelReverse = false;
                        vEReverseCallback.onReverseFinish(-1);
                    }
                    if (addFastReverseVideo != 0) {
                        try {
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("reverse mResManager.mVideoPaths[i] failed: ");
                            stringBuilder.append(addFastReverseVideo);
                            throw new VEException(-1, stringBuilder.toString());
                        } catch (VEException e) {
                            String str = VEEditor.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("reverse failed, result code: ");
                            stringBuilder2.append(addFastReverseVideo);
                            TELogUtil.e(str, stringBuilder2.toString());
                        }
                    }
                    VEEditor.this.mResManager.mReverseVideoPath[i] = genReverseVideoPath;
                }
                VEEditor.this.mReverseDone = true;
                vEReverseCallback.onReverseFinish(0);
            }
        });
    }

    public int cancelReverseVideo() {
        if (this.mReverseDone) {
            return VEResult.TER_INVALID_STAT;
        }
        synchronized (this) {
            new FFMpegInvoker().stopReverseVideo();
            this.mCancelReverse = true;
        }
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

    public int pauseSync() {
        TELogUtil.i(TAG, "pauseSync...");
        return this.mVideoEditor.pauseSync();
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

    /* JADX WARNING: Missing block: B:12:0x002e, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int addAudioTrack(String str, int i, int i2, boolean z) {
        synchronized (this) {
            TELogUtil.w(TAG, "addAudioTrack...");
            if (TextUtils.isEmpty(str)) {
                return -100;
            } else if (i2 <= i || i < 0) {
            } else {
                MonitorUtils.monitorStatistics("iesve_veeditor_import_music", 1, null);
                int addAudioTrack = this.mVideoEditor.addAudioTrack(str, 0, i2 - i, i, i2, z);
                return addAudioTrack;
            }
        }
    }

    /* JADX WARNING: Missing block: B:14:0x002b, code:
            return -100;
     */
    /* JADX WARNING: Missing block: B:16:0x002d, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z) {
        synchronized (this) {
            TELogUtil.i(TAG, "addAudioTrack...");
            if (TextUtils.isEmpty(str)) {
                return -100;
            } else if (i2 <= i || i < 0) {
            } else if (i4 <= i3 || i3 < 0) {
            } else {
                int addAudioTrack = this.mVideoEditor.addAudioTrack(str, i3, i4, i, i2, z);
                return addAudioTrack;
            }
        }
    }

    /* JADX WARNING: Missing block: B:17:0x0033, code:
            return -100;
     */
    /* JADX WARNING: Missing block: B:19:0x0035, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z, int i5, int i6) {
        int i7 = i;
        int i8 = i3;
        synchronized (this) {
            TELogUtil.i(TAG, "addAudioTrack...");
            if (TextUtils.isEmpty(str)) {
                return -100;
            }
            int i9 = i2;
            if (i9 <= i7 || i7 < 0) {
            } else {
                int i10 = i4;
                if (i10 <= i8 || i8 < 0) {
                } else {
                    i7 = this.mVideoEditor.addAudioTrack(str, i8, i10, i7, i9, z, i5, i6);
                    return i7;
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:12:0x0023, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int updateAudioTrack(int i, int i2, int i3, boolean z) {
        synchronized (this) {
            TELogUtil.w(TAG, "updateAudioTrack...");
            if (i < 0) {
                return -100;
            } else if (i3 <= i2 || i2 < 0) {
            } else {
                i = this.mVideoEditor.updateAudioTrack(i, 0, i3 - i2, i2, i3, z);
                return i;
            }
        }
    }

    /* JADX WARNING: Missing block: B:14:0x0027, code:
            return -100;
     */
    /* JADX WARNING: Missing block: B:16:0x0029, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z) {
        synchronized (this) {
            TELogUtil.i(TAG, "updateAudioTrack...");
            if (i < 0) {
                return -100;
            } else if (i3 <= i2 || i2 < 0) {
            } else if (i5 <= i4 || i4 < 0) {
            } else {
                i = this.mVideoEditor.updateAudioTrack(i, i4, i5, i2, i3, z);
                return i;
            }
        }
    }

    /* JADX WARNING: Missing block: B:20:0x0034, code:
            return -100;
     */
    /* JADX WARNING: Missing block: B:22:0x0036, code:
            return -100;
     */
    /* JADX WARNING: Missing block: B:24:0x0038, code:
            return -100;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z, int i6, int i7) {
        int i8 = i2;
        int i9 = i4;
        int i10 = i6;
        synchronized (this) {
            TELogUtil.i(TAG, "updateAudioTrack...");
            if (i < 0) {
                return -100;
            }
            int i11 = i3;
            if (i11 <= i8 || i8 < 0) {
            } else {
                int i12 = i5;
                if (i12 <= i9 || i9 < 0) {
                } else {
                    int i13 = i7;
                    if (i13 <= i10 || i10 < 0) {
                    } else {
                        i8 = this.mVideoEditor.updateAudioTrack(i, i9, i12, i8, i11, z, i10, i13);
                        return i8;
                    }
                }
            }
        }
    }

    public int deleteAudioTrack(int i) {
        synchronized (this) {
            TELogUtil.w(TAG, "deleteAudioTrack...");
            if (i >= 0) {
                i = this.mVideoEditor.deleteAudioTrack(i);
                return i;
            }
            return -100;
        }
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
        boolean trackVolume;
        synchronized (this) {
            TELogUtil.w(TAG, "setVolume...");
            trackVolume = this.mVideoEditor.setTrackVolume(i2, i, f);
        }
        return trackVolume;
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

    public int addInfoSticker(String str, @Nullable String[] strArr) {
        TELogUtil.i(TAG, "addInfoSticker...");
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
        return this.mVideoEditor.addInfoSticker(str, strArr);
    }

    public int setInfoStickerPosition(int i, float f, float f2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerPosition... index: ");
        stringBuilder.append(i);
        stringBuilder.append("offsetX: ");
        stringBuilder.append(f);
        stringBuilder.append("offsetY: ");
        stringBuilder.append(f2);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_POSITION_X, String.valueOf(f)) + this.mVideoEditor.setFilterParam(i, ENTITY_POSITION_Y, String.valueOf(f2));
    }

    public int setInfoStickerRotation(int i, float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerRotation... index: ");
        stringBuilder.append(i);
        stringBuilder.append("degree: ");
        stringBuilder.append(f);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_ROTATION, String.valueOf(f));
    }

    public int setInfoStickerTime(int i, int i2, int i3) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerTime... index: ");
        stringBuilder.append(i);
        stringBuilder.append("startTime: ");
        stringBuilder.append(i2);
        stringBuilder.append("endTime: ");
        stringBuilder.append(i3);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_START_TIME, String.valueOf(i2)) + this.mVideoEditor.setFilterParam(i, ENTITY_END_TIME, String.valueOf(i3));
    }

    public int setInfoStickerScale(int i, float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerScale... index: ");
        stringBuilder.append(i);
        stringBuilder.append("scale: ");
        stringBuilder.append(f);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_SCALE_X, String.valueOf(f)) + this.mVideoEditor.setFilterParam(i, ENTITY_SCALE_Y, String.valueOf(f));
    }

    public int setInfoStickerAlpha(int i, float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerAlpha... index: ");
        stringBuilder.append(i);
        stringBuilder.append("alpha: ");
        stringBuilder.append(f);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_ALPHA, String.valueOf(f));
    }

    public int setInfoStickerLayer(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setInfoStickerLayer... index: ");
        stringBuilder.append(i);
        stringBuilder.append("layer: ");
        stringBuilder.append(i2);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.setFilterParam(i, ENTITY_LAYER, String.valueOf(i2));
    }

    public int removeInfoSticker(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("removeInfoSticker... index: ");
        stringBuilder.append(i);
        TELogUtil.i(str, stringBuilder.toString());
        if (i < 0) {
            return -100;
        }
        return this.mVideoEditor.removeInfoSticker(i);
    }

    public float[] getInfoStickerBoundingBox(int i) throws VEException {
        TELogUtil.i(TAG, "getInfoStickerBoundingBox...");
        if (i >= 0) {
            return this.mVideoEditor.getInfoStickerBoundingBox(i);
        }
        throw new VEException(-100, "");
    }

    public int setInfoStickerEditMode(boolean z) {
        return -1;
    }

    private int addSticker(Bitmap bitmap, VESize vESize, int i, int i2) {
        return 0;
    }

    public int addSticker(String str, int i, int i2, int i3, int i4, float f, float f2, float f3, float f4) {
        int i5 = i;
        int i6 = i2;
        TELogUtil.w(TAG, "addSticker...");
        if (i5 > i6 || i5 < 0 || TextUtils.isEmpty(str)) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
        return this.mVideoEditor.addSticker(new String[]{str}, null, new int[]{i5}, new int[]{i6}, new int[]{i3}, new int[]{i4}, (double) f3, (double) f4, (double) f, (double) f2);
    }

    public int addExtRes(String str, int i, int i2, int i3, int i4, float f, float f2, float f3, float f4) {
        int i5 = i;
        int i6 = i2;
        TELogUtil.w(TAG, "addSticker...");
        if (i5 > i6 || i5 < 0 || TextUtils.isEmpty(str)) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veeditor_import_sticker", 1, null);
        return this.mVideoEditor.addSticker(new String[]{str}, null, new int[]{i5}, new int[]{i6}, new int[]{i3}, new int[]{i4}, (double) f3, (double) f4, (double) f, (double) f2);
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

    public int addWaterMarkForGifHigh(String str, double d, double d2, double d3, double d4) {
        this.waterMarkFile = str;
        this.waterMarkWidth = d;
        this.waterMarkHeight = d2;
        this.waterMarkOffsetX = d3;
        this.waterMarkOffsetY = d4;
        return 0;
    }

    public void updatePreViewResolution(int i, int i2, int i3, int i4) {
        this.mVideoEditor.updateResolution(i, i2, i3, i4);
    }

    public int setColorFilter(String str, float f) {
        synchronized (this) {
            if (this.mColorFilterIndex < 0) {
                return VEResult.TER_INVALID_STAT;
            } else if (f < 0.0f || str == null) {
                return -100;
            } else {
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
                VEKeyValue vEKeyValue = new VEKeyValue();
                String str3 = "";
                if (!TextUtils.isEmpty(str)) {
                    String[] split = str.split(File.separator);
                    if (split.length > 0) {
                        str3 = split[split.length - 1];
                    }
                }
                vEKeyValue.add("iesve_veeditor_set_filter_click_filter_id", str3);
                MonitorUtils.monitorStatistics("iesve_veeditor_set_filter_click", 1, vEKeyValue);
                return 0;
            }
        }
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
        String[] split;
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
        TEInterface tEInterface2 = this.mVideoEditor;
        int i2 = this.mColorFilterIndex;
        String str5 = FILTER_POSITION;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("");
        stringBuilder3.append(f);
        tEInterface2.setFilterParam(i2, str5, stringBuilder3.toString());
        VEKeyValue vEKeyValue = new VEKeyValue();
        String str6 = "";
        str3 = "";
        if (!TextUtils.isEmpty(str)) {
            split = str.split(File.separator);
            if (split.length > 0) {
                str6 = split[split.length - 1];
            }
        }
        if (!TextUtils.isEmpty(str2)) {
            split = str2.split(File.separator);
            if (split.length > 0) {
                str3 = split[split.length - 1];
            }
        }
        vEKeyValue.add("iesve_veeditor_set_filter_slide_left_id", str6);
        vEKeyValue.add("iesve_veeditor_set_filter_slide_right_id", str3);
        MonitorUtils.monitorStatistics("iesve_veeditor_set_filter_slide", 1, vEKeyValue);
        return 0;
    }

    public int enableFilterEffect(int i, String str) {
        if (i < 0 || i > getDuration() || TextUtils.isEmpty(str)) {
            return -100;
        }
        int duration = getDuration();
        int[] addFilters = this.mVideoEditor.addFilters(new int[]{0}, new String[]{"video effect"}, new int[]{i}, new int[]{duration}, new int[]{0}, new int[]{8});
        this.mVideoEditor.setFilterParam(addFilters[0], EFFECT_RES_PATH, str);
        VEKeyValue vEKeyValue = new VEKeyValue();
        String str2 = "";
        if (!TextUtils.isEmpty(str)) {
            String[] split = str.split(File.separator);
            if (split.length > 0) {
                str2 = split[split.length - 1];
            }
        }
        vEKeyValue.add("iesve_veeditor_filter_effect_id", str2);
        MonitorUtils.monitorStatistics("iesve_veeditor_filter_effect", 1, vEKeyValue);
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
        if (length != iArr.length) {
            iArr = new int[length];
            Arrays.fill(iArr, -1);
            return iArr;
        }
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

    public void setUseLargeMattingModel(boolean z) {
        synchronized (this) {
            this.mVideoEditor.setUseLargeMattingModel(z);
        }
    }

    public int addRepeatEffect(int i, int i2, int i3, int i4, int i5) {
        synchronized (this) {
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
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_time_effect_id", "repeat");
            MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
            i = addFilters[0];
            return i;
        }
    }

    public int deleteRepeatEffect(int i) {
        synchronized (this) {
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
    }

    public int setSpeedRatio(float f) {
        this.mVideoEditor.setSpeedRatio(f);
        return 0;
    }

    public int setSpeedRatioAndUpdate(float f) {
        this.mVideoEditor.stop();
        this.mVideoEditor.setSpeedRatio(f);
        this.mVideoEditor.createTimeline();
        return this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 0, this.mModelsDir);
    }

    public int addSlowMotionEffect(int i, int i2, int i3, int i4, float f, float f2) {
        int i5 = i;
        int i6 = i2;
        int i7 = i3;
        int i8 = i4;
        float f3 = f;
        float f4 = f2;
        synchronized (this) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("addSlowMotionEffect... ");
            stringBuilder.append(i5);
            stringBuilder.append(" ");
            stringBuilder.append(i6);
            stringBuilder.append(" ");
            stringBuilder.append(i7);
            stringBuilder.append(" ");
            stringBuilder.append(i8);
            stringBuilder.append(" ");
            stringBuilder.append(f3);
            stringBuilder.append(" ");
            stringBuilder.append(f4);
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
            int[] addFilters = this.mVideoEditor.addFilters(new int[]{i5}, new String[]{"timeEffect slow motion"}, new int[]{i7}, new int[]{pauseSync}, new int[]{i6}, new int[]{6});
            this.mAudioEffectfilterIndex = addFilters[0];
            stringBuilder = new StringBuilder();
            stringBuilder.append("");
            stringBuilder.append(i8);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion duration", stringBuilder.toString());
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("");
            stringBuilder3.append(f3);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect slow motion speed", stringBuilder3.toString());
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("");
            stringBuilder4.append(f4);
            this.mVideoEditor.setFilterParam(addFilters[0], "timeEffect fast motion speed", stringBuilder4.toString());
            this.mVideoEditor.createTimeline();
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_time_effect_id", CameraSettings.VIDEO_SPEED_SLOW);
            MonitorUtils.monitorStatistics("iesve_veeditor_time_effect", 1, vEKeyValue);
            i5 = addFilters[0];
            return i5;
        }
    }

    public int deleteSlowEffect(int i) {
        synchronized (this) {
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
        int removeFilter;
        synchronized (this) {
            TELogUtil.w(TAG, "deleteAudioFilter...");
            removeFilter = this.mVideoEditor.removeFilter(iArr);
        }
        return removeFilter;
    }

    public int deleteWaterMark(int i) {
        return 0;
    }

    public int addMetadata(String str, String str2) {
        synchronized (this) {
            TELogUtil.w(TAG, "addMetadata...");
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
                return -100;
            }
            this.mVideoEditor.addMetaData(str, str2);
            return 0;
        }
    }

    public void compile(String str, String str2, VEVideoEncodeSettings vEVideoEncodeSettings) {
        synchronized (this) {
            if (this.mVideoEditor.getNativeHandler() == 0) {
                return;
            }
            this.mOutputFile = str;
            this.mlCompileStartTime = System.currentTimeMillis();
            TELogUtil.w(TAG, "compile...");
            this.mVideoEditor.stop();
            switch (vEVideoEncodeSettings.getCompileType()) {
                case COMPILE_TYPE_MP4:
                    this.mVideoEditor.setCompileType(1);
                    this.mCompileType = "mp4";
                    break;
                case COMPILE_TYPE_GIF:
                    this.mVideoEditor.setCompileType(2);
                    this.mCompileType = "gif";
                    break;
                case COMPILE_TYPE_HIGH_GIF:
                    if (this.mp4ToGIFConverter == null || !this.mp4ToGIFConverter.mIsRunning) {
                        this.mBCompileHighQualityGif = true;
                        this.mVideoEditor.setCompileType(4);
                        if (this.mp4ToGIFConverter == null) {
                            this.mp4ToGIFConverter = new Mp4ToHighQualityGIFConverter();
                        }
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append(new File(this.mOutputFile).getParent());
                        stringBuilder.append(File.separatorChar);
                        stringBuilder.append("gif.mp4");
                        str = stringBuilder.toString();
                        this.mp4ToGIFConverter.setInputFile(str);
                        this.mp4ToGIFConverter.setOutputFile(this.mOutputFile);
                        this.mp4ToGIFConverter.setWaterMarkFile(this.waterMarkFile);
                        this.mp4ToGIFConverter.setWaterMarkWidth((int) (this.waterMarkWidth * ((double) vEVideoEncodeSettings.getVideoRes().width)));
                        this.mp4ToGIFConverter.setWaterMarkHeight((int) (this.waterMarkHeight * ((double) vEVideoEncodeSettings.getVideoRes().height)));
                        this.mp4ToGIFConverter.setWaterMarkOffsetX((int) (this.waterMarkOffsetX * ((double) vEVideoEncodeSettings.getVideoRes().width)));
                        this.mp4ToGIFConverter.setWaterMarkOffsetY((int) (this.waterMarkOffsetY * ((double) vEVideoEncodeSettings.getVideoRes().height)));
                        this.mCompileType = "high_gif";
                        break;
                    }
                    return;
                default:
                    this.mVideoEditor.setCompileType(1);
                    this.mCompileType = "mp4";
                    break;
            }
            this.mVideoEditor.setCompileFps(vEVideoEncodeSettings.getFps());
            setBitrateOptions(vEVideoEncodeSettings);
            this.mVideoEditor.setEngineCompilePath(str, str2);
            this.mVideoEditor.setResizer(vEVideoEncodeSettings.getResizeMode(), vEVideoEncodeSettings.getResizeX(), vEVideoEncodeSettings.getResizeY());
            this.mVideoEditor.setUsrRotate(vEVideoEncodeSettings.getRotate());
            this.mVideoEditor.setUseHwEnc(vEVideoEncodeSettings.isHwEnc());
            this.mVideoEditor.setEncGopSize(vEVideoEncodeSettings.getGopSize());
            this.mVideoEditor.setSpeedRatio(vEVideoEncodeSettings.getSpeed());
            this.mVideoEditor.setWidthHeight(vEVideoEncodeSettings.getVideoRes().width, vEVideoEncodeSettings.getVideoRes().height);
            VEWatermarkParam watermarkParam = vEVideoEncodeSettings.getWatermarkParam();
            if (watermarkParam != null && watermarkParam.needExtFile) {
                this.mVideoEditor.setCompileWatermark(watermarkParam);
                if (this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 2, this.mModelsDir) != 0) {
                    return;
                }
            } else if (this.mVideoEditor.prepareEngine(this.mInPoint, this.mOutPoint, 1, this.mModelsDir) != 0) {
                return;
            }
            if (watermarkParam != null) {
                this.mVideoEditor.setWaterMark(watermarkParam.images, watermarkParam.interval, watermarkParam.xOffset, watermarkParam.yOffset, watermarkParam.width, watermarkParam.height);
            }
            this.mVideoEditor.start();
            VEKeyValue vEKeyValue = new VEKeyValue();
            vEKeyValue.add("iesve_veeditor_composition_start_file", this.mCompileType);
            MonitorUtils.monitorStatistics("iesve_veeditor_composition_start", 1, vEKeyValue);
        }
    }

    private void setBitrateOptions(VEVideoEncodeSettings vEVideoEncodeSettings) {
        this.mVideoEditor.setCompileSoftwareEncodeOptions(vEVideoEncodeSettings.getSwCRF(), vEVideoEncodeSettings.getSwMaxRate(), vEVideoEncodeSettings.getSwPreset(), vEVideoEncodeSettings.getSwQP());
        this.mVideoEditor.setCompileHardwareEncodeOptions(vEVideoEncodeSettings.getBps());
        this.mVideoEditor.setCompileCommonEncodeOptions(vEVideoEncodeSettings.getBitrateMode().ordinal(), vEVideoEncodeSettings.getEncodeProfile());
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

    public boolean testSerialization() {
        return this.mVideoEditor.testSerialization();
    }

    private static boolean checkFileExists(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return new File(str).exists();
    }
}
