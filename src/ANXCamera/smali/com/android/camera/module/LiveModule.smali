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

.field protected mFaceDetectionEnabled:Z

.field protected mFaceDetectionStarted:Z

.field private mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field private mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

.field private mIsRecording:Z

.field private mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

.field private mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

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

.field private mQuality:I

.field private mSaved:Z

.field protected mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field protected mShowFace:Z

.field private mTouchFocusStartingTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 89
    const-class v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 81
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mShowFace:Z

    .line 119
    const/4 v1, 0x5

    iput v1, p0, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 122
    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsRecording:Z

    .line 930
    new-instance v0, Lcom/android/camera/module/LiveModule$4;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$4;-><init>(Lcom/android/camera/module/LiveModule;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;
    .locals 0

    .line 81
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    .line 81
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/module/LiveModule;ZZ)V
    .locals 0

    .line 81
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic access$402(Lcom/android/camera/module/LiveModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 81
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/loader/camera2/FocusManager2;
    .locals 0

    .line 81
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;
    .locals 0

    .line 81
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    return-object p0
.end method

.method private createName(JI)Ljava/lang/String;
    .locals 1

    .line 650
    if-gtz p3, :cond_0

    .line 651
    new-instance p3, Ljava/util/Date;

    invoke-direct {p3, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 652
    new-instance p1, Ljava/text/SimpleDateFormat;

    const p2, 0x7f0900c9

    .line 653
    invoke-virtual {p0, p2}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 654
    invoke-virtual {p1, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    .line 655
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1

    .line 657
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1
.end method

.method private doLaterReleaseIfNeed()V
    .locals 2

    .line 1701
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    .line 1702
    return-void

    .line 1705
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1706
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    .line 1707
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 1708
    return-void

    .line 1710
    :cond_1
    return-void
.end method

.method private genContentValues(IIZ)Landroid/content/ContentValues;
    .locals 7

    .line 662
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 663
    invoke-direct {p0, v0, v1, p2}, Lcom/android/camera/module/LiveModule;->createName(JI)Ljava/lang/String;

    move-result-object v2

    .line 664
    if-lez p2, :cond_0

    .line 665
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

    .line 666
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 668
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 669
    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object p1

    .line 670
    nop

    .line 671
    const/16 v3, 0x2f

    if-eqz p3, :cond_1

    .line 672
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->CAMERA_TEMP_DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 673
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

    .line 675
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 677
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

    .line 678
    new-instance v3, Landroid/content/ContentValues;

    const/16 v4, 0x8

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 679
    const-string v4, "title"

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    const-string v2, "_display_name"

    invoke-virtual {v3, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    const-string p2, "datetaken"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 682
    const-string p2, "mime_type"

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    const-string p1, "_data"

    invoke-virtual {v3, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    const-string p1, "resolution"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->width:I

    .line 685
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

    .line 684
    invoke-virtual {v3, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object p1

    .line 687
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

    .line 688
    :cond_2
    const-string p2, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    invoke-virtual {v3, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 689
    const-string p2, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 693
    :cond_3
    return-object v3
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6

    .line 1467
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v3

    .line 1468
    if-eqz p1, :cond_0

    .line 1470
    iget-boolean p2, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1471
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq p2, v0, :cond_1

    .line 1472
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0

    .line 1476
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 1478
    :cond_1
    :goto_0
    return-void
.end method

.method private initLiveConfig()Lcom/ss/android/ttve/oauth/TEOAuthResult;
    .locals 5

    .line 308
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 309
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xd1

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 310
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    .line 311
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

    .line 314
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 315
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 317
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initResource()V

    .line 320
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

    .line 324
    new-instance v0, Lcom/android/camera/module/LiveModule$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$2;-><init>(Lcom/android/camera/module/LiveModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 325
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    .line 331
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 332
    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 333
    return-void
.end method

.method private initializeFocusManager()V
    .locals 4

    .line 997
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1000
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1001
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1004
    nop

    .line 1005
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1006
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    .line 1008
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 1009
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 1010
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 1009
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1011
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_1

    .line 1016
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1017
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1019
    :goto_1
    return-void
.end method

.method private isEisOn()Z
    .locals 1

    .line 1267
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isBackCamera()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$onDestroy$0()V
    .locals 4

    .line 550
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 551
    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 552
    if-eqz v0, :cond_0

    .line 553
    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3, v3, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCenterHint(ILjava/lang/String;Ljava/lang/String;I)V

    .line 555
    :cond_0
    return-void
.end method

.method private previewWhenSessionSuccess()V
    .locals 1

    .line 1048
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1050
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    .line 1051
    return-void
.end method

.method private setOrientation(II)V
    .locals 1

    .line 1112
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1113
    return-void

    .line 1116
    :cond_0
    iput p1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    .line 1119
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkActivityOrientation()V

    .line 1123
    iget p1, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    if-eq p1, p2, :cond_1

    .line 1124
    iput p2, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    .line 1125
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    .line 1127
    :cond_1
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .line 1131
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1132
    return-void

    .line 1134
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1135
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1136
    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x23

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 1138
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1141
    :cond_2
    :goto_0
    return-void
.end method

.method private shouldApplyUltraWideLDC()Z
    .locals 3

    .line 1298
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1299
    return v1

    .line 1301
    :cond_0
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 1303
    return v1

    .line 1305
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideVideoLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private showAuthError()V
    .locals 2

    .line 271
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    new-instance v1, Lcom/android/camera/module/LiveModule$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/LiveModule$1;-><init>(Lcom/android/camera/module/LiveModule;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 295
    return-void
.end method

.method private showPreview()V
    .locals 3

    .line 639
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->pausePreview()V

    .line 642
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    .line 643
    const/4 v1, 0x2

    invoke-direct {p0, v1, v0, v0}, Lcom/android/camera/module/LiveModule;->genContentValues(IIZ)Landroid/content/ContentValues;

    move-result-object v0

    .line 645
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 646
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->startLiveRecordPreview(Landroid/content/ContentValues;)V

    .line 647
    return-void
.end method

.method private startVideoRecording()V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .line 713
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOn()V

    .line 716
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 717
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 718
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    .line 720
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStart()V

    .line 723
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    .line 725
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveRecordingParams()V

    .line 727
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsRecording:Z

    .line 728
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getVolumeControlStream()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    .line 729
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 730
    return-void
.end method

.method private trackLiveRecordingParams()V
    .locals 17

    .line 736
    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveAllSwitchAllValue()I

    move-result v0

    .line 737
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object v1

    .line 738
    const/4 v2, 0x1

    aget-object v4, v1, v2

    .line 739
    nop

    .line 740
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 741
    nop

    .line 744
    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveFilter()I

    move-result v5

    .line 745
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v6, v7, v5}, Lcom/android/camera/effect/EffectController;->findLiveFilter(Landroid/content/Context;I)Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    move-result-object v5

    .line 746
    nop

    .line 747
    iget-object v6, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 748
    nop

    .line 749
    and-int/lit8 v6, v0, 0x2

    if-nez v6, :cond_1

    add-int/lit8 v0, v0, 0x2

    .line 752
    :cond_1
    move v6, v2

    goto :goto_1

    :cond_2
    move v6, v3

    .line 753
    :goto_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v8

    .line 754
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 755
    nop

    .line 756
    and-int/lit8 v7, v0, 0x4

    if-nez v7, :cond_3

    add-int/lit8 v0, v0, 0x4

    .line 758
    :cond_3
    move v7, v2

    goto :goto_2

    :cond_4
    move v7, v3

    :goto_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeed()Ljava/lang/String;

    move-result-object v9

    .line 760
    nop

    .line 761
    const-string v10, "key_live_shrink_face_ratio"

    const/16 v11, 0x28

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v10

    int-to-float v10, v10

    const/high16 v12, 0x42c80000    # 100.0f

    div-float v13, v10, v12

    .line 762
    const-string v10, "key_live_enlarge_eye_ratio"

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v10

    int-to-float v10, v10

    div-float v14, v10, v12

    .line 763
    const-string v10, "key_live_smooth_strength"

    invoke-static {v10, v11}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v10

    int-to-float v10, v10

    div-float v15, v10, v12

    .line 765
    const/4 v10, 0x0

    cmpl-float v11, v13, v10

    if-gtz v11, :cond_6

    cmpl-float v11, v14, v10

    if-gtz v11, :cond_6

    cmpl-float v10, v15, v10

    if-lez v10, :cond_5

    goto :goto_3

    .line 769
    :cond_5
    move v10, v3

    goto :goto_4

    .line 766
    :cond_6
    :goto_3
    nop

    .line 767
    and-int/lit8 v3, v0, 0x8

    if-nez v3, :cond_7

    add-int/lit8 v0, v0, 0x8

    .line 769
    :cond_7
    move v10, v2

    :goto_4
    iget-object v2, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    move-object/from16 v3, p0

    iget v12, v3, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 770
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v16

    .line 769
    move v3, v1

    move v5, v6

    move-object v6, v2

    move v11, v13

    move v1, v12

    move v12, v14

    move v13, v15

    move v14, v1

    move/from16 v15, v16

    invoke-static/range {v3 .. v15}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveRecordingParams(ZLjava/lang/String;ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;ZFFFIZ)V

    .line 771
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setLiveAllSwitchAddValue(I)V

    .line 772
    return-void
.end method

.method private trackLiveVideoParams()V
    .locals 7

    .line 798
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getSegments()I

    move-result v0

    .line 799
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getTotalRecordingTime()J

    move-result-wide v1

    long-to-float v1, v1

    .line 800
    nop

    .line 801
    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveAllSwitchAllValue()I

    move-result v2

    .line 802
    and-int/lit8 v3, v2, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    .line 803
    nop

    .line 805
    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    and-int/lit8 v6, v2, 0x4

    if-eqz v6, :cond_1

    .line 806
    nop

    .line 808
    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v5

    :goto_1
    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_2

    .line 809
    goto :goto_2

    .line 811
    :cond_2
    move v4, v5

    :goto_2
    invoke-static {v5}, Lcom/android/camera/CameraSettings;->setLiveAllSwitchAddValue(I)V

    .line 812
    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    invoke-static {v0, v1, v3, v6, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveVideoParams(IFZZZ)V

    .line 813
    return-void
.end method

.method private updateBeauty()V
    .locals 6

    .line 437
    const-string v0, "key_live_shrink_face_ratio"

    const/16 v1, 0x28

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    .line 438
    const-string v3, "key_live_enlarge_eye_ratio"

    invoke-static {v3, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    .line 439
    const-string v4, "key_live_smooth_strength"

    invoke-static {v4, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    .line 440
    const/4 v2, 0x0

    cmpl-float v4, v0, v2

    if-gtz v4, :cond_1

    cmpl-float v4, v3, v2

    if-gtz v4, :cond_1

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    goto :goto_0

    .line 447
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setLiveBeautyStatus(Z)V

    .line 448
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v4, :cond_2

    .line 449
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v3, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautyFaceReshape(ZFF)V

    .line 450
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautify(ZF)V

    goto :goto_1

    .line 441
    :cond_1
    :goto_0
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setLiveBeautyStatus(Z)V

    .line 442
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v4, :cond_2

    .line 443
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v3, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautyFaceReshape(ZFF)V

    .line 444
    iget-object v4, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v4, v2, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setBeautify(ZF)V

    .line 453
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

    .line 454
    return-void
.end method

.method private updateDeviceOrientation()V
    .locals 2

    .line 1243
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 1244
    return-void
.end method

.method private updateFaceView(ZZ)V
    .locals 2

    .line 1459
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1460
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 1462
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 1463
    nop

    .line 1462
    invoke-virtual {v0, v1, p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 1463
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 1464
    return-void
.end method

.method private updateFilter()V
    .locals 4

    .line 1260
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 1261
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

    .line 1262
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 1263
    return-void
.end method

.method private updateFocusMode()V
    .locals 2

    .line 1255
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1256
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setFocusMode(Ljava/lang/String;)V

    .line 1257
    return-void
.end method

.method private updateFpsRange()V
    .locals 5

    .line 1309
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    const/16 v2, 0x1e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    .line 1310
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 1311
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 5

    .line 1230
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v1, Landroid/graphics/SurfaceTexture;

    .line 1231
    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 1232
    iget v1, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mBogusCameraId:I

    .line 1233
    const/16 v3, 0x10

    const/16 v4, 0x9

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v3

    float-to-double v3, v3

    .line 1232
    invoke-static {v1, v2, v0, v3, v4}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1235
    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 1236
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->updateCameraScreenNailSize(II)V

    .line 1237
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

    .line 1239
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 1240
    return-void
.end method

.method private updateUltraWideLDC()V
    .locals 2

    .line 1294
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->shouldApplyUltraWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setUltraWideLDC(Z)V

    .line 1295
    return-void
.end method

.method private updateVideoStabilization()V
    .locals 4

    .line 1271
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1272
    return-void

    .line 1274
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->isEisOn()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1275
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: EIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1276
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1277
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1278
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1279
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    goto :goto_0

    .line 1282
    :cond_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v3, "videoStabilization: OIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1284
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1285
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1287
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public cancelFocus(Z)V
    .locals 1

    .line 1377
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1378
    return-void

    .line 1381
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1382
    return-void

    .line 1385
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_2

    .line 1386
    return-void

    .line 1389
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    .line 1390
    if-eqz p1, :cond_3

    .line 1391
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1393
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 1396
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    .line 1397
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1399
    :cond_5
    return-void
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .line 1146
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1147
    return-void

    .line 1149
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 1151
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_1

    .line 1152
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 1155
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 1156
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 1158
    :cond_2
    return-void
.end method

.method public closeCamera()V
    .locals 2

    .line 566
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 567
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 570
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 571
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 575
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 576
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 577
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 578
    iput-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 581
    :cond_2
    return-void
.end method

.method protected varargs consumePreference([I)V
    .locals 3

    .line 354
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 355
    sparse-switch v2, :sswitch_data_0

    .line 430
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

    .line 426
    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateUltraWideLDC()V

    .line 427
    goto :goto_1

    .line 385
    :sswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateDeviceOrientation()V

    .line 386
    goto :goto_1

    .line 401
    :sswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateVideoStabilization()V

    .line 402
    goto :goto_1

    .line 397
    :sswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateExposureMeteringMode()V

    .line 398
    goto :goto_1

    .line 393
    :sswitch_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->focusCenter()V

    .line 394
    goto :goto_1

    .line 389
    :sswitch_5
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->setZoomRatio(F)V

    .line 390
    goto :goto_1

    .line 418
    :sswitch_6
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFpsRange()V

    .line 419
    goto :goto_1

    .line 381
    :sswitch_7
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFocusMode()V

    .line 382
    goto :goto_1

    .line 422
    :sswitch_8
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateBeauty()V

    .line 423
    goto :goto_1

    .line 405
    :sswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->setEvValue()V

    .line 406
    goto :goto_1

    .line 415
    :sswitch_a
    goto :goto_1

    .line 377
    :sswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFlashPreference()V

    .line 378
    goto :goto_1

    .line 373
    :sswitch_c
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->updateAntiBanding(Ljava/lang/String;)V

    .line 374
    goto :goto_1

    .line 369
    :sswitch_d
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFace()V

    .line 370
    goto :goto_1

    .line 365
    :sswitch_e
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFocusArea()V

    .line 366
    goto :goto_1

    .line 361
    :sswitch_f
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFilter()V

    .line 362
    goto :goto_1

    .line 357
    :sswitch_10
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updatePictureAndPreviewSize()V

    .line 358
    nop

    .line 354
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 434
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

    .line 832
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    goto :goto_0

    .line 836
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordReverse()V

    .line 837
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->hasSegments()Z

    move-result v0

    if-nez v0, :cond_1

    .line 838
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 840
    :cond_1
    return-void

    .line 833
    :cond_2
    :goto_0
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .line 1353
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    .line 1355
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1353
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected getOperatingMode()I
    .locals 1

    .line 474
    nop

    .line 475
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 476
    const v0, 0x8004

    goto :goto_0

    .line 477
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fg()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 478
    const v0, 0x8030

    goto :goto_0

    .line 481
    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initializeCapabilities()V
    .locals 2

    .line 299
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 300
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 302
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 300
    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mContinuousFocusSupported:Z

    .line 303
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    .line 304
    return-void
.end method

.method protected is3ALocked()Z
    .locals 1

    .line 1222
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    return v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    .line 1226
    const/4 v0, 0x1

    return v0
.end method

.method public isDoingAction()Z
    .locals 2

    .line 861
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 862
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

    .line 1507
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isNeedMute()Z
    .locals 1

    .line 1455
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 2

    .line 920
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 921
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

    .line 926
    const/4 v0, 0x0

    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    .line 1512
    const/4 v0, 0x0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 1654
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

    .line 521
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 522
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 523
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 524
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 525
    return-void
.end method

.method protected keepScreenOnAwhile()V
    .locals 4

    .line 516
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 518
    return-void
.end method

.method protected lockAEAF()V
    .locals 2

    .line 1212
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1213
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1214
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1216
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1218
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 1219
    return-void
.end method

.method public multiCapture()Z
    .locals 1

    .line 1408
    const/4 v0, 0x0

    return v0
.end method

.method public notifyError()V
    .locals 1

    .line 1665
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->notifyError()V

    .line 1667
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1668
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1669
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1671
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    if-eqz v0, :cond_1

    .line 1672
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->closeCamera()V

    .line 1675
    :cond_1
    return-void
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .line 1445
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 1446
    return-void
.end method

.method public onBackPressed()Z
    .locals 8

    .line 1532
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1533
    return v1

    .line 1536
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_1

    .line 1537
    return v1

    .line 1540
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

    .line 1551
    :cond_2
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0

    .line 1541
    :cond_3
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1542
    iget-wide v4, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0xbb8

    cmp-long v0, v4, v6

    const/4 v4, 0x1

    if-lez v0, :cond_4

    .line 1543
    iput-wide v2, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    .line 1544
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const v2, 0x7f090122

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1545
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 1547
    :cond_4
    invoke-virtual {p0, v4, v1}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1549
    :goto_1
    return v4
.end method

.method public onBeautyChanged()V
    .locals 3

    .line 131
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xd

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 132
    return-void
.end method

.method protected onCameraOpened()V
    .locals 3

    .line 237
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 239
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initializeFocusManager()V

    .line 241
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 243
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initLiveConfig()Lcom/ss/android/ttve/oauth/TEOAuthResult;

    move-result-object v0

    .line 245
    sget-object v1, Lcom/android/camera/module/LiveModule$6;->$SwitchMap$com$ss$android$ttve$oauth$TEOAuthResult:[I

    invoke-virtual {v0}, Lcom/ss/android/ttve/oauth/TEOAuthResult;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 253
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->showAuthError()V

    .line 254
    return-void

    .line 248
    :pswitch_1
    nop

    .line 258
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 260
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isFirstShowCTAConCollect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/CtaNoticeFragment;->showCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Lcom/android/camera/fragment/CtaNoticeFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    .line 264
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    .line 265
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 266
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 267
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initMetaParser()V

    .line 268
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

    .line 226
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 227
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 228
    new-instance p1, Lcom/android/camera/module/LiveModule$MainHandler;

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/camera/module/LiveModule$MainHandler;-><init>(Lcom/android/camera/module/LiveModule;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 229
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->onCameraOpened()V

    .line 230
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 231
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 p2, 0x1f

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 232
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setRotationVectorEnabled(Z)V

    .line 233
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 544
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 546
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    if-eqz v0, :cond_0

    .line 547
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCtaNoticeFragment:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->dismiss()V

    .line 549
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    sget-object v1, Lcom/android/camera/module/-$$Lambda$LiveModule$QVM-tqWYbz8yPiLYvpxAglWLw-g;->INSTANCE:Lcom/android/camera/module/-$$Lambda$LiveModule$QVM-tqWYbz8yPiLYvpxAglWLw-g;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 556
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_1

    .line 557
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 559
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setRotationVectorEnabled(Z)V

    .line 560
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setTTARSensorEnabled(Z)V

    .line 561
    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 3

    .line 1482
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1483
    return-void

    .line 1485
    :cond_0
    if-nez p1, :cond_1

    .line 1486
    return-void

    .line 1490
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->gs()Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p1

    if-lez p2, :cond_2

    const/4 p2, 0x0

    aget-object p2, p1, p2

    iget p2, p2, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v0, 0xface

    if-ne p2, v0, :cond_2

    .line 1492
    iget-boolean p2, p0, Lcom/android/camera/module/LiveModule;->mObjectTrackingStarted:Z

    if-eqz p2, :cond_3

    .line 1493
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x3

    .line 1494
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1493
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    goto :goto_0

    .line 1498
    :cond_2
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x1

    .line 1499
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1498
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1500
    return-void

    .line 1503
    :cond_3
    :goto_0
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 8

    .line 1056
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 1060
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v1, 0x3

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 1080
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v0

    .line 1081
    const/4 v2, 0x0

    .line 1082
    if-eqz v0, :cond_1

    .line 1083
    const-string v2, "onAutoFocusMoving start"

    .line 1085
    :cond_1
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 1086
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1090
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-ne v0, v1, :cond_3

    .line 1091
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-ne v0, v1, :cond_5

    .line 1092
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-nez v0, :cond_5

    .line 1093
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 1062
    :pswitch_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "FocusTime=%1$dms focused=%2$b"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 1063
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

    .line 1062
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1064
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1065
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 1066
    invoke-virtual {p0, v6}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1070
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1071
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 1073
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-eqz p1, :cond_5

    .line 1074
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v6}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    .line 1099
    :cond_5
    :goto_0
    return-void

    .line 1057
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

    .line 1696
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    .line 1697
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->doLaterReleaseIfNeed()V

    .line 1698
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1557
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1558
    return v1

    .line 1561
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1562
    return v2

    .line 1565
    :cond_1
    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_3

    .line 1596
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1597
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1598
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 1600
    :cond_2
    return v2

    .line 1605
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1606
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1607
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    goto :goto_3

    .line 1609
    :cond_3
    return v2

    .line 1568
    :sswitch_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 1569
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->restoreBottom()V

    .line 1570
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1571
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1573
    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1576
    :cond_4
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    .line 1578
    :cond_5
    :goto_0
    return v1

    .line 1585
    :sswitch_3
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsRecording:Z

    if-eqz v0, :cond_6

    .line 1586
    goto :goto_3

    .line 1588
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

    .line 1591
    :goto_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    .line 1588
    invoke-virtual {p0, v2, v1, v0}, Lcom/android/camera/module/LiveModule;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1592
    return v1

    .line 1617
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

    .line 1622
    const/4 v0, 0x4

    const/4 v1, 0x1

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    const/16 v0, 0x42

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 1625
    :cond_0
    return v1

    .line 1629
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    .line 1630
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1631
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1632
    return v1

    .line 1635
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    .line 1713
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    .line 1714
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1715
    return-void

    .line 1717
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    new-instance v1, Lcom/android/camera/module/LiveModule$5;

    invoke-direct {v1, p0, p2, p1}, Lcom/android/camera/module/LiveModule$5;-><init>(Lcom/android/camera/module/LiveModule;Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 1736
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 0

    .line 1105
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->setOrientation(II)V

    .line 1106
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 493
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 498
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 499
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 502
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->tryRemoveCountDownMessage()V

    .line 503
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 506
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resetScreenOn()V

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->closeCamera()V

    .line 510
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_1

    .line 511
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 513
    :cond_1
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 2

    .line 817
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 818
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 820
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 821
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 822
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPause()V

    goto :goto_0

    .line 824
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveRecordingParams()V

    .line 825
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordResume()V

    .line 826
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onResume()V

    .line 828
    :goto_0
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    .line 337
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 338
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 339
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 340
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 339
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 341
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 343
    :cond_0
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    .line 1518
    if-nez p1, :cond_0

    .line 1519
    return-void

    .line 1522
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 1524
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 1525
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1527
    :cond_1
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 1044
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1038
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 1039
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1024
    if-nez p1, :cond_0

    .line 1025
    return-void

    .line 1027
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1028
    return-void

    .line 1031
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 1033
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 1034
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 348
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 350
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 486
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 487
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOnAwhile()V

    .line 488
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 2

    .line 901
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 903
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 905
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 906
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 907
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsRecording:Z

    .line 909
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 910
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    goto :goto_0

    .line 912
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 914
    :goto_0
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 2

    .line 878
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 881
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 882
    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 885
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    .line 886
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setVolumeControlStream(I)V

    .line 887
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mIsRecording:Z

    .line 889
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startSaveToLocal()V

    .line 891
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 892
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    goto :goto_0

    .line 894
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 896
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 1

    .line 698
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecordingPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 701
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->startVideoRecording()V

    .line 703
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xab

    .line 704
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 705
    if-eqz p1, :cond_2

    .line 706
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()V

    goto :goto_1

    .line 699
    :cond_1
    :goto_0
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 709
    :cond_2
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 851
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    .line 845
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 0

    .line 856
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2

    .line 1162
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1164
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1165
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->isInTapableRect(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1166
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    .line 1167
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1171
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1172
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    return-void

    .line 1177
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1178
    return-void

    .line 1183
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 1184
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1185
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1186
    return-void

    .line 1193
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1194
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    .line 1195
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 1196
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 1197
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->unlockAEAF()V

    .line 1198
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 1199
    return-void

    .line 1168
    :cond_4
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 536
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 537
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_0

    .line 538
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 540
    :cond_0
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0

    .line 867
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDoingAction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 868
    return-void

    .line 870
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 871
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 873
    :cond_1
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 1

    .line 1403
    const/4 v0, 0x0

    return v0
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 458
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 459
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 460
    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 461
    const-string v1, ":miui:starting_window_label"

    .line 462
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090045

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 461
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 463
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 464
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 466
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 467
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 469
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 470
    return-void
.end method

.method public pausePreview()V
    .locals 1

    .line 629
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 630
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 631
    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    .line 1641
    if-nez p2, :cond_1

    if-eqz p3, :cond_1

    .line 1642
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->restoreBottom()V

    .line 1643
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isIgnoreTouchEvent()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1644
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string p2, "ignore volume key"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1645
    return-void

    .line 1647
    :cond_0
    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->onShutterButtonClick(I)V

    .line 1649
    :cond_1
    return-void
.end method

.method public playFocusSound(I)V
    .locals 0

    .line 1450
    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->playCameraSound(I)V

    .line 1451
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    .line 193
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 194
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 195
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 196
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 197
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 198
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 200
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

    .line 203
    return-void

    :array_0
    .array-data 4
        0xa4
        0xd4
    .end array-data
.end method

.method protected resetScreenOn()V
    .locals 2

    .line 528
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 529
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 530
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x34

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 531
    return-void
.end method

.method public resumePreview()V
    .locals 0

    .line 635
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 636
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .line 1659
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

.method public startFaceDetection()V
    .locals 2

    .line 1414
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1417
    :cond_0
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 1418
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1419
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 1420
    iget-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mShowFace:Z

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/LiveModule;->updateFaceView(ZZ)V

    .line 1422
    :cond_1
    return-void

    .line 1415
    :cond_2
    :goto_0
    return-void
.end method

.method public startFocus()V
    .locals 3

    .line 1360
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1361
    return-void

    .line 1363
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1364
    return-void

    .line 1367
    :cond_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "startFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1368
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 1369
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    goto :goto_0

    .line 1371
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1373
    :goto_0
    return-void
.end method

.method public startPreview()V
    .locals 8

    .line 585
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 586
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 587
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 588
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 589
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 590
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0}, Lcom/android/camera/Util;->convertSizeToQuality(Lcom/android/camera/CameraSize;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mQuality:I

    .line 592
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mSurfaceCreatedTimestamp:J

    .line 593
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "LiveModule, startPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkDisplayOrientation()V

    .line 596
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x10e

    goto :goto_0

    :cond_0
    const/16 v0, 0x5a

    .line 597
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v4

    invoke-interface {v1, v2, v3, v4, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initPreview(IIZI)V

    .line 598
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->setEncodeSize(II)V

    .line 599
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 600
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    new-instance v2, Lcom/android/camera/module/LiveModule$3;

    invoke-direct {v2, p0}, Lcom/android/camera/module/LiveModule$3;-><init>(Lcom/android/camera/module/LiveModule;)V

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->startPreview(Landroid/view/Surface;Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V

    .line 615
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isSelectingCapturedResult()Z

    move-result v0

    if-nez v0, :cond_1

    .line 616
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v2, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 617
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 620
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getOperatingMode()I

    move-result v5

    const/4 v6, 0x0

    .line 616
    move-object v7, p0

    invoke-virtual/range {v1 .. v7}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 625
    :cond_1
    return-void
.end method

.method public startSaveToLocal()V
    .locals 4

    .line 1678
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    if-eqz v0, :cond_0

    .line 1679
    return-void

    .line 1682
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 1683
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->getSaveContentValues()Landroid/content/ContentValues;

    move-result-object v0

    .line 1684
    if-nez v0, :cond_1

    .line 1685
    return-void

    .line 1688
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mSaved:Z

    .line 1689
    const-string v2, "_data"

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1690
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v3

    invoke-virtual {v3, v2, v0, v1}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 1692
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 3

    .line 1426
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 1430
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1431
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_1

    .line 1432
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 1434
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 1435
    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/LiveModule;->updateFaceView(ZZ)V

    .line 1436
    return-void

    .line 1427
    :cond_2
    :goto_0
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0

    .line 1441
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 1

    .line 775
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOnAwhile()V

    .line 778
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 780
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 781
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->hasSegments()Z

    move-result v0

    if-nez v0, :cond_0

    .line 782
    sget-object p2, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v0, "onFinish of no segments !!"

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p2}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 784
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    goto :goto_0

    .line 786
    :cond_0
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostPreview()V

    .line 787
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->trackLiveVideoParams()V

    .line 788
    if-nez p2, :cond_1

    .line 789
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->showPreview()V

    .line 792
    :cond_1
    :goto_0
    return-void
.end method

.method public unRegisterModulePersistProtocol()V
    .locals 1

    .line 220
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterModulePersistProtocol()V

    .line 221
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachModulePersistent()V

    .line 222
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 3

    .line 208
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 209
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 210
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 211
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 212
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 213
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 215
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 216
    return-void
.end method

.method protected unlockAEAF()V
    .locals 2

    .line 1203
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1204
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 1205
    iget-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    if-eqz v1, :cond_0

    .line 1206
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1208
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1209
    return-void
.end method

.method protected updateFace()V
    .locals 3

    .line 1334
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->enableFaceDetection()Z

    move-result v0

    .line 1336
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    .line 1337
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 1339
    :cond_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1340
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_2

    .line 1341
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1342
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startFaceDetection()V

    goto :goto_0

    .line 1345
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    .line 1346
    invoke-virtual {p0, v1}, Lcom/android/camera/module/LiveModule;->stopFaceDetection(Z)V

    .line 1347
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1350
    :cond_2
    :goto_0
    return-void
.end method

.method public updateFlashPreference()V
    .locals 2

    .line 1248
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1249
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1250
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setFlashMode(Ljava/lang/String;)V

    .line 1251
    return-void
.end method

.method protected updateFocusArea()V
    .locals 4

    .line 1314
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1315
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "updateFocusArea: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1316
    return-void

    .line 1318
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 1319
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 1320
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1321
    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 1320
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1323
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1325
    iget-boolean v2, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v2, :cond_2

    .line 1326
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    goto :goto_1

    .line 1328
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1330
    :goto_1
    return-void
.end method
