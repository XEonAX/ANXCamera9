.class public Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;
.super Ljava/lang/Object;
.source "WideSelfieEngineWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;
    }
.end annotation


# static fields
.field private static final AWS_STATE_CAPTURING:I = 0x2002

.field private static final AWS_STATE_PREVIEW:I = 0x2001

.field private static final AWS_STATE_STITCHING:I = 0x2003

.field public static final DIRECTION_MOVE_LEFT:I = 0x1

.field public static final DIRECTION_MOVE_RIGHT:I = 0x0

.field public static final DIRECTION_NONE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "WideSelfieEngine"


# instance fields
.field private mAngleSize:Landroid/util/SizeF;

.field private mContext:Landroid/content/Context;

.field private volatile mEngineReady:Z

.field private mFullImageHeight:I

.field private mFullImageWidth:I

.field private mHandle:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mPreviewHeight:I

.field private mPreviewRect:Landroid/graphics/Rect;

.field private mPreviewWidth:I

.field private mSensor:Landroid/hardware/Sensor;

.field private mSensorEventListener:Landroid/hardware/SensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private volatile mState:I

.field private mThumbBgWidth:I

.field private mWideSelfCallback:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;

.field private final mWideSelfieCallback:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

.field private mWideSelfieCurrentCommand:I

.field private mWideSelfieOrientation:I

.field private nThumbnailHeight:I

.field private nThumbnailWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    const/16 v0, 0x5a

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    const/16 v0, 0x2001

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageWidth:I

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageHeight:I

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewWidth:I

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewHeight:I

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    iput-boolean v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mEngineReady:Z

    new-instance v0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;

    invoke-direct {v0, p0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;-><init>(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)V

    iput-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCallback:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    new-instance v0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$2;-><init>(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mHandle:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$3;

    invoke-direct {v0, p0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$3;-><init>(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)V

    iput-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    iput-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfCallback:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;

    const-string p2, "sensor"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensor:Landroid/hardware/Sensor;

    iget-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a015e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mThumbBgWidth:I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mHandle:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCurrentCommand:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCurrentCommand:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)Landroid/graphics/Rect;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewRect:Landroid/graphics/Rect;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfCallback:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mEngineReady:Z

    return p1
.end method

.method private getAngleValue(Landroid/hardware/camera2/CameraCharacteristics;)Landroid/util/SizeF;
    .locals 9

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SizeF;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_FOCAL_LENGTHS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    invoke-virtual {v0}, Landroid/util/SizeF;->getWidth()F

    move-result v1

    const/4 v2, 0x0

    aget v3, p1, v2

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    div-float/2addr v1, v3

    float-to-double v5, v1

    invoke-static {v5, v6}, Ljava/lang/StrictMath;->atan(D)D

    move-result-wide v5

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    mul-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v5

    double-to-float v1, v5

    invoke-virtual {v0}, Landroid/util/SizeF;->getHeight()F

    move-result v0

    aget p1, p1, v2

    mul-float/2addr v4, p1

    div-float/2addr v0, v4

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/StrictMath;->atan(D)D

    move-result-wide v2

    mul-double/2addr v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v2

    double-to-float p1, v2

    new-instance v0, Landroid/util/SizeF;

    invoke-direct {v0, v1, p1}, Landroid/util/SizeF;-><init>(FF)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public onBurstCapture([B)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mEngineReady:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    const/16 v1, 0x2002

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCurrentCommand:I

    invoke-static {}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->process(I[B)I

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    const/16 v0, 0x2003

    if-ne p1, v0, :cond_3

    const/16 p1, 0x2001

    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    const-string p1, "WideSelfieEngine"

    const-string v0, "onBurstCapture STITCHING"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    new-array v0, p1, [B

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfCallback:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfCallback:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;

    invoke-interface {v1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;->onWideSelfCompleted()V

    :cond_2
    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCurrentCommand:I

    invoke-static {}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->process(I[B)I

    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCurrentCommand:I

    invoke-static {}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->process(I[B)I

    :cond_3
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mHandle:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public pause()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    return-void
.end method

.method public resume()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mSensor:Landroid/hardware/Sensor;

    const/16 v3, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method public setCameraParameter(Ljava/lang/String;IIII)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput p2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewWidth:I

    iput p3, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewHeight:I

    iput p4, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageWidth:I

    iput p5, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageHeight:I

    iget-object p3, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f0a015f

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    int-to-float p2, p2

    int-to-float p3, p3

    div-float/2addr p2, p3

    iget p3, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewWidth:I

    int-to-float p3, p3

    div-float/2addr p3, p2

    float-to-int p3, p3

    iput p3, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    iget p3, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewHeight:I

    int-to-float p3, p3

    div-float/2addr p3, p2

    float-to-int p2, p3

    iput p2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    const-string p2, "WideSelfieEngine"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "mFullImageWidth = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageWidth:I

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", mFullImageHeight = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageHeight:I

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object p2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    const-string p3, "camera"

    invoke-virtual {p2, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/hardware/camera2/CameraManager;

    invoke-virtual {p2, p1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->getAngleValue(Landroid/hardware/camera2/CameraCharacteristics;)Landroid/util/SizeF;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mAngleSize:Landroid/util/SizeF;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    return-void
.end method

.method public startCapture()I
    .locals 9

    const-string v0, "WideSelfieEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startCapture orientation = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageWidth:I

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageHeight:I

    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    const/16 v3, 0x802

    invoke-static {v0, v1, v3, v2}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getDefaultInitParams(IIII)Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getInstance(Landroid/content/Context;)Lcom/android/camera/wideselfie/WideSelfieConfig;

    move-result-object v1

    nop

    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    rem-int/lit16 v2, v2, 0xb4

    const/16 v3, 0x5a

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageHeight:I

    invoke-virtual {v1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgWidth()I

    move-result v6

    sub-int/2addr v6, v5

    mul-int/2addr v2, v6

    invoke-virtual {v1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewWidth()I

    move-result v1

    div-int/2addr v2, v1

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mThumbBgWidth:I

    iget v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    sub-int/2addr v1, v6

    div-int/2addr v1, v5

    new-instance v6, Landroid/graphics/Rect;

    iget v7, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    iget v8, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    add-int/2addr v8, v1

    invoke-direct {v6, v4, v1, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewRect:Landroid/graphics/Rect;

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mFullImageWidth:I

    invoke-virtual {v1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getThumbBgHeightVertical()I

    move-result v6

    sub-int/2addr v6, v5

    mul-int/2addr v2, v6

    invoke-virtual {v1}, Lcom/android/camera/wideselfie/WideSelfieConfig;->getStillPreviewHeight()I

    move-result v1

    div-int/2addr v2, v1

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mThumbBgWidth:I

    iget v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    sub-int/2addr v1, v6

    div-int/2addr v1, v5

    new-instance v6, Landroid/graphics/Rect;

    iget v7, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    add-int/2addr v7, v1

    iget v8, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    invoke-direct {v6, v1, v4, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewRect:Landroid/graphics/Rect;

    :goto_0
    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mThumbBgWidth:I

    iget v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    sub-int/2addr v1, v6

    div-int/2addr v1, v5

    new-instance v6, Landroid/graphics/Rect;

    iget v7, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    iget v8, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    add-int/2addr v8, v1

    invoke-direct {v6, v4, v1, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v6, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mPreviewRect:Landroid/graphics/Rect;

    iput v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->maxResultWidth:I

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieOrientation:I

    rem-int/lit16 v1, v1, 0xb4

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    goto :goto_1

    :cond_1
    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    :goto_1
    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailWidth:I

    iget v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->thumbnailHeight:I

    iput v4, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStopBarThumbHeight:I

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mAngleSize:Landroid/util/SizeF;

    invoke-virtual {v1}, Landroid/util/SizeF;->getWidth()F

    move-result v1

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForWidth:F

    iget-object v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mAngleSize:Landroid/util/SizeF;

    invoke-virtual {v1}, Landroid/util/SizeF;->getHeight()F

    move-result v1

    iput v1, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForHeight:F

    const-string v1, "WideSelfieEngine"

    const-string v3, "startCapture maxResultWidth = %d, progressBarThumbHeight = %d, thumbnailWidth = %d, thumbnailHeight = %d,  guideStopBarThumbHeight = %d"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v4

    iget v2, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v6, v4

    iget v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailWidth:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v5

    const/4 v2, 0x3

    iget v5, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->nThumbnailHeight:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v2

    const/4 v2, 0x4

    iget v5, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStopBarThumbHeight:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v2

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->init(Lcom/arcsoft/camera/wideselfie/AwsInitParameter;)I

    move-result v0

    iput-boolean v4, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mEngineReady:Z

    const-string v1, "WideSelfieEngine"

    const-string v2, "WideSelfieEngine init"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mWideSelfieCallback:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    invoke-virtual {v1, v2}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->setOnCallback(Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;)V

    const/16 v1, 0x2002

    iput v1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    return v0
.end method

.method public stopCapture()V
    .locals 2

    const/16 v0, 0x2003

    iput v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->mState:I

    const-string v0, "WideSelfieEngine"

    const-string v1, "stopCapture set AWS_STATE_STITCHING"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
