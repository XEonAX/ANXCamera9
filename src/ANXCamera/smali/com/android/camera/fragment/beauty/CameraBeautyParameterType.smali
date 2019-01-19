.class public Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
.super Ljava/lang/Object;
.source "CameraBeautyParameterType.java"


# static fields
.field public static final BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;


# instance fields
.field public beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

.field public beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

.field public beautyType:I

.field public customParameterType:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 10
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 11
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 12
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 13
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 18
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 19
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 20
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 21
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 22
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 23
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 24
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 25
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 26
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 28
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const/4 v1, 0x4

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(II)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 33
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 34
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 35
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 36
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 41
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v2, 0x5

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 42
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 43
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 44
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 49
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v2, 0x7

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 50
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 51
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 67
    iput p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    .line 68
    return-void
.end method

.method private constructor <init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 72
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 73
    return-void
.end method

.method private constructor <init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 62
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 63
    return-void
.end method
