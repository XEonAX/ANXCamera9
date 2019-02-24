.class public final Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;
.super Ljava/lang/Object;
.source "PDF417ScanningDecoder.java"


# static fields
.field private static final CODEWORD_SKEW_SIZE:I = 0x2

.field private static final MAX_EC_CODEWORDS:I = 0x200

.field private static final MAX_ERRORS:I = 0x3

.field private static final errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 42
    new-instance v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    invoke-direct {v0}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;-><init>()V

    sput-object v0, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method private static adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 8
    .param p0, "rowIndicatorColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 143
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 144
    return-object v0

    .line 146
    :cond_4
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getRowHeights()[I

    move-result-object v1

    .line 147
    .local v1, "rowHeights":[I
    if-nez v1, :cond_b

    .line 148
    return-object v0

    .line 150
    :cond_b
    invoke-static {v1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getMax([I)I

    move-result v0

    .line 151
    .local v0, "maxRowHeight":I
    const/4 v2, 0x0

    .line 152
    .local v2, "missingStartRows":I
    array-length v3, v1

    const/4 v4, 0x0

    :goto_12
    if-lt v4, v3, :cond_15

    goto :goto_1d

    :cond_15
    aget v5, v1, v4

    .line 153
    .local v5, "rowHeight":I
    sub-int v6, v0, v5

    add-int/2addr v2, v6

    .line 154
    if-lez v5, :cond_5f

    .line 155
    nop

    .line 158
    .end local v5    # "rowHeight":I
    :goto_1d
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    .line 159
    .local v5, "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v3, 0x0

    .local v3, "row":I
    move v6, v2

    .end local v2    # "missingStartRows":I
    .local v6, "missingStartRows":I
    :goto_23
    if-lez v6, :cond_2f

    aget-object v2, v5, v3

    if-eqz v2, :cond_2a

    .end local v3    # "row":I
    goto :goto_2f

    .line 160
    .restart local v3    # "row":I
    :cond_2a
    add-int/lit8 v6, v6, -0x1

    .line 159
    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    .line 162
    .end local v3    # "row":I
    :cond_2f
    :goto_2f
    const/4 v2, 0x0

    .line 163
    .local v2, "missingEndRows":I
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    .restart local v3    # "row":I
    :goto_33
    if-gez v3, :cond_36

    .end local v3    # "row":I
    goto :goto_40

    .line 164
    .restart local v3    # "row":I
    :cond_36
    aget v4, v1, v3

    sub-int v4, v0, v4

    add-int/2addr v2, v4

    .line 165
    aget v4, v1, v3

    if-lez v4, :cond_5c

    .line 166
    nop

    .line 169
    .end local v3    # "row":I
    :goto_40
    array-length v3, v5

    add-int/lit8 v3, v3, -0x1

    .restart local v3    # "row":I
    :goto_43
    if-lez v2, :cond_4f

    aget-object v4, v5, v3

    if-eqz v4, :cond_4a

    .end local v3    # "row":I
    goto :goto_4f

    .line 170
    .restart local v3    # "row":I
    :cond_4a
    add-int/lit8 v2, v2, -0x1

    .line 169
    add-int/lit8 v3, v3, -0x1

    goto :goto_43

    .line 172
    .end local v3    # "row":I
    :cond_4f
    :goto_4f
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    .line 173
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft()Z

    move-result v4

    .line 172
    invoke-virtual {v3, v6, v2, v4}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->addMissingRows(IIZ)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    return-object v3

    .line 163
    .restart local v3    # "row":I
    :cond_5c
    add-int/lit8 v3, v3, -0x1

    goto :goto_33

    .line 152
    .end local v3    # "row":I
    .end local v5    # "codewords":[Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v6    # "missingStartRows":I
    .local v2, "missingStartRows":I
    :cond_5f
    add-int/lit8 v4, v4, 0x1

    goto :goto_12
.end method

.method private static adjustCodewordCount(Lcom/google/zxing/pdf417/decoder/DetectionResult;[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)V
    .registers 7
    .param p0, "detectionResult"    # Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .param p1, "barcodeMatrix"    # [[Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 235
    const/4 v0, 0x0

    aget-object v1, p1, v0

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v1

    .line 236
    .local v1, "numberOfCodewords":[I
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v3

    .line 237
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v4

    .line 236
    mul-int/2addr v3, v4

    .line 238
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeECLevel()I

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getNumberOfECCodeWords(I)I

    move-result v4

    .line 236
    sub-int/2addr v3, v4

    .line 239
    .local v3, "calculatedNumberOfCodewords":I
    array-length v4, v1

    if-nez v4, :cond_32

    .line 240
    if-lt v3, v2, :cond_2d

    const/16 v4, 0x3a0

    if-gt v3, v4, :cond_2d

    .line 243
    aget-object v0, p1, v0

    aget-object v0, v0, v2

    invoke-virtual {v0, v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    .line 244
    goto :goto_3d

    .line 241
    :cond_2d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 244
    :cond_32
    aget v4, v1, v0

    if-eq v4, v3, :cond_3d

    .line 246
    aget-object v0, p1, v0

    aget-object v0, v0, v2

    invoke-virtual {v0, v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    .line 248
    :cond_3d
    :goto_3d
    return-void
.end method

.method private static adjustCodewordStartColumn(Lcom/google/zxing/common/BitMatrix;IIZII)I
    .registers 12
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "minColumn"    # I
    .param p2, "maxColumn"    # I
    .param p3, "leftToRight"    # Z
    .param p4, "codewordStartColumn"    # I
    .param p5, "imageRow"    # I

    .line 497
    move v0, p4

    .line 498
    .local v0, "correctedStartColumn":I
    const/4 v1, 0x1

    if-eqz p3, :cond_6

    const/4 v2, -0x1

    goto :goto_7

    :cond_6
    move v2, v1

    .line 500
    .local v2, "increment":I
    :goto_7
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    const/4 v4, 0x2

    if-lt v3, v4, :cond_c

    .line 511
    .end local v3    # "i":I
    return v0

    .line 501
    .restart local v3    # "i":I
    :cond_c
    :goto_c
    if-eqz p3, :cond_10

    if-ge v0, p1, :cond_14

    :cond_10
    if-nez p3, :cond_26

    if-ge v0, p2, :cond_26

    .line 502
    :cond_14
    invoke-virtual {p0, v0, p5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eq p3, v5, :cond_1b

    goto :goto_26

    .line 503
    :cond_1b
    sub-int v5, p4, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-le v5, v4, :cond_24

    .line 504
    return p4

    .line 506
    :cond_24
    add-int/2addr v0, v2

    goto :goto_c

    .line 508
    :cond_26
    :goto_26
    neg-int v2, v2

    .line 509
    if-eqz p3, :cond_2b

    const/4 v4, 0x0

    goto :goto_2c

    :cond_2b
    move v4, v1

    :goto_2c
    move p3, v4

    .line 500
    add-int/lit8 v3, v3, 0x1

    goto :goto_8
.end method

.method private static checkCodewordSkew(III)Z
    .registers 4
    .param p0, "codewordSize"    # I
    .param p1, "minCodewordWidth"    # I
    .param p2, "maxCodewordWidth"    # I

    .line 515
    add-int/lit8 v0, p1, -0x2

    if-gt v0, p0, :cond_a

    .line 516
    add-int/lit8 v0, p2, 0x2

    .line 515
    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method private static correctErrors([I[II)I
    .registers 5
    .param p0, "codewords"    # [I
    .param p1, "erasures"    # [I
    .param p2, "numECCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 546
    if-eqz p1, :cond_9

    .line 547
    array-length v0, p1

    div-int/lit8 v1, p2, 0x2

    add-int/lit8 v1, v1, 0x3

    if-gt v0, v1, :cond_16

    .line 548
    :cond_9
    if-ltz p2, :cond_16

    .line 549
    const/16 v0, 0x200

    if-gt p2, v0, :cond_16

    .line 553
    sget-object v0, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    invoke-virtual {v0, p0, p2, p1}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->decode([II[I)I

    move-result v0

    return v0

    .line 551
    :cond_16
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v0

    throw v0
.end method

.method private static createBarcodeMatrix(Lcom/google/zxing/pdf417/decoder/DetectionResult;)[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    .registers 15
    .param p0, "detectionResult"    # Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 331
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v1, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    .line 330
    nop

    .line 332
    .local v0, "barcodeMatrix":[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    const/4 v1, 0x0

    .local v1, "row":I
    :goto_18
    array-length v2, v0

    if-lt v1, v2, :cond_5a

    .line 338
    .end local v1    # "row":I
    const/4 v1, 0x0

    .line 339
    .local v1, "column":I
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumns()[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v1

    move v1, v4

    .end local v1    # "column":I
    .local v5, "column":I
    :goto_24
    if-lt v1, v3, :cond_27

    .line 355
    return-object v0

    .line 339
    :cond_27
    aget-object v6, v2, v1

    .line 340
    .local v6, "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    if-eqz v6, :cond_55

    .line 341
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v7

    array-length v8, v7

    move v9, v4

    :goto_31
    if-lt v9, v8, :cond_34

    goto :goto_55

    :cond_34
    aget-object v10, v7, v9

    .line 342
    .local v10, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v10, :cond_52

    .line 343
    invoke-virtual {v10}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v11

    .line 344
    .local v11, "rowNumber":I
    if-ltz v11, :cond_52

    .line 345
    array-length v12, v0

    if-ge v11, v12, :cond_4d

    .line 348
    aget-object v12, v0, v11

    aget-object v12, v12, v5

    invoke-virtual {v10}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    .end local v10    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v11    # "rowNumber":I
    goto :goto_52

    .line 346
    .restart local v10    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    .restart local v11    # "rowNumber":I
    :cond_4d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 341
    .end local v10    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    .end local v11    # "rowNumber":I
    :cond_52
    :goto_52
    add-int/lit8 v9, v9, 0x1

    goto :goto_31

    .line 353
    :cond_55
    :goto_55
    add-int/lit8 v5, v5, 0x1

    .line 339
    .end local v6    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 333
    .end local v5    # "column":I
    .local v1, "row":I
    :cond_5a
    const/4 v2, 0x0

    .local v2, "column":I
    :goto_5b
    aget-object v3, v0, v1

    array-length v3, v3

    if-lt v2, v3, :cond_63

    .line 332
    .end local v2    # "column":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 334
    .restart local v2    # "column":I
    :cond_63
    aget-object v3, v0, v1

    new-instance v4, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    aput-object v4, v3, v2

    .line 333
    add-int/lit8 v2, v2, 0x1

    goto :goto_5b
.end method

.method private static createDecoderResult(Lcom/google/zxing/pdf417/decoder/DetectionResult;)Lcom/google/zxing/common/DecoderResult;
    .registers 12
    .param p0, "detectionResult"    # Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 252
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createBarcodeMatrix(Lcom/google/zxing/pdf417/decoder/DetectionResult;)[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    move-result-object v0

    .line 253
    .local v0, "barcodeMatrix":[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    invoke-static {p0, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustCodewordCount(Lcom/google/zxing/pdf417/decoder/DetectionResult;[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)V

    .line 254
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .local v1, "erasures":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v3

    mul-int/2addr v2, v3

    new-array v2, v2, [I

    .line 256
    .local v2, "codewords":[I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 257
    .local v3, "ambiguousIndexValuesList":Ljava/util/List;, "Ljava/util/List<[I>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 258
    .local v4, "ambiguousIndexesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v5, 0x0

    .local v5, "row":I
    :goto_22
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v6

    if-lt v5, v6, :cond_4e

    .line 272
    .end local v5    # "row":I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v6, v5, [[I

    .line 273
    .local v6, "ambiguousIndexValues":[[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2f
    array-length v7, v6

    if-lt v5, v7, :cond_43

    .line 276
    .end local v5    # "i":I
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeECLevel()I

    move-result v5

    .line 277
    invoke-static {v1}, Lcom/google/zxing/pdf417/PDF417Common;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v7

    invoke-static {v4}, Lcom/google/zxing/pdf417/PDF417Common;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v8

    .line 276
    invoke-static {v5, v2, v7, v8, v6}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createDecoderResultFromAmbiguousValues(I[I[I[I[[I)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    return-object v5

    .line 274
    .restart local v5    # "i":I
    :cond_43
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    aput-object v7, v6, v5

    .line 273
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 259
    .end local v6    # "ambiguousIndexValues":[[I
    .local v5, "row":I
    :cond_4e
    const/4 v6, 0x0

    .local v6, "column":I
    :goto_4f
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v7

    if-lt v6, v7, :cond_58

    .line 258
    .end local v6    # "column":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_22

    .line 260
    .restart local v6    # "column":I
    :cond_58
    aget-object v7, v0, v5

    add-int/lit8 v8, v6, 0x1

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v7

    .line 261
    .local v7, "values":[I
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v8

    mul-int/2addr v8, v5

    add-int/2addr v8, v6

    .line 262
    .local v8, "codewordIndex":I
    array-length v9, v7

    if-nez v9, :cond_73

    .line 263
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v1, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 264
    goto :goto_87

    :cond_73
    array-length v9, v7

    const/4 v10, 0x1

    if-ne v9, v10, :cond_7d

    .line 265
    const/4 v9, 0x0

    aget v9, v7, v9

    aput v9, v2, v8

    .line 266
    goto :goto_87

    .line 267
    :cond_7d
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    .end local v7    # "values":[I
    .end local v8    # "codewordIndex":I
    :goto_87
    add-int/lit8 v6, v6, 0x1

    goto :goto_4f
.end method

.method private static createDecoderResultFromAmbiguousValues(I[I[I[I[[I)Lcom/google/zxing/common/DecoderResult;
    .registers 11
    .param p0, "ecLevel"    # I
    .param p1, "codewords"    # [I
    .param p2, "erasureArray"    # [I
    .param p3, "ambiguousIndexes"    # [I
    .param p4, "ambiguousIndexValues"    # [[I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 299
    array-length v0, p3

    new-array v0, v0, [I

    .line 301
    .local v0, "ambiguousIndexCount":[I
    const/16 v1, 0x64

    .line 302
    .local v1, "tries":I
    :goto_5
    add-int/lit8 v2, v1, -0x1

    .local v2, "tries":I
    if-lez v1, :cond_4f

    .line 303
    .end local v1    # "tries":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v3, v0

    if-lt v1, v3, :cond_42

    .line 307
    .end local v1    # "i":I
    :try_start_d
    invoke-static {p1, p0, p2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->decodeCodewords([II[I)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1
    :try_end_11
    .catch Lcom/google/zxing/ChecksumException; {:try_start_d .. :try_end_11} :catch_12

    return-object v1

    .line 308
    :catch_12
    move-exception v1

    .line 311
    array-length v1, v0

    if-eqz v1, :cond_3d

    .line 314
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_17
    array-length v3, v0

    if-lt v1, v3, :cond_1b

    .end local v1    # "i":I
    goto :goto_2b

    .line 315
    .restart local v1    # "i":I
    :cond_1b
    aget v3, v0, v1

    aget-object v4, p4, v1

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_2d

    .line 316
    aget v3, v0, v1

    add-int/lit8 v3, v3, 0x1

    aput v3, v0, v1

    .line 317
    nop

    .line 302
    .end local v1    # "i":I
    :goto_2b
    move v1, v2

    goto :goto_5

    .line 319
    .restart local v1    # "i":I
    :cond_2d
    const/4 v3, 0x0

    aput v3, v0, v1

    .line 320
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-eq v1, v3, :cond_38

    .line 314
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 321
    :cond_38
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v3

    throw v3

    .line 312
    .end local v1    # "i":I
    :cond_3d
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v1

    throw v1

    .line 304
    .restart local v1    # "i":I
    :cond_42
    aget v3, p3, v1

    aget-object v4, p4, v1

    aget v5, v0, v1

    aget v4, v4, v5

    aput v4, p1, v3

    .line 303
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 326
    .end local v1    # "i":I
    :cond_4f
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v1

    throw v1
.end method

.method public static decode(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/DecoderResult;
    .registers 29
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "imageTopLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "imageBottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "imageTopRight"    # Lcom/google/zxing/ResultPoint;
    .param p4, "imageBottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "minCodewordWidth"    # I
    .param p6, "maxCodewordWidth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 58
    new-instance v6, Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-object v0, v6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    .line 59
    .local v0, "boundingBox":Lcom/google/zxing/pdf417/decoder/BoundingBox;
    const/4 v1, 0x0

    .line 60
    .local v1, "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    const/4 v2, 0x0

    .line 61
    .local v2, "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    const/4 v3, 0x0

    .line 62
    .local v3, "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_14
    const/4 v5, 0x2

    if-lt v4, v5, :cond_1b

    .line 84
    .end local v1    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v2    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v3    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .end local v4    # "i":I
    .local v5, "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .local v6, "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .local v7, "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    :goto_17
    move-object v6, v1

    move-object v7, v2

    move-object v5, v3

    goto :goto_73

    .line 63
    .end local v5    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .end local v6    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v7    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .restart local v1    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .restart local v2    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .restart local v3    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .restart local v4    # "i":I
    :cond_1b
    if-eqz p1, :cond_2c

    .line 64
    const/4 v8, 0x1

    .line 65
    nop

    .line 64
    move-object/from16 v5, p0

    move-object v6, v0

    move-object/from16 v7, p1

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    move-result-object v1

    .line 67
    :cond_2c
    if-eqz p3, :cond_3d

    .line 68
    const/4 v8, 0x0

    .line 69
    nop

    .line 68
    move-object/from16 v5, p0

    move-object v6, v0

    move-object/from16 v7, p3

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    move-result-object v2

    .line 71
    :cond_3d
    invoke-static {v1, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->merge(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/DetectionResult;

    move-result-object v3

    .line 72
    if-eqz v3, :cond_12f

    .line 75
    if-nez v4, :cond_6f

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    if-eqz v5, :cond_6f

    .line 76
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v6

    if-lt v5, v6, :cond_67

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    .line 77
    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v6

    if-le v5, v6, :cond_6f

    .line 78
    :cond_67
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    .line 79
    nop

    .line 62
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 80
    :cond_6f
    invoke-virtual {v3, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setBoundingBox(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    .line 81
    goto :goto_17

    .line 84
    .end local v1    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v2    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v3    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .end local v4    # "i":I
    .restart local v5    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .restart local v6    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .restart local v7    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    :goto_73
    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v1

    const/4 v8, 0x1

    add-int/lit8 v9, v1, 0x1

    .line 85
    .local v9, "maxBarcodeColumn":I
    const/4 v10, 0x0

    invoke-virtual {v5, v10, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    .line 86
    invoke-virtual {v5, v9, v7}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    .line 88
    if-eqz v6, :cond_85

    move v1, v8

    goto :goto_86

    :cond_85
    move v1, v10

    .line 89
    .local v1, "leftToRight":Z
    :goto_86
    const/4 v2, 0x1

    .local v2, "barcodeColumnCount":I
    move/from16 v3, p5

    move/from16 v4, p6

    .end local p5    # "minCodewordWidth":I
    .end local p6    # "maxCodewordWidth":I
    .local v3, "minCodewordWidth":I
    .local v4, "maxCodewordWidth":I
    :goto_8b
    if-le v2, v9, :cond_92

    .line 123
    .end local v2    # "barcodeColumnCount":I
    invoke-static {v5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createDecoderResult(Lcom/google/zxing/pdf417/decoder/DetectionResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    .line 90
    .restart local v2    # "barcodeColumnCount":I
    :cond_92
    if-eqz v1, :cond_96

    move v11, v2

    goto :goto_98

    :cond_96
    sub-int v11, v9, v2

    :goto_98
    move v13, v11

    .line 91
    .local v13, "barcodeColumn":I
    invoke-virtual {v5, v13}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v11

    if-eqz v11, :cond_a0

    .line 93
    goto :goto_d0

    .line 96
    :cond_a0
    if-eqz v13, :cond_ab

    if-ne v13, v9, :cond_a5

    goto :goto_ab

    .line 99
    :cond_a5
    new-instance v11, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    invoke-direct {v11, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    goto :goto_b6

    .line 97
    :cond_ab
    :goto_ab
    new-instance v11, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    if-nez v13, :cond_b1

    move v12, v8

    goto :goto_b2

    :cond_b1
    move v12, v10

    :goto_b2
    invoke-direct {v11, v0, v12}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;Z)V

    .line 98
    .local v11, "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    nop

    .line 99
    :goto_b6
    move-object v12, v11

    .line 101
    .end local v11    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .local v12, "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    invoke-virtual {v5, v13, v12}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    .line 102
    const/4 v11, -0x1

    .line 103
    .local v11, "startColumn":I
    move v14, v11

    .line 105
    .local v14, "previousStartColumn":I
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v15

    .local v15, "imageRow":I
    move/from16 v19, v3

    move/from16 v20, v4

    move v4, v14

    move v3, v15

    .end local v14    # "previousStartColumn":I
    .end local v15    # "imageRow":I
    .local v3, "imageRow":I
    .local v4, "previousStartColumn":I
    .local v19, "minCodewordWidth":I
    .local v20, "maxCodewordWidth":I
    :goto_c6
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v8

    if-le v3, v8, :cond_d4

    .line 89
    .end local v3    # "imageRow":I
    .end local v4    # "previousStartColumn":I
    .end local v11    # "startColumn":I
    .end local v12    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .end local v13    # "barcodeColumn":I
    move/from16 v3, v19

    move/from16 v4, v20

    .end local v19    # "minCodewordWidth":I
    .end local v20    # "maxCodewordWidth":I
    .local v3, "minCodewordWidth":I
    .local v4, "maxCodewordWidth":I
    :goto_d0
    add-int/lit8 v2, v2, 0x1

    const/4 v8, 0x1

    goto :goto_8b

    .line 106
    .local v3, "imageRow":I
    .local v4, "previousStartColumn":I
    .restart local v11    # "startColumn":I
    .restart local v12    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .restart local v13    # "barcodeColumn":I
    .restart local v19    # "minCodewordWidth":I
    .restart local v20    # "maxCodewordWidth":I
    :cond_d4
    invoke-static {v5, v13, v3, v1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getStartColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;IIZ)I

    move-result v8

    .line 107
    .end local v11    # "startColumn":I
    .local v8, "startColumn":I
    if-ltz v8, :cond_e0

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v11

    if-le v8, v11, :cond_ea

    .line 108
    :cond_e0
    const/4 v11, -0x1

    if-ne v4, v11, :cond_e9

    .line 109
    nop

    .line 105
    move v11, v8

    move-object v10, v12

    move/from16 v21, v13

    goto :goto_127

    .line 111
    :cond_e9
    move v8, v4

    .line 113
    :cond_ea
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinX()I

    move-result v14

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v15

    .line 114
    nop

    .line 113
    move-object/from16 v11, p0

    move-object v10, v12

    move v12, v14

    .end local v12    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .local v10, "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    move/from16 v21, v13

    move v13, v15

    .end local v13    # "barcodeColumn":I
    .local v21, "barcodeColumn":I
    move v14, v1

    move v15, v8

    move/from16 v16, v3

    move/from16 v17, v19

    move/from16 v18, v20

    invoke-static/range {v11 .. v18}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v11

    .line 115
    .local v11, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v11, :cond_122

    .line 116
    invoke-virtual {v10, v3, v11}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->setCodeword(ILcom/google/zxing/pdf417/decoder/Codeword;)V

    .line 117
    move v4, v8

    .line 118
    invoke-virtual {v11}, Lcom/google/zxing/pdf417/decoder/Codeword;->getWidth()I

    move-result v12

    move/from16 v13, v19

    invoke-static {v13, v12}, Ljava/lang/Math;->min(II)I

    move-result v19

    .line 119
    invoke-virtual {v11}, Lcom/google/zxing/pdf417/decoder/Codeword;->getWidth()I

    move-result v12

    move/from16 v13, v20

    invoke-static {v13, v12}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 105
    .end local v11    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    move v11, v8

    goto :goto_127

    :cond_122
    move/from16 v13, v19

    move/from16 v11, v20

    move v11, v8

    .end local v8    # "startColumn":I
    .local v11, "startColumn":I
    :goto_127
    add-int/lit8 v3, v3, 0x1

    move-object v12, v10

    move/from16 v13, v21

    const/4 v8, 0x1

    const/4 v10, 0x0

    goto :goto_c6

    .line 73
    .end local v5    # "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .end local v6    # "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v7    # "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .end local v9    # "maxBarcodeColumn":I
    .end local v10    # "detectionResultColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .end local v11    # "startColumn":I
    .end local v19    # "minCodewordWidth":I
    .end local v20    # "maxCodewordWidth":I
    .end local v21    # "barcodeColumn":I
    .local v1, "leftRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .local v2, "rightRowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .local v3, "detectionResult":Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .local v4, "i":I
    .restart local p5    # "minCodewordWidth":I
    .restart local p6    # "maxCodewordWidth":I
    :cond_12f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private static decodeCodewords([II[I)Lcom/google/zxing/common/DecoderResult;
    .registers 7
    .param p0, "codewords"    # [I
    .param p1, "ecLevel"    # I
    .param p2, "erasures"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 521
    array-length v0, p0

    if-eqz v0, :cond_27

    .line 525
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    shl-int v0, v1, v0

    .line 526
    .local v0, "numECCodewords":I
    invoke-static {p0, p2, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->correctErrors([I[II)I

    move-result v1

    .line 527
    .local v1, "correctedErrorsCount":I
    invoke-static {p0, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->verifyCodewordCount([II)V

    .line 530
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    .line 531
    .local v2, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/common/DecoderResult;->setErrorsCorrected(Ljava/lang/Integer;)V

    .line 532
    array-length v3, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/common/DecoderResult;->setErasures(Ljava/lang/Integer;)V

    .line 533
    return-object v2

    .line 522
    .end local v0    # "numECCodewords":I
    .end local v1    # "correctedErrorsCount":I
    .end local v2    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    :cond_27
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;
    .registers 15
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "minColumn"    # I
    .param p2, "maxColumn"    # I
    .param p3, "leftToRight"    # Z
    .param p4, "startColumn"    # I
    .param p5, "imageRow"    # I
    .param p6, "minCodewordWidth"    # I
    .param p7, "maxCodewordWidth"    # I

    .line 409
    invoke-static/range {p0 .. p5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustCodewordStartColumn(Lcom/google/zxing/common/BitMatrix;IIZII)I

    move-result p4

    .line 414
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getModuleBitCount(Lcom/google/zxing/common/BitMatrix;IIZII)[I

    move-result-object v0

    .line 415
    .local v0, "moduleBitCount":[I
    const/4 v1, 0x0

    if-nez v0, :cond_12

    .line 416
    return-object v1

    .line 419
    :cond_12
    invoke-static {v0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v2

    .line 420
    .local v2, "codewordBitCount":I
    if-eqz p3, :cond_1b

    .line 421
    add-int v3, p4, v2

    .line 422
    .local v3, "endColumn":I
    goto :goto_24

    .line 423
    .end local v3    # "endColumn":I
    :cond_1b
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    array-length v4, v0

    div-int/lit8 v4, v4, 0x2

    if-lt v3, v4, :cond_41

    .line 428
    .end local v3    # "i":I
    move v3, p4

    .line 429
    .local v3, "endColumn":I
    sub-int p4, v3, v2

    .line 445
    :goto_24
    invoke-static {v2, p6, p7}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->checkCodewordSkew(III)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 448
    return-object v1

    .line 451
    :cond_2b
    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getDecodedValue([I)I

    move-result v4

    .line 452
    .local v4, "decodedValue":I
    invoke-static {v4}, Lcom/google/zxing/pdf417/PDF417Common;->getCodeword(I)I

    move-result v5

    .line 453
    .local v5, "codeword":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_37

    .line 454
    return-object v1

    .line 456
    :cond_37
    new-instance v1, Lcom/google/zxing/pdf417/decoder/Codeword;

    invoke-static {v4}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getCodewordBucketNumber(I)I

    move-result v6

    invoke-direct {v1, p4, v3, v6, v5}, Lcom/google/zxing/pdf417/decoder/Codeword;-><init>(IIII)V

    return-object v1

    .line 424
    .end local v4    # "decodedValue":I
    .end local v5    # "codeword":I
    .local v3, "i":I
    :cond_41
    aget v4, v0, v3

    .line 425
    .local v4, "tmpCount":I
    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v3

    aget v5, v0, v5

    aput v5, v0, v3

    .line 426
    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v3

    aput v4, v0, v5

    .line 423
    .end local v4    # "tmpCount":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c
.end method

.method private static getBarcodeMetadata(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    .registers 7
    .param p0, "leftRowIndicatorColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .param p1, "rightRowIndicatorColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    .line 187
    const/4 v0, 0x0

    if-eqz p0, :cond_38

    .line 188
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    move-object v2, v1

    .local v2, "leftBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    if-nez v1, :cond_b

    .end local v2    # "leftBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    goto :goto_38

    .line 189
    .restart local v2    # "leftBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    :cond_b
    nop

    .line 192
    if-eqz p1, :cond_37

    .line 193
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    move-object v3, v1

    .local v3, "rightBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    if-nez v1, :cond_16

    .end local v3    # "rightBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    goto :goto_37

    .line 194
    .restart local v3    # "rightBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    :cond_16
    nop

    .line 197
    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v4

    if-eq v1, v4, :cond_36

    .line 198
    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v4

    if-eq v1, v4, :cond_36

    .line 199
    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v4

    if-eq v1, v4, :cond_36

    .line 200
    return-object v0

    .line 202
    :cond_36
    return-object v2

    .line 194
    .end local v3    # "rightBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    :cond_37
    :goto_37
    return-object v2

    .line 189
    .end local v2    # "leftBarcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    :cond_38
    :goto_38
    if-nez p1, :cond_3b

    goto :goto_3f

    :cond_3b
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v0

    :goto_3f
    return-object v0
.end method

.method private static getBitCountForCodeword(I)[I
    .registers 5
    .param p0, "codeword"    # I

    .line 583
    const/16 v0, 0x8

    new-array v0, v0, [I

    .line 584
    .local v0, "result":[I
    const/4 v1, 0x0

    .line 585
    .local v1, "previousValue":I
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    .line 587
    .local v2, "i":I
    :goto_8
    and-int/lit8 v3, p0, 0x1

    if-eq v3, v1, :cond_14

    .line 588
    and-int/lit8 v1, p0, 0x1

    .line 589
    add-int/lit8 v2, v2, -0x1

    .line 590
    if-gez v2, :cond_14

    .line 591
    nop

    .line 597
    return-object v0

    .line 594
    :cond_14
    aget v3, v0, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v0, v2

    .line 595
    shr-int/lit8 p0, p0, 0x1

    .line 586
    goto :goto_8
.end method

.method private static getCodewordBucketNumber(I)I
    .registers 2
    .param p0, "codeword"    # I

    .line 601
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getBitCountForCodeword(I)[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getCodewordBucketNumber([I)I

    move-result v0

    return v0
.end method

.method private static getCodewordBucketNumber([I)I
    .registers 3
    .param p0, "moduleBitCount"    # [I

    .line 605
    const/4 v0, 0x0

    aget v0, p0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    sub-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p0, v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p0, v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x9

    rem-int/lit8 v0, v0, 0x9

    return v0
.end method

.method private static getMax([I)I
    .registers 5
    .param p0, "values"    # [I

    .line 177
    const/4 v0, -0x1

    .line 178
    .local v0, "maxValue":I
    array-length v1, p0

    const/4 v2, 0x0

    :goto_3
    if-lt v2, v1, :cond_6

    .line 181
    return v0

    .line 178
    :cond_6
    aget v3, p0, v2

    .line 179
    .local v3, "value":I
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 178
    .end local v3    # "value":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method private static getModuleBitCount(Lcom/google/zxing/common/BitMatrix;IIZII)[I
    .registers 13
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "minColumn"    # I
    .param p2, "maxColumn"    # I
    .param p3, "leftToRight"    # Z
    .param p4, "startColumn"    # I
    .param p5, "imageRow"    # I

    .line 465
    move v0, p4

    .line 466
    .local v0, "imageColumn":I
    const/16 v1, 0x8

    new-array v1, v1, [I

    .line 467
    .local v1, "moduleBitCount":[I
    const/4 v2, 0x0

    .line 468
    .local v2, "moduleNumber":I
    const/4 v3, 0x1

    if-eqz p3, :cond_b

    move v4, v3

    goto :goto_c

    :cond_b
    const/4 v4, -0x1

    .line 469
    .local v4, "increment":I
    :goto_c
    move v5, p3

    .line 470
    .local v5, "previousPixelValue":Z
    :goto_d
    if-eqz p3, :cond_11

    if-lt v0, p2, :cond_15

    :cond_11
    if-nez p3, :cond_2f

    if-lt v0, p1, :cond_2f

    .line 471
    :cond_15
    array-length v6, v1

    .line 470
    if-lt v2, v6, :cond_19

    goto :goto_2f

    .line 472
    :cond_19
    invoke-virtual {p0, v0, p5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-ne v6, v5, :cond_26

    .line 473
    aget v6, v1, v2

    add-int/2addr v6, v3

    aput v6, v1, v2

    .line 474
    add-int/2addr v0, v4

    .line 475
    goto :goto_d

    .line 476
    :cond_26
    add-int/lit8 v2, v2, 0x1

    .line 477
    if-eqz v5, :cond_2c

    const/4 v6, 0x0

    goto :goto_2d

    :cond_2c
    move v6, v3

    :goto_2d
    move v5, v6

    goto :goto_d

    .line 480
    :cond_2f
    :goto_2f
    array-length v6, v1

    if-eq v2, v6, :cond_41

    .line 481
    if-eqz p3, :cond_36

    if-eq v0, p2, :cond_3a

    :cond_36
    if-nez p3, :cond_3f

    if-ne v0, p1, :cond_3f

    :cond_3a
    array-length v6, v1

    sub-int/2addr v6, v3

    if-ne v2, v6, :cond_3f

    goto :goto_41

    .line 484
    :cond_3f
    const/4 v3, 0x0

    return-object v3

    .line 482
    :cond_41
    :goto_41
    return-object v1
.end method

.method private static getNumberOfECCodeWords(I)I
    .registers 2
    .param p0, "barcodeECLevel"    # I

    .line 488
    const/4 v0, 0x2

    shl-int/2addr v0, p0

    return v0
.end method

.method private static getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .registers 21
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "boundingBox"    # Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .param p2, "startPoint"    # Lcom/google/zxing/ResultPoint;
    .param p3, "leftToRight"    # Z
    .param p4, "minCodewordWidth"    # I
    .param p5, "maxCodewordWidth"    # I

    move/from16 v8, p3

    .line 211
    new-instance v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    .line 212
    nop

    .line 211
    move-object/from16 v9, p1

    invoke-direct {v0, v9, v8}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;Z)V

    move-object v10, v0

    .line 213
    .local v10, "rowIndicatorColumn":Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    const/4 v0, 0x0

    .local v0, "i":I
    move v11, v0

    .end local v0    # "i":I
    .local v11, "i":I
    :goto_d
    const/4 v0, 0x2

    if-lt v11, v0, :cond_11

    .line 230
    .end local v11    # "i":I
    return-object v10

    .line 214
    .restart local v11    # "i":I
    :cond_11
    if-nez v11, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, -0x1

    :goto_16
    move v12, v0

    .line 215
    .local v12, "increment":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    .line 216
    .local v0, "startColumn":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    float-to-int v1, v1

    .local v1, "imageRow":I
    move v14, v0

    move v13, v1

    .end local v0    # "startColumn":I
    .end local v1    # "imageRow":I
    .local v13, "imageRow":I
    .local v14, "startColumn":I
    :goto_23
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v0

    if-gt v13, v0, :cond_54

    .line 217
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v0

    .line 216
    if-ge v13, v0, :cond_30

    .end local v12    # "increment":I
    .end local v13    # "imageRow":I
    .end local v14    # "startColumn":I
    goto :goto_54

    .line 218
    .restart local v12    # "increment":I
    .restart local v13    # "imageRow":I
    .restart local v14    # "startColumn":I
    :cond_30
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    .line 219
    nop

    .line 218
    move-object v0, p0

    move v3, v8

    move v4, v14

    move v5, v13

    move/from16 v6, p4

    move/from16 v7, p5

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    .line 220
    .local v0, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v0, :cond_52

    .line 221
    invoke-virtual {v10, v13, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->setCodeword(ILcom/google/zxing/pdf417/decoder/Codeword;)V

    .line 222
    if-eqz v8, :cond_4e

    .line 223
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v14

    .line 224
    goto :goto_52

    .line 225
    :cond_4e
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v14

    .line 217
    .end local v0    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_52
    :goto_52
    add-int/2addr v13, v12

    goto :goto_23

    .line 213
    .end local v12    # "increment":I
    .end local v13    # "imageRow":I
    .end local v14    # "startColumn":I
    :cond_54
    :goto_54
    add-int/lit8 v11, v11, 0x1

    goto :goto_d
.end method

.method private static getStartColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;IIZ)I
    .registers 12
    .param p0, "detectionResult"    # Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .param p1, "barcodeColumn"    # I
    .param p2, "imageRow"    # I
    .param p3, "leftToRight"    # Z

    .line 366
    if-eqz p3, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, -0x1

    .line 367
    .local v0, "offset":I
    :goto_5
    const/4 v1, 0x0

    .line 368
    .local v1, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    sub-int v2, p1, v0

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 369
    sub-int v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodeword(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 371
    :cond_18
    if-eqz v1, :cond_26

    .line 372
    if-eqz p3, :cond_21

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    goto :goto_25

    :cond_21
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    :goto_25
    return v2

    .line 374
    :cond_26
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewordNearby(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 375
    if-eqz v1, :cond_3c

    .line 376
    if-eqz p3, :cond_37

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    goto :goto_3b

    :cond_37
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    :goto_3b
    return v2

    .line 378
    :cond_3c
    sub-int v2, p1, v0

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 379
    sub-int v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewordNearby(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    .line 381
    :cond_4e
    if-eqz v1, :cond_5c

    .line 382
    if-eqz p3, :cond_57

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    goto :goto_5b

    :cond_57
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    :goto_5b
    return v2

    .line 384
    :cond_5c
    const/4 v2, 0x0

    .line 386
    .local v2, "skippedColumns":I
    :goto_5d
    sub-int v3, p1, v0

    invoke-static {p0, v3}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v3

    if-nez v3, :cond_79

    .line 398
    if-eqz p3, :cond_70

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinX()I

    move-result v3

    goto :goto_78

    :cond_70
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v3

    :goto_78
    return v3

    .line 387
    :cond_79
    sub-int/2addr p1, v0

    .line 388
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_84
    if-lt v5, v4, :cond_89

    .line 396
    add-int/lit8 v2, v2, 0x1

    goto :goto_5d

    .line 388
    :cond_89
    aget-object v6, v3, v5

    .line 389
    .local v6, "previousRowCodeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v6, :cond_a8

    .line 390
    if-eqz p3, :cond_94

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v3

    goto :goto_98

    :cond_94
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v3

    .line 391
    :goto_98
    nop

    .line 392
    nop

    .line 391
    mul-int v4, v0, v2

    .line 393
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v7

    sub-int/2addr v5, v7

    .line 391
    mul-int/2addr v4, v5

    .line 390
    add-int/2addr v3, v4

    return v3

    .line 388
    .end local v6    # "previousRowCodeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    :cond_a8
    add-int/lit8 v5, v5, 0x1

    goto :goto_84
.end method

.method private static isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z
    .registers 4
    .param p0, "detectionResult"    # Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .param p1, "barcodeColumn"    # I

    .line 359
    if-ltz p1, :cond_b

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    if-gt p1, v0, :cond_b

    return v1

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method private static merge(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .registers 5
    .param p0, "leftRowIndicatorColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .param p1, "rightRowIndicatorColumn"    # Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 129
    const/4 v0, 0x0

    if-nez p0, :cond_6

    if-nez p1, :cond_6

    .line 130
    return-object v0

    .line 132
    :cond_6
    invoke-static {p0, p1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getBarcodeMetadata(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    .line 133
    .local v1, "barcodeMetadata":Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    if-nez v1, :cond_d

    .line 134
    return-object v0

    .line 136
    :cond_d
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    .line 137
    invoke-static {p1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v2

    .line 136
    invoke-static {v0, v2}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->merge(Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/pdf417/decoder/BoundingBox;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    .line 138
    .local v0, "boundingBox":Lcom/google/zxing/pdf417/decoder/BoundingBox;
    new-instance v2, Lcom/google/zxing/pdf417/decoder/DetectionResult;

    invoke-direct {v2, v1, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;-><init>(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    return-object v2
.end method

.method public static toString([[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)Ljava/lang/String;
    .registers 10
    .param p0, "barcodeMatrix"    # [[Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    .line 609
    new-instance v0, Ljava/util/Formatter;

    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    .line 610
    .local v0, "formatter":Ljava/util/Formatter;
    const/4 v1, 0x0

    .local v1, "row":I
    :goto_6
    array-length v2, p0

    if-lt v1, v2, :cond_11

    .line 623
    .end local v1    # "row":I
    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 624
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V

    .line 625
    return-object v1

    .line 611
    .local v1, "row":I
    :cond_11
    const-string v2, "Row %2d: "

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0, v2, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 612
    const/4 v2, 0x0

    .local v2, "column":I
    :goto_21
    aget-object v4, p0, v1

    array-length v4, v4

    if-lt v2, v4, :cond_30

    .line 621
    .end local v2    # "column":I
    const-string v2, "%n"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 610
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 613
    .restart local v2    # "column":I
    :cond_30
    aget-object v4, p0, v1

    aget-object v4, v4, v2

    .line 614
    .local v4, "barcodeValue":Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-nez v5, :cond_42

    .line 615
    const-string v5, "        "

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 616
    goto :goto_62

    .line 617
    :cond_42
    const-string v5, "%4d(%2d)"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v8

    aget v8, v8, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v6

    .line 618
    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v8

    aget v8, v8, v6

    invoke-virtual {v4, v8}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getConfidence(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    .line 617
    invoke-virtual {v0, v5, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 612
    .end local v4    # "barcodeValue":Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    :goto_62
    add-int/lit8 v2, v2, 0x1

    goto :goto_21
.end method

.method private static verifyCodewordCount([II)V
    .registers 5
    .param p0, "codewords"    # [I
    .param p1, "numECCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 560
    array-length v0, p0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1f

    .line 568
    const/4 v0, 0x0

    aget v1, p0, v0

    .line 569
    .local v1, "numberOfCodewords":I
    array-length v2, p0

    if-gt v1, v2, :cond_1a

    .line 572
    if-nez v1, :cond_19

    .line 574
    array-length v2, p0

    if-ge p1, v2, :cond_14

    .line 575
    array-length v2, p0

    sub-int/2addr v2, p1

    aput v2, p0, v0

    .line 576
    goto :goto_19

    .line 577
    :cond_14
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 580
    :cond_19
    :goto_19
    return-void

    .line 570
    :cond_1a
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 563
    .end local v1    # "numberOfCodewords":I
    :cond_1f
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method
