.class public final Lcom/google/zxing/oned/ITFReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "ITFReader.java"


# static fields
.field private static final DEFAULT_ALLOWED_LENGTHS:[I

.field private static final END_PATTERN_REVERSED:[I

.field private static final MAX_AVG_VARIANCE:F = 0.38f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.78f

.field private static final N:I = 0x1

.field static final PATTERNS:[[I

.field private static final START_PATTERN:[I

.field private static final W:I = 0x3


# instance fields
.field private narrowLineWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 54
    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_6e

    sput-object v1, Lcom/google/zxing/oned/ITFReader;->DEFAULT_ALLOWED_LENGTHS:[I

    .line 65
    const/4 v1, 0x4

    new-array v2, v1, [I

    fill-array-data v2, :array_7c

    sput-object v2, Lcom/google/zxing/oned/ITFReader;->START_PATTERN:[I

    .line 66
    const/4 v2, 0x3

    new-array v3, v2, [I

    fill-array-data v3, :array_88

    sput-object v3, Lcom/google/zxing/oned/ITFReader;->END_PATTERN_REVERSED:[I

    .line 71
    const/16 v3, 0xa

    new-array v3, v3, [[I

    .line 72
    new-array v4, v0, [I

    fill-array-data v4, :array_92

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 73
    new-array v4, v0, [I

    fill-array-data v4, :array_a0

    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 74
    new-array v4, v0, [I

    fill-array-data v4, :array_ae

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 75
    new-array v4, v0, [I

    fill-array-data v4, :array_bc

    aput-object v4, v3, v2

    .line 76
    new-array v2, v0, [I

    fill-array-data v2, :array_ca

    aput-object v2, v3, v1

    .line 77
    new-array v1, v0, [I

    fill-array-data v1, :array_d8

    aput-object v1, v3, v0

    .line 78
    new-array v1, v0, [I

    fill-array-data v1, :array_e6

    const/4 v2, 0x6

    aput-object v1, v3, v2

    .line 79
    new-array v1, v0, [I

    fill-array-data v1, :array_f4

    const/4 v2, 0x7

    aput-object v1, v3, v2

    .line 80
    new-array v1, v0, [I

    fill-array-data v1, :array_102

    const/16 v2, 0x8

    aput-object v1, v3, v2

    .line 81
    new-array v0, v0, [I

    fill-array-data v0, :array_110

    const/16 v1, 0x9

    aput-object v0, v3, v1

    .line 71
    sput-object v3, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    .line 82
    return-void

    :array_6e
    .array-data 4
        0x6
        0x8
        0xa
        0xc
        0xe
    .end array-data

    :array_7c
    .array-data 4
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_88
    .array-data 4
        0x1
        0x1
        0x3
    .end array-data

    :array_92
    .array-data 4
        0x1
        0x1
        0x3
        0x3
        0x1
    .end array-data

    :array_a0
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_ae
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x3
    .end array-data

    :array_bc
    .array-data 4
        0x3
        0x3
        0x1
        0x1
        0x1
    .end array-data

    :array_ca
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x3
    .end array-data

    :array_d8
    .array-data 4
        0x3
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_e6
    .array-data 4
        0x1
        0x3
        0x3
        0x1
        0x1
    .end array-data

    :array_f4
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x3
    .end array-data

    :array_102
    .array-data 4
        0x3
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_110
    .array-data 4
        0x1
        0x3
        0x1
        0x3
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .line 45
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    .line 45
    return-void
.end method

.method private static decodeDigit([I)I
    .registers 8
    .param p0, "counters"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 339
    const v0, 0x3ec28f5c    # 0.38f

    .line 340
    .local v0, "bestVariance":F
    const/4 v1, -0x1

    .line 341
    .local v1, "bestMatch":I
    sget-object v2, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    array-length v2, v2

    .line 342
    .local v2, "max":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    if-lt v3, v2, :cond_12

    .line 350
    .end local v3    # "i":I
    if-ltz v1, :cond_d

    .line 351
    return v1

    .line 353
    :cond_d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    .line 343
    .restart local v3    # "i":I
    :cond_12
    sget-object v4, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v4, v4, v3

    .line 344
    .local v4, "pattern":[I
    const v5, 0x3f47ae14    # 0.78f

    invoke-static {p0, v4, v5}, Lcom/google/zxing/oned/ITFReader;->patternMatchVariance([I[IF)F

    move-result v5

    .line 345
    .local v5, "variance":F
    cmpg-float v6, v5, v0

    if-gez v6, :cond_23

    .line 346
    move v0, v5

    .line 347
    move v1, v3

    .line 342
    .end local v4    # "pattern":[I
    .end local v5    # "variance":F
    :cond_23
    add-int/lit8 v3, v3, 0x1

    goto :goto_8
.end method

.method private static decodeMiddle(Lcom/google/zxing/common/BitArray;IILjava/lang/StringBuilder;)V
    .registers 12
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "payloadStart"    # I
    .param p2, "payloadEnd"    # I
    .param p3, "resultString"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 150
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 151
    .local v0, "counterDigitPair":[I
    const/4 v1, 0x5

    new-array v2, v1, [I

    .line 152
    .local v2, "counterBlack":[I
    new-array v3, v1, [I

    .line 154
    .local v3, "counterWhite":[I
    :goto_9
    if-lt p1, p2, :cond_c

    .line 174
    return-void

    .line 157
    :cond_c
    invoke-static {p0, p1, v0}, Lcom/google/zxing/oned/ITFReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 159
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_10
    if-lt v4, v1, :cond_32

    .line 165
    .end local v4    # "k":I
    invoke-static {v2}, Lcom/google/zxing/oned/ITFReader;->decodeDigit([I)I

    move-result v4

    .line 166
    .local v4, "bestMatch":I
    const/16 v5, 0x30

    add-int v6, v5, v4

    int-to-char v6, v6

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 167
    invoke-static {v3}, Lcom/google/zxing/oned/ITFReader;->decodeDigit([I)I

    move-result v6

    .line 168
    .end local v4    # "bestMatch":I
    .local v6, "bestMatch":I
    add-int/2addr v5, v6

    int-to-char v4, v5

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 170
    array-length v5, v0

    const/4 v4, 0x0

    :goto_29
    if-lt v4, v5, :cond_2c

    .end local v6    # "bestMatch":I
    goto :goto_9

    .restart local v6    # "bestMatch":I
    :cond_2c
    aget v7, v0, v4

    .line 171
    .local v7, "counterDigit":I
    add-int/2addr p1, v7

    .line 170
    .end local v7    # "counterDigit":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    .line 160
    .end local v6    # "bestMatch":I
    .local v4, "k":I
    :cond_32
    const/4 v5, 0x2

    mul-int/2addr v5, v4

    .line 161
    .local v5, "twoK":I
    aget v6, v0, v5

    aput v6, v2, v4

    .line 162
    add-int/lit8 v6, v5, 0x1

    aget v6, v0, v6

    aput v6, v3, v4

    .line 159
    .end local v5    # "twoK":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_10
.end method

.method private static findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I
    .registers 15
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "rowOffset"    # I
    .param p2, "pattern"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 300
    array-length v0, p2

    .line 301
    .local v0, "patternLength":I
    new-array v1, v0, [I

    .line 302
    .local v1, "counters":[I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    .line 303
    .local v2, "width":I
    const/4 v3, 0x0

    .line 305
    .local v3, "isWhite":Z
    const/4 v4, 0x0

    .line 306
    .local v4, "counterPosition":I
    move v5, p1

    .line 307
    .local v5, "patternStart":I
    move v6, p1

    .local v6, "x":I
    :goto_b
    if-ge v6, v2, :cond_58

    .line 308
    invoke-virtual {p0, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    xor-int/2addr v7, v3

    const/4 v8, 0x1

    if-eqz v7, :cond_1b

    .line 309
    aget v7, v1, v4

    add-int/2addr v7, v8

    aput v7, v1, v4

    .line 310
    goto :goto_55

    .line 311
    :cond_1b
    add-int/lit8 v7, v0, -0x1

    const/4 v9, 0x0

    if-ne v4, v7, :cond_4c

    .line 312
    const v7, 0x3f47ae14    # 0.78f

    invoke-static {v1, p2, v7}, Lcom/google/zxing/oned/ITFReader;->patternMatchVariance([I[IF)F

    move-result v7

    const v10, 0x3ec28f5c    # 0.38f

    cmpg-float v7, v7, v10

    const/4 v10, 0x2

    if-gez v7, :cond_36

    .line 313
    new-array v7, v10, [I

    aput v5, v7, v9

    aput v6, v7, v8

    return-object v7

    .line 315
    :cond_36
    aget v7, v1, v9

    aget v11, v1, v8

    add-int/2addr v7, v11

    add-int/2addr v5, v7

    .line 316
    add-int/lit8 v7, v0, -0x2

    invoke-static {v1, v10, v1, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    add-int/lit8 v7, v0, -0x2

    aput v9, v1, v7

    .line 318
    add-int/lit8 v7, v0, -0x1

    aput v9, v1, v7

    .line 319
    add-int/lit8 v4, v4, -0x1

    .line 320
    goto :goto_4e

    .line 321
    :cond_4c
    add-int/lit8 v4, v4, 0x1

    .line 323
    :goto_4e
    aput v8, v1, v4

    .line 324
    if-eqz v3, :cond_54

    move v8, v9

    nop

    :cond_54
    move v3, v8

    .line 307
    :goto_55
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    .line 327
    .end local v6    # "x":I
    :cond_58
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6
.end method

.method private static skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I
    .registers 4
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 240
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    .line 241
    .local v0, "width":I
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v1

    .line 242
    .local v1, "endStart":I
    if-eq v1, v0, :cond_c

    .line 246
    return v1

    .line 243
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method private validateQuietZone(Lcom/google/zxing/common/BitArray;I)V
    .registers 6
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startPattern"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 215
    iget v0, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    mul-int/lit8 v0, v0, 0xa

    .line 218
    .local v0, "quietCount":I
    if-ge v0, p2, :cond_8

    move v1, v0

    goto :goto_9

    :cond_8
    move v1, p2

    :goto_9
    move v0, v1

    .line 220
    add-int/lit8 v1, p2, -0x1

    .local v1, "i":I
    :goto_c
    if-lez v0, :cond_1d

    if-gez v1, :cond_11

    .end local v1    # "i":I
    goto :goto_1d

    .line 221
    .restart local v1    # "i":I
    :cond_11
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 222
    goto :goto_1d

    .line 224
    :cond_18
    add-int/lit8 v0, v0, -0x1

    .line 220
    add-int/lit8 v1, v1, -0x1

    goto :goto_c

    .line 226
    .end local v1    # "i":I
    :cond_1d
    :goto_1d
    if-nez v0, :cond_20

    .line 230
    return-void

    .line 228
    :cond_20
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method decodeEnd(Lcom/google/zxing/common/BitArray;)[I
    .registers 9
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 261
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 263
    :try_start_3
    invoke-static {p1}, Lcom/google/zxing/oned/ITFReader;->skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I

    move-result v0

    .line 264
    .local v0, "endStart":I
    sget-object v1, Lcom/google/zxing/oned/ITFReader;->END_PATTERN_REVERSED:[I

    invoke-static {p1, v0, v1}, Lcom/google/zxing/oned/ITFReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I

    move-result-object v1

    .line 269
    .local v1, "endPattern":[I
    const/4 v2, 0x0

    aget v3, v1, v2

    invoke-direct {p0, p1, v3}, Lcom/google/zxing/oned/ITFReader;->validateQuietZone(Lcom/google/zxing/common/BitArray;I)V

    .line 274
    aget v3, v1, v2

    .line 275
    .local v3, "temp":I
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v4

    const/4 v5, 0x1

    aget v6, v1, v5

    sub-int/2addr v4, v6

    aput v4, v1, v2

    .line 276
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    sub-int/2addr v2, v3

    aput v2, v1, v5
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_2b

    .line 278
    nop

    .line 281
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 278
    return-object v1

    .line 279
    .end local v0    # "endStart":I
    .end local v1    # "endPattern":[I
    .end local v3    # "temp":I
    :catchall_2b
    move-exception v0

    .line 281
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 282
    throw v0
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 22
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 89
    move-object/from16 v3, p3

    invoke-virtual {v0, v2}, Lcom/google/zxing/oned/ITFReader;->decodeStart(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v4

    .line 90
    .local v4, "startRange":[I
    invoke-virtual {v0, v2}, Lcom/google/zxing/oned/ITFReader;->decodeEnd(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v5

    .line 92
    .local v5, "endRange":[I
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x14

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 93
    .local v6, "result":Ljava/lang/StringBuilder;
    const/4 v7, 0x1

    aget v8, v4, v7

    const/4 v9, 0x0

    aget v10, v5, v9

    invoke-static {v2, v8, v10, v6}, Lcom/google/zxing/oned/ITFReader;->decodeMiddle(Lcom/google/zxing/common/BitArray;IILjava/lang/StringBuilder;)V

    .line 94
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 96
    .local v8, "resultString":Ljava/lang/String;
    const/4 v10, 0x0

    .line 97
    .local v10, "allowedLengths":[I
    if-eqz v3, :cond_30

    .line 98
    sget-object v11, Lcom/google/zxing/DecodeHintType;->ALLOWED_LENGTHS:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v3, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v10, v11

    check-cast v10, [I

    .line 101
    :cond_30
    if-nez v10, :cond_34

    .line 102
    sget-object v10, Lcom/google/zxing/oned/ITFReader;->DEFAULT_ALLOWED_LENGTHS:[I

    .line 107
    :cond_34
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    .line 108
    .local v11, "length":I
    const/4 v12, 0x0

    .line 109
    .local v12, "lengthOK":Z
    const/4 v13, 0x0

    .line 110
    .local v13, "maxAllowedLength":I
    array-length v14, v10

    move v15, v13

    move v13, v9

    .end local v13    # "maxAllowedLength":I
    .local v15, "maxAllowedLength":I
    :goto_3d
    if-lt v13, v14, :cond_40

    goto :goto_46

    :cond_40
    aget v9, v10, v13

    .line 111
    .local v9, "allowedLength":I
    if-ne v11, v9, :cond_79

    .line 112
    const/4 v12, 0x1

    .line 113
    nop

    .line 119
    .end local v9    # "allowedLength":I
    :goto_46
    if-nez v12, :cond_4b

    if-le v11, v15, :cond_4b

    .line 120
    const/4 v12, 0x1

    .line 122
    :cond_4b
    if-eqz v12, :cond_74

    .line 126
    new-instance v9, Lcom/google/zxing/Result;

    .line 127
    nop

    .line 128
    nop

    .line 129
    const/4 v14, 0x2

    new-array v14, v14, [Lcom/google/zxing/ResultPoint;

    new-instance v13, Lcom/google/zxing/ResultPoint;

    aget v0, v4, v7

    int-to-float v0, v0

    int-to-float v7, v1

    invoke-direct {v13, v0, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v0, 0x0

    aput-object v13, v14, v0

    .line 130
    new-instance v7, Lcom/google/zxing/ResultPoint;

    aget v0, v5, v0

    int-to-float v0, v0

    int-to-float v13, v1

    invoke-direct {v7, v0, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v7, v14, v16

    .line 131
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    .line 126
    const/4 v7, 0x0

    invoke-direct {v9, v8, v7, v14, v0}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v9

    .line 123
    :cond_74
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 115
    .restart local v9    # "allowedLength":I
    :cond_79
    move/from16 v16, v7

    const/4 v0, 0x0

    if-le v9, v15, :cond_80

    .line 116
    move v7, v9

    .line 110
    .end local v9    # "allowedLength":I
    .end local v15    # "maxAllowedLength":I
    .local v7, "maxAllowedLength":I
    move v15, v7

    .end local v7    # "maxAllowedLength":I
    .restart local v15    # "maxAllowedLength":I
    :cond_80
    add-int/lit8 v13, v13, 0x1

    move v9, v0

    move/from16 v7, v16

    move-object/from16 v0, p0

    goto :goto_3d
.end method

.method decodeStart(Lcom/google/zxing/common/BitArray;)[I
    .registers 7
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 185
    invoke-static {p1}, Lcom/google/zxing/oned/ITFReader;->skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I

    move-result v0

    .line 186
    .local v0, "endStart":I
    sget-object v1, Lcom/google/zxing/oned/ITFReader;->START_PATTERN:[I

    invoke-static {p1, v0, v1}, Lcom/google/zxing/oned/ITFReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I

    move-result-object v1

    .line 191
    .local v1, "startPattern":[I
    const/4 v2, 0x1

    aget v2, v1, v2

    const/4 v3, 0x0

    aget v4, v1, v3

    sub-int/2addr v2, v4

    div-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    .line 193
    aget v2, v1, v3

    invoke-direct {p0, p1, v2}, Lcom/google/zxing/oned/ITFReader;->validateQuietZone(Lcom/google/zxing/common/BitArray;I)V

    .line 195
    return-object v1
.end method
