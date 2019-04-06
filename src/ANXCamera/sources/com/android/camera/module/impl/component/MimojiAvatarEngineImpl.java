package com.android.camera.module.impl.component;

import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.media.Image;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.v4.media.session.PlaybackStateCompat;
import android.widget.Toast;
import com.android.camera.ActivityBase;
import com.android.camera.Util;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.fragment.mimoji.BitmapUtils;
import com.android.camera.fragment.mimoji.MimojiHelper;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.-$.Lambda.MimojiAvatarEngineImpl.cGyyBNege42DOCUFdSoZr1cIV9s;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.arcsoft.avatar.AvatarConfig;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProfileResult;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.a;
import com.arcsoft.avatar.c.g;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class MimojiAvatarEngineImpl implements MimojiAvatarEngine {
    private static final String FACE_MODEL;
    private static final int HANDLER_RECORDING_CURRENT_FILE_SIZE = 3;
    private static final int HANDLER_RECORDING_CURRENT_TIME = 1;
    private static final int HANDLER_RECORDING_MAX_DURATION_REACHED = 2;
    private static final int HANDLER_RECORDING_MAX_FILE_SIZE_REACHED = 4;
    private static final int HANDLER_RESOURCE_ERROR_BROKEN = 0;
    private static final String TAG = MimojiAvatarEngineImpl.class.getSimpleName();
    private static final String TRACK_DATA;
    private ActivityBase mActivityBase;
    private AvatarEngine mAvatar;
    private String mAvatarCachePath = "";
    private String mAvatarTemplatePath;
    private V6CameraGLSurfaceView mCameraView;
    private ContentValues mContentValues;
    private Context mContext;
    private int mCurrentScreenOrientation = 0;
    private int mDeviceRotation = 90;
    private int mFaceDectectResult;
    private Handler mHandler;
    private boolean mIsFrontCamera;
    private boolean mIsInMimojiCreated;
    private boolean mIsInMimojiEdit;
    private boolean mIsRecording;
    private boolean mIsShutterButtonClick;
    private MainContentProtocol mMainProtocol;
    private MimojiEditor mMimojiEditor;
    private int mMode;
    private int mOrientation;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private a mRecordModule;
    private g mRecordingListener;
    private boolean mSaveConfigThum;
    private String mSaveVideoPath;
    private boolean mShowAvatar = true;

    public static class MimojiMode {
        public static final int CREATE = 2;
        public static final int EDIT = 3;
        public static final int NONE = 0;
        public static final int PREVIEW = 1;
    }

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(MimojiHelper.MIMOJI_DIR);
        stringBuilder.append("track_data.dat");
        TRACK_DATA = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(MimojiHelper.MIMOJI_DIR);
        stringBuilder.append("config.txt");
        FACE_MODEL = stringBuilder.toString();
    }

    public MimojiAvatarEngineImpl(ActivityBase activityBase) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(MimojiHelper.MIMOJI_DIR);
        stringBuilder.append("model/cartoon_xiaomi_v_0_0_0_9");
        this.mAvatarTemplatePath = stringBuilder.toString();
        this.mIsInMimojiCreated = false;
        this.mIsShutterButtonClick = false;
        this.mSaveConfigThum = false;
        this.mIsInMimojiEdit = false;
        this.mFaceDectectResult = 0;
        this.mMode = 0;
        this.mRecordingListener = new g() {
            public void onRecordingListener(int i, Object obj) {
                Message obtainMessage = MimojiAvatarEngineImpl.this.mHandler.obtainMessage();
                switch (i) {
                    case 257:
                        obtainMessage.arg1 = (int) ((((Long) obj).longValue() / 1000) / 1000);
                        obtainMessage.what = 2;
                        break;
                    case 258:
                        long longValue = (((Long) obj).longValue() / 1000) / 1000;
                        obtainMessage.arg1 = (int) longValue;
                        String access$900 = MimojiAvatarEngineImpl.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onRecordingListener_time = ");
                        stringBuilder.append(longValue);
                        Log.d(access$900, stringBuilder.toString());
                        obtainMessage.what = 1;
                        break;
                    case 259:
                        obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                        obtainMessage.what = 4;
                        break;
                    case 260:
                        obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                        obtainMessage.what = 3;
                        break;
                }
                obtainMessage.sendToTarget();
            }
        };
        this.mHandler = new Handler(Looper.getMainLooper()) {
            public void handleMessage(Message message) {
                super.handleMessage(message);
                switch (message.what) {
                    case 0:
                        Toast.makeText(MimojiAvatarEngineImpl.this.mContext, (String) message.obj, 0).show();
                        return;
                    default:
                        return;
                }
            }
        };
        this.mActivityBase = activityBase;
        this.mCameraView = activityBase.getGLView();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
        this.mMainProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
    }

    private void animateCapture() {
        this.mActivityBase.getCameraScreenNail().animateCapture(this.mOrientation);
        this.mActivityBase.playCameraSound(0);
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onPostSavingStart();
        }
    }

    public static MimojiAvatarEngineImpl create(ActivityBase activityBase) {
        return new MimojiAvatarEngineImpl(activityBase);
    }

    private void createAvatar(byte[] bArr, int i, int i2) {
        ASAvatarProfileResult aSAvatarProfileResult = new ASAvatarProfileResult();
        int a = this.mAvatar.a(this.mAvatarTemplatePath, i, i2, i * 4, bArr, 0, true, aSAvatarProfileResult, new cGyyBNege42DOCUFdSoZr1cIV9s(this));
        if (aSAvatarProfileResult.status == 254 || aSAvatarProfileResult.status == 246) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("result = ");
            stringBuilder.append(a);
            Log.d(str, stringBuilder.toString());
            return;
        }
        if (aSAvatarProfileResult.status == 1) {
            Toast.makeText(this.mContext, "未检测到人脸", 0).show();
        } else if ((aSAvatarProfileResult.status & 2) == 0) {
            Toast.makeText(this.mContext, "发型检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 4) == 0) {
            Toast.makeText(this.mContext, "发型检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 8) == 0) {
            Toast.makeText(this.mContext, "发色检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 16) == 0) {
            Toast.makeText(this.mContext, "性别检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 32) == 0) {
            Toast.makeText(this.mContext, "肤色检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 64) == 0) {
            Toast.makeText(this.mContext, "眼镜检测失败", 0).show();
        } else if ((aSAvatarProfileResult.status & 128) == 0) {
            Toast.makeText(this.mContext, "脸型检测失败", 0).show();
        } else {
            Toast.makeText(this.mContext, "未知错误", 0).show();
        }
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onPostSavingFinish();
        }
        this.mMainProtocol.mimojiEnd();
    }

    public static /* synthetic */ void lambda$createAvatar$0(MimojiAvatarEngineImpl mimojiAvatarEngineImpl, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("avatat profile percent:");
        stringBuilder.append(i);
        com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
        if (i == 100) {
            mimojiAvatarEngineImpl.onProfileFinish();
        }
    }

    private void onProfileFinish() {
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onPostSavingFinish();
        }
        this.mMainProtocol.mimojiEnd();
        this.mIsInMimojiEdit = true;
        this.mAvatar.f(this.mAvatarTemplatePath);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.startMimojiEdit();
        }
    }

    private void updateVideoOrientation(int i) {
        if ((i > 315 && i <= ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) || (i >= 0 && i <= 45)) {
            this.mCurrentScreenOrientation = 0;
        } else if (i > 45 && i <= 135) {
            this.mCurrentScreenOrientation = 90;
        } else if (i > 135 && i <= 225) {
            this.mCurrentScreenOrientation = 180;
        } else if (i > 225 && i <= 315) {
            this.mCurrentScreenOrientation = 270;
        }
    }

    public void initAvatarEngine(int i, int i2, int i3, int i4, boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("initAvatarEngine with parameters : displayOrientation = ");
        stringBuilder.append(i);
        stringBuilder.append(", width = ");
        stringBuilder.append(i3);
        stringBuilder.append(", height = ");
        stringBuilder.append(i4);
        stringBuilder.append(", isFrontCamera = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        this.mPreviewWidth = i3;
        this.mPreviewHeight = i4;
        this.mIsFrontCamera = z;
        this.mOrientation = i2;
        this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
        this.mAvatar.f(TRACK_DATA, FACE_MODEL);
        this.mAvatar.a(true, 1.0f);
        this.mRecordModule = new a(this.mContext);
        this.mRecordModule.a(i, i3, i4, this.mAvatar, z);
        Rect displayRect = Util.getDisplayRect(this.mContext);
        this.mRecordModule.a(0, Util.sWindowHeight - displayRect.bottom, displayRect.right, displayRect.bottom - displayRect.top);
        MimojiHelper.init(this.mContext);
    }

    public void initResource() {
        if (!FileUtils.hasDir(MimojiHelper.MIMOJI_DIR)) {
            FileUtils.delDir(MimojiHelper.MIMOJI_DIR);
        }
        try {
            Util.verifyAssetZip(this.mContext, "mimoji/mimoji.zip", MimojiHelper.MIMOJI_DIR, 32768);
        } catch (Throwable e) {
            Log.e(TAG, "verify asset zip failed...", e);
        }
    }

    public boolean isOnCreateMimoji() {
        return this.mIsInMimojiCreated;
    }

    public boolean isRecording() {
        return this.mIsRecording;
    }

    public void onBack(boolean z) {
        this.mIsInMimojiEdit = false;
    }

    public void onCapture() {
    }

    public void onCaptureTaken() {
        if (this.mFaceDectectResult == 6) {
            ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingPostAction();
            this.mIsShutterButtonClick = true;
            animateCapture();
        }
    }

    public void onDeviceRotationChange(int i) {
        this.mDeviceRotation = i;
        updateVideoOrientation(i);
        if (this.mMimojiEditor != null) {
            this.mMimojiEditor.onDeviceRotationChange(i);
        }
    }

    public void onDrawFrame() {
        if (this.mRecordModule != null) {
            this.mRecordModule.a(this.mDeviceRotation, this.mShowAvatar);
        }
    }

    public void onMimojiCreate() {
        Log.d(TAG, "start create mimoji");
        this.mIsInMimojiCreated = true;
        this.mShowAvatar = false;
        this.mMainProtocol.mimojiStart();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).prepareCreateMimoji();
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).showMimojiCreateView();
    }

    public void onMimojiSelect(String str, String str2) {
        String str3 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("change mimoji with path = ");
        stringBuilder.append(str);
        Log.d(str3, stringBuilder.toString());
        if (this.mAvatar != null) {
            if (!str.isEmpty()) {
                this.mAvatar.f(str);
                this.mAvatarTemplatePath = str;
            }
            if (!str2.isEmpty()) {
                this.mAvatar.h(str2);
            }
        }
    }

    public void onPreviewFrame(Image image) {
        final Image image2 = image;
        int width = image.getWidth();
        int height = image.getHeight();
        long currentTimeMillis = System.currentTimeMillis();
        final byte[] dataFromImage = MimojiHelper.getDataFromImage(image2, 2);
        if (!(dataFromImage == null || this.mRecordModule == null)) {
            if (this.mIsInMimojiEdit) {
                if (this.mMimojiEditor == null) {
                    this.mMimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
                }
                if (this.mMimojiEditor != null) {
                    this.mAvatar.a(width, height, width, dataFromImage, null, 90, this.mIsFrontCamera, this.mOrientation);
                    AvatarConfig.g gVar = new AvatarConfig.g();
                    AvatarConfig.g gVar2 = gVar;
                    this.mAvatar.a(dataFromImage, width, height, width, 90, true, this.mOrientation, gVar);
                    if (this.mAvatar.a(gVar2) != 6) {
                        this.mMimojiEditor.showTips();
                    }
                    this.mMimojiEditor.requestRender();
                }
            } else {
                this.mRecordModule.a(dataFromImage, this.mOrientation, width, height, this.mShowAvatar);
                this.mCameraView.requestRender();
            }
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("process frame spend time  = ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str, stringBuilder.toString());
        if (this.mIsInMimojiCreated) {
            Log.d(TAG, "start enter create mimoji");
            AvatarConfig.g gVar3 = new AvatarConfig.g();
            int a = this.mAvatar.a(dataFromImage, width, height, width, 90, true, this.mOrientation, gVar3);
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Avatar detect result = ");
            stringBuilder2.append(a);
            Log.d(str2, stringBuilder2.toString());
            this.mFaceDectectResult = this.mAvatar.a(gVar3);
            if (this.mMainProtocol != null) {
                this.mMainProtocol.mimojiDetectFace(this.mAvatar.a(gVar3));
            }
        }
        if (this.mIsShutterButtonClick) {
            this.mActivityBase.runOnUiThread(new Runnable() {
                public void run() {
                    Log.d(MimojiAvatarEngineImpl.TAG, "create start capture");
                    System.currentTimeMillis();
                    Bitmap horizMirrorBitmap = BitmapUtils.horizMirrorBitmap(BitmapUtils.rotateBitmap(BitmapUtils.rawByteArray2RGBABitmap(dataFromImage, image2.getWidth(), image2.getHeight()), -90));
                    int width = horizMirrorBitmap.getWidth();
                    int height = horizMirrorBitmap.getHeight();
                    Buffer order = ByteBuffer.allocate(horizMirrorBitmap.getRowBytes() * horizMirrorBitmap.getHeight()).order(ByteOrder.nativeOrder());
                    horizMirrorBitmap.copyPixelsToBuffer(order);
                    MimojiAvatarEngineImpl.this.createAvatar(order.array(), width, height);
                    image2.close();
                }
            });
            this.mIsShutterButtonClick = false;
            return;
        }
        image.close();
    }

    public void onRecordStart(final ContentValues contentValues) {
        Log.d(TAG, "start record...");
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    MimojiAvatarEngineImpl.this.mIsRecording = true;
                    MimojiAvatarEngineImpl.this.mContentValues = contentValues;
                    MimojiAvatarEngineImpl.this.mSaveVideoPath = contentValues.getAsString("_data");
                    MimojiAvatarEngineImpl.this.mRecordModule.a(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mRecordingListener, MimojiAvatarEngineImpl.this.mCurrentScreenOrientation, MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight, 10000000);
                }
            }
        });
    }

    public void onRecordStop() {
        Log.d(TAG, "stop record...");
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    MimojiAvatarEngineImpl.this.mIsRecording = false;
                    MimojiAvatarEngineImpl.this.mRecordModule.stopRecording();
                    MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().addVideo(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mContentValues, true);
                }
            }
        });
    }

    public void onResume() {
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(217, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(217, this);
    }
}
