.class final Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;
.super Ljava/lang/Object;
.source "BitMatrixParser.java"


# instance fields
.field private final mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

.field private final readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

.field private final version:Lcom/google/zxing/datamatrix/decoder/Version;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 6
    .param p1, "bitMatrix"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    .line 37
    .local v0, "dimension":I
    const/16 v1, 0x8

    if-lt v0, v1, :cond_33

    const/16 v1, 0x90

    if-gt v0, v1, :cond_33

    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_33

    .line 41
    invoke-static {p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readVersion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    .line 42
    invoke-virtual {p0, p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->extractDataRegion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    .line 43
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    iget-object v2, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    .line 44
    return-void

    .line 38
    :cond_33
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method private static readVersion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/datamatrix/decoder/Version;
    .registers 4
    .param p0, "bitMatrix"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    .line 63
    .local v0, "numRows":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    .line 64
    .local v1, "numColumns":I
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/Version;->getVersionForDimensions(II)Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method extractDataRegion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .registers 23
    .param p1, "bitMatrix"    # Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v0, p0

    .line 403
    iget-object v1, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version;->getSymbolSizeRows()I

    move-result v1

    .line 404
    .local v1, "symbolSizeRows":I
    iget-object v2, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/Version;->getSymbolSizeColumns()I

    move-result v2

    .line 406
    .local v2, "symbolSizeColumns":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    if-ne v3, v1, :cond_7a

    .line 410
    iget-object v3, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/decoder/Version;->getDataRegionSizeRows()I

    move-result v3

    .line 411
    .local v3, "dataRegionSizeRows":I
    iget-object v4, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/Version;->getDataRegionSizeColumns()I

    move-result v4

    .line 413
    .local v4, "dataRegionSizeColumns":I
    div-int v5, v1, v3

    .line 414
    .local v5, "numDataRegionsRow":I
    div-int v6, v2, v4

    .line 416
    .local v6, "numDataRegionsColumn":I
    mul-int v7, v5, v3

    .line 417
    .local v7, "sizeDataRegionRow":I
    mul-int v8, v6, v4

    .line 419
    .local v8, "sizeDataRegionColumn":I
    new-instance v9, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v9, v8, v7}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 420
    .local v9, "bitMatrixWithoutAlignment":Lcom/google/zxing/common/BitMatrix;
    const/4 v10, 0x0

    .local v10, "dataRegionRow":I
    :goto_2e
    if-lt v10, v5, :cond_31

    .line 437
    .end local v10    # "dataRegionRow":I
    return-object v9

    .line 421
    .restart local v10    # "dataRegionRow":I
    :cond_31
    mul-int v11, v10, v3

    .line 422
    .local v11, "dataRegionRowOffset":I
    const/4 v12, 0x0

    .local v12, "dataRegionColumn":I
    :goto_34
    if-lt v12, v6, :cond_39

    .line 420
    .end local v11    # "dataRegionRowOffset":I
    .end local v12    # "dataRegionColumn":I
    add-int/lit8 v10, v10, 0x1

    goto :goto_2e

    .line 423
    .restart local v11    # "dataRegionRowOffset":I
    .restart local v12    # "dataRegionColumn":I
    :cond_39
    mul-int v13, v12, v4

    .line 424
    .local v13, "dataRegionColumnOffset":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_3c
    if-lt v14, v3, :cond_41

    .line 422
    .end local v13    # "dataRegionColumnOffset":I
    .end local v14    # "i":I
    add-int/lit8 v12, v12, 0x1

    goto :goto_34

    .line 425
    .restart local v13    # "dataRegionColumnOffset":I
    .restart local v14    # "i":I
    :cond_41
    add-int/lit8 v15, v3, 0x2

    mul-int/2addr v15, v10

    add-int/lit8 v15, v15, 0x1

    add-int/2addr v15, v14

    .line 426
    .local v15, "readRowOffset":I
    add-int v0, v11, v14

    .line 427
    .local v0, "writeRowOffset":I
    const/16 v16, 0x0

    .local v16, "j":I
    move/from16 v17, v1

    move/from16 v1, v16

    .end local v16    # "j":I
    .local v1, "j":I
    .local v17, "symbolSizeRows":I
    :goto_4f
    if-lt v1, v4, :cond_58

    .line 424
    .end local v0    # "writeRowOffset":I
    .end local v1    # "j":I
    .end local v15    # "readRowOffset":I
    add-int/lit8 v14, v14, 0x1

    move/from16 v1, v17

    move-object/from16 v0, p0

    goto :goto_3c

    .line 428
    .restart local v0    # "writeRowOffset":I
    .restart local v1    # "j":I
    .restart local v15    # "readRowOffset":I
    :cond_58
    add-int/lit8 v16, v4, 0x2

    mul-int v16, v16, v12

    add-int/lit8 v16, v16, 0x1

    move/from16 v18, v2

    add-int v2, v16, v1

    .line 429
    .local v2, "readColumnOffset":I
    .local v18, "symbolSizeColumns":I
    move/from16 v19, v3

    move-object/from16 v3, p1

    invoke-virtual {v3, v2, v15}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    .end local v3    # "dataRegionSizeRows":I
    .local v19, "dataRegionSizeRows":I
    if-eqz v16, :cond_73

    .line 430
    move/from16 v20, v2

    add-int v2, v13, v1

    .line 431
    .local v2, "writeColumnOffset":I
    .local v20, "readColumnOffset":I
    invoke-virtual {v9, v2, v0}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 427
    .end local v2    # "writeColumnOffset":I
    .end local v20    # "readColumnOffset":I
    :cond_73
    add-int/lit8 v1, v1, 0x1

    move/from16 v2, v18

    move/from16 v3, v19

    goto :goto_4f

    .line 407
    .end local v0    # "writeRowOffset":I
    .end local v4    # "dataRegionSizeColumns":I
    .end local v5    # "numDataRegionsRow":I
    .end local v6    # "numDataRegionsColumn":I
    .end local v7    # "sizeDataRegionRow":I
    .end local v8    # "sizeDataRegionColumn":I
    .end local v9    # "bitMatrixWithoutAlignment":Lcom/google/zxing/common/BitMatrix;
    .end local v10    # "dataRegionRow":I
    .end local v11    # "dataRegionRowOffset":I
    .end local v12    # "dataRegionColumn":I
    .end local v13    # "dataRegionColumnOffset":I
    .end local v14    # "i":I
    .end local v15    # "readRowOffset":I
    .end local v17    # "symbolSizeRows":I
    .end local v18    # "symbolSizeColumns":I
    .end local v19    # "dataRegionSizeRows":I
    .local v1, "symbolSizeRows":I
    .local v2, "symbolSizeColumns":I
    :cond_7a
    move-object/from16 v3, p1

    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "symbolSizeRows":I
    .end local v2    # "symbolSizeColumns":I
    .restart local v17    # "symbolSizeRows":I
    .restart local v18    # "symbolSizeColumns":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dimension of bitMarix must match the version size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getVersion()Lcom/google/zxing/datamatrix/decoder/Version;
    .registers 2

    .line 47
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    return-object v0
.end method

.method readCodewords()[B
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/Version;->getTotalCodewords()I

    move-result v0

    new-array v0, v0, [B

    .line 78
    .local v0, "result":[B
    const/4 v1, 0x0

    .line 80
    .local v1, "resultOffset":I
    const/4 v2, 0x4

    .line 81
    .local v2, "row":I
    const/4 v3, 0x0

    .line 83
    .local v3, "column":I
    iget-object v4, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    .line 84
    .local v4, "numRows":I
    iget-object v5, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v5

    .line 86
    .local v5, "numColumns":I
    const/4 v6, 0x0

    .line 87
    .local v6, "corner1Read":Z
    const/4 v7, 0x0

    .line 88
    .local v7, "corner2Read":Z
    const/4 v8, 0x0

    .line 89
    .local v8, "corner3Read":Z
    const/4 v9, 0x0

    .line 94
    .local v9, "corner4Read":Z
    :cond_1b
    if-ne v2, v4, :cond_34

    if-nez v3, :cond_34

    if-nez v6, :cond_34

    .line 95
    add-int/lit8 v10, v1, 0x1

    .local v10, "resultOffset":I
    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner1(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 96
    .end local v1    # "resultOffset":I
    add-int/lit8 v2, v2, -0x2

    .line 97
    add-int/lit8 v3, v3, 0x2

    .line 98
    const/4 v1, 0x1

    .line 99
    .end local v6    # "corner1Read":Z
    .local v1, "corner1Read":Z
    nop

    .line 137
    move v6, v1

    .end local v10    # "resultOffset":I
    .local v1, "resultOffset":I
    .restart local v6    # "corner1Read":Z
    :goto_31
    move v1, v10

    goto/16 :goto_d1

    .line 99
    :cond_34
    add-int/lit8 v10, v4, -0x2

    if-ne v2, v10, :cond_51

    if-nez v3, :cond_51

    and-int/lit8 v10, v5, 0x3

    if-eqz v10, :cond_51

    if-nez v7, :cond_51

    .line 100
    add-int/lit8 v10, v1, 0x1

    .restart local v10    # "resultOffset":I
    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner2(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 101
    .end local v1    # "resultOffset":I
    add-int/lit8 v2, v2, -0x2

    .line 102
    add-int/lit8 v3, v3, 0x2

    .line 103
    const/4 v1, 0x1

    .line 104
    .end local v7    # "corner2Read":Z
    .local v1, "corner2Read":Z
    nop

    .line 137
    move v7, v1

    goto :goto_31

    .line 104
    .end local v10    # "resultOffset":I
    .local v1, "resultOffset":I
    .restart local v7    # "corner2Read":Z
    :cond_51
    add-int/lit8 v10, v4, 0x4

    if-ne v2, v10, :cond_6f

    const/4 v10, 0x2

    if-ne v3, v10, :cond_6f

    and-int/lit8 v10, v5, 0x7

    if-nez v10, :cond_6f

    if-nez v8, :cond_6f

    .line 105
    add-int/lit8 v10, v1, 0x1

    .restart local v10    # "resultOffset":I
    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner3(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 106
    .end local v1    # "resultOffset":I
    add-int/lit8 v2, v2, -0x2

    .line 107
    add-int/lit8 v3, v3, 0x2

    .line 108
    const/4 v1, 0x1

    .line 109
    .end local v8    # "corner3Read":Z
    .local v1, "corner3Read":Z
    nop

    .line 137
    move v8, v1

    goto :goto_31

    .line 109
    .end local v10    # "resultOffset":I
    .local v1, "resultOffset":I
    .restart local v8    # "corner3Read":Z
    :cond_6f
    add-int/lit8 v10, v4, -0x2

    if-ne v2, v10, :cond_8d

    if-nez v3, :cond_8d

    and-int/lit8 v10, v5, 0x7

    const/4 v11, 0x4

    if-ne v10, v11, :cond_8d

    if-nez v9, :cond_8d

    .line 110
    add-int/lit8 v10, v1, 0x1

    .restart local v10    # "resultOffset":I
    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner4(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 111
    .end local v1    # "resultOffset":I
    add-int/lit8 v2, v2, -0x2

    .line 112
    add-int/lit8 v3, v3, 0x2

    .line 113
    const/4 v1, 0x1

    .line 114
    .end local v9    # "corner4Read":Z
    .local v1, "corner4Read":Z
    nop

    .line 137
    move v9, v1

    goto :goto_31

    .line 117
    .end local v10    # "resultOffset":I
    .local v1, "resultOffset":I
    .restart local v9    # "corner4Read":Z
    :cond_8d
    if-ge v2, v4, :cond_a3

    if-ltz v3, :cond_a3

    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10, v3, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-nez v10, :cond_a3

    .line 118
    add-int/lit8 v10, v1, 0x1

    .restart local v10    # "resultOffset":I
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readUtah(IIII)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 120
    .end local v1    # "resultOffset":I
    move v1, v10

    .end local v10    # "resultOffset":I
    .restart local v1    # "resultOffset":I
    :cond_a3
    add-int/lit8 v2, v2, -0x2

    .line 121
    add-int/lit8 v3, v3, 0x2

    .line 122
    if-ltz v2, :cond_ab

    .line 116
    if-lt v3, v5, :cond_8d

    .line 123
    :cond_ab
    add-int/lit8 v2, v2, 0x1

    .line 124
    add-int/lit8 v3, v3, 0x3

    .line 128
    :cond_af
    if-ltz v2, :cond_c5

    if-ge v3, v5, :cond_c5

    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10, v3, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-nez v10, :cond_c5

    .line 129
    add-int/lit8 v10, v1, 0x1

    .restart local v10    # "resultOffset":I
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readUtah(IIII)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    .line 131
    .end local v1    # "resultOffset":I
    move v1, v10

    .end local v10    # "resultOffset":I
    .restart local v1    # "resultOffset":I
    :cond_c5
    add-int/lit8 v2, v2, 0x2

    .line 132
    add-int/lit8 v3, v3, -0x2

    .line 133
    if-ge v2, v4, :cond_cd

    .line 127
    if-gez v3, :cond_af

    .line 134
    :cond_cd
    add-int/lit8 v2, v2, 0x3

    .line 135
    add-int/lit8 v3, v3, 0x1

    .line 137
    :goto_d1
    if-lt v2, v4, :cond_1b

    .line 92
    if-lt v3, v5, :cond_1b

    .line 139
    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version;->getTotalCodewords()I

    move-result v10

    if-ne v1, v10, :cond_de

    .line 142
    return-object v0

    .line 140
    :cond_de
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v10

    throw v10
.end method

.method readCorner1(II)I
    .registers 8
    .param p1, "numRows"    # I
    .param p2, "numColumns"    # I

    .line 225
    const/4 v0, 0x0

    .line 226
    .local v0, "currentByte":I
    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 227
    or-int/lit8 v0, v0, 0x1

    .line 229
    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    .line 230
    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v1, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 231
    or-int/lit8 v0, v0, 0x1

    .line 233
    :cond_18
    shl-int/2addr v0, v1

    .line 234
    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 235
    or-int/lit8 v0, v0, 0x1

    .line 237
    :cond_24
    shl-int/2addr v0, v1

    .line 238
    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 239
    or-int/lit8 v0, v0, 0x1

    .line 241
    :cond_2f
    shl-int/2addr v0, v1

    .line 242
    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 243
    or-int/lit8 v0, v0, 0x1

    .line 245
    :cond_3a
    shl-int/2addr v0, v1

    .line 246
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 247
    or-int/lit8 v0, v0, 0x1

    .line 249
    :cond_45
    shl-int/2addr v0, v1

    .line 250
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v4, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 251
    or-int/lit8 v0, v0, 0x1

    .line 253
    :cond_50
    shl-int/2addr v0, v1

    .line 254
    const/4 v1, 0x3

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 255
    or-int/lit8 v0, v0, 0x1

    .line 257
    :cond_5c
    return v0
.end method

.method readCorner2(II)I
    .registers 7
    .param p1, "numRows"    # I
    .param p2, "numColumns"    # I

    .line 270
    const/4 v0, 0x0

    .line 271
    .local v0, "currentByte":I
    add-int/lit8 v1, p1, -0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 272
    or-int/lit8 v0, v0, 0x1

    .line 274
    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    .line 275
    add-int/lit8 v3, p1, -0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 276
    or-int/lit8 v0, v0, 0x1

    .line 278
    :cond_18
    shl-int/2addr v0, v1

    .line 279
    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 280
    or-int/lit8 v0, v0, 0x1

    .line 282
    :cond_23
    shl-int/2addr v0, v1

    .line 283
    add-int/lit8 v3, p2, -0x4

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 284
    or-int/lit8 v0, v0, 0x1

    .line 286
    :cond_2e
    shl-int/2addr v0, v1

    .line 287
    add-int/lit8 v3, p2, -0x3

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 288
    or-int/lit8 v0, v0, 0x1

    .line 290
    :cond_39
    shl-int/2addr v0, v1

    .line 291
    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 292
    or-int/lit8 v0, v0, 0x1

    .line 294
    :cond_44
    shl-int/2addr v0, v1

    .line 295
    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 296
    or-int/lit8 v0, v0, 0x1

    .line 298
    :cond_4f
    shl-int/2addr v0, v1

    .line 299
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 300
    or-int/lit8 v0, v0, 0x1

    .line 302
    :cond_5a
    return v0
.end method

.method readCorner3(II)I
    .registers 8
    .param p1, "numRows"    # I
    .param p2, "numColumns"    # I

    .line 315
    const/4 v0, 0x0

    .line 316
    .local v0, "currentByte":I
    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 317
    or-int/lit8 v0, v0, 0x1

    .line 319
    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    .line 320
    add-int/lit8 v3, p1, -0x1

    add-int/lit8 v4, p2, -0x1

    invoke-virtual {p0, v3, v4, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 321
    or-int/lit8 v0, v0, 0x1

    .line 323
    :cond_1a
    shl-int/2addr v0, v1

    .line 324
    add-int/lit8 v3, p2, -0x3

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 325
    or-int/lit8 v0, v0, 0x1

    .line 327
    :cond_25
    shl-int/2addr v0, v1

    .line 328
    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 329
    or-int/lit8 v0, v0, 0x1

    .line 331
    :cond_30
    shl-int/2addr v0, v1

    .line 332
    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 333
    or-int/lit8 v0, v0, 0x1

    .line 335
    :cond_3b
    shl-int/2addr v0, v1

    .line 336
    add-int/lit8 v2, p2, -0x3

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 337
    or-int/lit8 v0, v0, 0x1

    .line 339
    :cond_46
    shl-int/2addr v0, v1

    .line 340
    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 341
    or-int/lit8 v0, v0, 0x1

    .line 343
    :cond_51
    shl-int/2addr v0, v1

    .line 344
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 345
    or-int/lit8 v0, v0, 0x1

    .line 347
    :cond_5c
    return v0
.end method

.method readCorner4(II)I
    .registers 7
    .param p1, "numRows"    # I
    .param p2, "numColumns"    # I

    .line 360
    const/4 v0, 0x0

    .line 361
    .local v0, "currentByte":I
    add-int/lit8 v1, p1, -0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 362
    or-int/lit8 v0, v0, 0x1

    .line 364
    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    .line 365
    add-int/lit8 v3, p1, -0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 366
    or-int/lit8 v0, v0, 0x1

    .line 368
    :cond_18
    shl-int/2addr v0, v1

    .line 369
    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 370
    or-int/lit8 v0, v0, 0x1

    .line 372
    :cond_23
    shl-int/2addr v0, v1

    .line 373
    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 374
    or-int/lit8 v0, v0, 0x1

    .line 376
    :cond_2e
    shl-int/2addr v0, v1

    .line 377
    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 378
    or-int/lit8 v0, v0, 0x1

    .line 380
    :cond_39
    shl-int/2addr v0, v1

    .line 381
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_44

    .line 382
    or-int/lit8 v0, v0, 0x1

    .line 384
    :cond_44
    shl-int/2addr v0, v1

    .line 385
    add-int/lit8 v2, p2, -0x1

    const/4 v3, 0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 386
    or-int/lit8 v0, v0, 0x1

    .line 388
    :cond_50
    shl-int/2addr v0, v1

    .line 389
    add-int/lit8 v1, p2, -0x1

    const/4 v2, 0x3

    invoke-virtual {p0, v2, v1, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 390
    or-int/lit8 v0, v0, 0x1

    .line 392
    :cond_5c
    return v0
.end method

.method readModule(IIII)Z
    .registers 6
    .param p1, "row"    # I
    .param p2, "column"    # I
    .param p3, "numRows"    # I
    .param p4, "numColumns"    # I

    .line 156
    if-gez p1, :cond_a

    .line 157
    add-int/2addr p1, p3

    .line 158
    add-int/lit8 v0, p3, 0x4

    and-int/lit8 v0, v0, 0x7

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p2, v0

    .line 160
    :cond_a
    if-gez p2, :cond_14

    .line 161
    add-int/2addr p2, p4

    .line 162
    add-int/lit8 v0, p4, 0x4

    and-int/lit8 v0, v0, 0x7

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p1, v0

    .line 164
    :cond_14
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p2, p1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 165
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    return v0
.end method

.method readUtah(IIII)I
    .registers 8
    .param p1, "row"    # I
    .param p2, "column"    # I
    .param p3, "numRows"    # I
    .param p4, "numColumns"    # I

    .line 180
    const/4 v0, 0x0

    .line 181
    .local v0, "currentByte":I
    add-int/lit8 v1, p1, -0x2

    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 182
    or-int/lit8 v0, v0, 0x1

    .line 184
    :cond_d
    shl-int/lit8 v0, v0, 0x1

    .line 185
    add-int/lit8 v1, p1, -0x2

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 186
    or-int/lit8 v0, v0, 0x1

    .line 188
    :cond_1b
    shl-int/lit8 v0, v0, 0x1

    .line 189
    add-int/lit8 v1, p1, -0x1

    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 190
    or-int/lit8 v0, v0, 0x1

    .line 192
    :cond_29
    shl-int/lit8 v0, v0, 0x1

    .line 193
    add-int/lit8 v1, p1, -0x1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 194
    or-int/lit8 v0, v0, 0x1

    .line 196
    :cond_37
    shl-int/lit8 v0, v0, 0x1

    .line 197
    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, v1, p2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 198
    or-int/lit8 v0, v0, 0x1

    .line 200
    :cond_43
    shl-int/lit8 v0, v0, 0x1

    .line 201
    add-int/lit8 v1, p2, -0x2

    invoke-virtual {p0, p1, v1, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 202
    or-int/lit8 v0, v0, 0x1

    .line 204
    :cond_4f
    shl-int/lit8 v0, v0, 0x1

    .line 205
    add-int/lit8 v1, p2, -0x1

    invoke-virtual {p0, p1, v1, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 206
    or-int/lit8 v0, v0, 0x1

    .line 208
    :cond_5b
    shl-int/lit8 v0, v0, 0x1

    .line 209
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 210
    or-int/lit8 v0, v0, 0x1

    .line 212
    :cond_65
    return v0
.end method
