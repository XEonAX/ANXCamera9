.class Lcom/miui/filtersdk/beauty/NewBeautyProcessor;
.super Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
.source "NewBeautyProcessor.java"


# static fields
.field private static final BEAUTY_PARAMETER_SIZE:I = 0x6

.field private static final EXTRA_SPAN:F = 50.0f

.field private static final NEW_BEAUTIFY_ENLARGE_EYE_RATIO:I = 0x2

.field private static final NEW_BEAUTIFY_ILLEGAL_PARAMETER:I = -0x1

.field private static final NEW_BEAUTIFY_RUDDY_STRENGTH:I = 0x4

.field private static final NEW_BEAUTIFY_SHRINK_FACE_RATIO:I = 0x3

.field private static final NEW_BEAUTIFY_SMOOTH_STRENGTH:I = 0x1

.field private static final NEW_BEAUTIFY_WHITEN_STRENGTH:I


# instance fields
.field private mBeautyParameters:[I


# direct methods
.method constructor <init>()V
    .locals 4

    .line 21
    invoke-direct {p0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;-><init>()V

    .line 22
    const/4 v0, 0x6

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    .line 23
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 24
    iget-object v3, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    aput v1, v3, v2

    .line 23
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 27
    :cond_0
    const/high16 v2, 0x42480000    # 50.0f

    invoke-virtual {p0, v2}, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->setExtraSpan(F)V

    .line 28
    new-array v0, v0, [[F

    const/4 v2, 0x5

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    aput-object v3, v0, v1

    new-array v1, v2, [F

    fill-array-data v1, :array_1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_2

    aput-object v3, v0, v1

    const/4 v1, 0x3

    new-array v3, v2, [F

    fill-array-data v3, :array_3

    aput-object v3, v0, v1

    const/4 v1, 0x4

    new-array v3, v2, [F

    fill-array-data v3, :array_4

    aput-object v3, v0, v1

    new-array v1, v2, [F

    fill-array-data v1, :array_5

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mLevelParameters:[[F

    .line 34
    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x41200000    # 10.0f
        0x41200000    # 10.0f
        0x41200000    # 10.0f
        0x41200000    # 10.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x41a00000    # 20.0f
        0x41a00000    # 20.0f
        0x41a00000    # 20.0f
        0x41a00000    # 20.0f
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x41f00000    # 30.0f
        0x41f00000    # 30.0f
        0x41f00000    # 30.0f
        0x41f00000    # 30.0f
        0x0
    .end array-data

    :array_4
    .array-data 4
        0x42480000    # 50.0f
        0x42480000    # 50.0f
        0x42480000    # 50.0f
        0x42480000    # 50.0f
        0x0
    .end array-data

    :array_5
    .array-data 4
        0x42700000    # 60.0f
        0x42700000    # 60.0f
        0x42700000    # 60.0f
        0x42700000    # 60.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public beautify([BII)I
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    invoke-static {v0}, Lcom/miui/filtersdk/BeautifyJni;->beautifyFaceUpdateIntensity([I)I

    .line 111
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 112
    iget v1, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mRotation:I

    invoke-static {p1, p2, p3, v1, v0}, Lcom/miui/filtersdk/BeautifyJni;->beautifyFaceYUVPreviewGPU([BIII[I)I

    .line 113
    const/4 p1, 0x0

    aget p1, v0, p1

    return p1
.end method

.method public beautify(IIII)V
    .locals 0

    .line 103
    return-void
.end method

.method public beautify(Landroid/graphics/Bitmap;II)V
    .locals 0

    .line 118
    return-void
.end method

.method public beautify([BIII[BI)V
    .locals 0

    .line 99
    return-void
.end method

.method public clearBeautyParameters()V
    .locals 3

    .line 138
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    .line 139
    iget-object v2, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    aput v0, v2, v1

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_0
    return-void
.end method

.method public getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .locals 3

    .line 38
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method public getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F
    .locals 1

    .line 46
    sget-object v0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 53
    const/4 p1, 0x0

    new-array p1, p1, [F

    return-object p1

    .line 51
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
        0x42c80000    # 100.0f
    .end array-data
.end method

.method public init(II)V
    .locals 0

    .line 122
    invoke-static {}, Lcom/miui/filtersdk/BeautifyJni;->Initbeautify()I

    .line 123
    invoke-static {p1, p2}, Lcom/miui/filtersdk/BeautifyJni;->beautifyFaceSetScreenSize(II)I

    .line 124
    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 0

    .line 134
    return-void
.end method

.method public release()V
    .locals 0

    .line 128
    invoke-static {}, Lcom/miui/filtersdk/BeautifyJni;->Cleanbeautify()I

    .line 129
    return-void
.end method

.method public setBeautyParamDegree(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V
    .locals 1

    .line 67
    sget-object v0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, -0x1

    packed-switch p1, :pswitch_data_0

    .line 84
    nop

    .line 88
    move p1, v0

    goto :goto_0

    .line 81
    :pswitch_0
    const/4 p1, 0x4

    .line 82
    goto :goto_0

    .line 78
    :pswitch_1
    const/4 p1, 0x1

    .line 79
    goto :goto_0

    .line 75
    :pswitch_2
    const/4 p1, 0x0

    .line 76
    goto :goto_0

    .line 72
    :pswitch_3
    const/4 p1, 0x3

    .line 73
    goto :goto_0

    .line 69
    :pswitch_4
    const/4 p1, 0x2

    .line 70
    nop

    .line 88
    :goto_0
    if-eq v0, p1, :cond_0

    .line 89
    iget-object v0, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    aput p2, v0, p1

    .line 90
    iget-object p1, p0, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->mBeautyParameters:[I

    invoke-static {p1}, Lcom/miui/filtersdk/BeautifyJni;->beautifyFaceUpdateIntensity([I)I

    .line 92
    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
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

    .line 59
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

    .line 60
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {p0, v1, v0}, Lcom/miui/filtersdk/beauty/NewBeautyProcessor;->setBeautyParamDegree(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method
