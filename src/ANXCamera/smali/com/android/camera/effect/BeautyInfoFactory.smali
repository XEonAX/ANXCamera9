.class public Lcom/android/camera/effect/BeautyInfoFactory;
.super Ljava/lang/Object;
.source "BeautyInfoFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFilterDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 2

    .line 136
    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    const/16 v1, 0x46

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 151
    const/16 p0, 0x64

    return p0

    .line 147
    :pswitch_0
    const/16 p0, 0x50

    return p0

    .line 140
    :pswitch_1
    return v1

    .line 138
    :pswitch_2
    const/16 p0, 0x3c

    return p0

    .line 149
    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getIndiaFilterDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 0

    .line 156
    const/16 p0, 0x64

    return p0
.end method

.method public static initBeautyFilterInfo()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    nop

    .line 20
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f0b006a

    const v5, 0x7f020196

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    .line 26
    nop

    .line 27
    nop

    .line 28
    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    .line 29
    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 119
    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    .line 111
    :pswitch_0
    const/16 v5, 0x96

    .line 112
    const v6, 0x7f0b0086

    .line 113
    const v7, 0x7f02018e

    .line 114
    goto :goto_1

    .line 105
    :pswitch_1
    const/16 v5, 0x8c

    .line 106
    const v6, 0x7f0b008c

    .line 107
    const v7, 0x7f020190

    .line 108
    goto :goto_1

    .line 99
    :pswitch_2
    const/16 v5, 0x82

    .line 100
    const v6, 0x7f0b008b

    .line 101
    const v7, 0x7f02018f

    .line 102
    goto :goto_1

    .line 93
    :pswitch_3
    const/16 v5, 0x78

    .line 94
    const v6, 0x7f0b008a

    .line 95
    const v7, 0x7f020191

    .line 96
    goto :goto_1

    .line 81
    :pswitch_4
    const/16 v5, 0x6e

    .line 82
    const v6, 0x7f0b0089

    .line 83
    const v7, 0x7f020194

    .line 84
    goto :goto_1

    .line 76
    :pswitch_5
    const/16 v5, 0x64

    .line 77
    const v6, 0x7f0b0088

    .line 78
    const v7, 0x7f020198

    .line 79
    goto :goto_1

    .line 66
    :pswitch_6
    const/16 v5, 0x50

    .line 67
    const v6, 0x7f0b0084

    .line 68
    const v7, 0x7f020192

    .line 69
    goto :goto_1

    .line 51
    :pswitch_7
    const/16 v5, 0x32

    .line 52
    const v6, 0x7f0b007f

    .line 53
    const v7, 0x7f02018c

    .line 54
    goto :goto_1

    .line 46
    :pswitch_8
    const/16 v5, 0x28

    .line 47
    const v6, 0x7f0b0087

    .line 48
    const v7, 0x7f02019a

    .line 49
    goto :goto_1

    .line 41
    :pswitch_9
    const/16 v5, 0x1e

    .line 42
    const v6, 0x7f0b0080

    .line 43
    const v7, 0x7f020197

    .line 44
    goto :goto_1

    .line 36
    :pswitch_a
    const/16 v5, 0x14

    .line 37
    const v6, 0x7f0b0081

    .line 38
    const v7, 0x7f02018d

    .line 39
    goto :goto_1

    .line 31
    :pswitch_b
    const/16 v5, 0xa

    .line 32
    const v6, 0x7f0b007e

    .line 33
    const v7, 0x7f020195

    .line 34
    nop

    .line 119
    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    .line 120
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    .line 121
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 122
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    nop

    .line 124
    nop

    .line 28
    move v6, v3

    move v12, v6

    goto :goto_3

    :cond_0
    move v6, v13

    :goto_3
    add-int/lit8 v4, v4, 0x1

    move v7, v5

    move v5, v12

    goto/16 :goto_0

    .line 127
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 128
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

.method public static initIndiaBeautyFilterInfo()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .line 132
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method
