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

    .line 189
    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    const/16 v1, 0x46

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 204
    const/16 p0, 0x64

    return p0

    .line 200
    :pswitch_0
    const/16 p0, 0x50

    return p0

    .line 193
    :pswitch_1
    return v1

    .line 191
    :pswitch_2
    const/16 p0, 0x3c

    return p0

    .line 202
    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x18
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
    .locals 3

    .line 209
    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/16 v0, 0xd

    const/16 v1, 0x50

    if-eq p0, v0, :cond_1

    const/16 v0, 0x10

    if-eq p0, v0, :cond_1

    const/16 v0, 0x12

    const/16 v2, 0x46

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 227
    const/16 p0, 0x64

    return p0

    .line 220
    :pswitch_0
    return v1

    .line 213
    :pswitch_1
    return v2

    .line 211
    :pswitch_2
    const/16 p0, 0x3c

    return p0

    .line 225
    :cond_0
    return v2

    .line 223
    :cond_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x18
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

    const v4, 0x7f0b0068

    const v5, 0x7f020180

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

    .line 92
    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    .line 85
    :pswitch_0
    const/16 v5, 0x78

    .line 86
    const v6, 0x7f0b0084

    .line 87
    const v7, 0x7f020178

    .line 88
    goto :goto_1

    .line 80
    :pswitch_1
    const/16 v5, 0x6e

    .line 81
    const v6, 0x7f0b0087

    .line 82
    const v7, 0x7f02017e

    .line 83
    goto :goto_1

    .line 75
    :pswitch_2
    const/16 v5, 0x64

    .line 76
    const v6, 0x7f0b0086

    .line 77
    const v7, 0x7f020182

    .line 78
    goto :goto_1

    .line 70
    :pswitch_3
    const/16 v5, 0x5a

    .line 71
    const v6, 0x7f0b0083

    .line 72
    const v7, 0x7f020179

    .line 73
    goto :goto_1

    .line 65
    :pswitch_4
    const/16 v5, 0x50

    .line 66
    const v6, 0x7f0b0082

    .line 67
    const v7, 0x7f02017c

    .line 68
    goto :goto_1

    .line 60
    :pswitch_5
    const/16 v5, 0x46

    .line 61
    const v6, 0x7f0b0081

    .line 62
    const v7, 0x7f020183

    .line 63
    goto :goto_1

    .line 55
    :pswitch_6
    const/16 v5, 0x3c

    .line 56
    const v6, 0x7f0b0080

    .line 57
    const v7, 0x7f02017d

    .line 58
    goto :goto_1

    .line 50
    :pswitch_7
    const/16 v5, 0x32

    .line 51
    const v6, 0x7f0b007d

    .line 52
    const v7, 0x7f02017a

    .line 53
    goto :goto_1

    .line 45
    :pswitch_8
    const/16 v5, 0x28

    .line 46
    const v6, 0x7f0b0085

    .line 47
    const v7, 0x7f020184

    .line 48
    goto :goto_1

    .line 40
    :pswitch_9
    const/16 v5, 0x1e

    .line 41
    const v6, 0x7f0b007e

    .line 42
    const v7, 0x7f020181

    .line 43
    goto :goto_1

    .line 35
    :pswitch_a
    const/16 v5, 0x14

    .line 36
    const v6, 0x7f0b007f

    .line 37
    const v7, 0x7f02017b

    .line 38
    goto :goto_1

    .line 30
    :pswitch_b
    const/16 v5, 0xa

    .line 31
    const v6, 0x7f0b007c

    .line 32
    const v7, 0x7f02017f

    .line 33
    nop

    .line 92
    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    .line 93
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    .line 94
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 95
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    nop

    .line 97
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

    .line 100
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 101
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

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    nop

    .line 108
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/4 v3, 0x0

    const v4, 0x7f0b0068

    const v5, 0x7f020188

    invoke-direct {v1, v2, v4, v5, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 112
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY_INDIA:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v1}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v1

    .line 114
    nop

    .line 115
    nop

    .line 116
    array-length v2, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v8, v1, v4

    .line 117
    sget-object v9, Lcom/android/camera/effect/BeautyInfoFactory$1;->$SwitchMap$com$miui$filtersdk$filter$helper$FilterType:[I

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 176
    move v12, v5

    move v13, v6

    move v5, v7

    goto/16 :goto_2

    .line 169
    :pswitch_0
    const/16 v5, 0x6e

    .line 170
    const v6, 0x7f0b025b

    .line 171
    const v7, 0x7f020187

    .line 172
    goto :goto_1

    .line 164
    :pswitch_1
    const/16 v5, 0x64

    .line 165
    const v6, 0x7f0b025a

    .line 166
    const v7, 0x7f02018c

    .line 167
    goto :goto_1

    .line 159
    :pswitch_2
    const/16 v5, 0x5a

    .line 160
    const v6, 0x7f0b0259

    .line 161
    const v7, 0x7f020191

    .line 162
    goto :goto_1

    .line 154
    :pswitch_3
    const/16 v5, 0x50

    .line 155
    const v6, 0x7f0b0258

    .line 156
    const v7, 0x7f02018b

    .line 157
    goto :goto_1

    .line 149
    :pswitch_4
    const/16 v5, 0x46

    .line 150
    const v6, 0x7f0b0257

    .line 151
    const v7, 0x7f02018a

    .line 152
    goto :goto_1

    .line 144
    :pswitch_5
    const/16 v5, 0x3c

    .line 145
    const v6, 0x7f0b0256

    .line 146
    const v7, 0x7f02018f

    .line 147
    goto :goto_1

    .line 139
    :pswitch_6
    const/16 v5, 0x32

    .line 140
    const v6, 0x7f0b0255

    .line 141
    const v7, 0x7f020190

    .line 142
    goto :goto_1

    .line 134
    :pswitch_7
    const/16 v5, 0x28

    .line 135
    const v6, 0x7f0b0254

    .line 136
    const v7, 0x7f02018d

    .line 137
    goto :goto_1

    .line 129
    :pswitch_8
    const/16 v5, 0x1e

    .line 130
    const v6, 0x7f0b0253

    .line 131
    const v7, 0x7f020186

    .line 132
    goto :goto_1

    .line 124
    :pswitch_9
    const/16 v5, 0x14

    .line 125
    const v6, 0x7f0b0252

    .line 126
    const v7, 0x7f020189

    .line 127
    goto :goto_1

    .line 119
    :pswitch_a
    const/16 v5, 0xa

    .line 120
    const v6, 0x7f0b0251

    .line 121
    const v7, 0x7f02018e

    .line 122
    nop

    .line 176
    :goto_1
    move v12, v6

    move v13, v7

    :goto_2
    if-eqz v12, :cond_0

    if-eqz v13, :cond_0

    .line 177
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    const/4 v10, 0x2

    .line 178
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v11

    move-object v9, v6

    move v14, v5

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 179
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    nop

    .line 181
    nop

    .line 116
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

    .line 184
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 185
    return-object v0

    :pswitch_data_0
    .packed-switch 0xd
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
