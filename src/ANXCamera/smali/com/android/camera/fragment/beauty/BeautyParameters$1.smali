.class synthetic Lcom/android/camera/fragment/beauty/BeautyParameters$1;
.super Ljava/lang/Object;
.source "BeautyParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/BeautyParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

.field static final synthetic $SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 240
    invoke-static {}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->values()[Lcom/miui/filtersdk/beauty/BeautyParameterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    sget-object v2, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v2}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    const/4 v1, 0x2

    :try_start_1
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    sget-object v3, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v3}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    :goto_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    sget-object v4, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v4}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v3

    :goto_2
    const/4 v3, 0x4

    :try_start_3
    sget-object v4, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    sget-object v5, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v5}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v4

    .line 190
    :goto_3
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->values()[Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    :try_start_4
    sget-object v4, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v5, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v5}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    :goto_4
    :try_start_5
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v4, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v4}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v4

    aput v1, v0, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    :goto_5
    :try_start_6
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    :goto_6
    :try_start_7
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    :goto_7
    :try_start_8
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v0

    :goto_8
    :try_start_9
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v0

    :goto_9
    :try_start_a
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    goto :goto_a

    :catch_a
    move-exception v0

    :goto_a
    :try_start_b
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    goto :goto_b

    :catch_b
    move-exception v0

    :goto_b
    :try_start_c
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    goto :goto_c

    :catch_c
    move-exception v0

    :goto_c
    :try_start_d
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    goto :goto_d

    :catch_d
    move-exception v0

    :goto_d
    :try_start_e
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    goto :goto_e

    :catch_e
    move-exception v0

    :goto_e
    :try_start_f
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    goto :goto_f

    :catch_f
    move-exception v0

    :goto_f
    :try_start_10
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_10

    goto :goto_10

    :catch_10
    move-exception v0

    :goto_10
    :try_start_11
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_11

    goto :goto_11

    :catch_11
    move-exception v0

    :goto_11
    :try_start_12
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_12

    goto :goto_12

    :catch_12
    move-exception v0

    :goto_12
    :try_start_13
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_13

    goto :goto_13

    :catch_13
    move-exception v0

    :goto_13
    :try_start_14
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_14

    goto :goto_14

    :catch_14
    move-exception v0

    :goto_14
    :try_start_15
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_15

    goto :goto_15

    :catch_15
    move-exception v0

    :goto_15
    :try_start_16
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$1;->$SwitchMap$com$android$camera$fragment$beauty$BeautyParameters$Type:[I

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_16

    goto :goto_16

    :catch_16
    move-exception v0

    :goto_16
    return-void
.end method
