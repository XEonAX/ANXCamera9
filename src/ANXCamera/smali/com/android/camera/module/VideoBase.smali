.class public abstract Lcom/android/camera/module/VideoBase;
.super Lcom/android/camera/module/BaseModule;
.source "VideoBase.java"

# interfaces
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.implements Lcom/android/camera2/Camera2Proxy$FocusCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/VideoBase$StereoSwitchThread;,
        Lcom/android/camera/module/VideoBase$MainHandler;
    }
.end annotation


# static fields
.field protected static final FILE_NUMBER_SINGLE:I = -0x1

.field private static final HOLD_WHEN_SAVING_VIDEO:Z = false

.field private static final MILLIS_PER_MINUTE:I = 0xea60

.field private static final MIN_BACK_RECORDING_MINUTE:I = 0x14

.field private static final MIN_FRONT_RECORDING_MINUTE:I = 0xa

.field private static final SHOW_FACE_VIEW:Z = false

.field public static final START_VIDEO_RECORDING_ACTION:Ljava/lang/String; = "com.android.camera.action.start_video_recording"

.field public static final STOP_VIDEO_RECORDING_ACTION:Ljava/lang/String; = "com.android.camera.action.stop_video_recording"

.field protected static TAG:Ljava/lang/String;


# instance fields
.field private m3ALocked:Z

.field protected mAudioManager:Landroid/media/AudioManager;

.field protected mBaseFileName:Ljava/lang/String;

.field protected mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

.field protected mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

.field protected mCurrentVideoFilename:Ljava/lang/String;

.field protected mCurrentVideoUri:Landroid/net/Uri;

.field protected mCurrentVideoValues:Landroid/content/ContentValues;

.field private mDialog:Landroid/app/AlertDialog;

.field protected mFaceDetectionEnabled:Z

.field protected mFaceDetectionStarted:Z

.field protected mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field protected mHandler:Landroid/os/Handler;

.field protected mInStartingFocusRecording:Z

.field protected mIntentRequestSize:J

.field protected mIsBeautyFrontOn:Z

.field private mIsSessionReady:Z

.field private mIsVideoCaptureIntent:Z

.field protected mMaxVideoDurationInMs:I

.field protected volatile mMediaRecorderRecording:Z

.field protected mMediaRecorderRecordingPaused:Z

.field private mMessageId:I

.field private mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field protected mOnResumeTime:J

.field protected mOrientationCompensationAtRecordStart:I

.field protected mOriginalMusicVolume:I

.field protected mOutputFormat:I

.field protected final mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field protected mPreviewing:Z

.field protected mRecordingStartTime:J

.field protected mSavePowerMode:Z

.field protected mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field protected mSnapshotInProgress:Z

.field protected mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

.field protected mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTitleId:I

.field protected mTouchFocusStartingTime:J

.field protected mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

.field protected mVideoFocusMode:Ljava/lang/String;

.field protected mVideoSize:Lcom/android/camera/CameraSize;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 332
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 320
    new-instance v0, Lcom/android/camera/module/VideoBase$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$2;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 1601
    new-instance v0, Lcom/android/camera/module/VideoBase$5;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$5;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    .line 333
    sput-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    .line 334
    new-instance p1, Lcom/android/camera/module/VideoBase$MainHandler;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/module/VideoBase$MainHandler;-><init>(Lcom/android/camera/module/VideoBase;Lcom/android/camera/module/VideoBase$1;)V

    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    .line 335
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/VideoBase;ZZ)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic access$102(Lcom/android/camera/module/VideoBase;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method private createName(JI)Ljava/lang/String;
    .locals 1

    .line 969
    if-gtz p3, :cond_0

    .line 970
    new-instance p3, Ljava/util/Date;

    invoke-direct {p3, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 971
    new-instance p1, Ljava/text/SimpleDateFormat;

    const p2, 0x7f0900c9

    .line 972
    invoke-virtual {p0, p2}, Lcom/android/camera/module/VideoBase;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 973
    invoke-virtual {p1, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    .line 974
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    return-object p1

    .line 976
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    return-object p1
.end method

.method private deleteCurrentVideo()V
    .locals 2

    .line 1014
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1015
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->deleteVideoFile(Ljava/lang/String;)V

    .line 1016
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1017
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 1018
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-static {v1, v0, v0}, Lcom/android/camera/Util;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1019
    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    .line 1022
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1023
    return-void
.end method

.method private getReviewBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .line 854
    nop

    .line 856
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    .line 857
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mDisplayRect:Landroid/graphics/Rect;

    .line 858
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 857
    invoke-static {v0, v1}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    .line 859
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 860
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 861
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mDisplayRect:Landroid/graphics/Rect;

    .line 862
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 861
    invoke-static {v0, v1}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    .line 864
    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 867
    iget v1, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensationAtRecordStart:I

    neg-int v1, v1

    .line 868
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v2

    .line 867
    invoke-static {v0, v1, v2}, Lcom/android/camera/Util;->rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 870
    :cond_2
    return-object v0
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6

    .line 307
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v3

    .line 308
    if-eqz p1, :cond_0

    .line 310
    iget-boolean p2, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 311
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq p2, v0, :cond_1

    .line 312
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0

    .line 316
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 318
    :cond_1
    :goto_0
    return-void
.end method

.method private hideAlert()V
    .locals 2

    .line 886
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 887
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->resumePreview()V

    goto :goto_0

    .line 889
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 891
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->hideReviewViews()V

    .line 892
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    .line 894
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 895
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 896
    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 897
    return-void
.end method

.method private initMetaParser()V
    .locals 3

    .line 290
    new-instance v0, Lcom/android/camera/module/VideoBase$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$1;-><init>(Lcom/android/camera/module/VideoBase;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 291
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    .line 297
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 298
    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 299
    return-void
.end method

.method private onBeautyParameterChanged()V
    .locals 5

    .line 1821
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    .line 1822
    iget-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mIsBeautyFrontOn:Z

    if-eq v1, v0, :cond_0

    .line 1823
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v1

    .line 1824
    sget-object v2, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onBeautyParameterChanged: isVideoBokehOn = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1825
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->restartModule()V

    .line 1826
    goto :goto_0

    .line 1827
    :cond_0
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/16 v3, 0xd

    aput v3, v1, v2

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase;->updatePreferenceInWorkThread([I)V

    .line 1829
    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsBeautyFrontOn:Z

    .line 1830
    return-void
.end method

.method private onStereoModeChanged()V
    .locals 2

    .line 1238
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    .line 1239
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1240
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->cancelFocus(Z)V

    .line 1241
    new-instance v0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    .line 1242
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->start()V

    .line 1243
    return-void
.end method

.method private restorePreferences()V
    .locals 1

    .line 734
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isZoomSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 735
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setZoomValue(F)V

    .line 737
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 738
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .line 1776
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1777
    return-void

    .line 1779
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1780
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    if-eqz v0, :cond_1

    .line 1781
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x23

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 1783
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1786
    :cond_2
    :goto_0
    return-void
.end method

.method private startPlayVideoActivity()V
    .locals 4

    .line 762
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 763
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    iget v2, p0, Lcom/android/camera/module/VideoBase;->mOutputFormat:I

    invoke-static {v2}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 764
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 766
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 769
    goto :goto_0

    .line 767
    :catch_0
    move-exception v0

    .line 768
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to view video "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 770
    :goto_0
    return-void
.end method

.method private updateFaceView(ZZ)V
    .locals 2

    .line 1509
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1510
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1512
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    .line 1513
    nop

    .line 1512
    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 1513
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 1514
    return-void
.end method


# virtual methods
.method protected animateHold()V
    .locals 0

    .line 1004
    return-void
.end method

.method protected animateSlide()V
    .locals 0

    .line 1010
    return-void
.end method

.method public cancelFocus(Z)V
    .locals 3

    .line 1439
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1440
    return-void

    .line 1443
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1444
    sget-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v0, "cancelFocus: frame not available"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1445
    return-void

    .line 1448
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cancelFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1449
    if-eqz p1, :cond_2

    .line 1450
    const-string p1, "continuous-video"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/VideoBase;->setVideoFocusMode(Ljava/lang/String;Z)V

    .line 1452
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 1453
    return-void
.end method

.method protected checkCallingState()Z
    .locals 2

    .line 1357
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 1358
    const v0, 0x7f09017e

    const v1, 0x7f09017f

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->showConfirmMessage(II)V

    .line 1360
    const/4 v0, 0x0

    return v0

    .line 1362
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .line 423
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 424
    return-void

    .line 426
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 427
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_1

    .line 428
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 430
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 431
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    .line 433
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 434
    return-void
.end method

.method protected cleanupEmptyFile()V
    .locals 7

    .line 981
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 982
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 983
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 984
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no video file: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 985
    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    goto :goto_1

    .line 987
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    .line 988
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    if-nez v1, :cond_1

    .line 989
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 991
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/FileCompat;->deleteFile(Ljava/lang/String;)Z

    .line 993
    :goto_0
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "delete empty video file: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 994
    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 998
    :cond_2
    :goto_1
    return-void
.end method

.method public closeCamera()V
    .locals 2

    .line 673
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "closeCamera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 674
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    .line 675
    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mSnapshotInProgress:Z

    .line 677
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 678
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 681
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 682
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 685
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 686
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 687
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 688
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->unlockAEAF()V

    .line 689
    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 691
    :cond_2
    return-void
.end method

.method protected closeVideoFileDescriptor()V
    .locals 3

    .line 1064
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    .line 1066
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1069
    goto :goto_0

    .line 1067
    :catch_0
    move-exception v0

    .line 1068
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v2, "fail to close fd"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1070
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 1072
    :cond_0
    return-void
.end method

.method protected deleteVideoFile(Ljava/lang/String;)V
    .locals 3

    .line 1026
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delete invalid video "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1027
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1028
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1029
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fail to delete "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1031
    :cond_0
    return-void
.end method

.method protected doLaterReleaseIfNeed()V
    .locals 2

    .line 1734
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    .line 1735
    return-void

    .line 1739
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1740
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "doLaterRelease"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1741
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    .line 1742
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 1743
    return-void

    .line 1747
    :cond_1
    return-void
.end method

.method protected doReturnToCaller(Z)V
    .locals 2

    .line 900
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 902
    if-eqz p1, :cond_0

    .line 903
    const/4 p1, -0x1

    .line 904
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 905
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_0

    .line 907
    :cond_0
    const/4 p1, 0x0

    .line 909
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 910
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->finish()V

    .line 911
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .line 1165
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    .line 1167
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1165
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public enterMutexMode(I)V
    .locals 3

    .line 1050
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->setZoomValue(F)V

    .line 1051
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    const-string v0, "pref_camera_whitebalance_key"

    const-string v1, "pref_camera_coloreffect_key"

    const/4 v2, 0x0

    filled-new-array {v0, v2, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/preferences/SettingsOverrider;->overrideSettings([Ljava/lang/String;)V

    .line 1054
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 1055
    return-void
.end method

.method protected enterSavePowerMode()V
    .locals 3

    .line 469
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "currentBrightness: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCurrentBrightness()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentBrightness()I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_0

    .line 471
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "enterSavePowerMode"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoBase$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoBase$3;-><init>(Lcom/android/camera/module/VideoBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 482
    :cond_0
    return-void
.end method

.method public exitMutexMode(I)V
    .locals 0

    .line 1059
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    invoke-virtual {p1}, Lcom/android/camera/preferences/SettingsOverrider;->restoreSettings()Z

    .line 1060
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 1061
    return-void
.end method

.method protected exitSavePowerMode()V
    .locals 2

    .line 485
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 487
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mSavePowerMode:Z

    if-eqz v0, :cond_0

    .line 488
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "exitSavePowerMode"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoBase$4;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoBase$4;-><init>(Lcom/android/camera/module/VideoBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 500
    :cond_0
    return-void
.end method

.method protected genContentValues(II)Landroid/content/ContentValues;
    .locals 2

    .line 918
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/camera/module/VideoBase;->genContentValues(IIZZ)Landroid/content/ContentValues;

    move-result-object p1

    return-object p1
.end method

.method protected genContentValues(IIZZ)Landroid/content/ContentValues;
    .locals 7

    .line 930
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 931
    invoke-direct {p0, v0, v1, p2}, Lcom/android/camera/module/VideoBase;->createName(JI)Ljava/lang/String;

    move-result-object v2

    .line 932
    if-lez p2, :cond_0

    .line 933
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "_%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 934
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 936
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 937
    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object p1

    .line 938
    nop

    .line 939
    const/16 v3, 0x2f

    if-eqz p3, :cond_1

    .line 940
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/android/camera/storage/Storage;->generatePrimaryTempFile()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 941
    new-instance p4, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/android/camera/storage/Storage;->generatePrimaryTempFile()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".nomedia"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p4}, Lcom/android/camera/Util;->createFile(Ljava/io/File;)Z

    goto :goto_0

    .line 943
    :cond_1
    if-eqz p4, :cond_2

    .line 944
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p4, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    .line 947
    :cond_2
    invoke-static {p2}, Lcom/android/camera/storage/Storage;->generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 950
    :goto_0
    sget-object p4, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "genContentValues: path="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p4, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 951
    new-instance p4, Landroid/content/ContentValues;

    const/16 v3, 0x8

    invoke-direct {p4, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 952
    const-string v3, "title"

    invoke-virtual {p4, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 953
    const-string v2, "_display_name"

    invoke-virtual {p4, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 954
    const-string p2, "datetaken"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p4, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 955
    const-string p2, "mime_type"

    invoke-virtual {p4, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 956
    const-string p1, "_data"

    invoke-virtual {p4, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 957
    const-string p1, "resolution"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/camera/module/VideoBase;->mVideoSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->width:I

    .line 958
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "x"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/module/VideoBase;->mVideoSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->height:I

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 957
    invoke-virtual {p4, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 959
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object p1

    .line 960
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide p2

    const-wide/16 v0, 0x0

    cmpl-double p2, p2, v0

    if-nez p2, :cond_3

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide p2

    cmpl-double p2, p2, v0

    if-eqz p2, :cond_4

    .line 961
    :cond_3
    const-string p2, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    invoke-virtual {p4, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 962
    const-string p2, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p4, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 965
    :cond_4
    return-object p4
.end method

.method protected getCameraRotation()I
    .locals 2

    .line 914
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensation:I

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mDisplayRotation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method

.method protected initializeCapabilities()V
    .locals 2

    .line 339
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 340
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 342
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 341
    const/4 v1, 0x3

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mContinuousFocusSupported:Z

    .line 343
    return-void
.end method

.method protected initializeFocusManager()V
    .locals 4

    .line 1187
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1189
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    .line 1190
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1192
    nop

    .line 1193
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1194
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    .line 1196
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 1197
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    .line 1198
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 1197
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1199
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_1

    .line 1204
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1205
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1207
    :goto_1
    return-void
.end method

.method protected is3ALocked()Z
    .locals 1

    .line 1712
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    return v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    .line 1716
    const/4 v0, 0x1

    return v0
.end method

.method protected isBeautyOn()Z
    .locals 2

    .line 1817
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v1, v1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isCameraEnabled()Z
    .locals 1

    .line 1234
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    return v0
.end method

.method protected isCameraSessionReady()Z
    .locals 1

    .line 1366
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isCaptureIntent()Z
    .locals 1

    .line 396
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsVideoCaptureIntent:Z

    return v0
.end method

.method public isDoingAction()Z
    .locals 1

    .line 794
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFaceDetectStarted()Z
    .locals 1

    .line 1546
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isMeteringAreaOnly()Z
    .locals 1

    .line 1221
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMeteringAreaSupported:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 3

    .line 838
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCaptureIntent()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 839
    return v1

    .line 843
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa0

    .line 844
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 845
    const v2, 0x7f0d001b

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v2, 0xff3

    if-eq v0, v2, :cond_1

    .line 847
    return v1

    .line 850
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method protected isSessionReady()Z
    .locals 1

    .line 1370
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsSessionReady:Z

    return v0
.end method

.method public isShowAeAfLockIndicator()Z
    .locals 1

    .line 1584
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    return v0
.end method

.method public isThermalThreshold()Z
    .locals 7

    .line 1834
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1835
    return v1

    .line 1837
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 1838
    iget-wide v4, p0, Lcom/android/camera/module/VideoBase;->mRecordingStartTime:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0xea60

    div-long/2addr v2, v4

    .line 1839
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    .line 1840
    const-wide/16 v5, 0xa

    cmp-long v0, v2, v5

    if-ltz v0, :cond_1

    move v1, v4

    nop

    :cond_1
    return v1

    .line 1842
    :cond_2
    const-wide/16 v5, 0x14

    cmp-long v0, v2, v5

    if-ltz v0, :cond_3

    move v1, v4

    nop

    :cond_3
    return v1
.end method

.method public isUnInterruptable()Z
    .locals 1

    .line 799
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mUnInterruptableReason:Ljava/lang/String;

    .line 800
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isPostProcessing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 801
    const-string v0, "post process"

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mUnInterruptableReason:Ljava/lang/String;

    .line 803
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    .line 1551
    const/4 v0, 0x0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 610
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .line 742
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 743
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 742
    :goto_0
    return v0
.end method

.method protected keepPowerSave()V
    .locals 4

    .line 463
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "keepPowerSave"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->exitSavePowerMode()V

    .line 465
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x34

    const-wide/32 v2, 0x16e360

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 466
    return-void
.end method

.method protected keepScreenOn()V
    .locals 2

    .line 450
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 451
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 452
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 453
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 454
    return-void
.end method

.method protected keepScreenOnAwhile()V
    .locals 4

    .line 445
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 447
    return-void
.end method

.method protected lockAEAF()V
    .locals 2

    .line 1702
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1703
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mAeLockSupported:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 1704
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1706
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1708
    iput-boolean v1, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    .line 1709
    return-void
.end method

.method public multiCapture()Z
    .locals 2

    .line 1472
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "multiCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1473
    const/4 v0, 0x0

    return v0
.end method

.method public notifyError()V
    .locals 2

    .line 620
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 621
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 622
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 625
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->notifyError()V

    .line 626
    return-void
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .line 1574
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->updatePreferenceTrampoline([I)V

    .line 1575
    return-void
.end method

.method public onBackPressed()Z
    .locals 9

    .line 695
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 696
    return v1

    .line 699
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v0, :cond_1

    .line 700
    return v1

    .line 703
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 704
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 705
    iget-wide v5, p0, Lcom/android/camera/module/VideoBase;->mLastBackPressedTime:J

    sub-long v5, v3, v5

    const-wide/16 v7, 0xbb8

    cmp-long v0, v5, v7

    if-lez v0, :cond_2

    .line 706
    iput-wide v3, p0, Lcom/android/camera/module/VideoBase;->mLastBackPressedTime:J

    .line 707
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const v3, 0x7f090122

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoBase;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 708
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 710
    :cond_2
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 712
    :goto_0
    return v2

    .line 715
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 716
    return v2

    .line 719
    :cond_4
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onBeautyChanged()V
    .locals 0

    .line 1847
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->onBeautyParameterChanged()V

    .line 1848
    return-void
.end method

.method public onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1591
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V

    .line 1592
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 1593
    const-string p2, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1594
    invoke-static {}, Lcom/android/camera/storage/Storage;->isCurrentStorageIsSecondary()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1595
    invoke-static {}, Lcom/android/camera/storage/Storage;->switchToPhoneStorage()V

    .line 1596
    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 1599
    :cond_0
    return-void
.end method

.method protected onCameraOpened()V
    .locals 1

    .line 284
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 285
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsBeautyFrontOn:Z

    .line 286
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->initMetaParser()V

    .line 287
    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 0

    .line 1519
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 4

    .line 1661
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1665
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1681
    :pswitch_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez v0, :cond_1

    .line 1682
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    if-nez v0, :cond_1

    .line 1683
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 1667
    :pswitch_1
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "focusTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getElapsedTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "ms focused="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1668
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " waitForRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1669
    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1667
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1671
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1672
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1673
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 1675
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    if-eqz p1, :cond_1

    .line 1676
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    .line 1688
    :cond_1
    :goto_0
    return-void

    .line 1662
    :cond_2
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onHostStopAndNotifyActionStop()V
    .locals 2

    .line 630
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    if-eqz v0, :cond_0

    .line 631
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    .line 633
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    .line 634
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 635
    if-eqz v0, :cond_0

    .line 636
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 640
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCameraSessionReady()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 641
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 643
    :cond_1
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 530
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 531
    return v1

    .line 534
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 535
    return v2

    .line 538
    :cond_1
    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_3

    .line 566
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 567
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 568
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 570
    :cond_2
    return v2

    .line 575
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 576
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 577
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 579
    :cond_3
    return v2

    .line 541
    :sswitch_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 542
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->restoreBottom()V

    .line 543
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 544
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 546
    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    goto :goto_0

    .line 549
    :cond_4
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    .line 551
    :cond_5
    :goto_0
    return v1

    .line 558
    :sswitch_3
    const/16 v0, 0x18

    if-eq p1, v0, :cond_7

    const/16 v0, 0x58

    if-ne p1, v0, :cond_6

    goto :goto_1

    :cond_6
    goto :goto_2

    :cond_7
    :goto_1
    move v2, v1

    .line 561
    :goto_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    .line 558
    invoke-virtual {p0, v2, v1, v0}, Lcom/android/camera/module/VideoBase;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 562
    return v1

    .line 587
    :cond_8
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_3
        0x19 -> :sswitch_3
        0x1b -> :sswitch_2
        0x42 -> :sswitch_2
        0x57 -> :sswitch_3
        0x58 -> :sswitch_3
        0x2bc -> :sswitch_1
        0x2bd -> :sswitch_0
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 592
    const/4 v0, 0x4

    const/4 v1, 0x1

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    const/16 v0, 0x42

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 595
    :cond_0
    return v1

    .line 599
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    .line 600
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 601
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 602
    return v1

    .line 605
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onLongPress(II)V
    .locals 1

    .line 1721
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->isInTapableRect(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1722
    return-void

    .line 1724
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->onSingleTapUp(II)V

    .line 1727
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isAEAFLockSupported()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1728
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->lockAEAF()V

    .line 1730
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->performHapticFeedback(I)V

    .line 1731
    return-void
.end method

.method public onNewIntent()V
    .locals 1

    .line 752
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->changeConflictPreference()V

    .line 753
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setCaptureIntent(Z)V

    .line 754
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 2

    .line 1751
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1752
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onOrientationChanged(II)V

    .line 1753
    return-void

    .line 1758
    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 1759
    return-void

    .line 1762
    :cond_1
    iput p1, p0, Lcom/android/camera/module/VideoBase;->mOrientation:I

    .line 1763
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mOrientation:I

    .line 1764
    invoke-static {v0, v1}, Lcom/android/camera/Util;->getShootOrientation(Landroid/app/Activity;I)I

    move-result v0

    .line 1763
    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setOrientation(I)V

    .line 1765
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->checkActivityOrientation()V

    .line 1769
    iget p1, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensation:I

    if-eq p1, p2, :cond_2

    .line 1770
    iput p2, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensation:I

    .line 1771
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->setOrientationParameter()V

    .line 1773
    :cond_2
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 303
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 304
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    .line 1556
    if-nez p1, :cond_0

    .line 1557
    return-void

    .line 1560
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 1562
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 1563
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1565
    :cond_1
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 1409
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewSessionClosed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1410
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1411
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1412
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1414
    :cond_0
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 1394
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isTextureExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->retryOnceIfCameraError(Landroid/os/Handler;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1395
    sget-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v0, "sessionFailed due to surfaceTexture expired, retry"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1396
    return-void

    .line 1399
    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewSessionFailed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1400
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1401
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1402
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1404
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1405
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 1380
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewSessionSuccess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1381
    if-nez p1, :cond_0

    .line 1382
    return-void

    .line 1384
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1385
    return-void

    .line 1387
    :cond_1
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1388
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1389
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 6

    .line 347
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "onPreviewSizeChanged: %dx%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 351
    :cond_0
    return-void
.end method

.method protected onPreviewStart()V
    .locals 0

    .line 1291
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 355
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 356
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 357
    return-void

    .line 359
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mCameraDisabled:Z

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 363
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->updateStereoSettings(Z)V

    .line 366
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    if-nez v0, :cond_2

    .line 367
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 369
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 371
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->keepScreenOnAwhile()V

    .line 373
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSettingsBack()V

    .line 375
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    if-eqz v0, :cond_3

    .line 376
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoBase;->mOnResumeTime:J

    .line 377
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 380
    :cond_3
    return-void

    .line 360
    :cond_4
    :goto_0
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 2
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .line 827
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isSelectingCapturedResult()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 828
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->deleteCurrentVideo()V

    .line 829
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->hideAlert()V

    goto :goto_0

    .line 831
    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 832
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase;->doReturnToCaller(Z)V

    .line 834
    :goto_0
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 1
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .line 821
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->doReturnToCaller(Z)V

    .line 822
    return-void
.end method

.method public onReviewPlayClicked(Landroid/view/View;)V
    .locals 0
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .line 815
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->startPlayVideoActivity()V

    .line 816
    return-void
.end method

.method protected onSettingsBack()V
    .locals 3

    .line 723
    sget-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    .line 724
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/ChangeManager;->check(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 725
    invoke-virtual {v0, v1}, Lcom/android/camera/ChangeManager;->clear(I)V

    .line 726
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->restorePreferences()V

    goto :goto_0

    .line 727
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ChangeManager;->check(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 728
    invoke-virtual {v0, v1}, Lcom/android/camera/ChangeManager;->clear(I)V

    .line 729
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 731
    :cond_1
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 0

    .line 775
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 785
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 2

    .line 778
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "onShutterButtonLongClick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 1

    .line 789
    const/4 p1, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/VideoBase;->onShutterButtonFocus(ZI)V

    .line 790
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .line 808
    iget-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 809
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 811
    :cond_0
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    .line 438
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onUserInteraction()V

    .line 439
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 440
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->keepScreenOnAwhile()V

    .line 442
    :cond_0
    return-void
.end method

.method protected onWaitStopCallbackTimeout()V
    .locals 0

    .line 651
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 3

    .line 1457
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1458
    return v1

    .line 1460
    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v2, "capture"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1461
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x37

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1462
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    if-eqz v0, :cond_1

    .line 1463
    iput-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    .line 1464
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startVideoRecording()V

    .line 1465
    const/4 v0, 0x1

    return v0

    .line 1467
    :cond_1
    return v1
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .line 504
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onWindowFocusChanged(Z)V

    .line 505
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    .line 507
    if-eqz p1, :cond_0

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->keepPowerSave()V

    goto :goto_0

    .line 510
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->exitSavePowerMode()V

    .line 513
    :cond_1
    :goto_0
    return-void
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 1034
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1035
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1036
    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1037
    const-string v1, ":miui:starting_window_label"

    .line 1038
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090045

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1037
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1039
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1040
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1042
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 1043
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 1045
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 1046
    return-void
.end method

.method protected parseIntent(Landroid/content/Intent;)V
    .locals 3

    .line 404
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    .line 405
    if-eqz p1, :cond_0

    .line 406
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->getRequestSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoBase;->mIntentRequestSize:J

    .line 407
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->getExtraSavedUri()Landroid/net/Uri;

    move-result-object p1

    .line 408
    if-eqz p1, :cond_0

    .line 410
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mContentResolver:Landroid/content/ContentResolver;

    const-string v1, "rw"

    invoke-virtual {v0, p1, v1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 411
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    .line 412
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseIntent: outputUri="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    goto :goto_0

    .line 413
    :catch_0
    move-exception p1

    .line 415
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    :cond_0
    :goto_0
    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    .line 517
    if-nez p2, :cond_1

    if-eqz p3, :cond_1

    .line 518
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->restoreBottom()V

    .line 519
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isIgnoreTouchEvent()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 520
    sget-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string p2, "ignore volume key"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    return-void

    .line 523
    :cond_0
    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    .line 525
    :cond_1
    return-void
.end method

.method public playFocusSound(I)V
    .locals 0

    .line 1579
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->playCameraSound(I)V

    .line 1580
    return-void
.end method

.method public playVideo()V
    .locals 0

    .line 758
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->startPlayVideoActivity()V

    .line 759
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 0

    .line 748
    return-void
.end method

.method protected resetScreenOn()V
    .locals 2

    .line 457
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 458
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 459
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 460
    return-void
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 0

    .line 1287
    return-void
.end method

.method protected restoreMusicSound()V
    .locals 3

    .line 1099
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    .line 1100
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 1101
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v2, v1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 1103
    :cond_0
    iput v1, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    .line 1104
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1105
    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .line 1230
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1231
    return-void
.end method

.method protected setCaptureIntent(Z)V
    .locals 0

    .line 400
    iput-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mIsVideoCaptureIntent:Z

    .line 401
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1

    .line 384
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 386
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 387
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 388
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 389
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 390
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 392
    :cond_0
    return-void
.end method

.method protected setSessionReady(Z)V
    .locals 0

    .line 1374
    iput-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mIsSessionReady:Z

    .line 1375
    return-void
.end method

.method protected setVideoFocusMode(Ljava/lang/String;Z)V
    .locals 0

    .line 1322
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    .line 1323
    if-eqz p2, :cond_0

    .line 1324
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateVideoFocusMode()V

    .line 1326
    :cond_0
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .line 615
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isSelectingCapturedResult()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected showAlert()V
    .locals 2

    .line 874
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->pausePreview()V

    .line 875
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->getReviewBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 876
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showReviewViews(Landroid/graphics/Bitmap;)V

    .line 877
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    .line 880
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 881
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 882
    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 883
    return-void
.end method

.method protected showConfirmMessage(II)V
    .locals 8

    .line 1341
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1342
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mTitleId:I

    if-eq v0, p1, :cond_1

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mMessageId:I

    if-ne v0, p2, :cond_0

    goto :goto_0

    .line 1345
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_1

    .line 1343
    :cond_1
    :goto_0
    return-void

    .line 1347
    :cond_2
    :goto_1
    iput p1, p0, Lcom/android/camera/module/VideoBase;->mTitleId:I

    .line 1348
    iput p2, p0, Lcom/android/camera/module/VideoBase;->mMessageId:I

    .line 1349
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    .line 1351
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    .line 1352
    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const p2, 0x104000a

    .line 1353
    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 1349
    invoke-static/range {v1 .. v7}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    .line 1354
    return-void
.end method

.method protected silenceSounds()V
    .locals 4

    .line 1079
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    if-nez v0, :cond_0

    .line 1080
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    .line 1083
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 1090
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    .line 1091
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    if-eqz v0, :cond_1

    .line 1092
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v3, v1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 1094
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2b

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1096
    :cond_1
    return-void
.end method

.method public startFaceDetection()V
    .locals 1

    .line 1479
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1482
    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 1483
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    .line 1484
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 1490
    :cond_1
    return-void

    .line 1480
    :cond_2
    :goto_0
    return-void
.end method

.method public startFocus()V
    .locals 3

    .line 1421
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1422
    return-void

    .line 1424
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1425
    return-void

    .line 1428
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "startFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1429
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 1430
    const-string v0, "auto"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->setVideoFocusMode(Ljava/lang/String;Z)V

    .line 1431
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    goto :goto_0

    .line 1433
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1435
    :goto_0
    return-void
.end method

.method protected startVideoRecording()V
    .locals 0

    .line 1226
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 0

    .line 1494
    iget-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    if-nez p1, :cond_0

    goto :goto_0

    .line 1498
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    .line 1499
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_1

    .line 1500
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 1506
    :cond_1
    return-void

    .line 1495
    :cond_2
    :goto_0
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0

    .line 1570
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 0

    .line 647
    return-void
.end method

.method protected supportTouchFocus()Z
    .locals 1

    .line 1318
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected switchMutexHDR()V
    .locals 2

    .line 1210
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1211
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1212
    const-string v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1213
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->resetMutexModeManually()V

    goto :goto_0

    .line 1215
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 1217
    :goto_0
    return-void
.end method

.method protected unlockAEAF()V
    .locals 2

    .line 1691
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1692
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->m3ALocked:Z

    .line 1693
    iget-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mAeLockSupported:Z

    if-eqz v1, :cond_0

    .line 1694
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1696
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v1, :cond_1

    .line 1697
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1699
    :cond_1
    return-void
.end method

.method protected updateBeauty()V
    .locals 2

    .line 1793
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 1800
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    if-nez v0, :cond_1

    .line 1801
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyValues;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 1804
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 1806
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    .line 1807
    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    .line 1808
    if-nez v0, :cond_2

    .line 1809
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->initBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;Z)V

    .line 1811
    :cond_2
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v1, v1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1812
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 1814
    :cond_3
    return-void

    .line 1796
    :cond_4
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 1797
    return-void
.end method

.method protected updateDeviceOrientation()V
    .locals 2

    .line 1789
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1790
    return-void
.end method

.method protected updateFace()V
    .locals 3

    .line 1146
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->enableFaceDetection()Z

    move-result v0

    .line 1148
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    .line 1149
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 1151
    :cond_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1152
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_2

    .line 1153
    iput-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    .line 1154
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startFaceDetection()V

    goto :goto_0

    .line 1157
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    .line 1158
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase;->stopFaceDetection(Z)V

    .line 1159
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    .line 1162
    :cond_2
    :goto_0
    return-void
.end method

.method public updateFlashPreference()V
    .locals 2

    .line 1172
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSupportedFlashOn()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    .line 1173
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSupportedTorch()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1174
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->resetMutexModeManually()V

    .line 1180
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1181
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1182
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setFlashMode(Ljava/lang/String;)V

    .line 1184
    return-void
.end method

.method protected updateFocusArea()V
    .locals 4

    .line 1127
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1128
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "updateFocusArea: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1129
    return-void

    .line 1131
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 1132
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 1133
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1134
    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 1133
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1136
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1137
    iget-boolean v2, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-eqz v2, :cond_2

    .line 1138
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    goto :goto_1

    .line 1140
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1142
    :goto_1
    return-void
.end method

.method protected updateFocusCallback()V
    .locals 2

    .line 1329
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1330
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "updateFocusCallback: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1331
    return-void

    .line 1333
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mContinuousFocusSupported:Z

    if-eqz v0, :cond_1

    .line 1334
    const-string v0, "continuous-video"

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1335
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 1338
    :cond_1
    return-void
.end method

.method protected updateMotionFocusManager()V
    .locals 2

    .line 1122
    const-string v0, "auto"

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1123
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1124
    return-void
.end method

.method protected updateRecordingTime()V
    .locals 2

    .line 654
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isThermalThreshold()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "0"

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    .line 655
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getFlashMode(I)Ljava/lang/String;

    move-result-object v1

    .line 654
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 656
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->onThermalNotification()V

    .line 658
    :cond_0
    return-void
.end method

.method protected updateStereoSettings(Z)V
    .locals 3

    .line 1306
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1307
    if-eqz p1, :cond_0

    .line 1308
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "pref_camera_video_flashmode_key"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    .line 1310
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1308
    invoke-virtual {p1, v0}, Lcom/android/camera/preferences/SettingsOverrider;->overrideSettings([Ljava/lang/String;)V

    goto :goto_0

    .line 1312
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    invoke-virtual {p1}, Lcom/android/camera/preferences/SettingsOverrider;->restoreSettings()Z

    .line 1315
    :cond_1
    :goto_0
    return-void
.end method

.method protected updateVideoFocusMode()V
    .locals 2

    .line 1108
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1109
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v1, "updateVideoFocusMode: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1110
    return-void

    .line 1112
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 1113
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/constant/AutoFocus;->convertToFocusMode(Ljava/lang/String;)I

    move-result v1

    .line 1114
    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1115
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1116
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateMotionFocusManager()V

    .line 1117
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateFocusCallback()V

    .line 1119
    :cond_1
    return-void
.end method

.method protected waitStereoSwitchThread()V
    .locals 3

    .line 1295
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v0, :cond_0

    .line 1296
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->cancel()V

    .line 1297
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->join()V

    .line 1298
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1302
    :cond_0
    goto :goto_0

    .line 1300
    :catch_0
    move-exception v0

    .line 1301
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1303
    :goto_0
    return-void
.end method
