.class public Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
.super Ljava/lang/Object;
.source "CameraBeautyParameterType.java"


# static fields
.field public static final BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final BRIGHT_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final CONTRAST_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final DEBLEMISH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final DEPOUCH_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

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

.field public static final IRIS_SHINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final LIP_BEAUTY_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final RELIGHTING_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final RUDDY_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHRINK_JAW_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field public static final SHRINK_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

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

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->CONTRAST_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->CONTRAST_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 11
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 12
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 13
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 14
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 15
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_JAW_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_JAW_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 16
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->RUDDY_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 17
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->BRIGHT_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BRIGHT_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 18
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->IRIS_SHINE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->IRIS_SHINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 19
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEBLEMISH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->DEBLEMISH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 20
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEPOUCH_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->DEPOUCH_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 21
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RELIGHTING_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->RELIGHTING_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 22
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->LIP_BEAUTY_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIP_BEAUTY_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 23
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_NOSE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 29
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 31
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 33
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 35
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 37
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 39
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_CHIN_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 41
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_NECK_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 43
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SMILE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 45
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->FACE_3D_SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 48
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const/4 v1, 0x4

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(II)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 51
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 52
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 53
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 54
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 57
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v2, 0x5

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 58
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 59
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 60
    new-instance v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;-><init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    sput-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 76
    iput p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    .line 77
    return-void
.end method

.method private constructor <init>(ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 81
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 82
    return-void
.end method

.method private constructor <init>(ILcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput p1, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    .line 71
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 72
    return-void
.end method
