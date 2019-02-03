.class final Lcom/google/zxing/qrcode/encoder/MaskUtil;
.super Ljava/lang/Object;
.source "MaskUtil.java"


# static fields
.field private static final N1:I = 0x3

.field private static final N2:I = 0x3

.field private static final N3:I = 0x28

.field private static final N4:I = 0xa


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method static applyMaskPenaltyRule1(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 3
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 41
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I
    .registers 13
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .param p1, "isHorizontal"    # Z

    .line 191
    const/4 v0, 0x0

    .line 192
    .local v0, "penalty":I
    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v1

    goto :goto_c

    :cond_8
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v1

    .line 193
    .local v1, "iLimit":I
    :goto_c
    if-eqz p1, :cond_13

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    goto :goto_17

    :cond_13
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v2

    .line 194
    .local v2, "jLimit":I
    :goto_17
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v3

    .line 195
    .local v3, "array":[[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1c
    if-lt v4, v1, :cond_1f

    .line 214
    .end local v4    # "i":I
    return v0

    .line 196
    .restart local v4    # "i":I
    :cond_1f
    const/4 v5, 0x0

    .line 197
    .local v5, "numSameBitCells":I
    const/4 v6, -0x1

    .line 198
    .local v6, "prevBit":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_22
    const/4 v8, 0x3

    const/4 v9, 0x5

    if-lt v7, v2, :cond_2f

    .line 210
    .end local v7    # "j":I
    if-lt v5, v9, :cond_2c

    .line 211
    add-int/lit8 v7, v5, -0x5

    add-int/2addr v8, v7

    add-int/2addr v0, v8

    .line 195
    .end local v5    # "numSameBitCells":I
    .end local v6    # "prevBit":I
    :cond_2c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    .line 199
    .restart local v5    # "numSameBitCells":I
    .restart local v6    # "prevBit":I
    .restart local v7    # "j":I
    :cond_2f
    if-eqz p1, :cond_36

    aget-object v10, v3, v4

    aget-byte v10, v10, v7

    goto :goto_3a

    :cond_36
    aget-object v10, v3, v7

    aget-byte v10, v10, v4

    .line 200
    .local v10, "bit":I
    :goto_3a
    if-ne v10, v6, :cond_3f

    .line 201
    add-int/lit8 v5, v5, 0x1

    .line 202
    goto :goto_47

    .line 203
    :cond_3f
    if-lt v5, v9, :cond_45

    .line 204
    add-int/lit8 v9, v5, -0x5

    add-int/2addr v8, v9

    add-int/2addr v0, v8

    .line 206
    :cond_45
    const/4 v5, 0x1

    .line 207
    move v6, v10

    .line 198
    .end local v10    # "bit":I
    :goto_47
    add-int/lit8 v7, v7, 0x1

    goto :goto_22
.end method

.method static applyMaskPenaltyRule2(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 10
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 50
    const/4 v0, 0x0

    .line 51
    .local v0, "penalty":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    .line 52
    .local v1, "array":[[B
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    .line 53
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    .line 54
    .local v3, "height":I
    const/4 v4, 0x0

    .local v4, "y":I
    :goto_e
    add-int/lit8 v5, v3, -0x1

    if-lt v4, v5, :cond_15

    .line 62
    .end local v4    # "y":I
    const/4 v4, 0x3

    mul-int/2addr v4, v0

    return v4

    .line 55
    .restart local v4    # "y":I
    :cond_15
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_16
    add-int/lit8 v6, v2, -0x1

    if-lt v5, v6, :cond_1d

    .line 54
    .end local v5    # "x":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 56
    .restart local v5    # "x":I
    :cond_1d
    aget-object v6, v1, v4

    aget-byte v6, v6, v5

    .line 57
    .local v6, "value":I
    aget-object v7, v1, v4

    add-int/lit8 v8, v5, 0x1

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_3d

    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v6, v7, :cond_3d

    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    add-int/lit8 v8, v5, 0x1

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_3d

    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 55
    .end local v6    # "value":I
    :cond_3d
    add-int/lit8 v5, v5, 0x1

    goto :goto_16
.end method

.method static applyMaskPenaltyRule3(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 11
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "numPenalties":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    .line 73
    .local v1, "array":[[B
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    .line 74
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    .line 75
    .local v3, "height":I
    const/4 v4, 0x0

    .local v4, "y":I
    :goto_e
    if-lt v4, v3, :cond_13

    .line 102
    .end local v4    # "y":I
    mul-int/lit8 v4, v0, 0x28

    return v4

    .line 76
    .restart local v4    # "y":I
    :cond_13
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_14
    if-lt v5, v2, :cond_19

    .line 75
    .end local v5    # "x":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 77
    .restart local v5    # "x":I
    :cond_19
    aget-object v6, v1, v4

    .line 78
    .local v6, "arrayY":[B
    add-int/lit8 v7, v5, 0x6

    const/4 v8, 0x1

    if-ge v7, v2, :cond_5c

    .line 79
    aget-byte v7, v6, v5

    if-ne v7, v8, :cond_5c

    .line 80
    add-int/lit8 v7, v5, 0x1

    aget-byte v7, v6, v7

    if-nez v7, :cond_5c

    .line 81
    add-int/lit8 v7, v5, 0x2

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    .line 82
    add-int/lit8 v7, v5, 0x3

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    .line 83
    add-int/lit8 v7, v5, 0x4

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    .line 84
    add-int/lit8 v7, v5, 0x5

    aget-byte v7, v6, v7

    if-nez v7, :cond_5c

    .line 85
    add-int/lit8 v7, v5, 0x6

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    .line 86
    add-int/lit8 v7, v5, -0x4

    invoke-static {v6, v7, v5}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteHorizontal([BII)Z

    move-result v7

    if-nez v7, :cond_5a

    add-int/lit8 v7, v5, 0x7

    add-int/lit8 v9, v5, 0xb

    invoke-static {v6, v7, v9}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteHorizontal([BII)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 87
    :cond_5a
    add-int/lit8 v0, v0, 0x1

    .line 89
    :cond_5c
    add-int/lit8 v7, v4, 0x6

    if-ge v7, v3, :cond_aa

    .line 90
    aget-object v7, v1, v4

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    .line 91
    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-nez v7, :cond_aa

    .line 92
    add-int/lit8 v7, v4, 0x2

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    .line 93
    add-int/lit8 v7, v4, 0x3

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    .line 94
    add-int/lit8 v7, v4, 0x4

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    .line 95
    add-int/lit8 v7, v4, 0x5

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-nez v7, :cond_aa

    .line 96
    add-int/lit8 v7, v4, 0x6

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    .line 97
    add-int/lit8 v7, v4, -0x4

    invoke-static {v1, v5, v7, v4}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteVertical([[BIII)Z

    move-result v7

    if-nez v7, :cond_a8

    add-int/lit8 v7, v4, 0x7

    add-int/lit8 v8, v4, 0xb

    invoke-static {v1, v5, v7, v8}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteVertical([[BIII)Z

    move-result v7

    if-eqz v7, :cond_aa

    .line 98
    :cond_a8
    add-int/lit8 v0, v0, 0x1

    .line 76
    .end local v6    # "arrayY":[B
    :cond_aa
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_14
.end method

.method static applyMaskPenaltyRule4(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 10
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 128
    const/4 v0, 0x0

    .line 129
    .local v0, "numDarkCells":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    .line 130
    .local v1, "array":[[B
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    .line 131
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    .line 132
    .local v3, "height":I
    const/4 v4, 0x0

    .local v4, "y":I
    :goto_e
    if-lt v4, v3, :cond_26

    .line 140
    .end local v4    # "y":I
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v5

    mul-int/2addr v4, v5

    .line 141
    .local v4, "numTotalCells":I
    mul-int/lit8 v5, v0, 0x2

    sub-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0xa

    div-int/2addr v5, v4

    .line 142
    .local v5, "fivePercentVariances":I
    mul-int/lit8 v6, v5, 0xa

    return v6

    .line 133
    .end local v5    # "fivePercentVariances":I
    .local v4, "y":I
    :cond_26
    aget-object v5, v1, v4

    .line 134
    .local v5, "arrayY":[B
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_29
    if-lt v6, v2, :cond_2e

    .line 132
    .end local v5    # "arrayY":[B
    .end local v6    # "x":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 135
    .restart local v5    # "arrayY":[B
    .restart local v6    # "x":I
    :cond_2e
    aget-byte v7, v5, v6

    const/4 v8, 0x1

    if-ne v7, v8, :cond_35

    .line 136
    add-int/lit8 v0, v0, 0x1

    .line 134
    :cond_35
    add-int/lit8 v6, v6, 0x1

    goto :goto_29
.end method

.method static getDataMaskBit(III)Z
    .registers 7
    .param p0, "maskPattern"    # I
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 152
    const/4 v0, 0x1

    packed-switch p0, :pswitch_data_52

    .line 181
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid mask pattern: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :pswitch_18
    mul-int v1, p2, p1

    .line 178
    .local v1, "temp":I
    rem-int/lit8 v2, v1, 0x3

    add-int v3, p2, p1

    and-int/2addr v3, v0

    add-int/2addr v2, v3

    and-int/2addr v2, v0

    .line 179
    .local v2, "intermediate":I
    goto :goto_4b

    .line 173
    .end local v1    # "temp":I
    .end local v2    # "intermediate":I
    :pswitch_22
    mul-int v1, p2, p1

    .line 174
    .restart local v1    # "temp":I
    and-int/lit8 v2, v1, 0x1

    rem-int/lit8 v3, v1, 0x3

    add-int/2addr v2, v3

    and-int/2addr v2, v0

    .line 175
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 169
    .end local v1    # "temp":I
    .end local v2    # "intermediate":I
    :pswitch_2b
    mul-int v1, p2, p1

    .line 170
    .restart local v1    # "temp":I
    and-int/lit8 v2, v1, 0x1

    rem-int/lit8 v3, v1, 0x3

    add-int/2addr v2, v3

    .line 171
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 166
    .end local v1    # "temp":I
    .end local v2    # "intermediate":I
    :pswitch_33
    div-int/lit8 v1, p2, 0x2

    div-int/lit8 v2, p1, 0x3

    add-int/2addr v1, v2

    and-int/lit8 v2, v1, 0x1

    .line 167
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 163
    .end local v2    # "intermediate":I
    :pswitch_3b
    add-int v1, p2, p1

    rem-int/lit8 v2, v1, 0x3

    .line 164
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 160
    .end local v2    # "intermediate":I
    :pswitch_40
    rem-int/lit8 v2, p1, 0x3

    .line 161
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 157
    .end local v2    # "intermediate":I
    :pswitch_43
    and-int/lit8 v2, p2, 0x1

    .line 158
    .restart local v2    # "intermediate":I
    goto :goto_4b

    .line 154
    .end local v2    # "intermediate":I
    :pswitch_46
    add-int v1, p2, p1

    and-int/lit8 v2, v1, 0x1

    .line 155
    .restart local v2    # "intermediate":I
    nop

    .line 181
    :goto_4b
    move v1, v2

    .line 183
    .end local v2    # "intermediate":I
    .local v1, "intermediate":I
    if-nez v1, :cond_4f

    return v0

    :cond_4f
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3b
        :pswitch_33
        :pswitch_2b
        :pswitch_22
        :pswitch_18
    .end packed-switch
.end method

.method private static isWhiteHorizontal([BII)Z
    .registers 6
    .param p0, "rowArray"    # [B
    .param p1, "from"    # I
    .param p2, "to"    # I

    .line 106
    move v0, p1

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x1

    if-lt v0, p2, :cond_5

    .line 111
    .end local v0    # "i":I
    return v1

    .line 107
    .restart local v0    # "i":I
    :cond_5
    if-ltz v0, :cond_10

    array-length v2, p0

    if-ge v0, v2, :cond_10

    aget-byte v2, p0, v0

    if-ne v2, v1, :cond_10

    .line 108
    const/4 v1, 0x0

    return v1

    .line 106
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static isWhiteVertical([[BIII)Z
    .registers 7
    .param p0, "array"    # [[B
    .param p1, "col"    # I
    .param p2, "from"    # I
    .param p3, "to"    # I

    .line 115
    move v0, p2

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x1

    if-lt v0, p3, :cond_5

    .line 120
    .end local v0    # "i":I
    return v1

    .line 116
    .restart local v0    # "i":I
    :cond_5
    if-ltz v0, :cond_12

    array-length v2, p0

    if-ge v0, v2, :cond_12

    aget-object v2, p0, v0

    aget-byte v2, v2, p1

    if-ne v2, v1, :cond_12

    .line 117
    const/4 v1, 0x0

    return v1

    .line 115
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
