.class public final Lcom/google/zxing/common/HybridBinarizer;
.super Lcom/google/zxing/common/GlobalHistogramBinarizer;
.source "HybridBinarizer.java"


# static fields
.field private static final BLOCK_SIZE:I = 0x8

.field private static final BLOCK_SIZE_MASK:I = 0x7

.field private static final BLOCK_SIZE_POWER:I = 0x3

.field private static final MINIMUM_DIMENSION:I = 0x28

.field private static final MIN_DYNAMIC_RANGE:I = 0x18


# instance fields
.field private matrix:Lcom/google/zxing/common/BitMatrix;


# direct methods
.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .registers 2
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .line 53
    invoke-direct {p0, p1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    .line 54
    return-void
.end method

.method private static calculateBlackPoints([BIIII)[[I
    .registers 22
    .param p0, "luminances"    # [B
    .param p1, "subWidth"    # I
    .param p2, "subHeight"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    move/from16 v0, p1

    move/from16 v1, p2

    .line 166
    filled-new-array {v1, v0}, [I

    move-result-object v2

    const-class v3, I

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    .line 167
    .local v2, "blackPoints":[[I
    const/4 v3, 0x0

    .local v3, "y":I
    :goto_11
    if-lt v3, v1, :cond_14

    .line 234
    .end local v3    # "y":I
    return-object v2

    .line 168
    .restart local v3    # "y":I
    :cond_14
    shl-int/lit8 v4, v3, 0x3

    .line 169
    .local v4, "yoffset":I
    add-int/lit8 v5, p4, -0x8

    .line 170
    .local v5, "maxYOffset":I
    if-le v4, v5, :cond_1b

    .line 171
    move v4, v5

    .line 173
    :cond_1b
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_1c
    if-lt v6, v0, :cond_21

    .line 167
    .end local v4    # "yoffset":I
    .end local v5    # "maxYOffset":I
    .end local v6    # "x":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 174
    .restart local v4    # "yoffset":I
    .restart local v5    # "maxYOffset":I
    .restart local v6    # "x":I
    :cond_21
    shl-int/lit8 v7, v6, 0x3

    .line 175
    .local v7, "xoffset":I
    add-int/lit8 v8, p3, -0x8

    .line 176
    .local v8, "maxXOffset":I
    if-le v7, v8, :cond_28

    .line 177
    move v7, v8

    .line 179
    :cond_28
    const/4 v9, 0x0

    .line 180
    .local v9, "sum":I
    const/16 v10, 0xff

    .line 181
    .local v10, "min":I
    const/4 v11, 0x0

    .line 182
    .local v11, "max":I
    const/4 v12, 0x0

    .local v12, "yy":I
    mul-int v13, v4, p3

    add-int/2addr v13, v7

    .local v13, "offset":I
    :goto_30
    const/16 v0, 0x8

    if-lt v12, v0, :cond_6c

    .line 206
    .end local v12    # "yy":I
    .end local v13    # "offset":I
    shr-int/lit8 v0, v9, 0x6

    .line 207
    .local v0, "average":I
    sub-int v12, v11, v10

    move v15, v0

    const/16 v0, 0x18

    if-gt v12, v0, :cond_62

    .line 214
    .end local v0    # "average":I
    .local v15, "average":I
    div-int/lit8 v0, v10, 0x2

    .line 216
    .end local v15    # "average":I
    .restart local v0    # "average":I
    if-lez v3, :cond_63

    if-lez v6, :cond_63

    .line 225
    add-int/lit8 v12, v3, -0x1

    aget-object v12, v2, v12

    aget v12, v12, v6

    aget-object v13, v2, v3

    add-int/lit8 v14, v6, -0x1

    aget v13, v13, v14

    const/4 v14, 0x2

    mul-int/2addr v14, v13

    add-int/2addr v12, v14

    add-int/lit8 v13, v3, -0x1

    aget-object v13, v2, v13

    add-int/lit8 v14, v6, -0x1

    aget v13, v13, v14

    add-int/2addr v12, v13

    div-int/lit8 v12, v12, 0x4

    .line 224
    nop

    .line 226
    .local v12, "averageNeighborBlackPoint":I
    if-ge v10, v12, :cond_63

    .line 227
    move v0, v12

    .end local v12    # "averageNeighborBlackPoint":I
    goto :goto_63

    .line 231
    .end local v0    # "average":I
    .restart local v15    # "average":I
    :cond_62
    move v0, v15

    .end local v15    # "average":I
    .restart local v0    # "average":I
    :cond_63
    :goto_63
    aget-object v12, v2, v3

    aput v0, v12, v6

    .line 173
    .end local v0    # "average":I
    .end local v7    # "xoffset":I
    .end local v8    # "maxXOffset":I
    .end local v9    # "sum":I
    .end local v10    # "min":I
    .end local v11    # "max":I
    add-int/lit8 v6, v6, 0x1

    move/from16 v0, p1

    goto :goto_1c

    .line 183
    .restart local v7    # "xoffset":I
    .restart local v8    # "maxXOffset":I
    .restart local v9    # "sum":I
    .restart local v10    # "min":I
    .restart local v11    # "max":I
    .local v12, "yy":I
    .restart local v13    # "offset":I
    :cond_6c
    const/4 v15, 0x0

    .local v15, "xx":I
    move/from16 v16, v15

    move v15, v9

    move/from16 v9, v16

    .local v9, "xx":I
    .local v15, "sum":I
    :goto_72
    if-lt v9, v0, :cond_a8

    .line 195
    .end local v9    # "xx":I
    sub-int v9, v11, v10

    const/16 v0, 0x18

    if-le v9, v0, :cond_9d

    .line 197
    add-int/lit8 v12, v12, 0x1

    add-int v13, v13, p3

    move v0, v12

    move v9, v13

    .end local v12    # "yy":I
    .end local v13    # "offset":I
    .local v0, "yy":I
    .local v9, "offset":I
    :goto_80
    const/16 v12, 0x8

    if-lt v0, v12, :cond_86

    .line 182
    move v12, v0

    goto :goto_9e

    .line 198
    :cond_86
    const/4 v13, 0x0

    .local v13, "xx":I
    move v1, v13

    .end local v13    # "xx":I
    .local v1, "xx":I
    :goto_88
    if-lt v1, v12, :cond_91

    .line 197
    .end local v1    # "xx":I
    add-int/lit8 v0, v0, 0x1

    add-int v9, v9, p3

    move/from16 v1, p2

    goto :goto_80

    .line 199
    .restart local v1    # "xx":I
    :cond_91
    add-int v13, v9, v1

    aget-byte v12, p0, v13

    and-int/lit16 v12, v12, 0xff

    add-int/2addr v15, v12

    .line 198
    add-int/lit8 v1, v1, 0x1

    const/16 v12, 0x8

    goto :goto_88

    .line 182
    .end local v0    # "yy":I
    .end local v1    # "xx":I
    .end local v9    # "offset":I
    .restart local v12    # "yy":I
    .local v13, "offset":I
    :cond_9d
    move v9, v13

    .end local v13    # "offset":I
    .restart local v9    # "offset":I
    :goto_9e
    add-int/lit8 v12, v12, 0x1

    add-int v13, v9, p3

    .end local v9    # "offset":I
    .restart local v13    # "offset":I
    move v9, v15

    move/from16 v0, p1

    move/from16 v1, p2

    goto :goto_30

    .line 184
    .local v9, "xx":I
    :cond_a8
    move v1, v0

    const/16 v0, 0x18

    add-int v14, v13, v9

    aget-byte v0, p0, v14

    and-int/lit16 v0, v0, 0xff

    .line 185
    .local v0, "pixel":I
    add-int/2addr v15, v0

    .line 187
    if-ge v0, v10, :cond_b5

    .line 188
    move v10, v0

    .line 190
    :cond_b5
    if-le v0, v11, :cond_b8

    .line 191
    move v11, v0

    .line 183
    .end local v0    # "pixel":I
    :cond_b8
    add-int/lit8 v9, v9, 0x1

    move v0, v1

    move/from16 v1, p2

    goto :goto_72
.end method

.method private static calculateThresholdForBlock([BIIII[[ILcom/google/zxing/common/BitMatrix;)V
    .registers 25
    .param p0, "luminances"    # [B
    .param p1, "subWidth"    # I
    .param p2, "subHeight"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "blackPoints"    # [[I
    .param p6, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    move/from16 v0, p1

    move/from16 v1, p2

    .line 108
    const/4 v2, 0x0

    .local v2, "y":I
    :goto_5
    if-lt v2, v1, :cond_8

    .line 131
    .end local v2    # "y":I
    return-void

    .line 109
    .restart local v2    # "y":I
    :cond_8
    shl-int/lit8 v3, v2, 0x3

    .line 110
    .local v3, "yoffset":I
    add-int/lit8 v4, p4, -0x8

    .line 111
    .local v4, "maxYOffset":I
    if-le v3, v4, :cond_f

    .line 112
    move v3, v4

    .line 114
    :cond_f
    const/4 v5, 0x0

    .local v5, "x":I
    move v11, v5

    .end local v5    # "x":I
    .local v11, "x":I
    :goto_11
    if-lt v11, v0, :cond_16

    .line 108
    .end local v3    # "yoffset":I
    .end local v4    # "maxYOffset":I
    .end local v11    # "x":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 115
    .restart local v3    # "yoffset":I
    .restart local v4    # "maxYOffset":I
    .restart local v11    # "x":I
    :cond_16
    shl-int/lit8 v5, v11, 0x3

    .line 116
    .local v5, "xoffset":I
    add-int/lit8 v12, p3, -0x8

    .line 117
    .local v12, "maxXOffset":I
    if-le v5, v12, :cond_1d

    .line 118
    move v5, v12

    .line 120
    .end local v5    # "xoffset":I
    .local v13, "xoffset":I
    :cond_1d
    move v13, v5

    add-int/lit8 v5, v0, -0x3

    const/4 v6, 0x2

    invoke-static {v11, v6, v5}, Lcom/google/zxing/common/HybridBinarizer;->cap(III)I

    move-result v14

    .line 121
    .local v14, "left":I
    add-int/lit8 v5, v1, -0x3

    invoke-static {v2, v6, v5}, Lcom/google/zxing/common/HybridBinarizer;->cap(III)I

    move-result v15

    .line 122
    .local v15, "top":I
    const/4 v5, 0x0

    .line 123
    .local v5, "sum":I
    const/4 v7, -0x2

    .local v7, "z":I
    move/from16 v16, v5

    .end local v5    # "sum":I
    .local v16, "sum":I
    :goto_2f
    if-le v7, v6, :cond_43

    .line 127
    .end local v7    # "z":I
    div-int/lit8 v17, v16, 0x19

    .line 128
    .local v17, "average":I
    move-object/from16 v5, p0

    move v6, v13

    move v7, v3

    move/from16 v8, v17

    move/from16 v9, p3

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/common/HybridBinarizer;->thresholdBlock([BIIIILcom/google/zxing/common/BitMatrix;)V

    .line 114
    .end local v12    # "maxXOffset":I
    .end local v13    # "xoffset":I
    .end local v14    # "left":I
    .end local v15    # "top":I
    .end local v16    # "sum":I
    .end local v17    # "average":I
    add-int/lit8 v11, v11, 0x1

    goto :goto_11

    .line 124
    .restart local v7    # "z":I
    .restart local v12    # "maxXOffset":I
    .restart local v13    # "xoffset":I
    .restart local v14    # "left":I
    .restart local v15    # "top":I
    .restart local v16    # "sum":I
    :cond_43
    add-int v5, v15, v7

    aget-object v5, p5, v5

    .line 125
    .local v5, "blackRow":[I
    add-int/lit8 v9, v14, -0x2

    aget v9, v5, v9

    add-int/lit8 v10, v14, -0x1

    aget v10, v5, v10

    add-int/2addr v9, v10

    aget v10, v5, v14

    add-int/2addr v9, v10

    add-int/lit8 v10, v14, 0x1

    aget v10, v5, v10

    add-int/2addr v9, v10

    add-int/lit8 v10, v14, 0x2

    aget v10, v5, v10

    add-int/2addr v9, v10

    add-int v16, v16, v9

    .line 123
    .end local v5    # "blackRow":[I
    add-int/lit8 v7, v7, 0x1

    goto :goto_2f
.end method

.method private static cap(III)I
    .registers 4
    .param p0, "value"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .line 134
    if-ge p0, p1, :cond_4

    move v0, p1

    goto :goto_9

    :cond_4
    if-le p0, p2, :cond_8

    move v0, p2

    goto :goto_9

    :cond_8
    move v0, p0

    :goto_9
    return v0
.end method

.method private static thresholdBlock([BIIIILcom/google/zxing/common/BitMatrix;)V
    .registers 12
    .param p0, "luminances"    # [B
    .param p1, "xoffset"    # I
    .param p2, "yoffset"    # I
    .param p3, "threshold"    # I
    .param p4, "stride"    # I
    .param p5, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    .line 146
    const/4 v0, 0x0

    .local v0, "y":I
    mul-int v1, p2, p4

    add-int/2addr v1, p1

    .local v1, "offset":I
    :goto_4
    const/16 v2, 0x8

    if-lt v0, v2, :cond_9

    .line 154
    .end local v0    # "y":I
    .end local v1    # "offset":I
    return-void

    .line 147
    .restart local v0    # "y":I
    .restart local v1    # "offset":I
    :cond_9
    const/4 v3, 0x0

    .local v3, "x":I
    :goto_a
    if-lt v3, v2, :cond_10

    .line 146
    .end local v3    # "x":I
    add-int/lit8 v0, v0, 0x1

    add-int/2addr v1, p4

    goto :goto_4

    .line 149
    .restart local v3    # "x":I
    :cond_10
    add-int v4, v1, v3

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    if-gt v4, p3, :cond_1f

    .line 150
    add-int v4, p1, v3

    add-int v5, p2, v0

    invoke-virtual {p5, v4, v5}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 147
    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_a
.end method


# virtual methods
.method public createBinarizer(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    .registers 3
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .line 93
    new-instance v0, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getBlackMatrix()Lcom/google/zxing/common/BitMatrix;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    if-eqz v0, :cond_7

    .line 64
    iget-object v0, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    return-object v0

    .line 66
    :cond_7
    invoke-virtual {p0}, Lcom/google/zxing/common/HybridBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    .line 67
    .local v0, "source":Lcom/google/zxing/LuminanceSource;
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v8

    .line 68
    .local v8, "width":I
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v9

    .line 69
    .local v9, "height":I
    const/16 v1, 0x28

    if-lt v8, v1, :cond_46

    if-lt v9, v1, :cond_46

    .line 70
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v10

    .line 71
    .local v10, "luminances":[B
    shr-int/lit8 v1, v8, 0x3

    .line 72
    .local v1, "subWidth":I
    and-int/lit8 v2, v8, 0x7

    if-eqz v2, :cond_25

    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 75
    .end local v1    # "subWidth":I
    .local v11, "subWidth":I
    :cond_25
    move v11, v1

    shr-int/lit8 v1, v9, 0x3

    .line 76
    .local v1, "subHeight":I
    and-int/lit8 v2, v9, 0x7

    if-eqz v2, :cond_2e

    .line 77
    add-int/lit8 v1, v1, 0x1

    .line 79
    .end local v1    # "subHeight":I
    .local v12, "subHeight":I
    :cond_2e
    move v12, v1

    invoke-static {v10, v11, v12, v8, v9}, Lcom/google/zxing/common/HybridBinarizer;->calculateBlackPoints([BIIII)[[I

    move-result-object v13

    .line 81
    .local v13, "blackPoints":[[I
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v8, v9}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    move-object v14, v1

    .line 82
    .local v14, "newMatrix":Lcom/google/zxing/common/BitMatrix;
    move-object v1, v10

    move v2, v11

    move v3, v12

    move v4, v8

    move v5, v9

    move-object v6, v13

    move-object v7, v14

    invoke-static/range {v1 .. v7}, Lcom/google/zxing/common/HybridBinarizer;->calculateThresholdForBlock([BIIII[[ILcom/google/zxing/common/BitMatrix;)V

    .line 83
    iput-object v14, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    .line 84
    .end local v10    # "luminances":[B
    .end local v11    # "subWidth":I
    .end local v12    # "subHeight":I
    .end local v13    # "blackPoints":[[I
    .end local v14    # "newMatrix":Lcom/google/zxing/common/BitMatrix;
    goto :goto_4c

    .line 86
    :cond_46
    invoke-super {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    .line 88
    :goto_4c
    iget-object v1, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    return-object v1
.end method
