.class public Lcom/android/camera/panorama/MorphoPanoramaGP3;
.super Ljava/lang/Object;
.source "MorphoPanoramaGP3.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;,
        Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;,
        Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;
    }
.end annotation


# static fields
.field public static final DIRECTION_AUTO:I = 0x0

.field public static final DIRECTION_HORIZONTAL:I = 0x2

.field public static final DIRECTION_HORIZONTAL_LEFT:I = 0x5

.field public static final DIRECTION_HORIZONTAL_RIGHT:I = 0x6

.field public static final DIRECTION_INVALID:I = -0x1

.field public static final DIRECTION_VERTICAL:I = 0x1

.field public static final DIRECTION_VERTICAL_DOWN:I = 0x4

.field public static final DIRECTION_VERTICAL_UP:I = 0x3

.field public static final END_MODE_CANCEL:I = 0x2

.field public static final END_MODE_MAKE_360:I = 0x0

.field public static final END_MODE_NOT_MAKE_360:I = 0x1

.field public static final END_STATUS_CANCEL:I = 0x2

.field public static final END_STATUS_MAKE_360:I = 0x0

.field public static final END_STATUS_NOT_MAKE_360:I = 0x1

.field public static final ERROR_INVALID_DIR:I = -0x3fffffff

.field public static final FAST_SPEED_THRESHOLD:I = 0x1194

.field private static GAIN_COEF:D = 0.0

.field public static final MODE_PANORAMA:I = 0x0

.field public static final MODE_SCANNER:I = 0x1

.field private static final POINT_INFO_SIZE:I = 0x2

.field private static final POINT_X_OFFSET:I = 0x0

.field private static final POINT_Y_OFFSET:I = 0x1

.field private static final RECT_BOTTOM_OFFSET:I = 0x3

.field private static final RECT_INFO_SIZE:I = 0x4

.field private static final RECT_LEFT_OFFSET:I = 0x0

.field private static final RECT_RIGHT_OFFSET:I = 0x2

.field private static final RECT_TOP_OFFSET:I = 0x1

.field public static final TAG:Ljava/lang/String; = "MorphoPanoramaGP3"

.field private static final USE_STANDARD_DEVIATION:Z = true


# instance fields
.field private mAttachCount:J

.field private mAttachEnabled:Z

.field private mAttachFirstNanoTime:J

.field private mAttachLastNanoTime:J

.field private mFolderPathInputImages:Ljava/lang/String;

.field private final mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

.field private mIndexBase:[I

.field private mInputImageFormat:Ljava/lang/String;

.field private mIntervalArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mNative:J

.field private mNativeOutputInfo:J

.field private mSaveInputImages:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 25
    :try_start_0
    const-string v0, "morpho_panorama_gp3"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    const-string v1, "MorphoPanoramaGP3"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t loadLibrary, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :goto_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sput-wide v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->GAIN_COEF:D

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    .line 59
    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    .line 60
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    .line 63
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIntervalArray:Ljava/util/ArrayList;

    .line 64
    iput-boolean v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachEnabled:Z

    .line 66
    new-instance v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    invoke-direct {v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    .line 81
    const/4 v2, 0x4

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    .line 256
    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachFirstNanoTime:J

    .line 257
    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachLastNanoTime:J

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIntervalArray:Ljava/util/ArrayList;

    .line 175
    return-void
.end method

.method private static createName(J)Ljava/lang/String;
    .locals 1

    .line 318
    const-string v0, "yyyy-MM-dd_kk-mm-ss"

    invoke-static {v0, p0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private native createNativeObject()J
.end method

.method private native createNativeOutputInfoObject()J
.end method

.method private native deleteNativeObject(J)V
.end method

.method private native deleteNativeOutputInfoObject(J)V
.end method

.method private static getFD(Ljava/io/FileDescriptor;)I
    .locals 2

    .line 717
    :try_start_0
    const-class v0, Ljava/io/FileDescriptor;

    const-string v1, "descriptor"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 718
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 719
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 721
    :catch_0
    move-exception p0

    .line 722
    const/4 p0, -0x1

    return p0
.end method

.method public static getGain(Landroid/media/Image;)D
    .locals 15

    .line 446
    invoke-static {p0}, Lcom/android/camera/panorama/PanoramaGP3ImageFormat;->getImageFormat(Landroid/media/Image;)Ljava/lang/String;

    move-result-object v9

    .line 447
    const/4 v0, 0x1

    new-array v13, v0, [D

    .line 448
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v1

    const/4 v14, 0x0

    aget-object v1, v1, v14

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    const/4 v4, 0x2

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 449
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v14

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v6

    aget-object v6, v6, v0

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v6

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v7

    aget-object v7, v7, v4

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    .line 450
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v14

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v8

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v10

    aget-object v0, v10, v0

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v10

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v11

    .line 451
    invoke-virtual {p0}, Landroid/media/Image;->getWidth()I

    move-result v12

    invoke-virtual {p0}, Landroid/media/Image;->getHeight()I

    move-result p0

    .line 448
    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    move v3, v5

    move v4, v6

    move v5, v7

    move v6, v8

    move v7, v10

    move v8, v11

    move v10, v12

    move v11, p0

    move-object v12, v13

    invoke-static/range {v0 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetGain(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;II[D)I

    move-result p0

    .line 453
    if-eqz p0, :cond_0

    .line 454
    const-string v0, "MorphoPanoramaGP3"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nativeGetGain error. ret="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    return-wide v0

    .line 457
    :cond_0
    sget-wide v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->GAIN_COEF:D

    aget-wide v2, v13, v14

    mul-double/2addr v0, v2

    aput-wide v0, v13, v14

    .line 458
    aget-wide v0, v13, v14

    return-wide v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .line 182
    invoke-static {}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private native nativeAttach(J[B)I
.end method

.method private native nativeAttachYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;[D)I
.end method

.method private native nativeCreateOutputImage(JIIII)I
.end method

.method private native nativeEnd(JID)I
.end method

.method private native nativeFinish(J)I
.end method

.method private native nativeGetClippingRect(J[I)I
.end method

.method private native nativeGetDirection(J[I)I
.end method

.method private native nativeGetEndStatus(J)I
.end method

.method private static native nativeGetGain(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;II[D)I
.end method

.method private native nativeGetImage(J[BIIII)I
.end method

.method private native nativeGetOutputImage(J[BIIII)I
.end method

.method private native nativeGetOutputSize(J[I)I
.end method

.method private native nativeGetRotatedSmallImage(J[BIIIIII)I
.end method

.method private static native nativeGetVersion()Ljava/lang/String;
.end method

.method private native nativeInitialize(JLcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;J)I
.end method

.method private native nativePreparePanorama360(JIILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;)I
.end method

.method private static native nativeRenderByteArray([BLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;II)I
.end method

.method private static native nativeRenderByteArrayRaw([B[BLjava/lang/String;II)I
.end method

.method private static native nativeRenderByteBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;II)I
.end method

.method private static native nativeRenderByteBufferRaw(Ljava/nio/ByteBuffer;[BLjava/lang/String;II)I
.end method

.method private native nativeSaveLog(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method private static native nativeSaveNotPanorama(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;IILjava/lang/String;I)I
.end method

.method private native nativeSavePanorama360(JIILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I
.end method

.method private native nativeSavePanorama360Delay(JLjava/lang/String;IZIZ)I
.end method

.method private native nativeSaveYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;)I
.end method

.method private native nativeSetAovGain(JD)I
.end method

.method private native nativeSetCalcseamPixnum(JI)I
.end method

.method private native nativeSetDistortionCorrectionParam(JDDDD)I
.end method

.method private native nativeSetDrawThreshold(JD)I
.end method

.method private native nativeSetGyroscopeData(J[Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;)I
.end method

.method private native nativeSetImageFormat(JLjava/lang/String;)I
.end method

.method private native nativeSetInitialRotationByGravity(JDDD)I
.end method

.method private native nativeSetMotionDetectionMode(JI)I
.end method

.method private native nativeSetNoiseReductionParam(JI)I
.end method

.method private native nativeSetPreviewImage(JII)I
.end method

.method private native nativeSetProjectionMode(JI)I
.end method

.method private native nativeSetRotationRatio(JD)I
.end method

.method private native nativeSetRotationVector(J[D)I
.end method

.method private native nativeSetSeamsearchRatio(JD)I
.end method

.method private native nativeSetSensorUseMode(JI)I
.end method

.method private native nativeSetShrinkRatio(JD)I
.end method

.method private native nativeSetUnsharpStrength(JI)I
.end method

.method private native nativeSetUseDeform(JI)I
.end method

.method private native nativeSetUseLuminanceCorrection(JI)I
.end method

.method private native nativeSetZrotationCoeff(JD)I
.end method

.method private native nativeStart(JII)I
.end method

.method private native nativeUpdatePreviewImage(JLandroid/graphics/Bitmap;)I
.end method

.method private static native nativeYuv2Bitmap8888([BIILandroid/graphics/Bitmap;II)I
.end method

.method public static saveNotPanorama(Lcom/android/camera/panorama/CaptureImage;Ljava/io/FileDescriptor;)I
    .locals 1

    .line 900
    invoke-static {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getFD(Ljava/io/FileDescriptor;)I

    move-result p1

    .line 901
    if-ltz p1, :cond_0

    .line 902
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->saveNotPanorama_sub(Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;I)I

    move-result p0

    return p0

    .line 904
    :cond_0
    const p0, -0x7ffffff0

    return p0
.end method

.method public static saveNotPanorama(Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;)I
    .locals 1

    .line 909
    const/4 v0, -0x1

    invoke-static {p0, p1, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->saveNotPanorama_sub(Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static saveNotPanorama_sub(Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;I)I
    .locals 16

    .line 869
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/panorama/CaptureImage;->image()Landroid/media/Image;

    move-result-object v0

    .line 870
    if-eqz v0, :cond_0

    .line 871
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/panorama/CaptureImage;->getImageFormat()Ljava/lang/String;

    move-result-object v11

    .line 872
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/panorama/CaptureImage;->getWidth()I

    move-result v12

    .line 873
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/panorama/CaptureImage;->getHeight()I

    move-result v13

    .line 874
    const/4 v1, 0x0

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v6

    const/4 v7, 0x2

    aget-object v6, v6, v7

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 875
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v3

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v8

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v9

    aget-object v9, v9, v5

    invoke-virtual {v9}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v9

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v10

    aget-object v10, v10, v7

    invoke-virtual {v10}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v10

    .line 876
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v14

    aget-object v3, v14, v3

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v14

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    aget-object v3, v3, v5

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v15

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v7

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v0

    .line 874
    move-object v3, v4

    move-object v4, v6

    move v5, v8

    move v6, v9

    move v7, v10

    move v8, v14

    move v9, v15

    move v10, v0

    move-object/from16 v14, p1

    move/from16 v15, p2

    invoke-static/range {v1 .. v15}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSaveNotPanorama(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;IILjava/lang/String;I)I

    move-result v0

    .line 878
    goto :goto_0

    .line 879
    :cond_0
    move-object/from16 v0, p0

    check-cast v0, Lcom/android/camera/panorama/Camera1Image;

    .line 880
    invoke-virtual {v0}, Lcom/android/camera/panorama/Camera1Image;->getImageFormat()Ljava/lang/String;

    move-result-object v11

    .line 881
    invoke-virtual {v0}, Lcom/android/camera/panorama/Camera1Image;->getWidth()I

    move-result v12

    .line 882
    invoke-virtual {v0}, Lcom/android/camera/panorama/Camera1Image;->getHeight()I

    move-result v13

    .line 883
    invoke-virtual {v0}, Lcom/android/camera/panorama/Camera1Image;->raw()[B

    move-result-object v0

    .line 884
    array-length v1, v0

    invoke-static {v1}, Lcom/android/camera/panorama/NativeMemoryAllocator;->allocateBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v15

    .line 885
    invoke-virtual {v15, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 886
    invoke-virtual {v15}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 887
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v1, v15

    move-object/from16 v14, p1

    move-object v0, v15

    move/from16 v15, p2

    invoke-static/range {v1 .. v15}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSaveNotPanorama(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;IILjava/lang/String;I)I

    move-result v1

    .line 891
    invoke-static {v0}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)V

    .line 893
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 894
    const-string v1, "MorphoPanoramaGP3"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nativeSaveNotPanorama error. ret="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 896
    :cond_1
    return v0
.end method

.method public static yuv2Bitmap8888([BIILandroid/graphics/Bitmap;I)I
    .locals 6

    .line 768
    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeYuv2Bitmap8888([BIILandroid/graphics/Bitmap;II)I

    move-result p0

    return p0
.end method

.method public static yvu2Bitmap8888([BIILandroid/graphics/Bitmap;I)I
    .locals 6

    .line 772
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeYuv2Bitmap8888([BIILandroid/graphics/Bitmap;II)I

    move-result p0

    return p0
.end method


# virtual methods
.method public attach(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILcom/android/camera/panorama/SensorInfoManager;[DLandroid/content/Context;)I
    .locals 20

    move-object/from16 v14, p0

    move-object/from16 v0, p10

    .line 264
    iget-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 265
    const v0, -0x7ffffffe

    return v0

    .line 268
    :cond_0
    iget-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 269
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iput-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachFirstNanoTime:J

    .line 272
    :cond_1
    nop

    .line 274
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v15

    .line 276
    const/4 v1, 0x0

    .line 277
    iget-boolean v2, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    const/4 v13, 0x1

    const/16 v17, 0x0

    if-eqz v2, :cond_3

    .line 278
    const/4 v1, 0x2

    if-eqz v0, :cond_2

    .line 279
    iget-wide v2, v0, Lcom/android/camera/panorama/SensorInfoManager;->timeMillis:J

    invoke-static {v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createName(J)Ljava/lang/String;

    move-result-object v2

    .line 280
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%s/%06d_"

    new-array v5, v1, [Ljava/lang/Object;

    iget-object v6, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mFolderPathInputImages:Ljava/lang/String;

    aput-object v6, v5, v17

    iget-wide v6, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v13

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 281
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "_sg%05d_sr%05d_sa%05d.yuv"

    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/Object;

    iget v7, v0, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    iget-object v8, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v8, v8, v17

    add-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v17

    iget v7, v0, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    iget-object v8, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v8, v8, v5

    add-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v13

    iget v7, v0, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    iget-object v8, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v8, v8, v13

    add-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v2, v3, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 282
    iget-object v2, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v3, v2, v17

    iget-object v4, v0, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object v4, v4, v17

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/2addr v3, v4

    aput v3, v2, v17

    .line 283
    iget-object v2, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v3, v2, v5

    iget-object v4, v0, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/2addr v3, v4

    aput v3, v2, v5

    .line 284
    iget-object v2, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIndexBase:[I

    aget v3, v2, v13

    iget-object v0, v0, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object v0, v0, v13

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v3, v0

    aput v3, v2, v13

    .line 285
    goto :goto_0

    .line 286
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createName(J)Ljava/lang/String;

    move-result-object v0

    .line 287
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s/%06d_"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mFolderPathInputImages:Ljava/lang/String;

    aput-object v4, v1, v17

    iget-wide v4, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v13

    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".yuv"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 291
    move-object v12, v0

    goto :goto_1

    :cond_3
    :goto_0
    move-object v12, v1

    :goto_1
    iget-boolean v0, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachEnabled:Z

    if-eqz v0, :cond_4

    .line 292
    iget-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-object v0, v14

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move-wide/from16 v18, v15

    move v15, v13

    move-object/from16 v13, p11

    invoke-direct/range {v0 .. v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeAttachYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;[D)I

    move-result v0

    goto :goto_2

    .line 296
    :cond_4
    move-wide/from16 v18, v15

    move v15, v13

    if-eqz v12, :cond_5

    .line 297
    iget-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-object v0, v14

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-direct/range {v0 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSaveYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;)I

    move-result v0

    goto :goto_2

    .line 302
    :cond_5
    move/from16 v0, v17

    :goto_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 303
    const-string v3, "MorphoPanoramaGP3"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Performance.JNI %1$,3d nsec"

    new-array v6, v15, [Ljava/lang/Object;

    sub-long v7, v1, v18

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v17

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    iget-wide v3, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    .line 306
    iget-wide v3, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    cmp-long v3, v3, v5

    if-lez v3, :cond_6

    .line 307
    iget-object v3, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mIntervalArray:Ljava/util/ArrayList;

    iget-wide v4, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachLastNanoTime:J

    sub-long v4, v1, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    :cond_6
    iput-wide v1, v14, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachLastNanoTime:J

    .line 311
    nop

    .line 314
    return v0
.end method

.method public attach([B)I
    .locals 6

    .line 243
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 244
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeAttach(J[B)I

    move-result p1

    .line 245
    iget-boolean v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    if-eqz v0, :cond_0

    .line 246
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%06d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 248
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    goto :goto_0

    .line 250
    :cond_1
    const p1, -0x7ffffffe

    .line 253
    :goto_0
    return p1
.end method

.method public createNativeOutputInfo()I
    .locals 4

    .line 776
    invoke-direct {p0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createNativeOutputInfoObject()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    .line 777
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 778
    const/4 v0, 0x0

    return v0

    .line 780
    :cond_0
    const v0, -0x7ffffffe

    return v0
.end method

.method public createOutputImage(Landroid/graphics/Rect;)I
    .locals 8

    .line 793
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 794
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    iget v4, p1, Landroid/graphics/Rect;->left:I

    iget v5, p1, Landroid/graphics/Rect;->top:I

    iget v6, p1, Landroid/graphics/Rect;->right:I

    iget v7, p1, Landroid/graphics/Rect;->bottom:I

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeCreateOutputImage(JIIII)I

    move-result p1

    goto :goto_0

    .line 796
    :cond_0
    const p1, -0x7ffffffe

    .line 799
    :goto_0
    return p1
.end method

.method public deleteNativeOutputInfo()I
    .locals 2

    .line 785
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->deleteNativeOutputInfoObject(J)V

    .line 786
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    .line 787
    const/4 v0, 0x0

    return v0
.end method

.method public deleteObject()I
    .locals 4

    .line 219
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 220
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->deleteNativeObject(J)V

    .line 221
    iput-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    .line 224
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public disableSaveInputImages()V
    .locals 1

    .line 414
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    .line 415
    return-void
.end method

.method public enableSaveInputImages(Ljava/lang/String;)V
    .locals 1

    .line 409
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    .line 410
    iput-object p1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mFolderPathInputImages:Ljava/lang/String;

    .line 411
    return-void
.end method

.method public end(ID)I
    .locals 7

    .line 476
    nop

    .line 478
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 479
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-object v1, p0

    move v4, p1

    move-wide v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeEnd(JID)I

    move-result p1

    goto :goto_0

    .line 482
    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public finish(Z)I
    .locals 6

    .line 205
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 206
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeFinish(J)I

    move-result v0

    .line 207
    if-eqz p1, :cond_1

    .line 208
    iget-wide v4, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v4, v5}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->deleteNativeObject(J)V

    .line 209
    iput-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    goto :goto_0

    .line 212
    :cond_0
    const v0, -0x7ffffffe

    .line 215
    :cond_1
    :goto_0
    return v0
.end method

.method public getAttachCount()J
    .locals 2

    .line 405
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    return-wide v0
.end method

.method public getClippingRect(Landroid/graphics/Rect;)I
    .locals 7

    .line 363
    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 365
    iget-wide v1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 366
    iget-wide v3, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v3, v4, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetClippingRect(J[I)I

    move-result v1

    .line 367
    if-nez v1, :cond_1

    .line 368
    aget v3, v0, v2

    const/4 v4, 0x1

    aget v4, v0, v4

    const/4 v5, 0x2

    aget v5, v0, v5

    const/4 v6, 0x3

    aget v0, v0, v6

    invoke-virtual {p1, v3, v4, v5, v0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 374
    :cond_0
    const v1, -0x7ffffffe

    .line 377
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 378
    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 381
    :cond_2
    return v1
.end method

.method public getDirection()I
    .locals 6

    .line 462
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 464
    const/4 v1, 0x0

    const/4 v2, -0x1

    aput v2, v0, v1

    .line 465
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 466
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v2, v3, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetDirection(J[I)I

    move-result v2

    .line 467
    if-eqz v2, :cond_0

    .line 468
    const-string v3, "MorphoPanoramaGP3"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MorphoPanoramaGP3.getDirection error. ret="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    :cond_0
    aget v0, v0, v1

    return v0
.end method

.method public getEndStatus()I
    .locals 4

    .line 486
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 487
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetEndStatus(J)I

    move-result v0

    return v0

    .line 489
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public getImage([BLandroid/graphics/Rect;)I
    .locals 9

    .line 324
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 325
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->bottom:I

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v1 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetImage(J[BIIII)I

    move-result p1

    goto :goto_0

    .line 327
    :cond_0
    const p1, -0x7ffffffe

    .line 330
    :goto_0
    return p1
.end method

.method public getInputFolderPath()Ljava/lang/String;
    .locals 1

    .line 418
    iget-object v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mFolderPathInputImages:Ljava/lang/String;

    return-object v0
.end method

.method public getInputImageFormat()Ljava/lang/String;
    .locals 1

    .line 385
    iget-object v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mInputImageFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getLastGravity()Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;
    .locals 1

    .line 556
    iget-object v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;->copyInstance()Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    move-result-object v0

    return-object v0
.end method

.method public getOutputImage([BLandroid/graphics/Rect;)I
    .locals 9

    .line 507
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 508
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->bottom:I

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v1 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetOutputImage(J[BIIII)I

    move-result p1

    goto :goto_0

    .line 510
    :cond_0
    const p1, -0x7ffffffe

    .line 513
    :goto_0
    return p1
.end method

.method public getOutputImageSize([I)I
    .locals 4

    .line 495
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 496
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetOutputSize(J[I)I

    move-result p1

    goto :goto_0

    .line 498
    :cond_0
    const p1, -0x7ffffffe

    .line 501
    :goto_0
    return p1
.end method

.method public getRotatedSmallImage([BLandroid/graphics/Rect;II)I
    .locals 11

    .line 336
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 337
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->bottom:I

    move-object v1, p0

    move-object v4, p1

    move v9, p3

    move v10, p4

    invoke-direct/range {v1 .. v10}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeGetRotatedSmallImage(J[BIIIIII)I

    move-result p1

    goto :goto_0

    .line 339
    :cond_0
    const p1, -0x7ffffffe

    .line 342
    :goto_0
    return p1
.end method

.method public initialize(Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)I
    .locals 7

    .line 186
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 187
    const p1, -0x7ffffffe

    return p1

    .line 192
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createNativeObject()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    .line 193
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 194
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    iget-wide v5, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeInitialize(JLcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;J)I

    move-result p1

    goto :goto_0

    .line 196
    :cond_1
    const p1, -0x7ffffffc

    .line 199
    :goto_0
    return p1
.end method

.method public inputSave(Landroid/media/Image;)I
    .locals 20

    move-object/from16 v13, p0

    .line 422
    iget-wide v0, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 423
    const v0, -0x7ffffffe

    return v0

    .line 428
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 430
    const/4 v0, 0x0

    .line 431
    iget-boolean v1, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mSaveInputImages:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v1, :cond_1

    .line 432
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s/%06d.yuv"

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mFolderPathInputImages:Ljava/lang/String;

    aput-object v6, v5, v3

    iget-wide v6, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v0, v1, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 434
    :cond_1
    move-object v12, v0

    iget-wide v5, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 435
    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v10

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v16

    .line 436
    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v18

    invoke-virtual/range {p1 .. p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v19

    .line 434
    move-object v0, v13

    move-wide v1, v5

    move-object v3, v7

    move-object v4, v8

    move-object v5, v9

    move v6, v10

    move v7, v11

    move/from16 v8, v16

    move/from16 v9, v17

    move/from16 v10, v18

    move/from16 v11, v19

    invoke-direct/range {v0 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSaveYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILjava/lang/String;)I

    move-result v0

    .line 437
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 438
    const-string v3, "MorphoPanoramaGP3"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Performance.JNI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v1, v14

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " msec"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    iget-wide v1, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v13, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    .line 441
    return v0
.end method

.method public preparePanorama360(IILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;)I
    .locals 9

    .line 805
    iget-wide v1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 806
    iget-wide v1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativePreparePanorama360(JIILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;)I

    move-result v0

    goto :goto_0

    .line 808
    :cond_0
    const v0, -0x7ffffffe

    .line 811
    :goto_0
    return v0
.end method

.method public saveLog(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 758
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 759
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSaveLog(JLjava/lang/String;Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    .line 761
    :cond_0
    const p1, -0x7ffffffe

    .line 764
    :goto_0
    return p1
.end method

.method public savePanorama360(IILjava/io/FileDescriptor;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I
    .locals 12

    move-object v0, p0

    .line 741
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 742
    invoke-static {p3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getFD(Ljava/io/FileDescriptor;)I

    move-result v6

    .line 743
    if-ltz v6, :cond_0

    .line 744
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const/4 v5, 0x0

    move v3, p1

    move v4, p2

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v0 .. v11}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSavePanorama360(JIILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v0

    goto :goto_0

    .line 746
    :cond_0
    const v0, -0x7ffffff0

    .line 748
    :goto_0
    goto :goto_1

    .line 749
    :cond_1
    const v0, -0x7ffffffe

    .line 752
    :goto_1
    return v0
.end method

.method public savePanorama360(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I
    .locals 12

    move-object v0, p0

    .line 729
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 730
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const/4 v6, 0x0

    move v3, p1

    move v4, p2

    move-object v5, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v0 .. v11}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSavePanorama360(JIILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v0

    goto :goto_0

    .line 732
    :cond_0
    const v0, -0x7ffffffe

    .line 735
    :goto_0
    return v0
.end method

.method public savePanorama360Delay(Ljava/io/FileDescriptor;ZIZ)I
    .locals 9

    .line 829
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 830
    invoke-static {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getFD(Ljava/io/FileDescriptor;)I

    move-result v5

    .line 831
    if-ltz v5, :cond_0

    .line 832
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const/4 v4, 0x0

    move-object v1, p0

    move v6, p2

    move v7, p3

    move v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSavePanorama360Delay(JLjava/lang/String;IZIZ)I

    move-result p1

    goto :goto_0

    .line 834
    :cond_0
    const p1, -0x7ffffff0

    .line 836
    :goto_0
    goto :goto_1

    .line 837
    :cond_1
    const p1, -0x7ffffffe

    .line 840
    :goto_1
    return p1
.end method

.method public savePanorama360Delay(Ljava/lang/String;ZIZ)I
    .locals 9

    .line 817
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 818
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNativeOutputInfo:J

    const/4 v5, 0x0

    move-object v1, p0

    move-object v4, p1

    move v6, p2

    move v7, p3

    move v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSavePanorama360Delay(JLjava/lang/String;IZIZ)I

    move-result p1

    goto :goto_0

    .line 820
    :cond_0
    const p1, -0x7ffffffe

    .line 823
    :goto_0
    return p1
.end method

.method public setAovGain(D)I
    .locals 4

    .line 658
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 659
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetAovGain(JD)I

    move-result p1

    goto :goto_0

    .line 661
    :cond_0
    const p1, -0x7ffffffe

    .line 664
    :goto_0
    return p1
.end method

.method public setAttachEnabled(Z)V
    .locals 0

    .line 178
    iput-boolean p1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachEnabled:Z

    .line 179
    return-void
.end method

.method public setCalcseamPixnum(I)I
    .locals 4

    .line 531
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 532
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetCalcseamPixnum(JI)I

    move-result p1

    goto :goto_0

    .line 534
    :cond_0
    const p1, -0x7ffffffe

    .line 537
    :goto_0
    return p1
.end method

.method public setDistortionCorrectionParam(DDDD)I
    .locals 11

    move-object v0, p0

    .line 706
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 707
    iget-wide v1, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-wide v3, p1

    move-wide v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    invoke-direct/range {v0 .. v10}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetDistortionCorrectionParam(JDDDD)I

    move-result v0

    goto :goto_0

    .line 709
    :cond_0
    const v0, -0x7ffffffe

    .line 712
    :goto_0
    return v0
.end method

.method public setDrawThreshold(D)I
    .locals 4

    .line 610
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 611
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetDrawThreshold(JD)I

    move-result p1

    goto :goto_0

    .line 613
    :cond_0
    const p1, -0x7ffffffe

    .line 616
    :goto_0
    return p1
.end method

.method public setGyroscopeData([Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;)I
    .locals 4

    .line 622
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 623
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetGyroscopeData(J[Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;)I

    move-result p1

    goto :goto_0

    .line 625
    :cond_0
    const p1, -0x7ffffffe

    .line 628
    :goto_0
    return p1
.end method

.method public setInitialRotationByGravity(DDD)I
    .locals 10

    move-object v9, p0

    .line 543
    iget-wide v0, v9, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 544
    iget-wide v1, v9, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    move-object v0, v9

    move-wide v3, p1

    move-wide v5, p3

    move-wide v7, p5

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetInitialRotationByGravity(JDDD)I

    move-result v0

    .line 545
    iget-object v1, v9, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    move-wide v2, p1

    iput-wide v2, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;->x:D

    .line 546
    iget-object v1, v9, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    move-wide v2, p3

    iput-wide v2, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;->y:D

    .line 547
    iget-object v1, v9, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mGravity:Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;

    move-wide v2, p5

    iput-wide v2, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$GravityParam;->z:D

    goto :goto_0

    .line 549
    :cond_0
    const v0, -0x7ffffffe

    .line 552
    :goto_0
    return v0
.end method

.method public setInputImageFormat(Ljava/lang/String;)I
    .locals 4

    .line 391
    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mInputImageFormat:Ljava/lang/String;

    .line 392
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 393
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetImageFormat(JLjava/lang/String;)I

    move-result v0

    .line 394
    if-nez v0, :cond_1

    .line 395
    iput-object p1, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mInputImageFormat:Ljava/lang/String;

    goto :goto_0

    .line 398
    :cond_0
    const v0, -0x7ffffffe

    .line 401
    :cond_1
    :goto_0
    return v0
.end method

.method public setMotionDetectionMode(I)I
    .locals 4

    .line 858
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 859
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetMotionDetectionMode(JI)I

    move-result p1

    goto :goto_0

    .line 861
    :cond_0
    const p1, -0x7ffffffe

    .line 864
    :goto_0
    return p1
.end method

.method public setNoiseReductionParam(I)I
    .locals 4

    .line 694
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 695
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetNoiseReductionParam(JI)I

    move-result p1

    goto :goto_0

    .line 697
    :cond_0
    const p1, -0x7ffffffe

    .line 700
    :goto_0
    return p1
.end method

.method public setPreviewImage(II)I
    .locals 4

    .line 354
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 355
    const p1, -0x7ffffffe

    return p1

    .line 358
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetPreviewImage(JII)I

    move-result p1

    return p1
.end method

.method public setProjectionMode(I)I
    .locals 4

    .line 846
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 847
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetProjectionMode(JI)I

    move-result p1

    goto :goto_0

    .line 849
    :cond_0
    const p1, -0x7ffffffe

    .line 852
    :goto_0
    return p1
.end method

.method public setRotationRatio(D)I
    .locals 4

    .line 670
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 671
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetRotationRatio(JD)I

    move-result p1

    goto :goto_0

    .line 673
    :cond_0
    const p1, -0x7ffffffe

    .line 676
    :goto_0
    return p1
.end method

.method public setRotationVector([D)I
    .locals 4

    .line 634
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 635
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetRotationVector(J[D)I

    move-result p1

    goto :goto_0

    .line 637
    :cond_0
    const p1, -0x7ffffffe

    .line 640
    :goto_0
    return p1
.end method

.method public setSeamsearchRatio(D)I
    .locals 4

    .line 586
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 587
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetSeamsearchRatio(JD)I

    move-result p1

    goto :goto_0

    .line 589
    :cond_0
    const p1, -0x7ffffffe

    .line 592
    :goto_0
    return p1
.end method

.method public setSensorUseMode(I)I
    .locals 4

    .line 682
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 683
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetSensorUseMode(JI)I

    move-result p1

    goto :goto_0

    .line 685
    :cond_0
    const p1, -0x7ffffffe

    .line 688
    :goto_0
    return p1
.end method

.method public setShrinkRatio(D)I
    .locals 4

    .line 519
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 520
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetShrinkRatio(JD)I

    move-result p1

    goto :goto_0

    .line 522
    :cond_0
    const p1, -0x7ffffffe

    .line 525
    :goto_0
    return p1
.end method

.method public setUnsharpStrength(I)I
    .locals 4

    .line 646
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 647
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetUnsharpStrength(JI)I

    move-result p1

    .line 652
    return p1

    .line 649
    :cond_0
    const p1, -0x7ffffffe

    return p1
.end method

.method public setUseDeform(Z)I
    .locals 4

    .line 562
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 563
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetUseDeform(JI)I

    move-result p1

    goto :goto_0

    .line 565
    :cond_0
    const p1, -0x7ffffffe

    .line 568
    :goto_0
    return p1
.end method

.method public setUseLuminanceCorrection(Z)I
    .locals 4

    .line 574
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 575
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetUseLuminanceCorrection(JI)I

    move-result p1

    goto :goto_0

    .line 577
    :cond_0
    const p1, -0x7ffffffe

    .line 580
    :goto_0
    return p1
.end method

.method public setZrotationCoeff(D)I
    .locals 4

    .line 598
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 599
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeSetZrotationCoeff(JD)I

    move-result p1

    goto :goto_0

    .line 601
    :cond_0
    const p1, -0x7ffffffe

    .line 604
    :goto_0
    return p1
.end method

.method public start(II)I
    .locals 4

    .line 230
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 231
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeStart(JII)I

    move-result p1

    .line 232
    iput-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mAttachCount:J

    goto :goto_0

    .line 234
    :cond_0
    const p1, -0x7ffffffe

    .line 237
    :goto_0
    return p1
.end method

.method public updatePreviewImage(Landroid/graphics/Bitmap;)I
    .locals 4

    .line 346
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 347
    const p1, -0x7ffffffe

    return p1

    .line 350
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP3;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->nativeUpdatePreviewImage(JLandroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method
