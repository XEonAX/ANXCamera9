.class public Lcom/xiaomi/camera/core/FilterProcessor;
.super Ljava/lang/Object;
.source "FilterProcessor.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHeight:I

.field private mWidth:I

.field private mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/FilterProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getDrawYuvAttribute(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ZZLjava/lang/String;Lcom/xiaomi/camera/core/ParallelTaskData;)Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;
    .locals 21

    .line 90
    new-instance v20, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    .line 93
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v3

    .line 94
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewHeight()I

    move-result v4

    .line 95
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v5

    .line 96
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v6

    .line 97
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFilterId()I

    move-result v7

    .line 98
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOrientation()I

    move-result v8

    .line 99
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v9

    .line 100
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootRotation()F

    move-result v10

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 102
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->isMirror()Z

    move-result v13

    .line 106
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v17

    .line 107
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v18

    .line 108
    invoke-virtual/range {p6 .. p6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v19

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v14, p3

    move/from16 v15, p4

    move-object/from16 v16, p5

    invoke-direct/range {v0 .. v19}, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIIIFJZZZLjava/lang/String;Ljava/lang/String;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Ljava/util/List;)V

    .line 90
    return-object v20
.end method

.method private isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z
    .locals 1

    .line 67
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isHasDualWaterMark()Z

    move-result v0

    if-nez v0, :cond_1

    .line 68
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 69
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isAgeGenderAndMagicMirrorWater()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 67
    :goto_1
    return p1
.end method

.method private prepareEffectProcessor(III)V
    .locals 6

    .line 49
    sget-object v0, Lcom/xiaomi/camera/core/FilterProcessor;->TAG:Ljava/lang/String;

    const-string v1, "prepareEffectProcessor: %x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mWidth:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mHeight:I

    if-eq v0, p3, :cond_1

    .line 52
    :cond_0
    new-instance v0, Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 53
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0900a9

    .line 54
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v2

    const v4, 0x7f0900aa

    .line 55
    invoke-static {v4, v3}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v4

    const v5, 0x7f0900ab

    .line 56
    invoke-static {v5, v3}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v3

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/android/camera/effect/renders/DualWatermarkParam;-><init>(Ljava/lang/String;FFF)V

    .line 57
    new-instance v1, Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-direct {v1, v0, p2, p3}, Lcom/android/camera/effect/renders/SnapshotRender;-><init>(Lcom/android/camera/effect/renders/DualWatermarkParam;II)V

    iput-object v1, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 58
    iput p2, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mWidth:I

    .line 59
    iput p3, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mHeight:I

    .line 61
    :cond_1
    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p2, p1, :cond_2

    .line 62
    iget-object p2, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {p2, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->prepareEffectRender(I)V

    .line 64
    :cond_2
    return-void
.end method

.method private releaseEffectProcessor()V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->release()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 82
    :cond_0
    return-void
.end method

.method private shouldApplyEffect(Lcom/xiaomi/camera/core/ParallelTaskData;)Z
    .locals 2

    .line 73
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFilterId()I

    move-result v1

    if-ne v0, v1, :cond_1

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method public deInit()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/xiaomi/camera/core/FilterProcessor;->releaseEffectProcessor()V

    .line 29
    return-void
.end method

.method public doFilterSync(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/xiaomi/camera/imagecodec/MiImage;I)Lcom/xiaomi/camera/imagecodec/MiImage;
    .locals 10

    .line 32
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->shouldApplyEffect(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFilterId()I

    move-result v0

    .line 34
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v2

    .line 33
    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/camera/core/FilterProcessor;->prepareEffectProcessor(III)V

    .line 35
    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/MiImage;->getPlanes()[Lcom/xiaomi/camera/imagecodec/MiImage$Plane;

    move-result-object v0

    .line 36
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 37
    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/MiImage$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 38
    if-ne v2, p3, :cond_0

    .line 39
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/FilterProcessor;->isWatermarkEnabled(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 40
    move v6, v2

    goto :goto_0

    .line 39
    :cond_0
    nop

    .line 40
    move v6, v1

    :goto_0
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v9, p1

    invoke-direct/range {v3 .. v9}, Lcom/xiaomi/camera/core/FilterProcessor;->getDrawYuvAttribute(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ZZLjava/lang/String;Lcom/xiaomi/camera/core/ParallelTaskData;)Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    move-result-object p1

    .line 42
    iget-object p3, p0, Lcom/xiaomi/camera/core/FilterProcessor;->mYuvSnapshotRender:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {p3, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->processImageSync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    .line 44
    :cond_1
    return-object p2
.end method

.method public init(II)V
    .locals 1

    .line 24
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-direct {p0, v0, p1, p2}, Lcom/xiaomi/camera/core/FilterProcessor;->prepareEffectProcessor(III)V

    .line 25
    return-void
.end method
