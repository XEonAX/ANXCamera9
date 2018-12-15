.class final Lcom/google/zxing/pdf417/decoder/DetectionResult;
.super Ljava/lang/Object;
.source "DetectionResult.java"


# static fields
.field private static final ADJUST_ROW_NUMBER_SKIP:I = 0x2


# instance fields
.field private final barcodeColumnCount:I

.field private final barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

.field private boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

.field private final detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;


# direct methods
.method constructor <init>(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .registers 4
    .param p1, "barcodeMetadata"    # Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    .param p2, "boundingBox"    # Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    .line 37
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    .line 38
    iput-object p2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 39
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    .line 40
    return-void
.end method

.method private adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V
    .registers 4
    .param p1, "detectionResultColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    .line 55
    if-eqz p1, :cond_a

    .line 56
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    .line 57
    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0, v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->adjustCompleteIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)I

    .line 59
    :cond_a
    return-void
.end method

.method private static adjustRowNumber(Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/Codeword;)Z
    .registers 5
    .param p0, "codeword"    # Lcom/google/zxing/pdf417/decoder/Codeword;
    .param p1, "otherCodeword"    # Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 230
    const/4 v0, 0x0

    if-nez p1, :cond_4

    .line 231
    return v0

    .line 233
    :cond_4
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getBucket()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getBucket()I

    move-result v2

    if-ne v1, v2, :cond_1d

    .line 234
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    .line 235
    const/4 v0, 0x1

    return v0

    .line 237
    :cond_1d
    return v0
.end method

.method private static adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I
    .registers 4
    .param p0, "rowIndicatorRowNumber"    # I
    .param p1, "invalidRowCounts"    # I
    .param p2, "codeword"    # Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 172
    if-nez p2, :cond_3

    .line 173
    return p1

    .line 175
    :cond_3
    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v0

    if-nez v0, :cond_16

    .line 176
    invoke-virtual {p2, p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->isValidRowNumber(I)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 177
    invoke-virtual {p2, p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    .line 178
    const/4 p1, 0x0

    .line 179
    goto :goto_16

    .line 180
    :cond_14
    add-int/lit8 p1, p1, 0x1

    .line 183
    :cond_16
    :goto_16
    return p1
.end method

.method private adjustRowNumbers()I
    .registers 6

    .line 69
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersByRow()I

    move-result v0

    .line 70
    .local v0, "unadjustedCount":I
    if-nez v0, :cond_8

    .line 71
    const/4 v1, 0x0

    return v1

    .line 73
    :cond_8
    const/4 v1, 0x1

    .local v1, "barcodeColumn":I
    :goto_9
    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    if-lt v1, v2, :cond_10

    .line 84
    .end local v1    # "barcodeColumn":I
    return v0

    .line 74
    .restart local v1    # "barcodeColumn":I
    :cond_10
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v2

    .line 75
    .local v2, "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v3, 0x0

    .local v3, "codewordsRow":I
    :goto_19
    array-length v4, v2

    if-lt v3, v4, :cond_1f

    .line 73
    .end local v2    # "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v3    # "codewordsRow":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 76
    .restart local v2    # "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    .restart local v3    # "codewordsRow":I
    :cond_1f
    aget-object v4, v2, v3

    if-nez v4, :cond_24

    .line 77
    goto :goto_2f

    .line 79
    :cond_24
    aget-object v4, v2, v3

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v4

    if-nez v4, :cond_2f

    .line 80
    invoke-direct {p0, v1, v3, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbers(II[Lcom/google/zxing/pdf417/decoder/Codeword;)V

    .line 75
    :cond_2f
    :goto_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_19
.end method

.method private adjustRowNumbers(II[Lcom/google/zxing/pdf417/decoder/Codeword;)V
    .registers 13
    .param p1, "barcodeColumn"    # I
    .param p2, "codewordsRow"    # I
    .param p3, "codewords"    # [Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 187
    aget-object v0, p3, p2

    .line 188
    .local v0, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v2, p1, -0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 189
    .local v1, "previousColumnCodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    move-object v2, v1

    .line 190
    .local v2, "nextColumnCodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v4, p1, 0x1

    aget-object v3, v3, v4

    if-eqz v3, :cond_1f

    .line 191
    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v4, p1, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v2

    .line 194
    :cond_1f
    const/16 v3, 0xe

    new-array v3, v3, [Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 196
    .local v3, "otherCodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    aget-object v4, v1, p2

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 197
    const/4 v4, 0x3

    aget-object v6, v2, p2

    aput-object v6, v3, v4

    .line 199
    const/4 v4, 0x0

    if-lez p2, :cond_44

    .line 200
    add-int/lit8 v6, p2, -0x1

    aget-object v6, p3, v6

    aput-object v6, v3, v4

    .line 201
    const/4 v6, 0x4

    add-int/lit8 v7, p2, -0x1

    aget-object v7, v1, v7

    aput-object v7, v3, v6

    .line 202
    const/4 v6, 0x5

    add-int/lit8 v7, p2, -0x1

    aget-object v7, v2, v7

    aput-object v7, v3, v6

    .line 204
    :cond_44
    const/4 v6, 0x1

    if-le p2, v6, :cond_5f

    .line 205
    const/16 v7, 0x8

    add-int/lit8 v8, p2, -0x2

    aget-object v8, p3, v8

    aput-object v8, v3, v7

    .line 206
    const/16 v7, 0xa

    add-int/lit8 v8, p2, -0x2

    aget-object v8, v1, v8

    aput-object v8, v3, v7

    .line 207
    const/16 v7, 0xb

    add-int/lit8 v8, p2, -0x2

    aget-object v8, v2, v8

    aput-object v8, v3, v7

    .line 209
    :cond_5f
    array-length v7, p3

    sub-int/2addr v7, v6

    if-ge p2, v7, :cond_77

    .line 210
    add-int/lit8 v7, p2, 0x1

    aget-object v7, p3, v7

    aput-object v7, v3, v6

    .line 211
    const/4 v6, 0x6

    add-int/lit8 v7, p2, 0x1

    aget-object v7, v1, v7

    aput-object v7, v3, v6

    .line 212
    const/4 v6, 0x7

    add-int/lit8 v7, p2, 0x1

    aget-object v7, v2, v7

    aput-object v7, v3, v6

    .line 214
    :cond_77
    array-length v6, p3

    sub-int/2addr v6, v5

    if-ge p2, v6, :cond_93

    .line 215
    const/16 v5, 0x9

    add-int/lit8 v6, p2, 0x2

    aget-object v6, p3, v6

    aput-object v6, v3, v5

    .line 216
    const/16 v5, 0xc

    add-int/lit8 v6, p2, 0x2

    aget-object v6, v1, v6

    aput-object v6, v3, v5

    .line 217
    const/16 v5, 0xd

    add-int/lit8 v6, p2, 0x2

    aget-object v6, v2, v6

    aput-object v6, v3, v5

    .line 219
    :cond_93
    array-length v5, v3

    :goto_94
    if-lt v4, v5, :cond_97

    .line 224
    return-void

    .line 219
    :cond_97
    aget-object v6, v3, v4

    .line 220
    .local v6, "otherCodeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    invoke-static {v0, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumber(Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/Codeword;)Z

    move-result v7

    if-eqz v7, :cond_a0

    .line 221
    return-void

    .line 219
    .end local v6    # "otherCodeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_a0
    add-int/lit8 v4, v4, 0x1

    goto :goto_94
.end method

.method private adjustRowNumbersByRow()I
    .registers 3

    .line 88
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromBothRI()V

    .line 93
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromLRI()I

    move-result v0

    .line 94
    .local v0, "unadjustedCount":I
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromRRI()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method private adjustRowNumbersFromBothRI()V
    .registers 8

    .line 98
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-eqz v0, :cond_74

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v0, v0, v2

    if-nez v0, :cond_12

    goto :goto_74

    .line 101
    :cond_12
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    .line 102
    .local v0, "LRIcodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 103
    .local v1, "RRIcodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v2, 0x0

    .local v2, "codewordsRow":I
    :goto_27
    array-length v3, v0

    if-lt v2, v3, :cond_2b

    .line 119
    .end local v2    # "codewordsRow":I
    return-void

    .line 104
    .restart local v2    # "codewordsRow":I
    :cond_2b
    aget-object v3, v0, v2

    if-eqz v3, :cond_71

    .line 105
    aget-object v3, v1, v2

    if-eqz v3, :cond_71

    .line 106
    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    aget-object v4, v1, v2

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v4

    if-ne v3, v4, :cond_71

    .line 107
    const/4 v3, 0x1

    .local v3, "barcodeColumn":I
    :goto_42
    iget v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    if-le v3, v4, :cond_47

    .end local v3    # "barcodeColumn":I
    goto :goto_71

    .line 108
    .restart local v3    # "barcodeColumn":I
    :cond_47
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v4

    aget-object v4, v4, v2

    .line 109
    .local v4, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-nez v4, :cond_54

    .line 110
    goto :goto_6e

    .line 112
    :cond_54
    aget-object v5, v0, v2

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    .line 113
    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v5

    if-nez v5, :cond_6e

    .line 114
    iget-object v5, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v6, v5, v2

    .line 107
    .end local v4    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_6e
    :goto_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    .line 103
    .end local v3    # "barcodeColumn":I
    :cond_71
    :goto_71
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 99
    .end local v0    # "LRIcodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v1    # "RRIcodewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v2    # "codewordsRow":I
    :cond_74
    :goto_74
    return-void
.end method

.method private adjustRowNumbersFromLRI()I
    .registers 9

    .line 147
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-nez v0, :cond_8

    .line 148
    return v1

    .line 150
    :cond_8
    const/4 v0, 0x0

    .line 151
    .local v0, "unadjustedCount":I
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v1, v2, v1

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 152
    .local v1, "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v2, 0x0

    .local v2, "codewordsRow":I
    :goto_12
    array-length v3, v1

    if-lt v2, v3, :cond_16

    .line 168
    .end local v2    # "codewordsRow":I
    return v0

    .line 153
    .restart local v2    # "codewordsRow":I
    :cond_16
    aget-object v3, v1, v2

    if-nez v3, :cond_1b

    .line 154
    goto :goto_48

    .line 156
    :cond_1b
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    .line 157
    .local v3, "rowIndicatorRowNumber":I
    const/4 v4, 0x0

    .line 158
    .local v4, "invalidRowCounts":I
    const/4 v5, 0x1

    .local v5, "barcodeColumn":I
    :goto_23
    iget v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v6, v6, 0x1

    if-ge v5, v6, :cond_48

    const/4 v6, 0x2

    if-lt v4, v6, :cond_2d

    .end local v3    # "rowIndicatorRowNumber":I
    .end local v4    # "invalidRowCounts":I
    .end local v5    # "barcodeColumn":I
    goto :goto_48

    .line 159
    .restart local v3    # "rowIndicatorRowNumber":I
    .restart local v4    # "invalidRowCounts":I
    .restart local v5    # "barcodeColumn":I
    :cond_2d
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v2

    .line 160
    .local v6, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v6, :cond_45

    .line 161
    invoke-static {v3, v4, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I

    move-result v4

    .line 162
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v7

    if-nez v7, :cond_45

    .line 163
    add-int/lit8 v0, v0, 0x1

    .line 158
    .end local v6    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_45
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 152
    .end local v3    # "rowIndicatorRowNumber":I
    .end local v4    # "invalidRowCounts":I
    .end local v5    # "barcodeColumn":I
    :cond_48
    :goto_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method private adjustRowNumbersFromRRI()I
    .registers 9

    .line 122
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    if-nez v0, :cond_c

    .line 123
    const/4 v0, 0x0

    return v0

    .line 125
    :cond_c
    const/4 v0, 0x0

    .line 126
    .local v0, "unadjustedCount":I
    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 127
    .local v1, "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v2, 0x0

    .local v2, "codewordsRow":I
    :goto_1a
    array-length v3, v1

    if-lt v2, v3, :cond_1e

    .line 143
    .end local v2    # "codewordsRow":I
    return v0

    .line 128
    .restart local v2    # "codewordsRow":I
    :cond_1e
    aget-object v3, v1, v2

    if-nez v3, :cond_23

    .line 129
    goto :goto_4f

    .line 131
    :cond_23
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    .line 132
    .local v3, "rowIndicatorRowNumber":I
    const/4 v4, 0x0

    .line 133
    .local v4, "invalidRowCounts":I
    iget v5, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v5, v5, 0x1

    .local v5, "barcodeColumn":I
    :goto_2e
    if-lez v5, :cond_4f

    const/4 v6, 0x2

    if-lt v4, v6, :cond_34

    .end local v3    # "rowIndicatorRowNumber":I
    .end local v4    # "invalidRowCounts":I
    .end local v5    # "barcodeColumn":I
    goto :goto_4f

    .line 134
    .restart local v3    # "rowIndicatorRowNumber":I
    .restart local v4    # "invalidRowCounts":I
    .restart local v5    # "barcodeColumn":I
    :cond_34
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v2

    .line 135
    .local v6, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v6, :cond_4c

    .line 136
    invoke-static {v3, v4, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I

    move-result v4

    .line 137
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v7

    if-nez v7, :cond_4c

    .line 138
    add-int/lit8 v0, v0, 0x1

    .line 133
    .end local v6    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_4c
    add-int/lit8 v5, v5, -0x1

    goto :goto_2e

    .line 127
    .end local v3    # "rowIndicatorRowNumber":I
    .end local v4    # "invalidRowCounts":I
    .end local v5    # "barcodeColumn":I
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a
.end method


# virtual methods
.method getBarcodeColumnCount()I
    .registers 2

    .line 241
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    return v0
.end method

.method getBarcodeECLevel()I
    .registers 2

    .line 249
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v0

    return v0
.end method

.method getBarcodeRowCount()I
    .registers 2

    .line 245
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v0

    return v0
.end method

.method getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 2

    .line 257
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    return-object v0
.end method

.method getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .registers 3
    .param p1, "barcodeColumn"    # I

    .line 265
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v0, v0, p1

    return-object v0
.end method

.method getDetectionResultColumns()[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .registers 4

    .line 43
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    .line 44
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    .line 45
    const/16 v0, 0x3a0

    .line 48
    .local v0, "unadjustedCodewordCount":I
    :cond_15
    move v1, v0

    .line 49
    .local v1, "previousUnadjustedCount":I
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbers()I

    move-result v0

    .line 50
    if-lez v0, :cond_1e

    .line 47
    if-lt v0, v1, :cond_15

    .line 51
    :cond_1e
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    return-object v2
.end method

.method public setBoundingBox(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .registers 2
    .param p1, "boundingBox"    # Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 253
    iput-object p1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 254
    return-void
.end method

.method setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V
    .registers 4
    .param p1, "barcodeColumn"    # I
    .param p2, "detectionResultColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    .line 261
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aput-object p2, v0, p1

    .line 262
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 11

    .line 270
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 271
    .local v0, "rowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    const/4 v2, 0x1

    if-nez v0, :cond_f

    .line 272
    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/2addr v4, v2

    aget-object v0, v3, v4

    .line 274
    :cond_f
    new-instance v3, Ljava/util/Formatter;

    invoke-direct {v3}, Ljava/util/Formatter;-><init>()V

    .line 275
    .local v3, "formatter":Ljava/util/Formatter;
    const/4 v4, 0x0

    .local v4, "codewordsRow":I
    :goto_15
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    array-length v5, v5

    if-lt v4, v5, :cond_24

    .line 291
    .end local v4    # "codewordsRow":I
    invoke-virtual {v3}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/Formatter;->close()V

    .line 293
    return-object v1

    .line 276
    .end local v1    # "result":Ljava/lang/String;
    .restart local v4    # "codewordsRow":I
    :cond_24
    const-string v5, "CW %3d:"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {v3, v5, v6}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 277
    const/4 v5, 0x0

    .local v5, "barcodeColumn":I
    :goto_32
    iget v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    const/4 v7, 0x2

    add-int/2addr v6, v7

    if-lt v5, v6, :cond_42

    .line 289
    .end local v5    # "barcodeColumn":I
    const-string v5, "%n"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v6}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 275
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 278
    .restart local v5    # "barcodeColumn":I
    :cond_42
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    if-nez v6, :cond_50

    .line 279
    const-string v6, "    |   "

    new-array v7, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v6, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 280
    goto :goto_7f

    .line 282
    :cond_50
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v4

    .line 283
    .local v6, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-nez v6, :cond_64

    .line 284
    const-string v7, "    |   "

    new-array v8, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v7, v8}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 285
    goto :goto_7f

    .line 287
    :cond_64
    const-string v8, " %3d|%3d"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v1

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v2

    invoke-virtual {v3, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 277
    .end local v6    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :goto_7f
    add-int/lit8 v5, v5, 0x1

    goto :goto_32
.end method
