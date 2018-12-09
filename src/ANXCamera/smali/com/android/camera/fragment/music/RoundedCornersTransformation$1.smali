.class synthetic Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;
.super Ljava/lang/Object;
.source "RoundedCornersTransformation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/music/RoundedCornersTransformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 81
    invoke-static {}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->values()[Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    :try_start_0
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ALL:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    :try_start_1
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->TOP_LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    :try_start_2
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->TOP_RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    :goto_2
    :try_start_3
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->BOTTOM_LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_3
    :try_start_4
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->BOTTOM_RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    :goto_4
    :try_start_5
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->TOP:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    :goto_5
    :try_start_6
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->BOTTOM:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    :goto_6
    :try_start_7
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    :goto_7
    :try_start_8
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v0

    :goto_8
    :try_start_9
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->OTHER_TOP_LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v0

    :goto_9
    :try_start_a
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->OTHER_TOP_RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    goto :goto_a

    :catch_a
    move-exception v0

    :goto_a
    :try_start_b
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->OTHER_BOTTOM_LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    goto :goto_b

    :catch_b
    move-exception v0

    :goto_b
    :try_start_c
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->OTHER_BOTTOM_RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    goto :goto_c

    :catch_c
    move-exception v0

    :goto_c
    :try_start_d
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->DIAGONAL_FROM_TOP_LEFT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    goto :goto_d

    :catch_d
    move-exception v0

    :goto_d
    :try_start_e
    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    sget-object v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->DIAGONAL_FROM_TOP_RIGHT:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    goto :goto_e

    :catch_e
    move-exception v0

    :goto_e
    return-void
.end method
