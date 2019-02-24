.class public Lcom/android/camera/effect/ArcsoftBeautyProcessor;
.super Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
.source "ArcsoftBeautyProcessor.java"


# static fields
.field private static final CAMERA_BEAUTY_PARAM_MAX:F = 10.0f

.field private static final EXTRA_SPAN:F = 2.0f

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mEnlargeEyeRatio:I

.field private mShrinkFaceRatio:I

.field private mSmoothStrength:I

.field private mWhiteStrength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 23
    invoke-direct {p0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;-><init>()V

    .line 24
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->setExtraSpan(F)V

    .line 25
    const/4 v0, 0x6

    new-array v0, v0, [[F

    const/4 v1, 0x4

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_3

    const/4 v3, 0x3

    aput-object v2, v0, v3

    new-array v2, v1, [F

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    new-array v1, v1, [F

    fill-array-data v1, :array_5

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mLevelParameters:[[F

    .line 32
    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
    .end array-data

    :array_3
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data

    :array_4
    .array-data 4
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
    .end array-data

    :array_5
    .array-data 4
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
    .end array-data
.end method

.method private dumpParams()V
    .locals 6

    .line 101
    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "beautyParams: shrinkFace=%d largeEye=%d whiteSkin=%d smoothSkin=%d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    .line 103
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mWhiteStrength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mSmoothStrength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    .line 101
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method

.method private getDegreeByValue(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)I
    .locals 2

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F

    move-result-object p1

    .line 108
    array-length v0, p1

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 109
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1

    .line 112
    :cond_0
    const/4 v0, 0x0

    aget v0, p1, v0

    sub-float/2addr p2, v0

    const/4 v0, 0x1

    aget p1, p1, v0

    div-float/2addr p2, p1

    const/high16 p1, 0x41200000    # 10.0f

    mul-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private updateBeautyParameter(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V
    .locals 1

    .line 80
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 81
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->getDegreeByValue(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)I

    move-result p2

    .line 82
    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 84
    :pswitch_0
    iput p2, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mSmoothStrength:I

    .line 85
    goto :goto_1

    .line 87
    :pswitch_1
    iput p2, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mWhiteStrength:I

    .line 88
    goto :goto_1

    .line 93
    :pswitch_2
    iput p2, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    .line 94
    goto :goto_1

    .line 90
    :pswitch_3
    iput p2, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    .line 91
    nop

    .line 98
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public beautify([BII)I
    .locals 0

    .line 128
    const/4 p1, 0x0

    return p1
.end method

.method public beautify(IIII)V
    .locals 0

    .line 118
    return-void
.end method

.method public beautify(Landroid/graphics/Bitmap;II)V
    .locals 0

    .line 134
    return-void
.end method

.method public beautify([BIII[BI)V
    .locals 0

    .line 124
    return-void
.end method

.method public clearBeautyParameters()V
    .locals 1

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    .line 37
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    .line 38
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mWhiteStrength:I

    .line 39
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mSmoothStrength:I

    .line 40
    return-void
.end method

.method public getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .locals 3

    .line 44
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method public getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F
    .locals 1

    .line 54
    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 61
    const/4 p1, 0x0

    new-array p1, p1, [F

    return-object p1

    .line 59
    :pswitch_0
    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x0
        0x41200000    # 10.0f
    .end array-data
.end method

.method public init(II)V
    .locals 0

    .line 139
    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 0

    .line 149
    return-void
.end method

.method public release()V
    .locals 0

    .line 144
    return-void
.end method

.method public setBeautyParamDegree(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V
    .locals 0

    .line 75
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->updateBeautyParameter(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V

    .line 76
    invoke-direct {p0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->dumpParams()V

    .line 77
    return-void
.end method

.method public setBeautyParamsDegree(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 67
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 68
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-direct {p0, v1, v0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->updateBeautyParameter(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->dumpParams()V

    .line 71
    return-void
.end method
