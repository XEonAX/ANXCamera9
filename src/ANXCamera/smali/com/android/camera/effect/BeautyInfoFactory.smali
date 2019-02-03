.class public Lcom/android/camera/effect/BeautyInfoFactory;
.super Ljava/lang/Object;
.source "BeautyInfoFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFilterDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 2

    .line 245
    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    const/16 v1, 0x46

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 260
    const/16 p0, 0x64

    return p0

    .line 256
    :pswitch_0
    const/16 p0, 0x50

    return p0

    .line 249
    :pswitch_1
    return v1

    .line 247
    :pswitch_2
    const/16 p0, 0x3c

    return p0

    .line 258
    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x19
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
    .locals 2

    .line 265
    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/16 v0, 0xd

    const/16 v1, 0x50

    if-eq p0, v0, :cond_0

    const/16 v0, 0x10

    if-eq p0, v0, :cond_0

    const/16 v0, 0x46

    packed-switch p0, :pswitch_data_0

    .line 283
    const/16 p0, 0x64

    return p0

    .line 281
    :pswitch_0
    return v0

    .line 276
    :pswitch_1
    return v1

    .line 269
    :pswitch_2
    return v0

    .line 267
    :pswitch_3
    const/16 p0, 0x3c

    return p0

    .line 279
    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
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

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    nop

    .line 19
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f090069

    const v5, 0x7f0201ac

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    .line 25
    nop

    .line 26
    nop

    .line 27
    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    .line 28
    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 118
    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    .line 110
    :pswitch_0
    const/16 v5, 0x96

    .line 111
    const v6, 0x7f090085

    .line 112
    const v7, 0x7f0201a4

    .line 113
    goto :goto_1

    .line 104
    :pswitch_1
    const/16 v5, 0x8c

    .line 105
    const v6, 0x7f09008b

    .line 106
    const v7, 0x7f0201a6

    .line 107
    goto :goto_1

    .line 98
    :pswitch_2
    const/16 v5, 0x82

    .line 99
    const v6, 0x7f09008a

    .line 100
    const v7, 0x7f0201a5

    .line 101
    goto :goto_1

    .line 92
    :pswitch_3
    const/16 v5, 0x78

    .line 93
    const v6, 0x7f090089

    .line 94
    const v7, 0x7f0201a7

    .line 95
    goto :goto_1

    .line 80
    :pswitch_4
    const/16 v5, 0x6e

    .line 81
    const v6, 0x7f090088

    .line 82
    const v7, 0x7f0201aa

    .line 83
    goto :goto_1

    .line 75
    :pswitch_5
    const/16 v5, 0x64

    .line 76
    const v6, 0x7f090087

    .line 77
    const v7, 0x7f0201ae

    .line 78
    goto :goto_1

    .line 65
    :pswitch_6
    const/16 v5, 0x50

    .line 66
    const v6, 0x7f090083

    .line 67
    const v7, 0x7f0201a8

    .line 68
    goto :goto_1

    .line 50
    :pswitch_7
    const/16 v5, 0x32

    .line 51
    const v6, 0x7f09007e

    .line 52
    const v7, 0x7f0201a2

    .line 53
    goto :goto_1

    .line 45
    :pswitch_8
    const/16 v5, 0x28

    .line 46
    const v6, 0x7f090086

    .line 47
    const v7, 0x7f0201b0

    .line 48
    goto :goto_1

    .line 40
    :pswitch_9
    const/16 v5, 0x1e

    .line 41
    const v6, 0x7f09007f

    .line 42
    const v7, 0x7f0201ad

    .line 43
    goto :goto_1

    .line 35
    :pswitch_a
    const/16 v5, 0x14

    .line 36
    const v6, 0x7f090080

    .line 37
    const v7, 0x7f0201a3

    .line 38
    goto :goto_1

    .line 30
    :pswitch_b
    const/16 v5, 0xa

    .line 31
    const v6, 0x7f09007d

    .line 32
    const v7, 0x7f0201ab

    .line 33
    nop

    .line 118
    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    .line 119
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    .line 120
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 121
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    nop

    .line 123
    nop

    .line 27
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

    .line 126
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 127
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
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 132
    nop

    .line 134
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f090069

    const v5, 0x7f0201b9

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 138
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY_INDIA:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    .line 140
    nop

    .line 141
    nop

    .line 142
    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    .line 143
    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 232
    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    .line 225
    :pswitch_0
    const/16 v5, 0xa0

    .line 226
    const v6, 0x7f090085

    .line 227
    const v7, 0x7f0201b2

    .line 228
    goto :goto_1

    .line 219
    :pswitch_1
    const/16 v5, 0x96

    .line 220
    const v6, 0x7f09008b

    .line 221
    const v7, 0x7f0201b5

    .line 222
    goto :goto_1

    .line 213
    :pswitch_2
    const/16 v5, 0x8c

    .line 214
    const v6, 0x7f090089

    .line 215
    const v7, 0x7f0201b6

    .line 216
    goto :goto_1

    .line 207
    :pswitch_3
    const/16 v5, 0x82

    .line 208
    const v6, 0x7f09008a

    .line 209
    const v7, 0x7f0201b4

    .line 210
    goto :goto_1

    .line 201
    :pswitch_4
    const/16 v5, 0x78

    .line 202
    const v6, 0x7f09008c

    .line 203
    const v7, 0x7f0201b3

    .line 204
    goto :goto_1

    .line 190
    :pswitch_5
    const/16 v5, 0x64

    .line 191
    const v6, 0x7f090299

    .line 192
    const v7, 0x7f0201bd

    .line 193
    goto :goto_1

    .line 180
    :pswitch_6
    const/16 v5, 0x50

    .line 181
    const v6, 0x7f090297

    .line 182
    const v7, 0x7f0201bc

    .line 183
    goto :goto_1

    .line 165
    :pswitch_7
    const/16 v5, 0x32

    .line 166
    const v6, 0x7f090294

    .line 167
    const v7, 0x7f0201c1

    .line 168
    goto :goto_1

    .line 160
    :pswitch_8
    const/16 v5, 0x28

    .line 161
    const v6, 0x7f090293

    .line 162
    const v7, 0x7f0201be

    .line 163
    goto :goto_1

    .line 155
    :pswitch_9
    const/16 v5, 0x1e

    .line 156
    const v6, 0x7f090292

    .line 157
    const v7, 0x7f0201b7

    .line 158
    goto :goto_1

    .line 150
    :pswitch_a
    const/16 v5, 0x14

    .line 151
    const v6, 0x7f090291

    .line 152
    const v7, 0x7f0201ba

    .line 153
    goto :goto_1

    .line 145
    :pswitch_b
    const/16 v5, 0xa

    .line 146
    const v6, 0x7f090290

    .line 147
    const v7, 0x7f0201bf

    .line 148
    nop

    .line 232
    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    .line 233
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    .line 234
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 235
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    nop

    .line 237
    nop

    .line 142
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

    .line 240
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 241
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0xd
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
