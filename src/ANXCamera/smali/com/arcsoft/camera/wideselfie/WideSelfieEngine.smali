.class public Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;
.super Ljava/lang/Object;
.source "WideSelfieEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arcsoft/camera/wideselfie/WideSelfieEngine$a;
    }
.end annotation


# static fields
.field public static final MPAF_16BITS:I = 0x5000000

.field public static final MPAF_32BITS:I = 0x7000000

.field public static final MPAF_BGR:I = 0x1000

.field public static final MPAF_OTHERS_NV21:I = 0x70000002

.field public static final MPAF_RGB16_R5G6B5:I

.field public static final MPAF_RGB32_A8R8G8B8:I

.field public static final MPAF_RGB32_B8G8R8A8:I

.field public static final MPAF_RGBA_BASE:I = 0x30000000

.field public static final MPAF_RGB_BASE:I = 0x10000000

.field private static final a:Ljava/lang/String;

.field private static b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;


# instance fields
.field private c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

.field private d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

.field private e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    const/4 v0, 0x5

    invoke-static {v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_R(I)I

    move-result v1

    const/high16 v2, 0x15000000

    or-int/2addr v1, v2

    const/4 v2, 0x6

    invoke-static {v2}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_G(I)I

    move-result v2

    or-int/2addr v1, v2

    invoke-static {v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_B(I)I

    move-result v0

    or-int/2addr v0, v1

    sput v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_RGB16_R5G6B5:I

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_R(I)I

    move-result v1

    const/high16 v2, 0x37000000

    or-int/2addr v1, v2

    invoke-static {v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_G(I)I

    move-result v2

    or-int/2addr v1, v2

    invoke-static {v0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_MAKE_B(I)I

    move-result v0

    or-int/2addr v0, v1

    sput v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_RGB32_A8R8G8B8:I

    sget v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_RGB32_A8R8G8B8:I

    const/16 v1, 0x1000

    or-int/2addr v0, v1

    sput v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->MPAF_RGB32_B8G8R8A8:I

    const-string v0, "camera_wideselfie_mpbase"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "arcsoft_wideselfie"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v0, "jni_wideselfie"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iput-object v0, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z

    return-void
.end method

.method private native ConvertCS([BIIIIII)[B
.end method

.method private native ConvertCS2Bitmap([BIIIIIIIIZ)Landroid/graphics/Bitmap;
.end method

.method private native ConvertCSEx([Ljava/nio/ByteBuffer;IIIIII)[B
.end method

.method private native ConvertCSExx(JIII)[B
.end method

.method public static final MPAF_MAKE_B(I)I
    .locals 0

    add-int/lit8 p0, p0, -0x1

    shl-int/lit8 p0, p0, 0x0

    return p0
.end method

.method public static final MPAF_MAKE_G(I)I
    .locals 0

    add-int/lit8 p0, p0, -0x1

    shl-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static final MPAF_MAKE_R(I)I
    .locals 0

    add-int/lit8 p0, p0, -0x1

    shl-int/lit8 p0, p0, 0x8

    return p0
.end method

.method private native SetLogLevel(I)V
.end method

.method private a()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine$a;
    .locals 1

    invoke-direct {p0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_version()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine$a;

    move-result-object v0

    return-object v0
.end method

.method private b()I
    .locals 1

    invoke-direct {p0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_capture()I

    move-result v0

    return v0
.end method

.method private c()Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    return-object v0
.end method

.method public static declared-synchronized getSingleInstance()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;
    .locals 3

    const-class v0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    if-nez v1, :cond_1

    const-class v1, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v2, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    if-nez v2, :cond_0

    new-instance v2, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    invoke-direct {v2}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;-><init>()V

    sput-object v2, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;

    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2

    :cond_1
    :goto_0
    sget-object v1, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->b:Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private native native_capture()I
.end method

.method private native native_init(IIFFFFIIIIIIIIIIFIIZ)I
.end method

.method private native native_init_default(II)I
.end method

.method private native native_process(I[B)I
.end method

.method private native native_push_sensor_data_in([FJI)I
.end method

.method private native native_register_callback(Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;)V
.end method

.method private native native_uninit()I
.end method

.method private native native_version()Lcom/arcsoft/camera/wideselfie/WideSelfieEngine$a;
.end method


# virtual methods
.method public declared-synchronized convertCS([BIIIIII)[B
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p7}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->ConvertCS([BIIIIII)[B

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized convertCS2Bitmap([BIIIIIIIIZ)Landroid/graphics/Bitmap;
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p10}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->ConvertCS2Bitmap([BIIIIIIIIZ)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized convertCSEx([Ljava/nio/ByteBuffer;IIIIIIZ)[B
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p7}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->ConvertCSEx([Ljava/nio/ByteBuffer;IIIIII)[B

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized convertCSExx(JIII)[B
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p5}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->ConvertCSExx(JIII)[B

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized init(Lcom/arcsoft/camera/wideselfie/AwsInitParameter;)I
    .locals 28

    move-object/from16 v15, p0

    move-object/from16 v0, p1

    monitor-enter p0

    :try_start_0
    iget-boolean v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v22, 0x0

    if-eqz v1, :cond_0

    monitor-exit p0

    return v22

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x2

    monitor-exit p0

    return v0

    :cond_1
    :try_start_1
    iput-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getBufferSize()I

    move-result v2

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v3, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->mode:I

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v4, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForWidth:F

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v5, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->cameraViewAngleForHeight:F

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v6, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->resultAngleForWidth:F

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v7, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->resultAngleForHeight:F

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getSrcFormat()I

    move-result v8

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getFullImageWidth()I

    move-result v9

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getFullImageHeight()I

    move-result v10

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getThumbForamt()I

    move-result v11

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getThumbnailWidth()I

    move-result v12

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v0}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getThumbnailHeight()I

    move-result v13

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v14, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->maxResultWidth:I

    iget-object v0, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v0, v0, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeight:I

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v1, v1, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStopBarThumbHeight:I

    move/from16 v23, v1

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v1, v1, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->guideStableBarThumbHeight:I

    move/from16 v24, v1

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v1, v1, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->progressBarThumbHeightCropRatio:F

    move/from16 v25, v1

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget v1, v1, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->changeDirectionThumbThreshold:I

    move/from16 v26, v1

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    invoke-virtual {v1}, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->getDeviceOrientation()I

    move-result v20

    iget-object v1, v15, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->c:Lcom/arcsoft/camera/wideselfie/AwsInitParameter;

    iget-boolean v1, v1, Lcom/arcsoft/camera/wideselfie/AwsInitParameter;->convertNV21:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move/from16 v21, v1

    move/from16 v16, v23

    move/from16 v17, v24

    move/from16 v18, v25

    move/from16 v19, v26

    move-object v1, v15

    move v15, v0

    :try_start_2
    invoke-direct/range {v1 .. v21}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_init(IIFFFFIIIIIIIIIIFIIZ)I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v0, :cond_2

    const/16 v22, 0x1

    :goto_0
    move/from16 v1, v22

    goto :goto_1

    :cond_2
    goto :goto_0

    :goto_1
    move-object/from16 v2, p0

    :try_start_3
    iput-boolean v1, v2, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z

    const-string v1, "Arcsoft_Log"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "init res = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " ,mIsInit = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v2, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/arcsoft/camera/wideselfie/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object/from16 v2, p0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object v2, v15

    :goto_2
    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized process(I[B)I
    .locals 0

    monitor-enter p0

    if-eqz p2, :cond_0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_process(I[B)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_0
    const/4 p1, 0x2

    :goto_0
    monitor-exit p0

    return p1
.end method

.method public declared-synchronized setOnCallback(Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    iget-object p1, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->d:Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;

    invoke-direct {p0, p1}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_register_callback(Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSensorData([FJI)V
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_push_sensor_data_in([FJI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized uninit()I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->native_uninit()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    iput-boolean v1, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z

    const-string v1, "Arcsoft_Log"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uninit res = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ,mIsInit = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/arcsoft/camera/wideselfie/WideSelfieEngine;->e:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/camera/wideselfie/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
