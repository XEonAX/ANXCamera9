.class public Lcom/android/camera/fragment/beauty/BeautyParameters;
.super Ljava/lang/Object;
.source "BeautyParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/BeautyParameters$BeautyType;,
        Lcom/android/camera/fragment/beauty/BeautyParameters$Type;
    }
.end annotation


# static fields
.field public static final BACK_LEVEL_BEAUTY_TAB_ID:I = 0x0

.field public static final BEAUTY_BODY_BEAUTY_TAB_ID:I = 0x1

.field public static final BEAUTY_BODY_TYPE:I = 0x5

.field public static final BEAUTY_FILTER_TYPE:I = 0x6

.field public static final BEAUTY_LIVE_BEAUTY_MODE_TYPE:I = 0x7

.field public static final BEAUTY_MODEL_BEAUTY_TAB_ID:I = 0x1

.field public static final BEAUTY_MODEL_TYPE:I = 0x2

.field public static final EYE_LIGHT_BEAUTY_TAB_ID:I = 0x3

.field public static final EYE_LIGHT_BEAUTY_TYPE:I = 0x4

.field public static final FRON_LEVEL_BEAUTY_TAB_ID:I = 0x0

.field public static final LEVEL_BEAUTY_TYPE:I = 0x1

.field public static final LIVE_BEAUTY_MODE_BEAUTY_TAB_ID:I = 0x1

.field public static final LIVE_FILTER_BEAUTY_TAB_ID:I = 0x0

.field public static final MAKE_UP_BEAUTY_TAB_ID:I = 0x2

.field public static final MAKE_UP_TYPE:I = 0x3

.field public static final SEEKBAR_MAX:I = 0x64

.field public static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;

.field public static sSupportSeekBarAdjustBeautyType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSupportTwoWayAdjustableTypes:[Lcom/android/camera/fragment/beauty/BeautyParameters$Type;


# instance fields
.field private mCameraLevelParameters:[[F

.field private mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 29
    const-class v0, Lcom/android/camera/fragment/beauty/BeautyParameters;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->TAG:Ljava/lang/String;

    .line 62
    const/4 v0, 0x2

    new-array v1, v0, [Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sput-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportTwoWayAdjustableTypes:[Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 105
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportSeekBarAdjustBeautyType:Ljava/util/List;

    .line 106
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportSeekBarAdjustBeautyType:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportSeekBarAdjustBeautyType:Ljava/util/List;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportSeekBarAdjustBeautyType:Ljava/util/List;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 287
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

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mCameraLevelParameters:[[F

    .line 129
    return-void

    nop

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

.method public static convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/fragment/beauty/BeautyParameters$Type;
    .locals 1

    .line 240
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    .line 250
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 248
    :pswitch_0
    sget-object p0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    return-object p0

    .line 246
    :pswitch_1
    sget-object p0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    return-object p0

    .line 244
    :pswitch_2
    sget-object p0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    return-object p0

    .line 242
    :pswitch_3
    sget-object p0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getFaceBeautyRatioKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;
    .locals 1

    .line 190
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    .line 230
    const-string p0, ""

    return-object p0

    .line 228
    :pswitch_0
    const-string p0, "key_beauty_leg_slim_ratio"

    return-object p0

    .line 226
    :pswitch_1
    const-string p0, "pref_beauty_shoulder_slim_ratio"

    return-object p0

    .line 224
    :pswitch_2
    const-string p0, "pref_beauty_body_slim_ratio"

    return-object p0

    .line 222
    :pswitch_3
    const-string p0, "pref_beauty_head_slim_ratio"

    return-object p0

    .line 220
    :pswitch_4
    const-string p0, "pref_beautify_eyebrow_dye_ratio_key"

    return-object p0

    .line 218
    :pswitch_5
    const-string p0, "pref_beautify_pupil_line_ratio_key"

    return-object p0

    .line 216
    :pswitch_6
    const-string p0, "pref_beautify_jelly_lips_ratio_key"

    return-object p0

    .line 214
    :pswitch_7
    const-string p0, "pref_beautify_blusher_ratio_key"

    return-object p0

    .line 212
    :pswitch_8
    const-string p0, "pref_beautify_slim_nose_ratio_key"

    return-object p0

    .line 210
    :pswitch_9
    const-string p0, "pref_beautify_smile_ratio_key"

    return-object p0

    .line 208
    :pswitch_a
    const-string p0, "pref_beautify_neck_ratio_key"

    return-object p0

    .line 206
    :pswitch_b
    const-string p0, "pref_beautify_chin_ratio_key"

    return-object p0

    .line 204
    :pswitch_c
    const-string p0, "pref_beautify_lips_ratio_key"

    return-object p0

    .line 202
    :pswitch_d
    const-string p0, "pref_beautify_risorius_ratio_key"

    return-object p0

    .line 200
    :pswitch_e
    const-string p0, "pref_beautify_nose_ratio_key"

    return-object p0

    .line 198
    :pswitch_f
    const-string p0, "pref_beautify_slim_face_ratio_key"

    return-object p0

    .line 196
    :pswitch_10
    const-string p0, "pref_beautify_enlarge_eye_ratio_key"

    return-object p0

    .line 194
    :pswitch_11
    const-string p0, "pref_beautify_skin_color_ratio_key"

    return-object p0

    .line 192
    :pswitch_12
    const-string p0, "pref_beautify_skin_smooth_ratio_key"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/fragment/beauty/BeautyParameters;
    .locals 2

    const-class v0, Lcom/android/camera/fragment/beauty/BeautyParameters;

    monitor-enter v0

    .line 133
    :try_start_0
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;

    if-nez v1, :cond_0

    .line 134
    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyParameters;

    invoke-direct {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;-><init>()V

    sput-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;

    .line 136
    :cond_0
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters;->sInstance:Lcom/android/camera/fragment/beauty/BeautyParameters;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 132
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;",
            "I)",
            "Ljava/util/Map<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 346
    invoke-static {}, Lcom/mi/config/b;->hp()Z

    move-result v0

    if-nez v0, :cond_0

    .line 347
    add-int/lit8 p2, p2, -0x1

    .line 349
    :cond_0
    invoke-virtual {p1, p2}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getIntelligentLevelParams(I)Ljava/util/Map;

    move-result-object p1

    .line 363
    return-object p1
.end method

.method public static isCurrentModeSupportVideoBeauty()Z
    .locals 2

    .line 146
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 147
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 149
    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isFaceBeautyOn()Z
    .locals 1

    .line 255
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    .line 256
    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSupportTwoWayAdjustable(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z
    .locals 2

    .line 276
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getBeautyType()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 277
    const/4 p0, 0x0

    return p0

    .line 279
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters;->sSupportTwoWayAdjustableTypes:[Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private setBeautyParameters()V
    .locals 2

    .line 327
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    .line 328
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->isStickerEnable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 329
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_1

    .line 330
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 331
    invoke-direct {p0, v1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 332
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    .line 333
    goto :goto_0

    .line 335
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_1

    .line 336
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 337
    invoke-direct {p0, v1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 338
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    .line 341
    :cond_1
    :goto_0
    return-void
.end method

.method public static updateSupportedBeautyTypes(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 158
    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 161
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 163
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 164
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 166
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    if-nez v0, :cond_1

    .line 168
    sget-object p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->TAG:Ljava/lang/String;

    const-string v0, "updateSupportedTypes, but CameraCapabilities is null!"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 170
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 171
    invoke-virtual {v0, v2}, Lcom/android/camera2/CameraCapabilities;->isSupportBeautyType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 172
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_2
    goto :goto_0

    .line 177
    :cond_3
    :goto_1
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 178
    const/4 v0, 0x0

    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 179
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 181
    :cond_4
    return-object p0

    .line 159
    :cond_5
    :goto_3
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public getAdjustableTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 260
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMakeupProcessor()Lcom/miui/filtersdk/beauty/BeautyProcessor;
    .locals 1

    .line 305
    monitor-enter p0

    .line 306
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    monitor-exit p0

    return-object v0

    .line 307
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getStickerMakeupProcessor()Lcom/miui/filtersdk/beauty/BeautyProcessor;
    .locals 1

    .line 321
    monitor-enter p0

    .line 322
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    monitor-exit p0

    return-object v0

    .line 323
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSupportBeautyTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 264
    invoke-static {}, Lcom/mi/config/b;->hA()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 265
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getFrontSupportedBeautyTypes()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 268
    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getBackSupportedBeautyTypes()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 271
    :cond_1
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->getLegacySupportedBeautyTypes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 1

    .line 295
    monitor-enter p0

    .line 296
    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    .line 297
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 298
    nop

    .line 299
    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object p1

    .line 300
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    .line 301
    monitor-exit p0

    .line 302
    return-void

    .line 301
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setStickerMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 1

    .line 311
    monitor-enter p0

    .line 312
    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautyShowLevel()I

    move-result v0

    .line 313
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 314
    nop

    .line 315
    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object p1

    .line 316
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    .line 317
    monitor-exit p0

    .line 318
    return-void

    .line 317
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
