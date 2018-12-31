.class public Lcom/android/camera2/CameraHardwareFace;
.super Ljava/lang/Object;
.source "CameraHardwareFace.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field public static final CAMERA_META_DATA_T2T:I = 0xface

.field private static final TAG:Ljava/lang/String;


# instance fields
.field public ageFemale:F

.field public ageMale:F

.field public beautyscore:F

.field public blinkDetected:I

.field public faceRecognised:I

.field public faceType:I

.field public gender:F

.field public id:I

.field public leftEye:Landroid/graphics/Point;

.field public mouth:Landroid/graphics/Point;

.field public prob:F

.field public rect:Landroid/graphics/Rect;

.field public rightEye:Landroid/graphics/Point;

.field public score:I

.field public smileDegree:I

.field public smileScore:I

.field public t2tStop:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-class v0, Lcom/android/camera2/CameraHardwareFace;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraHardwareFace;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->id:I

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/CameraHardwareFace;->leftEye:Landroid/graphics/Point;

    .line 26
    iput-object v0, p0, Lcom/android/camera2/CameraHardwareFace;->rightEye:Landroid/graphics/Point;

    .line 27
    iput-object v0, p0, Lcom/android/camera2/CameraHardwareFace;->mouth:Landroid/graphics/Point;

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->smileDegree:I

    .line 33
    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->smileScore:I

    .line 34
    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->blinkDetected:I

    .line 35
    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->faceRecognised:I

    .line 36
    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    .line 37
    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->t2tStop:I

    .line 41
    return-void
.end method

.method public static convertCameraHardwareFace([Landroid/hardware/camera2/params/Face;)[Lcom/android/camera2/CameraHardwareFace;
    .locals 4

    .line 44
    array-length v0, p0

    new-array v0, v0, [Lcom/android/camera2/CameraHardwareFace;

    .line 45
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 46
    new-instance v2, Lcom/android/camera2/CameraHardwareFace;

    invoke-direct {v2}, Lcom/android/camera2/CameraHardwareFace;-><init>()V

    aput-object v2, v0, v1

    .line 47
    aget-object v2, v0, v1

    aget-object v3, p0, v1

    invoke-static {v2, v3}, Lcom/android/camera2/CameraHardwareFace;->copyFace(Lcom/android/camera2/CameraHardwareFace;Landroid/hardware/camera2/params/Face;)V

    .line 45
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-object v0
.end method

.method public static convertExCameraHardwareFace([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;)[Lcom/android/camera2/CameraHardwareFace;
    .locals 10

    .line 54
    array-length v0, p0

    iget-object v1, p1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 55
    new-array v1, v0, [Lcom/android/camera2/CameraHardwareFace;

    .line 56
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 57
    new-instance v3, Lcom/android/camera2/CameraHardwareFace;

    invoke-direct {v3}, Lcom/android/camera2/CameraHardwareFace;-><init>()V

    aput-object v3, v1, v2

    .line 58
    aget-object v4, v1, v2

    aget-object v5, p0, v2

    iget-object v3, p1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    aget v6, v3, v2

    iget-object v3, p1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    aget v7, v3, v2

    iget-object v3, p1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    aget v8, v3, v2

    iget-object v3, p1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mProp:[F

    aget v9, v3, v2

    invoke-static/range {v4 .. v9}, Lcom/android/camera2/CameraHardwareFace;->copyExFace(Lcom/android/camera2/CameraHardwareFace;Landroid/hardware/camera2/params/Face;FFFF)V

    .line 56
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 61
    :cond_0
    return-object v1
.end method

.method private static copyExFace(Lcom/android/camera2/CameraHardwareFace;Landroid/hardware/camera2/params/Face;FFFF)V
    .locals 6

    .line 83
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    .line 84
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getScore()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->score:I

    .line 85
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getId()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->id:I

    .line 88
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 89
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 91
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 92
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_1

    .line 93
    :catch_0
    move-exception v3

    .line 94
    sget-object v4, Lcom/android/camera2/CameraHardwareFace;->TAG:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 98
    :cond_0
    iput p3, p0, Lcom/android/camera2/CameraHardwareFace;->gender:F

    .line 99
    iput p4, p0, Lcom/android/camera2/CameraHardwareFace;->beautyscore:F

    .line 100
    iput p2, p0, Lcom/android/camera2/CameraHardwareFace;->ageMale:F

    iput p2, p0, Lcom/android/camera2/CameraHardwareFace;->ageFemale:F

    .line 101
    iput p5, p0, Lcom/android/camera2/CameraHardwareFace;->prob:F

    .line 102
    return-void
.end method

.method private static copyFace(Lcom/android/camera2/CameraHardwareFace;Landroid/hardware/camera2/params/Face;)V
    .locals 1

    .line 66
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    .line 67
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getScore()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraHardwareFace;->score:I

    .line 68
    invoke-virtual {p1}, Landroid/hardware/camera2/params/Face;->getId()I

    move-result p1

    iput p1, p0, Lcom/android/camera2/CameraHardwareFace;->id:I

    .line 80
    return-void
.end method
