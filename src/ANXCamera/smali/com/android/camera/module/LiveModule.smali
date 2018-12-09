.class public Lcom/android/camera/module/LiveModule;
.super Lcom/android/camera/module/BaseModule;
.source "LiveModule.java"

# interfaces
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;
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
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private m3ALocked:Z

.field private mBaseFileName:Ljava/lang/String;

.field protected mCurrentVideoValues:Landroid/content/ContentValues;

.field protected mFaceDetectionEnabled:Z

.field protected mFaceDetectionStarted:Z

.field private mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field private mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

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

.field private mOnResumeTime:J

.field protected mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field private mTouchFocusStartingTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 83
    const-class v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 75
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 678
    new-instance v0, Lcom/android/camera/module/LiveModule$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$2;-><init>(Lcom/android/camera/module/LiveModule;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/camera/module/LiveModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 75
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/camera/module/LiveModule;)J
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/loader/camera2/FocusManager2;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    return-object p0
.end method

.method private createName(JI)Ljava/lang/String;
    .locals 1

    .line 494
    if-gtz p3, :cond_0

    .line 495
    new-instance p3, Ljava/util/Date;

    invoke-direct {p3, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 496
    new-instance p1, Ljava/text/SimpleDateFormat;

    const p2, 0x7f0b00c4

    .line 497
    invoke-virtual {p0, p2}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 498
    invoke-virtual {p1, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    .line 499
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1

    .line 501
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mBaseFileName:Ljava/lang/String;

    return-object p1
.end method

.method private genContentValues(IIZ)Landroid/content/ContentValues;
    .locals 7

    .line 507
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 508
    invoke-direct {p0, v0, v1, p2}, Lcom/android/camera/module/LiveModule;->createName(JI)Ljava/lang/String;

    move-result-object v2

    .line 509
    if-lez p2, :cond_0

    .line 510
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

    .line 511
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 513
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 514
    invoke-static {p1}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object p1

    .line 515
    nop

    .line 516
    const/16 v3, 0x2f

    if-eqz p3, :cond_1

    .line 517
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->CAMERA_TEMP_DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 518
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

    .line 520
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 522
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

    .line 523
    new-instance v3, Landroid/content/ContentValues;

    const/16 v4, 0x8

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 524
    const-string v4, "title"

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    const-string v2, "_display_name"

    invoke-virtual {v3, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    const-string p2, "datetaken"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 527
    const-string p2, "mime_type"

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    const-string p1, "_data"

    invoke-virtual {v3, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    const-string p1, "resolution"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget p3, p3, Lcom/android/camera/CameraSize;->width:I

    .line 530
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

    .line 529
    invoke-virtual {v3, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object p1

    .line 532
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

    .line 533
    :cond_2
    const-string p2, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    invoke-virtual {v3, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 534
    const-string p2, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 538
    :cond_3
    return-object v3
.end method

.method private initLiveConfig()V
    .locals 5

    .line 227
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 228
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xd1

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 229
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    .line 230
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

    .line 233
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 234
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveVideoEditor:Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 236
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initResource()V

    .line 238
    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0xc9
        0xd1
    .end array-data
.end method

.method private initMetaParser()V
    .locals 3

    .line 242
    new-instance v0, Lcom/android/camera/module/LiveModule$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/LiveModule$1;-><init>(Lcom/android/camera/module/LiveModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 243
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    .line 249
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 250
    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 251
    return-void
.end method

.method private initializeFocusManager()V
    .locals 4

    .line 732
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 735
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 736
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 739
    nop

    .line 740
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 741
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    .line 743
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 744
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 745
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 744
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 746
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_1

    .line 751
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 752
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 754
    :goto_1
    return-void
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    .line 410
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 411
    return-void
.end method

.method private previewWhenSessionSuccess()V
    .locals 1

    .line 784
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 786
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    .line 787
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    .line 403
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 405
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 407
    :cond_0
    return-void
.end method

.method private setOrientation(II)V
    .locals 1

    .line 849
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 850
    return-void

    .line 853
    :cond_0
    iput p1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    .line 856
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkActivityOrientation()V

    .line 860
    iget p1, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    if-eq p1, p2, :cond_1

    .line 861
    iput p2, p0, Lcom/android/camera/module/LiveModule;->mOrientationCompensation:I

    .line 862
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->setOrientationParameter()V

    .line 864
    :cond_1
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .line 868
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 869
    return-void

    .line 871
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 872
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 873
    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x23

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 875
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 878
    :cond_2
    :goto_0
    return-void
.end method

.method private startVideoRecording()V
    .locals 2

    .line 558
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 559
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 560
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStart()V

    .line 561
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingStart()V

    .line 562
    return-void
.end method

.method private updateDeviceOrientation()V
    .locals 2

    .line 983
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 984
    return-void
.end method

.method private updateFaceView(ZZ)V
    .locals 2

    .line 1158
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1159
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 1161
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 1162
    nop

    .line 1161
    invoke-virtual {v0, v1, p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 1162
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 1163
    return-void
.end method

.method private updateFilter()V
    .locals 4

    .line 992
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 993
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

    .line 994
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 995
    return-void
.end method

.method private updateFocusMode()V
    .locals 2

    .line 987
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 988
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setFocusMode(Ljava/lang/String;)V

    .line 989
    return-void
.end method

.method private updateFpsRange()V
    .locals 4

    .line 1015
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    const/16 v2, 0x1e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 1016
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 5

    .line 970
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v1, Landroid/graphics/SurfaceTexture;

    .line 971
    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 972
    iget v1, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mBogusCameraId:I

    .line 973
    const/16 v3, 0x10

    const/16 v4, 0x9

    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v3

    float-to-double v3, v3

    .line 972
    invoke-static {v1, v2, v0, v3, v4}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 975
    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 976
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/LiveModule;->updateCameraScreenNailSize(II)V

    .line 977
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

    .line 979
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 980
    return-void
.end method

.method private updateVideoStabilization()V
    .locals 3

    .line 998
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 999
    return-void

    .line 1001
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1002
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v2, "videoStabilization: disabled EIS and OIS when VIDEO_BOKEH is opened"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1003
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1004
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1005
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1006
    return-void

    .line 1009
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1010
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1011
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1012
    return-void
.end method


# virtual methods
.method public cancelFocus(Z)V
    .locals 1

    .line 1084
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1085
    return-void

    .line 1088
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1089
    return-void

    .line 1092
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_2

    .line 1093
    return-void

    .line 1096
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    .line 1097
    if-eqz p1, :cond_3

    .line 1098
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1100
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 1103
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    .line 1104
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 1106
    :cond_5
    return-void
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .line 883
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 884
    return-void

    .line 886
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 888
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x10e

    goto :goto_0

    :cond_1
    const/16 v0, 0x5a

    :goto_0
    iput v0, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    .line 890
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_2

    .line 891
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 894
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_3

    .line 895
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 897
    :cond_3
    return-void
.end method

.method public closeCamera()V
    .locals 2

    .line 433
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 434
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 438
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 442
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 443
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 444
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 445
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->unlockAEAF()V

    .line 446
    iput-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 448
    :cond_2
    return-void
.end method

.method protected varargs consumePreference([I)V
    .locals 3

    .line 272
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 273
    sparse-switch v2, :sswitch_data_0

    .line 334
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

    .line 303
    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateDeviceOrientation()V

    .line 304
    goto :goto_1

    .line 319
    :sswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateVideoStabilization()V

    .line 320
    goto :goto_1

    .line 315
    :sswitch_2
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateExposureMeteringMode()V

    .line 316
    goto :goto_1

    .line 311
    :sswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->focusCenter()V

    .line 312
    goto :goto_1

    .line 307
    :sswitch_4
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->setZoomRatio(F)V

    .line 308
    goto :goto_1

    .line 327
    :sswitch_5
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFpsRange()V

    .line 328
    goto :goto_1

    .line 299
    :sswitch_6
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFocusMode()V

    .line 300
    goto :goto_1

    .line 331
    :sswitch_7
    goto :goto_1

    .line 323
    :sswitch_8
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->setEvValue()V

    .line 324
    goto :goto_1

    .line 295
    :sswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFlashPreference()V

    .line 296
    goto :goto_1

    .line 291
    :sswitch_a
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/LiveModule;->updateAntiBanding(Ljava/lang/String;)V

    .line 292
    goto :goto_1

    .line 287
    :sswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFace()V

    .line 288
    goto :goto_1

    .line 283
    :sswitch_c
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->updateFocusArea()V

    .line 284
    goto :goto_1

    .line 279
    :sswitch_d
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updateFilter()V

    .line 280
    goto :goto_1

    .line 275
    :sswitch_e
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->updatePictureAndPreviewSize()V

    .line 276
    nop

    .line 272
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 338
    :cond_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_e
        0x2 -> :sswitch_d
        0x3 -> :sswitch_c
        0x5 -> :sswitch_b
        0x9 -> :sswitch_a
        0xa -> :sswitch_9
        0xc -> :sswitch_8
        0xd -> :sswitch_7
        0xe -> :sswitch_6
        0x13 -> :sswitch_5
        0x18 -> :sswitch_4
        0x19 -> :sswitch_3
        0x1d -> :sswitch_2
        0x1f -> :sswitch_1
        0x23 -> :sswitch_0
    .end sparse-switch
.end method

.method public doReverse()V
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-nez v0, :cond_0

    goto :goto_0

    .line 606
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordReverse()V

    .line 607
    return-void

    .line 603
    :cond_1
    :goto_0
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .line 1060
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_key"

    .line 1062
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1060
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected getOperatingMode()I
    .locals 1

    .line 359
    nop

    .line 360
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fe()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    const v0, 0x8030

    goto :goto_0

    .line 363
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initializeCapabilities()V
    .locals 2

    .line 218
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 219
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 221
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 219
    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mContinuousFocusSupported:Z

    .line 222
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    .line 223
    return-void
.end method

.method protected is3ALocked()Z
    .locals 1

    .line 962
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    return v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    .line 966
    const/4 v0, 0x1

    return v0
.end method

.method public isDoingAction()Z
    .locals 2

    .line 628
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 629
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

    .line 1192
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    .line 671
    const/4 v0, 0x0

    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    .line 1197
    const/4 v0, 0x0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .line 1260
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    return v0
.end method

.method protected lockAEAF()V
    .locals 2

    .line 952
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 953
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 954
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 956
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 958
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 959
    return-void
.end method

.method public multiCapture()Z
    .locals 1

    .line 1115
    const/4 v0, 0x0

    return v0
.end method

.method public notifyError()V
    .locals 1

    .line 1270
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->notifyError()V

    .line 1272
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1273
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1274
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    if-eqz v0, :cond_0

    .line 1275
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->closeCamera()V

    .line 1278
    :cond_0
    return-void
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .line 1149
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 1150
    return-void
.end method

.method public onBackPressed()Z
    .locals 9

    .line 1217
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1218
    return v1

    .line 1221
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1222
    return v2

    .line 1226
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1227
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 1228
    iget-wide v5, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    sub-long v5, v3, v5

    const-wide/16 v7, 0xbb8

    cmp-long v0, v5, v7

    if-lez v0, :cond_2

    .line 1229
    iput-wide v3, p0, Lcom/android/camera/module/LiveModule;->mLastBackPressedTime:J

    .line 1230
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const v3, 0x7f0b011a

    invoke-virtual {p0, v3}, Lcom/android/camera/module/LiveModule;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1231
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1233
    :cond_2
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 1235
    :goto_0
    return v2

    .line 1237
    :cond_3
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    .line 1203
    if-nez p1, :cond_0

    .line 1204
    return-void

    .line 1207
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V

    .line 1209
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 1210
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1212
    :cond_1
    return-void
.end method

.method protected onCameraOpened()V
    .locals 2

    .line 199
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 201
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initializeFocusManager()V

    .line 203
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->updatePreferenceTrampoline([I)V

    .line 205
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initLiveConfig()V

    .line 206
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startPreview()V

    .line 209
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mOnResumeTime:J

    .line 210
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 211
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 212
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->initMetaParser()V

    .line 214
    return-void
.end method

.method public onCreate(II)V
    .locals 0

    .line 187
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 188
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 189
    new-instance p1, Lcom/android/camera/module/LiveModule$MainHandler;

    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/camera/module/LiveModule$MainHandler;-><init>(Lcom/android/camera/module/LiveModule;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    .line 190
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->onCameraOpened()V

    .line 191
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 192
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 p2, 0x1f

    invoke-virtual {p1, p2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 194
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 424
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 425
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_0

    .line 426
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 428
    :cond_0
    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 3

    .line 1167
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1168
    return-void

    .line 1170
    :cond_0
    if-nez p1, :cond_1

    .line 1171
    return-void

    .line 1175
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->gg()Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p1

    if-lez p2, :cond_2

    const/4 p2, 0x0

    aget-object p2, p1, p2

    iget p2, p2, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v0, 0xface

    if-ne p2, v0, :cond_2

    .line 1177
    iget-boolean p2, p0, Lcom/android/camera/module/LiveModule;->mObjectTrackingStarted:Z

    if-eqz p2, :cond_3

    .line 1178
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x3

    .line 1179
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1178
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    goto :goto_0

    .line 1183
    :cond_2
    iget-object p2, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x1

    .line 1184
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mZoomValue:F

    .line 1183
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1185
    return-void

    .line 1188
    :cond_3
    :goto_0
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 8

    .line 793
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 797
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v1, 0x3

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 817
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v0

    .line 818
    const/4 v2, 0x0

    .line 819
    if-eqz v0, :cond_1

    .line 820
    const-string v2, "onAutoFocusMoving start"

    .line 822
    :cond_1
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 823
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-ne v0, v1, :cond_3

    .line 828
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-ne v0, v1, :cond_5

    .line 829
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-nez v0, :cond_5

    .line 830
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 799
    :pswitch_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "FocusTime=%1$dms focused=%2$b"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 800
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

    .line 799
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v0

    if-nez v0, :cond_4

    .line 802
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 803
    invoke-virtual {p0, v6}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 807
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 808
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 810
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    if-eqz p1, :cond_5

    .line 811
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v6}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    .line 836
    :cond_5
    :goto_0
    return-void

    .line 794
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

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1242
    const/4 v0, 0x4

    const/4 v1, 0x1

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    const/16 v0, 0x42

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 1245
    :cond_0
    return v1

    .line 1249
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    .line 1250
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1251
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1252
    return v1

    .line 1255
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onOrientationChanged(II)V
    .locals 0

    .line 842
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->setOrientation(II)V

    .line 843
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 375
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 377
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 378
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingPause()V

    .line 384
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 388
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->tryRemoveCountDownMessage()V

    .line 389
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 390
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 393
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->resetScreenOn()V

    .line 395
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->closeCamera()V

    .line 397
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_1

    .line 398
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 400
    :cond_1
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 2

    .line 583
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 585
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 586
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 587
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingPause()V

    goto :goto_0

    .line 589
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordResume()V

    .line 590
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingResume()V

    .line 592
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 593
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 594
    if-eqz v0, :cond_1

    .line 595
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 598
    :cond_1
    :goto_0
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    .line 255
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 256
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    .line 258
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 257
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 259
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 261
    :cond_0
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 780
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 774
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 775
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 760
    if-nez p1, :cond_0

    .line 761
    return-void

    .line 763
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    .line 764
    return-void

    .line 767
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessage(I)Z

    .line 769
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 770
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 268
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 368
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 369
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->keepScreenOnAwhile()V

    .line 370
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 2

    .line 662
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 663
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 665
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingWorkspace(Z)V

    .line 666
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    .line 667
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 4

    .line 645
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordStop()V

    .line 648
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 649
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 651
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    .line 653
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 654
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 655
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->resumePreview()V

    .line 656
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 1

    .line 543
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecording()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->isRecordingPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 546
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->startVideoRecording()V

    .line 548
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xab

    .line 549
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 550
    if-eqz p1, :cond_2

    .line 551
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    goto :goto_1

    .line 544
    :cond_1
    :goto_0
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 554
    :cond_2
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 618
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    .line 612
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 0

    .line 623
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2

    .line 901
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mPaused:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 903
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 904
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/LiveModule;->isInTapableRect(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 905
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    .line 906
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 910
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 911
    sget-object p1, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 912
    return-void

    .line 916
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 917
    return-void

    .line 922
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 923
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 924
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 925
    return-void

    .line 932
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 933
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mTouchFocusStartingTime:J

    .line 934
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 935
    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 936
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->unlockAEAF()V

    .line 937
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 938
    return-void

    .line 907
    :cond_4
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 416
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 417
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    if-eqz v0, :cond_0

    .line 418
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mHandler:Lcom/android/camera/module/LiveModule$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 420
    :cond_0
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0

    .line 634
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDoingAction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 635
    return-void

    .line 637
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 638
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 640
    :cond_1
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 1

    .line 1110
    const/4 v0, 0x0

    return v0
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 343
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 344
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 345
    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 346
    const-string v1, ":miui:starting_window_label"

    .line 347
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0044

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 346
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 348
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 349
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 351
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 352
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 354
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 355
    return-void
.end method

.method public pausePreview()V
    .locals 1

    .line 475
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 476
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/LiveModule;->setCameraState(I)V

    .line 477
    return-void
.end method

.method public playSound(I)V
    .locals 0

    .line 1154
    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule;->playCameraSound(I)V

    .line 1155
    return-void
.end method

.method public playVideo()V
    .locals 0

    .line 1291
    return-void
.end method

.method public registerProtocol()V
    .locals 5

    .line 157
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 158
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 159
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 160
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 161
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 163
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const/16 v4, 0xa4

    aput v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 165
    return-void
.end method

.method public resumePreview()V
    .locals 0

    .line 481
    invoke-direct {p0}, Lcom/android/camera/module/LiveModule;->previewWhenSessionSuccess()V

    .line 482
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .line 1265
    const/4 v0, 0x0

    return v0
.end method

.method public showPreview()V
    .locals 2

    .line 485
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->pausePreview()V

    .line 487
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, v1, v0, v0}, Lcom/android/camera/module/LiveModule;->genContentValues(IIZ)Landroid/content/ContentValues;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/LiveModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 489
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 490
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->startLiveRecordPreview(Landroid/content/ContentValues;)V

    .line 491
    return-void
.end method

.method public startFaceDetection()V
    .locals 1

    .line 1121
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1124
    :cond_0
    iget v0, p0, Lcom/android/camera/module/LiveModule;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 1125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1126
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 1128
    :cond_1
    return-void

    .line 1122
    :cond_2
    :goto_0
    return-void
.end method

.method public startFocus()V
    .locals 3

    .line 1067
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1068
    return-void

    .line 1070
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1071
    return-void

    .line 1074
    :cond_1
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "startFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1075
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 1076
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/LiveModule;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    goto :goto_0

    .line 1078
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1080
    :goto_0
    return-void
.end method

.method public startPreview()V
    .locals 8

    .line 452
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 453
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 454
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 455
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 457
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/LiveModule;->mSurfaceCreatedTimestamp:J

    .line 458
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "LiveModule, startPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->checkDisplayOrientation()V

    .line 460
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->isFrontCamera()Z

    move-result v3

    iget v4, p0, Lcom/android/camera/module/LiveModule;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->initPreview(IIZI)V

    .line 462
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 463
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->startPreview(Landroid/view/Surface;)V

    .line 464
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setRecordSpeed(I)V

    .line 465
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 466
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 469
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getOperatingMode()I

    move-result v6

    .line 465
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v7, p0

    invoke-virtual/range {v2 .. v7}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 471
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 0

    .line 1132
    iget-boolean p1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    if-nez p1, :cond_0

    goto :goto_0

    .line 1136
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionStarted:Z

    .line 1137
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_1

    .line 1138
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 1140
    :cond_1
    return-void

    .line 1133
    :cond_2
    :goto_0
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0

    .line 1145
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 1

    .line 566
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 567
    const/16 v0, 0xa2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 568
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingWorkspace(Z)V

    .line 570
    iget-object p1, p0, Lcom/android/camera/module/LiveModule;->mLiveConfigChanges:Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->onRecordPause()V

    .line 571
    if-nez p2, :cond_1

    .line 572
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xab

    .line 573
    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 574
    if-eqz p1, :cond_0

    .line 575
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 577
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->showPreview()V

    .line 579
    :cond_1
    return-void
.end method

.method public unRegisterModulePersistProtocol()V
    .locals 1

    .line 181
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterModulePersistProtocol()V

    .line 182
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachModulePersistent()V

    .line 183
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 3

    .line 170
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 171
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 172
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 173
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa9

    invoke-virtual {v0, v2, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 174
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 176
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 177
    return-void
.end method

.method protected unlockAEAF()V
    .locals 2

    .line 943
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 944
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->m3ALocked:Z

    .line 945
    iget-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mAeLockSupported:Z

    if-eqz v1, :cond_0

    .line 946
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 948
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 949
    return-void
.end method

.method protected updateFace()V
    .locals 3

    .line 1041
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->enableFaceDetection()Z

    move-result v0

    .line 1043
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    .line 1044
    iget-object v1, p0, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 1046
    :cond_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1047
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_2

    .line 1048
    iput-boolean v1, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1049
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->startFaceDetection()V

    goto :goto_0

    .line 1052
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    .line 1053
    invoke-virtual {p0, v1}, Lcom/android/camera/module/LiveModule;->stopFaceDetection(Z)V

    .line 1054
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/LiveModule;->mFaceDetectionEnabled:Z

    .line 1057
    :cond_2
    :goto_0
    return-void
.end method

.method protected updateFocusArea()V
    .locals 4

    .line 1021
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1022
    sget-object v0, Lcom/android/camera/module/LiveModule;->TAG:Ljava/lang/String;

    const-string v1, "updateFocusArea: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1023
    return-void

    .line 1025
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 1026
    invoke-virtual {p0}, Lcom/android/camera/module/LiveModule;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 1027
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1028
    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 1027
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1030
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1032
    iget-boolean v2, p0, Lcom/android/camera/module/LiveModule;->mFocusAreaSupported:Z

    if-eqz v2, :cond_2

    .line 1033
    iget-object v2, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/LiveModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    goto :goto_1

    .line 1035
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/LiveModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1037
    :goto_1
    return-void
.end method
