.class public final Lcom/google/zxing/aztec/encoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field public static final DEFAULT_AZTEC_LAYERS:I = 0x0

.field public static final DEFAULT_EC_PERCENT:I = 0x21

.field private static final MAX_NB_BITS:I = 0x20

.field private static final MAX_NB_BITS_COMPACT:I = 0x4

.field private static final WORD_SIZE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const/16 v0, 0x21

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 37
    nop

    .line 38
    nop

    .line 36
    sput-object v0, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    .line 39
    return-void

    :array_0
    .array-data 4
        0x4
        0x6
        0x6
        0x8
        0x8
        0x8
        0x8
        0x8
        0x8
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method private static bitsToWords(Lcom/google/zxing/common/BitArray;II)[I
    .locals 7
    .param p0, "stuffedBits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "wordSize"    # I
    .param p2, "totalWords"    # I

    .line 288
    new-array v0, p2, [I

    .line 291
    .local v0, "message":[I
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    div-int/2addr v2, p1

    .local v2, "n":I
    :goto_0
    if-lt v1, v2, :cond_0

    .line 298
    return-object v0

    .line 292
    :cond_0
    const/4 v3, 0x0

    .line 293
    .local v3, "value":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    if-lt v4, p1, :cond_1

    .line 296
    .end local v4    # "j":I
    aput v3, v0, v1

    .line 291
    .end local v3    # "value":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 294
    .restart local v3    # "value":I
    .restart local v4    # "j":I
    :cond_1
    mul-int v5, v1, p1

    add-int/2addr v5, v4

    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_2

    sub-int v5, p1, v4

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    shl-int v5, v6, v5

    goto :goto_2

    :cond_2
    const/4 v5, 0x0

    :goto_2
    or-int/2addr v3, v5

    .line 293
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private static drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V
    .locals 3
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "center"    # I
    .param p2, "size"    # I

    .line 204
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 212
    .end local v0    # "i":I
    sub-int v0, p1, p2

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 213
    sub-int v0, p1, p2

    add-int/lit8 v0, v0, 0x1

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 214
    sub-int v0, p1, p2

    sub-int v1, p1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 215
    add-int v0, p1, p2

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 216
    add-int v0, p1, p2

    sub-int v1, p1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 217
    add-int v0, p1, p2

    add-int v1, p1, p2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 218
    return-void

    .line 205
    .restart local v0    # "i":I
    :cond_0
    sub-int v1, p1, v0

    .local v1, "j":I
    :goto_1
    add-int v2, p1, v0

    if-le v1, v2, :cond_1

    .line 204
    .end local v1    # "j":I
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 206
    .restart local v1    # "j":I
    :cond_1
    sub-int v2, p1, v0

    invoke-virtual {p0, v1, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 207
    add-int v2, p1, v0

    invoke-virtual {p0, v1, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 208
    sub-int v2, p1, v0

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 209
    add-int v2, p1, v0

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static drawModeMessage(Lcom/google/zxing/common/BitMatrix;ZILcom/google/zxing/common/BitArray;)V
    .locals 4
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "compact"    # Z
    .param p2, "matrixSize"    # I
    .param p3, "modeMessage"    # Lcom/google/zxing/common/BitArray;

    .line 235
    div-int/lit8 v0, p2, 0x2

    .line 236
    .local v0, "center":I
    if-eqz p1, :cond_5

    .line 237
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x7

    if-lt v1, v2, :cond_0

    .line 252
    .end local v1    # "i":I
    goto :goto_2

    .line 238
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v2, v0, -0x3

    add-int/2addr v2, v1

    .line 239
    .local v2, "offset":I
    invoke-virtual {p3, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 240
    add-int/lit8 v3, v0, -0x5

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 242
    :cond_1
    add-int/lit8 v3, v1, 0x7

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 243
    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 245
    :cond_2
    rsub-int/lit8 v3, v1, 0x14

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 246
    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 248
    :cond_3
    rsub-int/lit8 v3, v1, 0x1b

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 249
    add-int/lit8 v3, v0, -0x5

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 237
    .end local v2    # "offset":I
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 253
    .end local v1    # "i":I
    :cond_5
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    const/16 v2, 0xa

    if-lt v1, v2, :cond_6

    .line 269
    .end local v1    # "i":I
    :goto_2
    return-void

    .line 254
    .restart local v1    # "i":I
    :cond_6
    add-int/lit8 v2, v0, -0x5

    add-int/2addr v2, v1

    div-int/lit8 v3, v1, 0x5

    add-int/2addr v2, v3

    .line 255
    .restart local v2    # "offset":I
    invoke-virtual {p3, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 256
    add-int/lit8 v3, v0, -0x7

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 258
    :cond_7
    add-int/lit8 v3, v1, 0xa

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 259
    add-int/lit8 v3, v0, 0x7

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 261
    :cond_8
    rsub-int/lit8 v3, v1, 0x1d

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 262
    add-int/lit8 v3, v0, 0x7

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 264
    :cond_9
    rsub-int/lit8 v3, v1, 0x27

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 265
    add-int/lit8 v3, v0, -0x7

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 253
    .end local v2    # "offset":I
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static encode([B)Lcom/google/zxing/aztec/encoder/AztecCode;
    .locals 2
    .param p0, "data"    # [B

    .line 51
    const/16 v0, 0x21

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->encode([BII)Lcom/google/zxing/aztec/encoder/AztecCode;

    move-result-object v0

    return-object v0
.end method

.method public static encode([BII)Lcom/google/zxing/aztec/encoder/AztecCode;
    .locals 28
    .param p0, "data"    # [B
    .param p1, "minECCPercent"    # I
    .param p2, "userSpecifiedLayers"    # I

    .line 65
    new-instance v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;

    move-object/from16 v2, p0

    invoke-direct {v1, v2}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;-><init>([B)V

    invoke-virtual {v1}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->encode()Lcom/google/zxing/common/BitArray;

    move-result-object v1

    .line 68
    .local v1, "bits":Lcom/google/zxing/common/BitArray;
    invoke-virtual {v1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    mul-int v3, v3, p1

    div-int/lit8 v3, v3, 0x64

    const/16 v5, 0xb

    add-int/2addr v3, v5

    .line 69
    .local v3, "eccBits":I
    invoke-virtual {v1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    add-int/2addr v6, v3

    .line 75
    .local v6, "totalSizeBits":I
    const/16 v7, 0x20

    const/4 v8, 0x0

    const/4 v10, 0x1

    if-eqz p2, :cond_6

    .line 76
    if-gez p2, :cond_0

    move v11, v10

    goto :goto_0

    :cond_0
    move v11, v8

    .line 77
    .local v11, "compact":Z
    :goto_0
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v12

    .line 78
    .local v12, "layers":I
    if-eqz v11, :cond_1

    const/4 v7, 0x4

    nop

    :cond_1
    if-gt v12, v7, :cond_5

    .line 82
    invoke-static {v12, v11}, Lcom/google/zxing/aztec/encoder/Encoder;->totalBitsInLayer(IZ)I

    move-result v7

    .line 83
    .local v7, "totalBitsInLayer":I
    sget-object v8, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v8, v8, v12

    .line 84
    .local v8, "wordSize":I
    rem-int v13, v7, v8

    sub-int v13, v7, v13

    .line 85
    .local v13, "usableBitsInLayers":I
    invoke-static {v1, v8}, Lcom/google/zxing/aztec/encoder/Encoder;->stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;

    move-result-object v14

    .line 86
    .local v14, "stuffedBits":Lcom/google/zxing/common/BitArray;
    invoke-virtual {v14}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v15

    add-int/2addr v15, v3

    if-gt v15, v13, :cond_4

    .line 89
    if-eqz v11, :cond_3

    invoke-virtual {v14}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v15

    mul-int/lit8 v9, v8, 0x40

    if-gt v15, v9, :cond_2

    .end local v13    # "usableBitsInLayers":I
    goto :goto_1

    .line 91
    .restart local v13    # "usableBitsInLayers":I
    :cond_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v9, "Data to large for user specified layer"

    invoke-direct {v5, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 99
    .end local v13    # "usableBitsInLayers":I
    :cond_3
    :goto_1
    move v15, v7

    move-object v7, v14

    goto/16 :goto_6

    .line 87
    .restart local v13    # "usableBitsInLayers":I
    :cond_4
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v9, "Data to large for user specified layer"

    invoke-direct {v5, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 79
    .end local v7    # "totalBitsInLayer":I
    .end local v8    # "wordSize":I
    .end local v13    # "usableBitsInLayers":I
    .end local v14    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    :cond_5
    new-instance v5, Ljava/lang/IllegalArgumentException;

    .line 80
    new-array v7, v10, [Ljava/lang/Object;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const-string v8, "Illegal value %s for layers"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 79
    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 94
    .end local v11    # "compact":Z
    .end local v12    # "layers":I
    :cond_6
    const/4 v9, 0x0

    .line 95
    .local v9, "wordSize":I
    const/4 v11, 0x0

    .line 99
    .local v11, "stuffedBits":Lcom/google/zxing/common/BitArray;
    move v12, v9

    move v9, v8

    .line 100
    .local v9, "i":I
    .local v12, "wordSize":I
    :goto_2
    if-gt v9, v7, :cond_1c

    .line 103
    const/4 v13, 0x3

    if-gt v9, v13, :cond_7

    move v13, v10

    goto :goto_3

    :cond_7
    move v13, v8

    .line 104
    .local v13, "compact":Z
    :goto_3
    if-eqz v13, :cond_8

    add-int/lit8 v14, v9, 0x1

    goto :goto_4

    :cond_8
    move v14, v9

    .line 105
    .local v14, "layers":I
    :goto_4
    invoke-static {v14, v13}, Lcom/google/zxing/aztec/encoder/Encoder;->totalBitsInLayer(IZ)I

    move-result v15

    .line 106
    .local v15, "totalBitsInLayer":I
    if-le v6, v15, :cond_9

    .line 107
    nop

    .line 99
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    move v6, v10

    .end local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v3    # "eccBits":I
    .end local v6    # "totalSizeBits":I
    .local v22, "bits":Lcom/google/zxing/common/BitArray;
    .local v23, "eccBits":I
    .local v26, "totalSizeBits":I
    :goto_5
    const/16 v16, 0x4

    goto/16 :goto_14

    .line 111
    .end local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v23    # "eccBits":I
    .end local v26    # "totalSizeBits":I
    .restart local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v3    # "eccBits":I
    .restart local v6    # "totalSizeBits":I
    :cond_9
    sget-object v17, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v7, v17, v14

    if-eq v12, v7, :cond_a

    .line 112
    sget-object v7, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v7, v7, v14

    .line 113
    .end local v12    # "wordSize":I
    .local v7, "wordSize":I
    invoke-static {v1, v7}, Lcom/google/zxing/aztec/encoder/Encoder;->stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;

    move-result-object v11

    .line 115
    move v12, v7

    .end local v7    # "wordSize":I
    .restart local v12    # "wordSize":I
    :cond_a
    rem-int v7, v15, v12

    sub-int v7, v15, v7

    .line 116
    .local v7, "usableBitsInLayers":I
    if-eqz v13, :cond_b

    invoke-virtual {v11}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    mul-int/lit8 v10, v12, 0x40

    if-le v8, v10, :cond_b

    .line 118
    nop

    .line 99
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    const/4 v6, 0x1

    goto :goto_5

    .line 120
    :cond_b
    invoke-virtual {v11}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    add-int/2addr v8, v3

    if-gt v8, v7, :cond_1b

    .line 121
    nop

    .line 99
    move-object v7, v11

    move v8, v12

    move v11, v13

    move v12, v14

    .end local v9    # "i":I
    .end local v13    # "compact":Z
    .end local v14    # "layers":I
    .local v7, "stuffedBits":Lcom/google/zxing/common/BitArray;
    .restart local v8    # "wordSize":I
    .local v11, "compact":Z
    .local v12, "layers":I
    :goto_6
    move v10, v11

    .end local v11    # "compact":Z
    .local v10, "compact":Z
    move v9, v12

    .end local v12    # "layers":I
    .local v9, "layers":I
    move v11, v15

    .line 125
    .end local v15    # "totalBitsInLayer":I
    .local v11, "totalBitsInLayer":I
    invoke-static {v7, v11, v8}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v12

    .line 128
    .local v12, "messageBits":Lcom/google/zxing/common/BitArray;
    invoke-virtual {v7}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v13

    div-int/2addr v13, v8

    .line 129
    .local v13, "messageSizeInWords":I
    invoke-static {v10, v9, v13}, Lcom/google/zxing/aztec/encoder/Encoder;->generateModeMessage(ZII)Lcom/google/zxing/common/BitArray;

    move-result-object v14

    .line 132
    .local v14, "modeMessage":Lcom/google/zxing/common/BitArray;
    if-eqz v10, :cond_c

    :goto_7
    mul-int/lit8 v15, v9, 0x4

    add-int/2addr v5, v15

    goto :goto_8

    :cond_c
    const/16 v5, 0xe

    goto :goto_7

    .line 133
    .local v5, "baseMatrixSize":I
    :goto_8
    new-array v15, v5, [I

    .line 135
    .local v15, "alignmentMap":[I
    if-eqz v10, :cond_e

    .line 137
    move/from16 v17, v5

    .line 138
    .local v17, "matrixSize":I
    const/16 v18, 0x0

    .local v18, "i":I
    move/from16 v0, v18

    .end local v18    # "i":I
    .local v0, "i":I
    :goto_9
    move-object/from16 v22, v1

    array-length v1, v15

    .end local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v22    # "bits":Lcom/google/zxing/common/BitArray;
    if-lt v0, v1, :cond_d

    .line 141
    .end local v0    # "i":I
    goto :goto_b

    .line 139
    .restart local v0    # "i":I
    :cond_d
    aput v0, v15, v0

    .line 138
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v1, v22

    goto :goto_9

    .line 142
    .end local v0    # "i":I
    .end local v17    # "matrixSize":I
    .end local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v1    # "bits":Lcom/google/zxing/common/BitArray;
    :cond_e
    move-object/from16 v22, v1

    .end local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v22    # "bits":Lcom/google/zxing/common/BitArray;
    add-int/lit8 v0, v5, 0x1

    div-int/lit8 v1, v5, 0x2

    const/16 v17, 0x1

    add-int/lit8 v1, v1, -0x1

    div-int/lit8 v1, v1, 0xf

    const/16 v17, 0x2

    mul-int v1, v1, v17

    add-int v17, v0, v1

    .line 143
    .restart local v17    # "matrixSize":I
    div-int/lit8 v0, v5, 0x2

    .line 144
    .local v0, "origCenter":I
    div-int/lit8 v1, v17, 0x2

    .line 145
    .local v1, "center":I
    const/16 v18, 0x0

    .restart local v18    # "i":I
    move/from16 v2, v18

    .end local v18    # "i":I
    .local v2, "i":I
    :goto_a
    if-lt v2, v0, :cond_1a

    .line 151
    .end local v1    # "center":I
    .end local v2    # "i":I
    .end local v17    # "matrixSize":I
    .local v0, "matrixSize":I
    :goto_b
    move/from16 v0, v17

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 154
    .local v1, "matrix":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    const/16 v17, 0x0

    .local v17, "rowOffset":I
    move/from16 v18, v17

    .end local v17    # "rowOffset":I
    .local v18, "rowOffset":I
    :goto_c
    if-lt v2, v9, :cond_12

    .line 177
    .end local v2    # "i":I
    .end local v18    # "rowOffset":I
    invoke-static {v1, v10, v0, v14}, Lcom/google/zxing/aztec/encoder/Encoder;->drawModeMessage(Lcom/google/zxing/common/BitMatrix;ZILcom/google/zxing/common/BitArray;)V

    .line 180
    if-eqz v10, :cond_f

    .line 181
    div-int/lit8 v2, v0, 0x2

    move/from16 v23, v3

    const/4 v3, 0x5

    .end local v3    # "eccBits":I
    .restart local v23    # "eccBits":I
    invoke-static {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/Encoder;->drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V

    .line 182
    goto :goto_e

    .line 183
    .end local v23    # "eccBits":I
    .restart local v3    # "eccBits":I
    :cond_f
    move/from16 v23, v3

    .end local v3    # "eccBits":I
    .restart local v23    # "eccBits":I
    div-int/lit8 v2, v0, 0x2

    const/4 v3, 0x7

    invoke-static {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/Encoder;->drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V

    .line 184
    const/4 v2, 0x0

    .restart local v2    # "i":I
    const/4 v3, 0x0

    .local v3, "j":I
    move/from16 v17, v3

    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    .local v17, "j":I
    :goto_d
    div-int/lit8 v2, v5, 0x2

    const/16 v16, 0x1

    add-int/lit8 v2, v2, -0x1

    if-lt v3, v2, :cond_10

    .line 194
    .end local v3    # "i":I
    .end local v17    # "j":I
    :goto_e
    new-instance v2, Lcom/google/zxing/aztec/encoder/AztecCode;

    invoke-direct {v2}, Lcom/google/zxing/aztec/encoder/AztecCode;-><init>()V

    .line 195
    .local v2, "aztec":Lcom/google/zxing/aztec/encoder/AztecCode;
    invoke-virtual {v2, v10}, Lcom/google/zxing/aztec/encoder/AztecCode;->setCompact(Z)V

    .line 196
    invoke-virtual {v2, v0}, Lcom/google/zxing/aztec/encoder/AztecCode;->setSize(I)V

    .line 197
    invoke-virtual {v2, v9}, Lcom/google/zxing/aztec/encoder/AztecCode;->setLayers(I)V

    .line 198
    invoke-virtual {v2, v13}, Lcom/google/zxing/aztec/encoder/AztecCode;->setCodeWords(I)V

    .line 199
    invoke-virtual {v2, v1}, Lcom/google/zxing/aztec/encoder/AztecCode;->setMatrix(Lcom/google/zxing/common/BitMatrix;)V

    .line 200
    return-object v2

    .line 185
    .end local v2    # "aztec":Lcom/google/zxing/aztec/encoder/AztecCode;
    .restart local v3    # "i":I
    .restart local v17    # "j":I
    :cond_10
    div-int/lit8 v2, v0, 0x2

    const/16 v16, 0x1

    and-int/lit8 v2, v2, 0x1

    .local v2, "k":I
    :goto_f
    if-lt v2, v0, :cond_11

    .line 184
    .end local v2    # "k":I
    add-int/lit8 v3, v3, 0xf

    add-int/lit8 v17, v17, 0x10

    goto :goto_d

    .line 186
    .restart local v2    # "k":I
    :cond_11
    div-int/lit8 v16, v0, 0x2

    move/from16 v24, v3

    sub-int v3, v16, v17

    .end local v3    # "i":I
    .local v24, "i":I
    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 187
    div-int/lit8 v3, v0, 0x2

    add-int v3, v3, v17

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 188
    div-int/lit8 v3, v0, 0x2

    sub-int v3, v3, v17

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 189
    div-int/lit8 v3, v0, 0x2

    add-int v3, v3, v17

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 185
    add-int/lit8 v2, v2, 0x2

    move/from16 v3, v24

    goto :goto_f

    .line 155
    .end local v17    # "j":I
    .end local v23    # "eccBits":I
    .end local v24    # "i":I
    .local v2, "i":I
    .local v3, "eccBits":I
    .restart local v18    # "rowOffset":I
    :cond_12
    move/from16 v23, v3

    .end local v3    # "eccBits":I
    .restart local v23    # "eccBits":I
    if-eqz v10, :cond_13

    sub-int v3, v9, v2

    const/16 v16, 0x4

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x9

    goto :goto_10

    :cond_13
    const/16 v16, 0x4

    sub-int v3, v9, v2

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0xc

    .line 156
    .local v3, "rowSize":I
    :goto_10
    const/16 v17, 0x0

    .restart local v17    # "j":I
    move/from16 v4, v17

    .end local v17    # "j":I
    .local v4, "j":I
    :goto_11
    if-lt v4, v3, :cond_14

    .line 173
    .end local v4    # "j":I
    mul-int/lit8 v4, v3, 0x8

    add-int v18, v18, v4

    .line 154
    .end local v3    # "rowSize":I
    add-int/lit8 v2, v2, 0x1

    move/from16 v3, v23

    goto/16 :goto_c

    .line 157
    .restart local v3    # "rowSize":I
    .restart local v4    # "j":I
    :cond_14
    mul-int/lit8 v19, v4, 0x2

    .line 158
    .local v19, "columnOffset":I
    const/16 v17, 0x0

    .local v17, "k":I
    move/from16 v25, v0

    move/from16 v0, v17

    .end local v17    # "k":I
    .local v0, "k":I
    .local v25, "matrixSize":I
    :goto_12
    move/from16 v26, v6

    const/4 v6, 0x2

    if-lt v0, v6, :cond_15

    .line 156
    .end local v0    # "k":I
    .end local v6    # "totalSizeBits":I
    .end local v19    # "columnOffset":I
    .restart local v26    # "totalSizeBits":I
    add-int/lit8 v4, v4, 0x1

    move/from16 v0, v25

    move/from16 v6, v26

    goto :goto_11

    .line 159
    .restart local v0    # "k":I
    .restart local v19    # "columnOffset":I
    :cond_15
    add-int v17, v18, v19

    add-int v6, v17, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 160
    mul-int/lit8 v6, v2, 0x2

    add-int/2addr v6, v0

    aget v6, v15, v6

    mul-int/lit8 v17, v2, 0x2

    add-int v17, v17, v4

    move-object/from16 v27, v7

    aget v7, v15, v17

    .end local v7    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .local v27, "stuffedBits":Lcom/google/zxing/common/BitArray;
    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    goto :goto_13

    .line 162
    .end local v27    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .restart local v7    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    :cond_16
    move-object/from16 v27, v7

    .end local v7    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .restart local v27    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    :goto_13
    mul-int/lit8 v6, v3, 0x2

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 163
    mul-int/lit8 v6, v2, 0x2

    add-int/2addr v6, v4

    aget v6, v15, v6

    add-int/lit8 v7, v5, -0x1

    mul-int/lit8 v17, v2, 0x2

    sub-int v7, v7, v17

    sub-int/2addr v7, v0

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 165
    :cond_17
    mul-int/lit8 v6, v3, 0x4

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_18

    .line 166
    add-int/lit8 v6, v5, -0x1

    mul-int/lit8 v7, v2, 0x2

    sub-int/2addr v6, v7

    sub-int/2addr v6, v0

    aget v6, v15, v6

    add-int/lit8 v7, v5, -0x1

    mul-int/lit8 v17, v2, 0x2

    sub-int v7, v7, v17

    sub-int/2addr v7, v4

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 168
    :cond_18
    mul-int/lit8 v6, v3, 0x6

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 169
    add-int/lit8 v6, v5, -0x1

    mul-int/lit8 v7, v2, 0x2

    sub-int/2addr v6, v7

    sub-int/2addr v6, v4

    aget v6, v15, v6

    mul-int/lit8 v7, v2, 0x2

    add-int/2addr v7, v0

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 158
    :cond_19
    add-int/lit8 v0, v0, 0x1

    move/from16 v6, v26

    move-object/from16 v7, v27

    goto/16 :goto_12

    .line 146
    .end local v4    # "j":I
    .end local v18    # "rowOffset":I
    .end local v19    # "columnOffset":I
    .end local v23    # "eccBits":I
    .end local v25    # "matrixSize":I
    .end local v26    # "totalSizeBits":I
    .end local v27    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .local v0, "origCenter":I
    .local v1, "center":I
    .local v3, "eccBits":I
    .restart local v6    # "totalSizeBits":I
    .restart local v7    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .local v17, "matrixSize":I
    :cond_1a
    move/from16 v23, v3

    move/from16 v26, v6

    move-object/from16 v27, v7

    const/16 v16, 0x4

    .end local v3    # "eccBits":I
    .end local v6    # "totalSizeBits":I
    .end local v7    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .restart local v23    # "eccBits":I
    .restart local v26    # "totalSizeBits":I
    .restart local v27    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    div-int/lit8 v3, v2, 0xf

    add-int/2addr v3, v2

    .line 147
    .local v3, "newOffset":I
    sub-int v4, v0, v2

    const/4 v6, 0x1

    sub-int/2addr v4, v6

    sub-int v7, v1, v3

    sub-int/2addr v7, v6

    aput v7, v15, v4

    .line 148
    add-int v4, v0, v2

    add-int v7, v1, v3

    add-int/2addr v7, v6

    aput v7, v15, v4

    .line 145
    .end local v3    # "newOffset":I
    add-int/lit8 v2, v2, 0x1

    move/from16 v3, v23

    move/from16 v6, v26

    move-object/from16 v7, v27

    goto/16 :goto_a

    .line 99
    .end local v0    # "origCenter":I
    .end local v2    # "i":I
    .end local v5    # "baseMatrixSize":I
    .end local v8    # "wordSize":I
    .end local v10    # "compact":Z
    .end local v17    # "matrixSize":I
    .end local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v23    # "eccBits":I
    .end local v26    # "totalSizeBits":I
    .end local v27    # "stuffedBits":Lcom/google/zxing/common/BitArray;
    .local v1, "bits":Lcom/google/zxing/common/BitArray;
    .local v3, "eccBits":I
    .restart local v6    # "totalSizeBits":I
    .local v9, "i":I
    .local v11, "stuffedBits":Lcom/google/zxing/common/BitArray;
    .local v12, "wordSize":I
    .local v13, "compact":Z
    .local v14, "layers":I
    .local v15, "totalBitsInLayer":I
    :cond_1b
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    const/4 v6, 0x1

    const/16 v16, 0x4

    .end local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v3    # "eccBits":I
    .end local v6    # "totalSizeBits":I
    .restart local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v23    # "eccBits":I
    .restart local v26    # "totalSizeBits":I
    :goto_14
    add-int/lit8 v9, v9, 0x1

    .end local v13    # "compact":Z
    .end local v14    # "layers":I
    .end local v15    # "totalBitsInLayer":I
    move v10, v6

    move-object/from16 v1, v22

    move/from16 v3, v23

    move/from16 v6, v26

    move-object/from16 v2, p0

    const/16 v7, 0x20

    const/4 v8, 0x0

    goto/16 :goto_2

    .line 101
    .end local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v23    # "eccBits":I
    .end local v26    # "totalSizeBits":I
    .restart local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v3    # "eccBits":I
    .restart local v6    # "totalSizeBits":I
    :cond_1c
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    .end local v1    # "bits":Lcom/google/zxing/common/BitArray;
    .end local v3    # "eccBits":I
    .end local v6    # "totalSizeBits":I
    .restart local v22    # "bits":Lcom/google/zxing/common/BitArray;
    .restart local v23    # "eccBits":I
    .restart local v26    # "totalSizeBits":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Data too large for an Aztec code"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;
    .locals 9
    .param p0, "bitArray"    # Lcom/google/zxing/common/BitArray;
    .param p1, "totalBits"    # I
    .param p2, "wordSize"    # I

    .line 273
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    div-int/2addr v0, p2

    .line 274
    .local v0, "messageSizeInWords":I
    new-instance v1, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;

    invoke-static {p2}, Lcom/google/zxing/aztec/encoder/Encoder;->getGF(I)Lcom/google/zxing/common/reedsolomon/GenericGF;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    .line 275
    .local v1, "rs":Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;
    div-int v2, p1, p2

    .line 276
    .local v2, "totalWords":I
    invoke-static {p0, p2, v2}, Lcom/google/zxing/aztec/encoder/Encoder;->bitsToWords(Lcom/google/zxing/common/BitArray;II)[I

    move-result-object v3

    .line 277
    .local v3, "messageWords":[I
    sub-int v4, v2, v0

    invoke-virtual {v1, v3, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->encode([II)V

    .line 278
    rem-int v4, p1, p2

    .line 279
    .local v4, "startPad":I
    new-instance v5, Lcom/google/zxing/common/BitArray;

    invoke-direct {v5}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 280
    .local v5, "messageBits":Lcom/google/zxing/common/BitArray;
    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 281
    array-length v7, v3

    :goto_0
    if-lt v6, v7, :cond_0

    .line 284
    return-object v5

    .line 281
    :cond_0
    aget v8, v3, v6

    .line 282
    .local v8, "messageWord":I
    invoke-virtual {v5, v8, p2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 281
    .end local v8    # "messageWord":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method static generateModeMessage(ZII)Lcom/google/zxing/common/BitArray;
    .locals 4
    .param p0, "compact"    # Z
    .param p1, "layers"    # I
    .param p2, "messageSizeInWords"    # I

    .line 221
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 222
    .local v0, "modeMessage":Lcom/google/zxing/common/BitArray;
    const/4 v1, 0x4

    if-eqz p0, :cond_0

    .line 223
    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 224
    add-int/lit8 v2, p2, -0x1

    const/4 v3, 0x6

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 225
    const/16 v2, 0x1c

    invoke-static {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 226
    goto :goto_0

    .line 227
    :cond_0
    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x5

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 228
    add-int/lit8 v2, p2, -0x1

    const/16 v3, 0xb

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 229
    const/16 v2, 0x28

    invoke-static {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 231
    :goto_0
    return-object v0
.end method

.method private static getGF(I)Lcom/google/zxing/common/reedsolomon/GenericGF;
    .locals 1
    .param p0, "wordSize"    # I

    .line 302
    const/4 v0, 0x4

    if-eq p0, v0, :cond_4

    const/4 v0, 0x6

    if-eq p0, v0, :cond_3

    const/16 v0, 0x8

    if-eq p0, v0, :cond_2

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc

    if-eq p0, v0, :cond_0

    .line 314
    const/4 v0, 0x0

    return-object v0

    .line 312
    :cond_0
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    .line 310
    :cond_1
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    .line 308
    :cond_2
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    .line 306
    :cond_3
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    .line 304
    :cond_4
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_PARAM:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0
.end method

.method static stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;
    .locals 8
    .param p0, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "wordSize"    # I

    .line 319
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 321
    .local v0, "out":Lcom/google/zxing/common/BitArray;
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    .line 322
    .local v1, "n":I
    const/4 v2, 0x1

    shl-int v3, v2, p1

    add-int/lit8 v3, v3, -0x2

    .line 323
    .local v3, "mask":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-lt v4, v1, :cond_0

    .line 340
    .end local v4    # "i":I
    return-object v0

    .line 324
    .restart local v4    # "i":I
    :cond_0
    const/4 v5, 0x0

    .line 325
    .local v5, "word":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    if-lt v6, p1, :cond_3

    .line 330
    .end local v6    # "j":I
    and-int v6, v5, v3

    if-ne v6, v3, :cond_1

    .line 331
    and-int v6, v5, v3

    invoke-virtual {v0, v6, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 332
    add-int/lit8 v4, v4, -0x1

    .line 333
    goto :goto_2

    :cond_1
    and-int v6, v5, v3

    if-nez v6, :cond_2

    .line 334
    or-int/lit8 v6, v5, 0x1

    invoke-virtual {v0, v6, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 335
    add-int/lit8 v4, v4, -0x1

    .line 336
    goto :goto_2

    .line 337
    :cond_2
    invoke-virtual {v0, v5, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 323
    .end local v5    # "word":I
    :goto_2
    add-int/2addr v4, p1

    goto :goto_0

    .line 326
    .restart local v5    # "word":I
    .restart local v6    # "j":I
    :cond_3
    add-int v7, v4, v6

    if-ge v7, v1, :cond_4

    add-int v7, v4, v6

    invoke-virtual {p0, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 327
    :cond_4
    add-int/lit8 v7, p1, -0x1

    sub-int/2addr v7, v6

    shl-int v7, v2, v7

    or-int/2addr v5, v7

    .line 325
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method

.method private static totalBitsInLayer(IZ)I
    .locals 2
    .param p0, "layers"    # I
    .param p1, "compact"    # Z

    .line 344
    if-eqz p1, :cond_0

    const/16 v0, 0x58

    goto :goto_0

    :cond_0
    const/16 v0, 0x70

    :goto_0
    const/16 v1, 0x10

    mul-int/2addr v1, p0

    add-int/2addr v0, v1

    mul-int/2addr v0, p0

    return v0
.end method
