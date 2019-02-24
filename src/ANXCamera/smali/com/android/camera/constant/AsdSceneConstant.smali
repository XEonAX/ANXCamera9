.class public Lcom/android/camera/constant/AsdSceneConstant;
.super Ljava/lang/Object;
.source "AsdSceneConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AsdSceneConstant$SceneResult;
    }
.end annotation


# static fields
.field private static final AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final AEC_LUX_HEIGHT_LIGHT:F

.field private static final AEC_LUX_LAST_LIGHT:F

.field private static final AEC_LUX_LOW_LIGHT:F = 450.0f

.field private static final FRAME_BYPASS_NUMBER:I = 0x2

.field private static final LENS_FOCUS_DISTANCE_TOO_CLOSE:F = 2.5f

.field private static final LENS_FOCUS_DISTANCE_TOO_FAR:F = 0.5f

.field public static final SCENE_FLASH:I = 0x0

.field public static final SCENE_FLASH_FRONT:I = 0x9

.field public static final SCENE_HDR:I = 0x1

.field public static final SCENE_MOTION:I = 0x3

.field public static final SCENE_NIGHT:I = 0x2

.field public static final SCENE_NONE:I = -0x1

.field public static final SCENE_RTB_DEPTH_EFFECT_SUCCESS:I = 0x7

.field public static final SCENE_RTB_LOW_LIGHT:I = 0x6

.field public static final SCENE_RTB_TOO_CLOSE:I = 0x4

.field public static final SCENE_RTB_TOO_FAR:I = 0x5

.field public static final SCENE_TELE_NIGHT:I = 0x8

.field private static final XIAO_MI_SCENE_RESULT:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static mFrameNumber:I

.field private static mIsFlashRetain:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "xiaomi.scene.result"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/AsdSceneConstant;->XIAO_MI_SCENE_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 51
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string v1, "com.qti.chi.statsaec.AecLux"

    const-class v2, Ljava/lang/Float;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;

    .line 56
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fy()I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX_LAST_LIGHT:F

    .line 57
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fz()I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX_HEIGHT_LIGHT:F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseRtbSceneResult(Landroid/hardware/camera2/CaptureResult;ZZ)I
    .locals 3

    .line 87
    nop

    .line 88
    sget-object v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    .line 91
    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    const/4 v2, -0x1

    if-nez p1, :cond_5

    .line 92
    sput-boolean v1, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 93
    const/high16 p1, 0x43e10000    # 450.0f

    cmpl-float p1, v0, p1

    if-lez p1, :cond_1

    .line 94
    const/4 p0, 0x6

    return p0

    .line 98
    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureResult;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 99
    sget-object p1, Landroid/hardware/camera2/CaptureResult;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    .line 103
    const/high16 p1, 0x40200000    # 2.5f

    cmpl-float p1, p0, p1

    if-ltz p1, :cond_2

    .line 104
    const/4 p0, 0x4

    return p0

    .line 105
    :cond_2
    const/high16 p1, 0x3f000000    # 0.5f

    cmpg-float p0, p0, p1

    if-gtz p0, :cond_3

    .line 106
    const/4 p0, 0x5

    return p0

    .line 108
    :cond_3
    const/4 p0, 0x7

    return p0

    .line 101
    :cond_4
    return v2

    .line 110
    :cond_5
    if-nez p2, :cond_9

    .line 111
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fn()Z

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_6

    sget p0, Lcom/android/camera/constant/AsdSceneConstant;->mFrameNumber:I

    const/4 p2, 0x2

    if-ge p0, p2, :cond_6

    .line 112
    sget p0, Lcom/android/camera/constant/AsdSceneConstant;->mFrameNumber:I

    add-int/2addr p0, p1

    sput p0, Lcom/android/camera/constant/AsdSceneConstant;->mFrameNumber:I

    .line 113
    return v2

    .line 115
    :cond_6
    sget-boolean p0, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    const/16 p2, 0x9

    if-eqz p0, :cond_7

    sget p0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX_HEIGHT_LIGHT:F

    cmpl-float p0, v0, p0

    if-lez p0, :cond_7

    .line 116
    return p2

    .line 118
    :cond_7
    sget p0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX_LAST_LIGHT:F

    cmpl-float p0, v0, p0

    if-lez p0, :cond_8

    .line 119
    sput-boolean p1, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 120
    return p2

    .line 122
    :cond_8
    sput-boolean v1, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 123
    return v2

    .line 126
    :cond_9
    sput v1, Lcom/android/camera/constant/AsdSceneConstant;->mFrameNumber:I

    .line 127
    return v2
.end method
