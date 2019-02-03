.class final Lcom/google/zxing/qrcode/decoder/DataBlock;
.super Ljava/lang/Object;
.source "DataBlock.java"


# instance fields
.field private final codewords:[B

.field private final numDataCodewords:I


# direct methods
.method private constructor <init>(I[B)V
    .registers 3
    .param p1, "numDataCodewords"    # I
    .param p2, "codewords"    # [B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    .line 33
    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    .line 34
    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;
    .registers 19
    .param p0, "rawCodewords"    # [B
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    move-object/from16 v0, p0

    .line 51
    array-length v1, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v2

    if-ne v1, v2, :cond_ba

    .line 57
    invoke-virtual/range {p1 .. p2}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v1

    .line 60
    .local v1, "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    const/4 v2, 0x0

    .line 61
    .local v2, "totalBlocks":I
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v3

    .line 62
    .local v3, "ecBlockArray":[Lcom/google/zxing/qrcode/decoder/Version$ECB;
    array-length v4, v3

    const/4 v5, 0x0

    move v6, v2

    move v2, v5

    .end local v2    # "totalBlocks":I
    .local v6, "totalBlocks":I
    :goto_16
    if-lt v2, v4, :cond_af

    .line 67
    new-array v7, v6, [Lcom/google/zxing/qrcode/decoder/DataBlock;

    .line 68
    .local v7, "result":[Lcom/google/zxing/qrcode/decoder/DataBlock;
    const/4 v2, 0x0

    .line 69
    .local v2, "numResultBlocks":I
    array-length v8, v3

    move v9, v5

    :goto_1d
    if-lt v9, v8, :cond_8b

    .line 79
    aget-object v4, v7, v5

    iget-object v4, v4, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v4, v4

    .line 80
    .local v4, "shorterBlocksTotalCodewords":I
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    .line 81
    .local v8, "longerBlocksStartAt":I
    :goto_27
    if-gez v8, :cond_2a

    goto :goto_32

    .line 82
    :cond_2a
    aget-object v9, v7, v8

    iget-object v9, v9, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v9, v9

    .line 83
    .local v9, "numCodewords":I
    if-ne v9, v4, :cond_88

    .line 84
    nop

    .line 88
    .end local v9    # "numCodewords":I
    :goto_32
    add-int/lit8 v10, v8, 0x1

    .line 90
    .end local v8    # "longerBlocksStartAt":I
    .local v10, "longerBlocksStartAt":I
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v8

    sub-int v11, v4, v8

    .line 93
    .local v11, "shorterBlocksNumDataCodewords":I
    const/4 v8, 0x0

    .line 94
    .local v8, "rawCodewordsOffset":I
    const/4 v9, 0x0

    .local v9, "i":I
    move v12, v9

    .end local v9    # "i":I
    .local v12, "i":I
    :goto_3d
    if-lt v12, v11, :cond_74

    .line 100
    .end local v12    # "i":I
    move v9, v10

    .local v9, "j":I
    :goto_40
    if-lt v9, v2, :cond_66

    .line 104
    .end local v9    # "j":I
    aget-object v5, v7, v5

    iget-object v5, v5, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v12, v5

    .line 105
    .local v12, "max":I
    move v5, v11

    .local v5, "i":I
    move v13, v5

    .end local v5    # "i":I
    .local v13, "i":I
    :goto_49
    if-lt v13, v12, :cond_4c

    .line 111
    .end local v13    # "i":I
    return-object v7

    .line 106
    .restart local v13    # "i":I
    :cond_4c
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_4d
    if-lt v5, v2, :cond_52

    .line 105
    .end local v5    # "j":I
    add-int/lit8 v13, v13, 0x1

    goto :goto_49

    .line 107
    .restart local v5    # "j":I
    :cond_52
    if-ge v5, v10, :cond_56

    move v9, v13

    goto :goto_58

    :cond_56
    add-int/lit8 v9, v13, 0x1

    .line 108
    .local v9, "iOffset":I
    :goto_58
    aget-object v14, v7, v5

    iget-object v14, v14, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v15, v8, 0x1

    .local v15, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v14, v9

    .line 106
    .end local v9    # "iOffset":I
    add-int/lit8 v5, v5, 0x1

    move v8, v15

    goto :goto_4d

    .line 101
    .end local v5    # "j":I
    .end local v12    # "max":I
    .end local v13    # "i":I
    .end local v15    # "rawCodewordsOffset":I
    .restart local v8    # "rawCodewordsOffset":I
    .local v9, "j":I
    :cond_66
    aget-object v12, v7, v9

    iget-object v12, v12, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v13, v8, 0x1

    .local v13, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v12, v11

    .line 100
    add-int/lit8 v9, v9, 0x1

    move v8, v13

    goto :goto_40

    .line 95
    .end local v9    # "j":I
    .end local v13    # "rawCodewordsOffset":I
    .restart local v8    # "rawCodewordsOffset":I
    .local v12, "i":I
    :cond_74
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_75
    if-lt v9, v2, :cond_7a

    .line 94
    .end local v9    # "j":I
    add-int/lit8 v12, v12, 0x1

    goto :goto_3d

    .line 96
    .restart local v9    # "j":I
    :cond_7a
    aget-object v13, v7, v9

    iget-object v13, v13, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v14, v8, 0x1

    .local v14, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v13, v12

    .line 95
    add-int/lit8 v9, v9, 0x1

    move v8, v14

    goto :goto_75

    .line 86
    .end local v10    # "longerBlocksStartAt":I
    .end local v11    # "shorterBlocksNumDataCodewords":I
    .end local v12    # "i":I
    .end local v14    # "rawCodewordsOffset":I
    .local v8, "longerBlocksStartAt":I
    .local v9, "numCodewords":I
    :cond_88
    add-int/lit8 v8, v8, -0x1

    .end local v9    # "numCodewords":I
    goto :goto_27

    .line 69
    .end local v4    # "shorterBlocksTotalCodewords":I
    .end local v8    # "longerBlocksStartAt":I
    :cond_8b
    aget-object v10, v3, v9

    .line 70
    .local v10, "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8e
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v11

    if-lt v4, v11, :cond_97

    .line 69
    .end local v4    # "i":I
    .end local v10    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    add-int/lit8 v9, v9, 0x1

    goto :goto_1d

    .line 71
    .restart local v4    # "i":I
    .restart local v10    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    :cond_97
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v11

    .line 72
    .local v11, "numDataCodewords":I
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v12

    add-int/2addr v12, v11

    .line 73
    .local v12, "numBlockCodewords":I
    add-int/lit8 v13, v2, 0x1

    .local v13, "numResultBlocks":I
    new-instance v14, Lcom/google/zxing/qrcode/decoder/DataBlock;

    new-array v15, v12, [B

    invoke-direct {v14, v11, v15}, Lcom/google/zxing/qrcode/decoder/DataBlock;-><init>(I[B)V

    aput-object v14, v7, v2

    .line 70
    .end local v2    # "numResultBlocks":I
    .end local v11    # "numDataCodewords":I
    .end local v12    # "numBlockCodewords":I
    add-int/lit8 v4, v4, 0x1

    move v2, v13

    goto :goto_8e

    .line 62
    .end local v4    # "i":I
    .end local v7    # "result":[Lcom/google/zxing/qrcode/decoder/DataBlock;
    .end local v10    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    .end local v13    # "numResultBlocks":I
    :cond_af
    aget-object v7, v3, v2

    .line 63
    .local v7, "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    invoke-virtual {v7}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v8

    add-int/2addr v6, v8

    .line 62
    .end local v7    # "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_16

    .line 52
    .end local v1    # "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .end local v3    # "ecBlockArray":[Lcom/google/zxing/qrcode/decoder/Version$ECB;
    .end local v6    # "totalBlocks":I
    :cond_ba
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method


# virtual methods
.method getCodewords()[B
    .registers 2

    .line 119
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .registers 2

    .line 115
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
