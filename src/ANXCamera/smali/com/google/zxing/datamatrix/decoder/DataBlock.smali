.class final Lcom/google/zxing/datamatrix/decoder/DataBlock;
.super Ljava/lang/Object;
.source "DataBlock.java"


# instance fields
.field private final codewords:[B

.field private final numDataCodewords:I


# direct methods
.method private constructor <init>(I[B)V
    .locals 0
    .param p1, "numDataCodewords"    # I
    .param p2, "codewords"    # [B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    .line 33
    iput-object p2, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    .line 34
    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .locals 18
    .param p0, "rawCodewords"    # [B
    .param p1, "version"    # Lcom/google/zxing/datamatrix/decoder/Version;

    move-object/from16 v0, p0

    .line 49
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getECBlocks()Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    move-result-object v1

    .line 52
    .local v1, "ecBlocks":Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;
    const/4 v2, 0x0

    .line 53
    .local v2, "totalBlocks":I
    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    move-result-object v3

    .line 54
    .local v3, "ecBlockArray":[Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    array-length v4, v3

    const/4 v5, 0x0

    move v6, v2

    move v2, v5

    .end local v2    # "totalBlocks":I
    .local v6, "totalBlocks":I
    :goto_0
    if-lt v2, v4, :cond_b

    .line 59
    new-array v7, v6, [Lcom/google/zxing/datamatrix/decoder/DataBlock;

    .line 60
    .local v7, "result":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    const/4 v2, 0x0

    .line 61
    .local v2, "numResultBlocks":I
    array-length v8, v3

    move v9, v5

    :goto_1
    if-lt v9, v8, :cond_9

    .line 72
    aget-object v4, v7, v5

    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    array-length v4, v4

    .line 75
    .local v4, "longerBlocksTotalCodewords":I
    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v8

    sub-int v10, v4, v8

    .line 76
    .local v10, "longerBlocksNumDataCodewords":I
    add-int/lit8 v11, v10, -0x1

    .line 79
    .local v11, "shorterBlocksNumDataCodewords":I
    const/4 v8, 0x0

    .line 80
    .local v8, "rawCodewordsOffset":I
    const/4 v9, 0x0

    .local v9, "i":I
    move v12, v9

    .end local v9    # "i":I
    .local v12, "i":I
    :goto_2
    if-lt v12, v11, :cond_7

    .line 87
    .end local v12    # "i":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getVersionNumber()I

    move-result v9

    const/16 v12, 0x18

    if-ne v9, v12, :cond_0

    const/4 v9, 0x1

    goto :goto_3

    :cond_0
    move v9, v5

    .line 88
    .local v9, "specialVersion":Z
    :goto_3
    if-eqz v9, :cond_1

    const/16 v12, 0x8

    goto :goto_4

    :cond_1
    move v12, v2

    :goto_4
    move v13, v12

    .line 89
    .local v13, "numLongerBlocks":I
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_5
    if-lt v12, v13, :cond_6

    .line 94
    .end local v12    # "j":I
    aget-object v5, v7, v5

    iget-object v5, v5, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    array-length v14, v5

    .line 95
    .local v14, "max":I
    move v5, v10

    .local v5, "i":I
    move v15, v5

    .end local v5    # "i":I
    .local v15, "i":I
    :goto_6
    if-lt v15, v14, :cond_3

    .line 102
    .end local v15    # "i":I
    array-length v5, v0

    if-ne v8, v5, :cond_2

    .line 106
    return-object v7

    .line 103
    :cond_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    .line 96
    .restart local v15    # "i":I
    :cond_3
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_7
    if-lt v5, v2, :cond_4

    .line 95
    .end local v5    # "j":I
    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 97
    .restart local v5    # "j":I
    :cond_4
    if-eqz v9, :cond_5

    const/4 v12, 0x7

    if-le v5, v12, :cond_5

    add-int/lit8 v12, v15, -0x1

    goto :goto_8

    :cond_5
    move v12, v15

    .line 98
    .local v12, "iOffset":I
    :goto_8
    move/from16 v16, v4

    aget-object v4, v7, v5

    .end local v4    # "longerBlocksTotalCodewords":I
    .local v16, "longerBlocksTotalCodewords":I
    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v17, v8, 0x1

    .local v17, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v4, v12

    .line 96
    .end local v12    # "iOffset":I
    add-int/lit8 v5, v5, 0x1

    move/from16 v4, v16

    move/from16 v8, v17

    goto :goto_7

    .line 90
    .end local v5    # "j":I
    .end local v14    # "max":I
    .end local v15    # "i":I
    .end local v16    # "longerBlocksTotalCodewords":I
    .end local v17    # "rawCodewordsOffset":I
    .restart local v4    # "longerBlocksTotalCodewords":I
    .restart local v8    # "rawCodewordsOffset":I
    .local v12, "j":I
    :cond_6
    move/from16 v16, v4

    .end local v4    # "longerBlocksTotalCodewords":I
    .restart local v16    # "longerBlocksTotalCodewords":I
    aget-object v4, v7, v12

    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v14, v10, -0x1

    add-int/lit8 v15, v8, 0x1

    .local v15, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v4, v14

    .line 89
    add-int/lit8 v12, v12, 0x1

    move v8, v15

    move/from16 v4, v16

    goto :goto_5

    .line 81
    .end local v9    # "specialVersion":Z
    .end local v13    # "numLongerBlocks":I
    .end local v15    # "rawCodewordsOffset":I
    .end local v16    # "longerBlocksTotalCodewords":I
    .restart local v4    # "longerBlocksTotalCodewords":I
    .restart local v8    # "rawCodewordsOffset":I
    .local v12, "i":I
    :cond_7
    move/from16 v16, v4

    .end local v4    # "longerBlocksTotalCodewords":I
    .restart local v16    # "longerBlocksTotalCodewords":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_9
    if-lt v4, v2, :cond_8

    .line 80
    .end local v4    # "j":I
    add-int/lit8 v12, v12, 0x1

    move/from16 v4, v16

    goto :goto_2

    .line 82
    .restart local v4    # "j":I
    :cond_8
    aget-object v9, v7, v4

    iget-object v9, v9, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v13, v8, 0x1

    .local v13, "rawCodewordsOffset":I
    aget-byte v8, v0, v8

    .end local v8    # "rawCodewordsOffset":I
    aput-byte v8, v9, v12

    .line 81
    add-int/lit8 v4, v4, 0x1

    move v8, v13

    goto :goto_9

    .line 61
    .end local v4    # "j":I
    .end local v10    # "longerBlocksNumDataCodewords":I
    .end local v11    # "shorterBlocksNumDataCodewords":I
    .end local v12    # "i":I
    .end local v13    # "rawCodewordsOffset":I
    .end local v16    # "longerBlocksTotalCodewords":I
    :cond_9
    aget-object v10, v3, v9

    .line 62
    .local v10, "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_a
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v11

    if-lt v4, v11, :cond_a

    .line 61
    .end local v4    # "i":I
    .end local v10    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 63
    .restart local v4    # "i":I
    .restart local v10    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    :cond_a
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getDataCodewords()I

    move-result v11

    .line 64
    .local v11, "numDataCodewords":I
    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v12

    add-int/2addr v12, v11

    .line 65
    .local v12, "numBlockCodewords":I
    add-int/lit8 v13, v2, 0x1

    .local v13, "numResultBlocks":I
    new-instance v14, Lcom/google/zxing/datamatrix/decoder/DataBlock;

    new-array v15, v12, [B

    invoke-direct {v14, v11, v15}, Lcom/google/zxing/datamatrix/decoder/DataBlock;-><init>(I[B)V

    aput-object v14, v7, v2

    .line 62
    .end local v2    # "numResultBlocks":I
    .end local v11    # "numDataCodewords":I
    .end local v12    # "numBlockCodewords":I
    add-int/lit8 v4, v4, 0x1

    move v2, v13

    goto :goto_a

    .line 54
    .end local v4    # "i":I
    .end local v7    # "result":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .end local v10    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    .end local v13    # "numResultBlocks":I
    :cond_b
    aget-object v7, v3, v2

    .line 55
    .local v7, "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v8

    add-int/2addr v6, v8

    .line 54
    .end local v7    # "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0
.end method


# virtual methods
.method getCodewords()[B
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .locals 1

    .line 110
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
