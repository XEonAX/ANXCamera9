.class public Lcom/android/camera/module/LiveModule;
.super Lcom/android/camera/module/BaseModule;
.source "LiveModule.java"

# interfaces
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.implements Lcom/android/camera2/Camera2Proxy$FocusCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/LiveModule$MainHandler;
    }
.end annotation


# static fields
.field private static final BEAUTY_SWITCH:I = 0x8

.field private static final FILTER_SWITCH:I = 0x2

.field private static final STICKER_SWITCH:I = 0x4

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private m3ALocked:Z

.field private mBaseFileName:Ljava/lang/String;

.field private mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

.field private mDialog:Landroid/app/AlertDialog;

.field protected mFaceDetectionEnabled:Z

.field protected mFaceDetectionStarted:Z

.field private mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field private mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

.field private mIsPreviewing:Z

.field private mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

.field private mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

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

.field private mOldOriginVolumeStream:I

.field private mOnResumeTime:J

.field protected final mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mQuality:I

.field private mSaved:Z

.field protected mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field protected mShowFace:Z

.field protected mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTitleId:I

.field private mTouchFocusStartingTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 93
    const-class v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 85
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mShowFace:Z

    .line 128
    const/4 v1, 0x5

    iput v1, p0, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 131
    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsPreviewing:Z

    .line 200
    new-instance v0, Lcom/android/camera/module/LiveModule$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$1;-><init>(Lcom/android/camera/module/LiveModule;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 978
    new-instance v0, Lcom/android/camera/module/LiveModule$5;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$5;-><init>(Lcom/android/camera/module/LiveModule;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/module/LiveModule;ZZ)V
    .locals 0

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 85
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/camera/module/LiveModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/loader/camera2/FocusManager2;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    return-object p0
.end method

.method private createName(JI)Ljava/lang/String;
    .locals 1

    .line 678
    if-gtz p3, :cond_0

    .line 679
    new-instance p3, Ljava/util/Date;

    invoke-direct {p3, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 680
    new-instance p1, Ljava/text/SimpleDateFormat;

    const p2, 0x7f0900c9

    .line 681
    invoke-virtual {p0, p2}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 682
    invoke-virtual {p1, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    .line 683
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1

    .line 685
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1
.end method

.method private doLaterReleaseIfNeed()V
    .locals 2

    .line 1779
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    .line 1780
    return-void

    .line 1783
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1784
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    .line 1785
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 1786
    return-void

    .line 1788
    :cond_1
    return-void
.end method

.method private genContentValues(IIZ)Landroid/content/ContentValues;
    .locals 7

    .line 690
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 691
    invoke-direct {p0, v0, v1, p2}, Lcom/android/camera/module/LiveModule;->createName(JI)Ljava/lang/String;

    move-result-object v2

    .line 692
    if-lez p2, :cond_0

    .line 693
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

    .line 694
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 696
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 697
    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object p1

    .line 698
    nop

    .line 699
    const/16 v3, 0x2f

    if-eqz p3, :cond_1

    .line 700
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->CAMERA_TEMP_DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 701
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/android/camera/storage/Storage;->CAMERA_TEMP_DIRECTORY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".nomedia"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/android/camera/Util;->createFile(Ljava/io/File;)Z

    goto :goto_0

    .line 703
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 705
    :goto_0
    sget-object v3, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "genContentValues: path="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    new-instance v3, Landroid/content/ContentValues;

    const/16 v4, 0x8

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 707
    const-string v4, "title"

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 708
    const-string v2, "_display_name"

    invoke-virtual {v3, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    const-string p2, "datetaken"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 710
    const-string p2, "mime_type"

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    const-string p1, "_data"

    invoke-virtual {v3, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    const-string p1, "resolution"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->width:I

    .line 713
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "x"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->height:I

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 712
    invoke-virtual {v3, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 714
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object p1

    .line 715
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide p2

    const-wide/16 v0, 0x0

    cmpl-double p2, p2, v0

    if-nez p2, :cond_2

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide p2

    cmpl-double p2, p2, v0

    if-eqz p2, :cond_3

    .line 716
    :cond_2
    const-string p2, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    invoke-virtual {v3, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 717
    const-string p2, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 721
    :cond_3
    return-object v3
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6

    .line 1548
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v3

    .line 1549
    if-eqz p1, :cond_0

    .line 1551
    iget-boolean p2, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1552
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq p2, v0, :cond_1

    .line 1553
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0

    .line 1557
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 1559
    :cond_1
    :goto_0
    return-void
.end method

.method private initLiveConfig()Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 5

    .line 329
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 330
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xd1

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 331
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    .line 332
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [I

    fill-array-data v4, :array_0

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/module/impl/ImplFactory;->initModulePersistent(Lcom/android/camera/ActivityBase;[I)V

    .line 335
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 336
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 338
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initResource()V

    .line 341
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getAuthResult()Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v0

    return-object v0

    nop

    :array_0
    .array-data 4
        0xc9
        0xd1
    .end array-data
.end method

.method private initMetaParser()V
    .locals 3

    .line 345
    new-instance v0, Lcom/android/camera/module/LiveModule$3;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$3;-><init>(Lcom/android/camera/module/LiveModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 346
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    .line 352
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 353
    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 354
    return-void
.end method

.method private initializeFocusManager()V
    .locals 4

    .line 1045
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1048
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1049
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1052
    nop

    .line 1053
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1054
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    .line 1056
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 1057
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1058
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 1057
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1059
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_1

    .line 1064
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1065
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1067
    :goto_1
    return-void
.end method

.method private isEisOn()Z
    .locals 1

    .line 1345
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$onDestroy$0()V
    .locals 4

    .line 571
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 572
    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 573
    if-eqz v0, :cond_0

    .line 574
    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3, v3, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCenterHint(ILjava/lang/String;Ljava/lang/String;I)V

    .line 576
    :cond_0
    return-void
.end method

.method private previewWhenSessionSuccess()V
    .locals 1

    .line 1126
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1128
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    .line 1129
    return-void
.end method

.method private setOrientation(II)V
    .locals 1

    .line 1190
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1191
    return-void

    .line 1194
    :cond_0
    iput p1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    .line 1197
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkActivityOrientation()V

    .line 1201
    iget p1, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    if-eq p1, p2, :cond_1

    .line 1202
    iput p2, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    .line 1203
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    .line 1205
    :cond_1
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .line 1209
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1210
    return-void

    .line 1212
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1213
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1214
    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x23

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 1216
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1219
    :cond_2
    :goto_0
    return-void
.end method

.method private shouldApplyUltraWideLDC()Z
    .locals 3

    .line 1376
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1377
    return v1

    .line 1379
    :cond_0
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 1381
    return v1

    .line 1383
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideVideoLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private showAuthError()V
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    new-instance v1, Lcom/android/camera/module/LiveModule$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/LiveModule$2;-><init>(Lcom/android/camera/module/LiveModule;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 316
    return-void
.end method

.method private showPreview()V
    .locals 3

    .line 667
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->pausePreview()V

    .line 670
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    .line 671
    const/4 v1, 0x2

    invoke-direct {p0, v1, v0, v0}, Lcom/android/camera/module/LiveModule;->genContentValues(IIZ)Landroid/content/ContentValues;

    move-result-object v0

    .line 673
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 674
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->startLiveRecordPreview(Landroid/content/ContentValues;)V

    .line 675
    return-void
.end method

.method private startVideoRecording()V
    .locals 3
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 751
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOn()V

    .line 754
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 755
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 756
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    .line 758
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStart()V

    .line 760
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    if-eqz v1, :cond_0

    .line 761
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->setRecordOrientation(I)V

    .line 765
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    .line 767
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 768
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "listen call state"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveRecordingParams()V

    .line 772
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getVolumeControlStream()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    .line 773
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 774
    return-void
.end method

.method private trackLiveRecordingParams()V
    .locals 17

    .line 780
    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveAllSwitchAllValue()I

    move-result v0

    .line 781
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object v1

    .line 782
    const/4 v2, 0x1

    aget-object v4, v1, v2

    .line 783
    nop

    .line 784
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 785
    nop

    .line 788
    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/extra/DataItemLive;->getLiveFilter()I

    move-result v5

    .line 789
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v6, v7, v5}, Lcom/android/camera/effect/EffectController;->findLiveFilter(Landroid/content/Context;I)Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    move-result-object v5

    .line 790
    nop

    .line 791
    iget-object v6, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 792
    nop

    .line 793
    and-int/lit8 v6, v0, 0x2

    if-nez v6, :cond_1

    add-int/lit8 v0, v0, 0x2

    .line 796
    :cond_1
    move v6, v2

    goto :goto_1

    :cond_2
    move v6, v3

    .line 797
    :goto_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveStickerName()Ljava/lang/String;

    move-result-object v8

    .line 798
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 799
    nop

    .line 800
    and-int/lit8 v7, v0, 0x4

    if-nez v7, :cond_3

    add-int/lit8 v0, v0, 0x4

    .line 802
    :cond_3
    move v7, v2

    goto :goto_2

    :cond_4
    move v7, v3

    :goto_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeedText()Ljava/lang/String;

    move-result-object v9

    .line 804
    nop

    .line 805
    const-string v10, "key_live_shrink_face_ratio"

    const/16 v11, 0x28

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v12

    .line 806
    const-string v10, "key_live_enlarge_eye_ratio"

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v13

    .line 807
    const-string v10, "key_live_smooth_strength"

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v14

    .line 809
    if-gtz v12, :cond_6

    if-gtz v13, :cond_6

    if-lez v14, :cond_5

    goto :goto_3

    .line 813
    :cond_5
    move v10, v3

    goto :goto_4

    .line 810
    :cond_6
    :goto_3
    nop

    .line 811
    and-int/lit8 v3, v0, 0x8

    if-nez v3, :cond_7

    add-int/lit8 v0, v0, 0x8

    .line 813
    :cond_7
    move v10, v2

    :goto_4
    iget-object v2, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    move-object/from16 v3, p0

    iget v15, v3, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 814
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v16

    .line 813
    move v3, v1

    move v5, v6

    move-object v6, v2

    move v11, v12

    move v12, v13

    move v13, v14

    move v14, v15

    move/from16 v15, v16

    invoke-static/range {v3 .. v15}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveRecordingParams(ZLjava/lang/String;ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;ZIIIIZ)V

    .line 815
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setLiveAllSwitchAddValue(I)V

    .line 816
    return-void
.end method

.method private trackLiveVideoParams()V
    .locals 7

    .line 845
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getSegments()I

    move-result v0

    .line 846
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getTotalRecordingTime()J

    move-result-wide v1

    long-to-float v1, v1

    .line 847
    nop

    .line 848
    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveAllSwitchAllValue()I

    move-result v2

    .line 849
    and-int/lit8 v3, v2, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    .line 850
    nop

    .line 852
    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    and-int/lit8 v6, v2, 0x4

    if-eqz v6, :cond_1

    .line 853
    nop

    .line 855
    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v5

    :goto_1
    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_2

    .line 856
    goto :goto_2

    .line 858
    :cond_2
    move v4, v5

    :goto_2
    invoke-static {v5}, Lcom/android/camera/CameraSettings;->setLiveAllSwitchAddValue(I)V

    .line 859
    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    invoke-static {v0, v1, v3, v6, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveVideoParams(IFZZZ)V

    .line 860
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWideFunTaken()V

    .line 861
    return-void
.end method

.method private updateBeauty()V
    .locals 6

    .line 458
    const-string v0, "key_live_shrink_face_ratio"

    const/16 v1, 0x28

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    .line 459
    const-string v3, "key_live_enlarge_eye_ratio"

    invoke-static {v3, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    .line 460
    const-string v4, "key_live_smooth_strength"

    invoke-static {v4, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    .line 461
    const/4 v2, 0x0

    cmpl-float v4, v0, v2

    if-gtz v4, :cond_1

    cmpl-float v4, v3, v2

    if-gtz v4, :cond_1

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    goto :goto_0

    .line 468
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setLiveBeautyStatus(Z)V

    .line 469
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v4, :cond_2

    .line 470
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v3, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautyFaceReshape(ZFF)V

    .line 471
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautify(ZF)V

    goto :goto_1

    .line 462
    :cond_1
    :goto_0
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setLiveBeautyStatus(Z)V

    .line 463
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v4, :cond_2

    .line 464
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v3, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautyFaceReshape(ZFF)V

    .line 465
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautify(ZF)V

    .line 474
    :cond_2
    :goto_1
    sget-object v2, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "shrinkFaceRatio->"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ",enlargEyeRatio->"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ",smoothStrengthRatio->"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    return-void
.end method

.method private updateDeviceOrientation()V
    .locals 2

    .line 1321
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1322
    return-void
.end method

.method private updateFaceView(ZZ)V
    .locals 2

    .line 1540
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1541
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 1543
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 1544
    nop

    .line 1543
    invoke-virtual {v0, v1, p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 1544
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 1545
    return-void
.end method

.method private updateFilter()V
    .locals 4

    .line 1338
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 1339
    sget-object v1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateFilter: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1340
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 1341
    return-void
.end method

.method private updateFocusMode()V
    .locals 2

    .line 1333
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1334
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setFocusMode(Ljava/lang/String;)V

    .line 1335
    return-void
.end method

.method private updateFpsRange()V
    .locals 0

    .line 1392
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 5

    .line 1308
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v1, Landroid/graphics/SurfaceTexture;

    .line 1309
    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 1310
    iget v1, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mBogusCameraId:I

    .line 1311
    const/16 v3, 0x10

    const/16 v4, 0x9

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v3

    float-to-double v3, v3

    .line 1310
    invoke-static {v1, v2, v0, v3, v4}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1313
    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 1314
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->updateCameraScreenNailSize(II)V

    .line 1315
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "previewSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 1318
    return-void
.end method

.method private updateUltraWideLDC()V
    .locals 2

    .line 1372
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->shouldApplyUltraWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setUltraWideLDC(Z)V

    .line 1373
    return-void
.end method

.method private updateVideoStabilization()V
    .locals 4

    .line 1349
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1350
    return-void

    .line 1352
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->isEisOn()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1353
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: EIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1354
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1355
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1356
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1357
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    goto :goto_0

    .line 1360
    :cond_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: OIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1361
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1362
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1363
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1365
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public cancelFocus(Z)V
    .locals 1

    .line 1458
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1459
    return-void

    .line 1462
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1463
    return-void

    .line 1466
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_2

    .line 1467
    return-void

    .line 1470
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    .line 1471
    if-eqz p1, :cond_3

    .line 1472
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1474
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 1477
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    .line 1478
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1480
    :cond_5
    return-void
.end method

.method protected checkCallingState()Z
    .locals 2

    .line 1086
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 1087
    const v0, 0x7f09017e

    const v1, 0x7f09017f

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->showConfirmMessage(II)V

    .line 1089
    const/4 v0, 0x0

    return v0

    .line 1091
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .line 1224
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1225
    return-void

    .line 1227
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 1229
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_1

    .line 1230
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 1233
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 1234
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 1236
    :cond_2
    return-void
.end method

.method public closeCamera()V
    .locals 2

    .line 587
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 588
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 591
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 592
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 596
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 597
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 598
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 599
    iput-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 602
    :cond_2
    return-void
.end method

.method protected varargs consumePreference([I)V
    .locals 3

    .line 375
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 376
    sparse-switch v2, :sswitch_data_0

    .line 451
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 447
    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateUltraWideLDC()V

    .line 448
    goto :goto_1

    .line 406
    :sswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateDeviceOrientation()V

    .line 407
    goto :goto_1

    .line 422
    :sswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateVideoStabilization()V

    .line 423
    goto :goto_1

    .line 418
    :sswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateExposureMeteringMode()V

    .line 419
    goto :goto_1

    .line 414
    :sswitch_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->focusCenter()V

    .line 415
    goto :goto_1

    .line 410
    :sswitch_5
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->setZoomRatio(F)V

    .line 411
    goto :goto_1

    .line 439
    :sswitch_6
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFpsRange()V

    .line 440
    goto :goto_1

    .line 402
    :sswitch_7
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFocusMode()V

    .line 403
    goto :goto_1

    .line 443
    :sswitch_8
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateBeauty()V

    .line 444
    goto :goto_1

    .line 426
    :sswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->setEvValue()V

    .line 427
    goto :goto_1

    .line 436
    :sswitch_a
    goto :goto_1

    .line 398
    :sswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFlashPreference()V

    .line 399
    goto :goto_1

    .line 394
    :sswitch_c
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->updateAntiBanding(Ljava/lang/String;)V

    .line 395
    goto :goto_1

    .line 390
    :sswitch_d
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFace()V

    .line 391
    goto :goto_1

    .line 386
    :sswitch_e
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFocusArea()V

    .line 387
    goto :goto_1

    .line 382
    :sswitch_f
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFilter()V

    .line 383
    goto :goto_1

    .line 378
    :sswitch_10
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updatePictureAndPreviewSize()V

    .line 379
    nop

    .line 375
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 455
    :cond_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_10
        0x2 -> :sswitch_f
        0x3 -> :sswitch_e
        0x5 -> :sswitch_d
        0x9 -> :sswitch_c
        0xa -> :sswitch_b
        0xb -> :sswitch_a
        0xc -> :sswitch_9
        0xd -> :sswitch_8
        0xe -> :sswitch_7
        0x13 -> :sswitch_6
        0x14 -> :sswitch_a
        0x18 -> :sswitch_5
        0x19 -> :sswitch_4
        0x1d -> :sswitch_3
        0x1e -> :sswitch_a
        0x1f -> :sswitch_2
        0x22 -> :sswitch_a
        0x23 -> :sswitch_1
        0x2a -> :sswitch_a
        0x2b -> :sswitch_a
        0x2f -> :sswitch_0
        0x32 -> :sswitch_a
    .end sparse-switch
.end method

.method public doReverse()V
    .locals 2

    .line 880
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    goto :goto_0

    .line 884
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordReverse()V

    .line 885
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->hasSegments()Z

    move-result v0

    if-nez v0, :cond_1

    .line 886
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 888
    :cond_1
    return-void

    .line 881
    :cond_2
    :goto_0
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .line 1434
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    .line 1436
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1434
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected getOperatingMode()I
    .locals 1

    .line 495
    nop

    .line 496
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 497
    const v0, 0x8004

    goto :goto_0

    .line 498
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fg()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 499
    const v0, 0x8030

    goto :goto_0

    .line 502
    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initializeCapabilities()V
    .locals 2

    .line 320
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 321
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 323
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 321
    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mContinuousFocusSupported:Z

    .line 324
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    .line 325
    return-void
.end method

.method protected is3ALocked()Z
    .locals 1

    .line 1300
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    return v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    .line 1304
    const/4 v0, 0x1

    return v0
.end method

.method public isDoingAction()Z
    .locals 2

    .line 909
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 910
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->isLiveRecordPreviewShown()Z

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

.method public isFaceDetectStarted()Z
    .locals 1

    .line 1588
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isNeedMute()Z
    .locals 1

    .line 1536
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 2

    .line 968
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 969
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->isLiveRecordPreviewShown()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    .line 974
    const/4 v0, 0x0

    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    .line 1593
    const/4 v0, 0x0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 1735
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected keepScreenOn()V
    .locals 2

    .line 542
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 543
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 544
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 545
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 546
    return-void
.end method

.method protected keepScreenOnAwhile()V
    .locals 4

    .line 537
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 539
    return-void
.end method

.method protected lockAEAF()V
    .locals 2

    .line 1290
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1291
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1292
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1294
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1296
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 1297
    return-void
.end method

.method public multiCapture()Z
    .locals 1

    .line 1489
    const/4 v0, 0x0

    return v0
.end method

.method public notifyError()V
    .locals 1

    .line 1746
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1747
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1748
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1752
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->notifyError()V

    .line 1753
    return-void
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .line 1526
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 1527
    return-void
.end method

.method public onBackPressed()Z
    .locals 8

    .line 1613
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1614
    return v1

    .line 1617
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_1

    .line 1618
    return v1

    .line 1621
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecordingPaused()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 1632
    :cond_2
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0

    .line 1622
    :cond_3
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1623
    iget-wide v4, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0xbb8

    cmp-long v0, v4, v6

    const/4 v4, 0x1

    if-lez v0, :cond_4

    .line 1624
    iput-wide v2, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    .line 1625
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const v2, 0x7f090122

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1626
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 1628
    :cond_4
    invoke-virtual {p0, v4, v1}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1630
    :goto_1
    return v4
.end method

.method public onBeautyChanged()V
    .locals 3

    .line 140
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xd

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 141
    return-void
.end method

.method protected onCameraOpened()V
    .locals 3

    .line 258
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 260
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initializeFocusManager()V

    .line 262
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 264
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initLiveConfig()Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v0

    .line 266
    sget-object v1, Lcom/android/camera/module/LiveModule$7;->$SwitchMap$com$ss$android$ttve$oauth$TEOAuthResult:[I

    invoke-virtual {v0}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 274
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->showAuthError()V

    .line 275
    return-void

    .line 269
    :pswitch_1
    nop

    .line 279
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 281
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isFirstShowCTAConCollect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/CtaNoticeFragment;->showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    .line 285
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    .line 286
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 287
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 288
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initMetaParser()V

    .line 289
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(II)V
    .locals 0

    .line 246
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 247
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 248
    new-instance p1, Lcom/android/camera/module/LiveModule$MainHandler;

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/camera/module/LiveModule$MainHandler;-><init>(Lcom/android/camera/module/LiveModule;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 249
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const-string p2, "phone"

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 250
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->onCameraOpened()V

    .line 251
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 252
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 p2, 0x1f

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 253
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setRotationVectorEnabled(Z)V

    .line 254
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 565
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 567
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    if-eqz v0, :cond_0

    .line 568
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->dismiss()V

    .line 570
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    sget-object v1, Lcom/android/camera/module/-$$Lambda$LiveModule$QVM-tqWYbz8yPiLYvpxAglWLw-g;->INSTANCE:Lcom/android/camera/module/-$$Lambda$LiveModule$QVM-tqWYbz8yPiLYvpxAglWLw-g;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 577
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_1

    .line 578
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 580
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setRotationVectorEnabled(Z)V

    .line 581
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setTTARSensorEnabled(Z)V

    .line 582
    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 3

    .line 1563
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1564
    return-void

    .line 1566
    :cond_0
    if-nez p1, :cond_1

    .line 1567
    return-void

    .line 1571
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->gy()Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p1

    if-lez p2, :cond_2

    const/4 p2, 0x0

    aget-object p2, p1, p2

    iget p2, p2, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v0, 0xface

    if-ne p2, v0, :cond_2

    .line 1573
    iget-boolean p2, p0, Lcom/android/camera/module/LiveModule;->mObjectTrackingStarted:Z

    if-eqz p2, :cond_3

    .line 1574
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x3

    .line 1575
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1574
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    goto :goto_0

    .line 1579
    :cond_2
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x1

    .line 1580
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1579
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1581
    return-void

    .line 1584
    :cond_3
    :goto_0
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 8

    .line 1134
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 1138
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v1, 0x3

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 1158
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v0

    .line 1159
    const/4 v2, 0x0

    .line 1160
    if-eqz v0, :cond_1

    .line 1161
    const-string v2, "onAutoFocusMoving start"

    .line 1163
    :cond_1
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 1164
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1168
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-ne v0, v1, :cond_3

    .line 1169
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-ne v0, v1, :cond_5

    .line 1170
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-nez v0, :cond_5

    .line 1171
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 1140
    :pswitch_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "FocusTime=%1$dms focused=%2$b"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 1141
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getElapsedTime()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 1140
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1142
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1143
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 1144
    invoke-virtual {p0, v6}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1148
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1149
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 1151
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-eqz p1, :cond_5

    .line 1152
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v6}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    .line 1177
    :cond_5
    :goto_0
    return-void

    .line 1135
    :cond_6
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onHostStopAndNotifyActionStop()V
    .locals 0

    .line 1774
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    .line 1775
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->doLaterReleaseIfNeed()V

    .line 1776
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1638
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1639
    return v1

    .line 1642
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1643
    return v2

    .line 1646
    :cond_1
    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_3

    .line 1677
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1678
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1679
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 1681
    :cond_2
    return v2

    .line 1686
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1687
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1688
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 1690
    :cond_3
    return v2

    .line 1649
    :sswitch_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 1650
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->restoreBottom()V

    .line 1651
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1652
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1654
    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1657
    :cond_4
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    .line 1659
    :cond_5
    :goto_0
    return v1

    .line 1666
    :sswitch_3
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsPreviewing:Z

    if-eqz v0, :cond_6

    .line 1667
    goto :goto_3

    .line 1669
    :cond_6
    const/16 v0, 0x18

    if-eq p1, v0, :cond_8

    const/16 v0, 0x58

    if-ne p1, v0, :cond_7

    goto :goto_1

    :cond_7
    goto :goto_2

    :cond_8
    :goto_1
    move v2, v1

    .line 1672
    :goto_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    .line 1669
    invoke-virtual {p0, v2, v1, v0}, Lcom/android/camera/module/LiveModule;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1673
    return v1

    .line 1698
    :cond_9
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

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

    .line 1703
    const/4 v0, 0x4

    const/4 v1, 0x1

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    const/16 v0, 0x42

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 1706
    :cond_0
    return v1

    .line 1710
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    .line 1711
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1712
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1713
    return v1

    .line 1716
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    .line 1791
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    .line 1792
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1793
    return-void

    .line 1795
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    new-instance v1, Lcom/android/camera/module/LiveModule$6;

    invoke-direct {v1, p0, p2, p1}, Lcom/android/camera/module/LiveModule$6;-><init>(Lcom/android/camera/module/LiveModule;Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 1814
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 0

    .line 1183
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->setOrientation(II)V

    .line 1184
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 514
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 519
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 520
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 523
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->tryRemoveCountDownMessage()V

    .line 524
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 527
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resetScreenOn()V

    .line 529
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->closeCamera()V

    .line 531
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_1

    .line 532
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 534
    :cond_1
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 2

    .line 865
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 866
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 868
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 869
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 870
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPause()V

    goto :goto_0

    .line 872
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveRecordingParams()V

    .line 873
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordResume()V

    .line 874
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onResume()V

    .line 876
    :goto_0
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    .line 358
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 359
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 361
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 360
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 362
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 364
    :cond_0
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    .line 1599
    if-nez p1, :cond_0

    .line 1600
    return-void

    .line 1603
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 1605
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 1606
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1608
    :cond_1
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 1122
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1112
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isTextureExpired()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->retryOnceIfCameraError(Landroid/os/Handler;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1113
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v0, "sessionFailed due to surfaceTexture expired, retry"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1114
    return-void

    .line 1116
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 1117
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1097
    if-nez p1, :cond_0

    .line 1098
    return-void

    .line 1100
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1101
    return-void

    .line 1104
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 1106
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 1107
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 369
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 371
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 507
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOnAwhile()V

    .line 509
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 2

    .line 949
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 951
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 953
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 954
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 955
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsPreviewing:Z

    .line 957
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 958
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    goto :goto_0

    .line 960
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 962
    :goto_0
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 2

    .line 926
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 929
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 930
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 933
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 934
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 935
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsPreviewing:Z

    .line 937
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startSaveToLocal()V

    .line 939
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 940
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    goto :goto_0

    .line 942
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 944
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 1

    .line 726
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecordingPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 729
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkCallingState()Z

    move-result p1

    if-nez p1, :cond_1

    .line 730
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v0, "ignore in calling state"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    .line 733
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 734
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    .line 735
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    .line 736
    return-void

    .line 739
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->startVideoRecording()V

    .line 741
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xab

    .line 742
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 743
    if-eqz p1, :cond_3

    .line 744
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()V

    goto :goto_1

    .line 727
    :cond_2
    :goto_0
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 747
    :cond_3
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 899
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    .line 893
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 0

    .line 904
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2

    .line 1240
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1242
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1243
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->isInTapableRect(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1244
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    .line 1245
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1249
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1250
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1251
    return-void

    .line 1255
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1256
    return-void

    .line 1261
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 1262
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1263
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1264
    return-void

    .line 1271
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1272
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    .line 1273
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 1274
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 1275
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->unlockAEAF()V

    .line 1276
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 1277
    return-void

    .line 1246
    :cond_4
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 557
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 558
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 561
    :cond_0
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0

    .line 915
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDoingAction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 916
    return-void

    .line 918
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 919
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 921
    :cond_1
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 1

    .line 1484
    const/4 v0, 0x0

    return v0
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 479
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 480
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 481
    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 482
    const-string v1, ":miui:starting_window_label"

    .line 483
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090045

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 482
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 484
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 485
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 487
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 488
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 490
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 491
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .line 651
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 652
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->forceTurnFlashOffAndPausePreview()V

    goto :goto_0

    .line 654
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 656
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setEffectAudio(Z)V

    .line 657
    invoke-virtual {p0, v1}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 658
    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    .line 1722
    if-nez p2, :cond_1

    if-eqz p3, :cond_1

    .line 1723
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->restoreBottom()V

    .line 1724
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isIgnoreTouchEvent()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1725
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string p2, "ignore volume key"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1726
    return-void

    .line 1728
    :cond_0
    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    .line 1730
    :cond_1
    return-void
.end method

.method public playFocusSound(I)V
    .locals 0

    .line 1531
    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->playCameraSound(I)V

    .line 1532
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    .line 213
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 214
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 215
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 216
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 217
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 218
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 220
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 223
    return-void

    :array_0
    .array-data 4
        0xa4
        0xd4
    .end array-data
.end method

.method protected resetScreenOn()V
    .locals 2

    .line 549
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 550
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 551
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 552
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .line 662
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 663
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setEffectAudio(Z)V

    .line 664
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .line 1740
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isSelectingCapturedResult()Z

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

.method protected showConfirmMessage(II)V
    .locals 8

    .line 1070
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1071
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mTitleId:I

    if-eq v0, p1, :cond_1

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mMessageId:I

    if-ne v0, p2, :cond_0

    goto :goto_0

    .line 1074
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_1

    .line 1072
    :cond_1
    :goto_0
    return-void

    .line 1076
    :cond_2
    :goto_1
    iput p1, p0, Lcom/android/camera/module/LiveModule;->mTitleId:I

    .line 1077
    iput p2, p0, Lcom/android/camera/module/LiveModule;->mMessageId:I

    .line 1078
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1080
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1081
    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const p2, 0x104000a

    .line 1082
    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 1078
    invoke-static/range {v1 .. v7}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mDialog:Landroid/app/AlertDialog;

    .line 1083
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .line 1495
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1498
    :cond_0
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 1499
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1500
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 1501
    iget-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mShowFace:Z

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/LiveModule;->updateFaceView(ZZ)V

    .line 1503
    :cond_1
    return-void

    .line 1496
    :cond_2
    :goto_0
    return-void
.end method

.method public startFocus()V
    .locals 3

    .line 1441
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1442
    return-void

    .line 1444
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1445
    return-void

    .line 1448
    :cond_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "startFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1449
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 1450
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    goto :goto_0

    .line 1452
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1454
    :goto_0
    return-void
.end method

.method public startPreview()V
    .locals 8

    .line 606
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 607
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 608
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 609
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 610
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 611
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0}, Lcom/android/camera/Util;->convertSizeToQuality(Lcom/android/camera/CameraSize;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 613
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mSurfaceCreatedTimestamp:J

    .line 614
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "LiveModule, startPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkDisplayOrientation()V

    .line 617
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x10e

    goto :goto_0

    :cond_0
    const/16 v0, 0x5a

    .line 618
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v4

    invoke-interface {v1, v2, v3, v4, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initPreview(IIZI)V

    .line 619
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->setEncodeSize(II)V

    .line 620
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 621
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    new-instance v2, Lcom/android/camera/module/LiveModule$4;

    invoke-direct {v2, p0}, Lcom/android/camera/module/LiveModule$4;-><init>(Lcom/android/camera/module/LiveModule;)V

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->startPreview(Landroid/view/Surface;Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V

    .line 636
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 637
    :goto_1
    move v3, v0

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isSelectingCapturedResult()Z

    move-result v0

    if-nez v0, :cond_2

    .line 638
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v2, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 639
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 640
    const/4 v4, 0x0

    .line 642
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getOperatingMode()I

    move-result v5

    const/4 v6, 0x0

    .line 638
    move-object v7, p0

    invoke-virtual/range {v1 .. v7}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 647
    :cond_2
    return-void
.end method

.method public startSaveToLocal()V
    .locals 4

    .line 1756
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    if-eqz v0, :cond_0

    .line 1757
    return-void

    .line 1760
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 1761
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->getSaveContentValues()Landroid/content/ContentValues;

    move-result-object v0

    .line 1762
    if-nez v0, :cond_1

    .line 1763
    return-void

    .line 1766
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    .line 1767
    const-string v2, "_data"

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1768
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v3

    invoke-virtual {v3, v2, v0, v1}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 1770
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 3

    .line 1507
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 1511
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1512
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_1

    .line 1513
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 1515
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 1516
    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/LiveModule;->updateFaceView(ZZ)V

    .line 1517
    return-void

    .line 1508
    :cond_2
    :goto_0
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0

    .line 1522
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 2

    .line 819
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOnAwhile()V

    .line 822
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 824
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 825
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->hasSegments()Z

    move-result v0

    if-nez v0, :cond_0

    .line 826
    sget-object p2, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v0, "onFinish of no segments !!"

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p2}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 828
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    goto :goto_0

    .line 830
    :cond_0
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostPreview()V

    .line 831
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 832
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v0, "listen none"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveVideoParams()V

    .line 834
    if-nez p2, :cond_1

    .line 835
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/module/LiveModule;->mIsPreviewing:Z

    .line 836
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->showPreview()V

    .line 839
    :cond_1
    :goto_0
    return-void
.end method

.method public unRegisterModulePersistProtocol()V
    .locals 1

    .line 240
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterModulePersistProtocol()V

    .line 241
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachModulePersistent()V

    .line 242
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 3

    .line 228
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 229
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 230
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 231
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 232
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 233
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 235
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 236
    return-void
.end method

.method protected unlockAEAF()V
    .locals 2

    .line 1281
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1282
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 1283
    iget-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    if-eqz v1, :cond_0

    .line 1284
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1286
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1287
    return-void
.end method

.method protected updateFace()V
    .locals 3

    .line 1415
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->enableFaceDetection()Z

    move-result v0

    .line 1417
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    .line 1418
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 1420
    :cond_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1421
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_2

    .line 1422
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1423
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startFaceDetection()V

    goto :goto_0

    .line 1426
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    .line 1427
    invoke-virtual {p0, v1}, Lcom/android/camera/module/LiveModule;->stopFaceDetection(Z)V

    .line 1428
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1431
    :cond_2
    :goto_0
    return-void
.end method

.method public updateFlashPreference()V
    .locals 2

    .line 1326
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1327
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1328
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setFlashMode(Ljava/lang/String;)V

    .line 1329
    return-void
.end method

.method protected updateFocusArea()V
    .locals 4

    .line 1395
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1396
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "updateFocusArea: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1397
    return-void

    .line 1399
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 1400
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 1401
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1402
    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 1401
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1404
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1406
    iget-boolean v2, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v2, :cond_2

    .line 1407
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    goto :goto_1

    .line 1409
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1411
    :goto_1
    return-void
.end method
