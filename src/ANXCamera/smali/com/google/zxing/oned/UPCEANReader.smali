.class public abstract Lcom/google/zxing/oned/UPCEANReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "UPCEANReader.java"


# static fields
.field static final L_AND_G_PATTERNS:[[I

.field static final L_PATTERNS:[[I

.field private static final MAX_AVG_VARIANCE:F = 0.48f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.7f

.field static final MIDDLE_PATTERN:[I

.field static final START_END_PATTERN:[I


# instance fields
.field private final decodeRowStringBuffer:Ljava/lang/StringBuilder;

.field private final eanManSupport:Lcom/google/zxing/oned/EANManufacturerOrgSupport;

.field private final extensionReader:Lcom/google/zxing/oned/UPCEANExtensionSupport;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 53
    const/4 v0, 0x3

    new-array v1, v0, [I

    fill-array-data v1, :array_96

    sput-object v1, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    .line 58
    const/4 v1, 0x5

    new-array v2, v1, [I

    fill-array-data v2, :array_a0

    sput-object v2, Lcom/google/zxing/oned/UPCEANReader;->MIDDLE_PATTERN:[I

    .line 63
    const/16 v2, 0xa

    new-array v3, v2, [[I

    .line 64
    const/4 v4, 0x4

    new-array v5, v4, [I

    fill-array-data v5, :array_ae

    const/4 v6, 0x0

    aput-object v5, v3, v6

    .line 65
    new-array v5, v4, [I

    fill-array-data v5, :array_ba

    const/4 v7, 0x1

    aput-object v5, v3, v7

    .line 66
    new-array v5, v4, [I

    fill-array-data v5, :array_c6

    const/4 v8, 0x2

    aput-object v5, v3, v8

    .line 67
    new-array v5, v4, [I

    fill-array-data v5, :array_d2

    aput-object v5, v3, v0

    .line 68
    new-array v0, v4, [I

    fill-array-data v0, :array_de

    aput-object v0, v3, v4

    .line 69
    new-array v0, v4, [I

    fill-array-data v0, :array_ea

    aput-object v0, v3, v1

    .line 70
    new-array v0, v4, [I

    fill-array-data v0, :array_f6

    const/4 v1, 0x6

    aput-object v0, v3, v1

    .line 71
    new-array v0, v4, [I

    fill-array-data v0, :array_102

    const/4 v1, 0x7

    aput-object v0, v3, v1

    .line 72
    new-array v0, v4, [I

    fill-array-data v0, :array_10e

    const/16 v1, 0x8

    aput-object v0, v3, v1

    .line 73
    new-array v0, v4, [I

    fill-array-data v0, :array_11a

    const/16 v1, 0x9

    aput-object v0, v3, v1

    .line 63
    sput-object v3, Lcom/google/zxing/oned/UPCEANReader;->L_PATTERNS:[[I

    .line 82
    const/16 v0, 0x14

    new-array v1, v0, [[I

    sput-object v1, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    .line 83
    sget-object v1, Lcom/google/zxing/oned/UPCEANReader;->L_PATTERNS:[[I

    sget-object v3, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    invoke-static {v1, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    const/16 v1, 0xa

    .local v1, "i":I
    :goto_75
    if-lt v1, v0, :cond_78

    .line 92
    .end local v1    # "i":I
    return-void

    .line 85
    .restart local v1    # "i":I
    :cond_78
    sget-object v2, Lcom/google/zxing/oned/UPCEANReader;->L_PATTERNS:[[I

    add-int/lit8 v3, v1, -0xa

    aget-object v2, v2, v3

    .line 86
    .local v2, "widths":[I
    array-length v3, v2

    new-array v3, v3, [I

    .line 87
    .local v3, "reversedWidths":[I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_82
    array-length v5, v2

    if-lt v4, v5, :cond_8c

    .line 90
    .end local v4    # "j":I
    sget-object v4, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    aput-object v3, v4, v1

    .line 84
    .end local v2    # "widths":[I
    .end local v3    # "reversedWidths":[I
    add-int/lit8 v1, v1, 0x1

    goto :goto_75

    .line 88
    .restart local v2    # "widths":[I
    .restart local v3    # "reversedWidths":[I
    .restart local v4    # "j":I
    :cond_8c
    array-length v5, v2

    sub-int/2addr v5, v4

    sub-int/2addr v5, v7

    aget v5, v2, v5

    aput v5, v3, v4

    .line 87
    add-int/lit8 v4, v4, 0x1

    goto :goto_82

    :array_96
    .array-data 4
        0x1
        0x1
        0x1
    .end array-data

    :array_a0
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_ae
    .array-data 4
        0x3
        0x2
        0x1
        0x1
    .end array-data

    :array_ba
    .array-data 4
        0x2
        0x2
        0x2
        0x1
    .end array-data

    :array_c6
    .array-data 4
        0x2
        0x1
        0x2
        0x2
    .end array-data

    :array_d2
    .array-data 4
        0x1
        0x4
        0x1
        0x1
    .end array-data

    :array_de
    .array-data 4
        0x1
        0x1
        0x3
        0x2
    .end array-data

    :array_ea
    .array-data 4
        0x1
        0x2
        0x3
        0x1
    .end array-data

    :array_f6
    .array-data 4
        0x1
        0x1
        0x1
        0x4
    .end array-data

    :array_102
    .array-data 4
        0x1
        0x3
        0x1
        0x2
    .end array-data

    :array_10e
    .array-data 4
        0x1
        0x2
        0x1
        0x3
    .end array-data

    :array_11a
    .array-data 4
        0x3
        0x1
        0x1
        0x2
    .end array-data
.end method

.method protected constructor <init>()V
    .registers 3

    .line 98
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANReader;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 100
    new-instance v0, Lcom/google/zxing/oned/UPCEANExtensionSupport;

    invoke-direct {v0}, Lcom/google/zxing/oned/UPCEANExtensionSupport;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANReader;->extensionReader:Lcom/google/zxing/oned/UPCEANExtensionSupport;

    .line 101
    new-instance v0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;

    invoke-direct {v0}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANReader;->eanManSupport:Lcom/google/zxing/oned/EANManufacturerOrgSupport;

    .line 102
    return-void
.end method

.method static checkStandardUPCEANChecksum(Ljava/lang/CharSequence;)Z
    .registers 7
    .param p0, "s"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 261
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 262
    .local v0, "length":I
    const/4 v1, 0x0

    if-nez v0, :cond_8

    .line 263
    return v1

    .line 266
    :cond_8
    const/4 v2, 0x0

    .line 267
    .local v2, "sum":I
    add-int/lit8 v3, v0, -0x2

    .local v3, "i":I
    :goto_b
    const/16 v4, 0x9

    if-gez v3, :cond_2e

    .line 274
    .end local v3    # "i":I
    mul-int/lit8 v2, v2, 0x3

    .line 275
    add-int/lit8 v3, v0, -0x1

    .restart local v3    # "i":I
    :goto_13
    if-gez v3, :cond_1b

    .line 282
    .end local v3    # "i":I
    rem-int/lit8 v3, v2, 0xa

    if-nez v3, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1

    .line 276
    .restart local v3    # "i":I
    :cond_1b
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v5, v5, -0x30

    .line 277
    .local v5, "digit":I
    if-ltz v5, :cond_29

    if-gt v5, v4, :cond_29

    .line 280
    add-int/2addr v2, v5

    .line 275
    .end local v5    # "digit":I
    add-int/lit8 v3, v3, -0x2

    goto :goto_13

    .line 278
    .restart local v5    # "digit":I
    :cond_29
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 268
    .end local v5    # "digit":I
    :cond_2e
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v5, v5, -0x30

    .line 269
    .restart local v5    # "digit":I
    if-ltz v5, :cond_3c

    if-gt v5, v4, :cond_3c

    .line 272
    add-int/2addr v2, v5

    .line 267
    .end local v5    # "digit":I
    add-int/lit8 v3, v3, -0x2

    goto :goto_b

    .line 270
    .restart local v5    # "digit":I
    :cond_3c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method static decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I
    .registers 11
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "counters"    # [I
    .param p2, "rowOffset"    # I
    .param p3, "patterns"    # [[I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 355
    invoke-static {p0, p2, p1}, Lcom/google/zxing/oned/UPCEANReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 356
    const v0, 0x3ef5c28f    # 0.48f

    .line 357
    .local v0, "bestVariance":F
    const/4 v1, -0x1

    .line 358
    .local v1, "bestMatch":I
    array-length v2, p3

    .line 359
    .local v2, "max":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_9
    if-lt v3, v2, :cond_13

    .line 367
    .end local v3    # "i":I
    if-ltz v1, :cond_e

    .line 368
    return v1

    .line 370
    :cond_e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    .line 360
    .restart local v3    # "i":I
    :cond_13
    aget-object v4, p3, v3

    .line 361
    .local v4, "pattern":[I
    const v5, 0x3f333333    # 0.7f

    invoke-static {p1, v4, v5}, Lcom/google/zxing/oned/UPCEANReader;->patternMatchVariance([I[IF)F

    move-result v5

    .line 362
    .local v5, "variance":F
    cmpg-float v6, v5, v0

    if-gez v6, :cond_22

    .line 363
    move v0, v5

    .line 364
    move v1, v3

    .line 359
    .end local v4    # "pattern":[I
    .end local v5    # "variance":F
    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method static findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I
    .registers 5
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "rowOffset"    # I
    .param p2, "whiteFirst"    # Z
    .param p3, "pattern"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 293
    array-length v0, p3

    new-array v0, v0, [I

    invoke-static {p0, p1, p2, p3, v0}, Lcom/google/zxing/oned/UPCEANReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I[I)[I

    move-result-object v0

    return-object v0
.end method

.method private static findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I[I)[I
    .registers 16
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "rowOffset"    # I
    .param p2, "whiteFirst"    # Z
    .param p3, "pattern"    # [I
    .param p4, "counters"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 312
    array-length v0, p3

    .line 313
    .local v0, "patternLength":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    .line 314
    .local v1, "width":I
    move v2, p2

    .line 315
    .local v2, "isWhite":Z
    if-eqz p2, :cond_d

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v3

    goto :goto_11

    :cond_d
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v3

    :goto_11
    move p1, v3

    .line 316
    const/4 v3, 0x0

    .line 317
    .local v3, "counterPosition":I
    move v4, p1

    .line 318
    .local v4, "patternStart":I
    move v5, p1

    .local v5, "x":I
    :goto_15
    if-ge v5, v1, :cond_62

    .line 319
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    xor-int/2addr v6, v2

    const/4 v7, 0x1

    if-eqz v6, :cond_25

    .line 320
    aget v6, p4, v3

    add-int/2addr v6, v7

    aput v6, p4, v3

    .line 321
    goto :goto_5f

    .line 322
    :cond_25
    add-int/lit8 v6, v0, -0x1

    const/4 v8, 0x0

    if-ne v3, v6, :cond_56

    .line 323
    const v6, 0x3f333333    # 0.7f

    invoke-static {p4, p3, v6}, Lcom/google/zxing/oned/UPCEANReader;->patternMatchVariance([I[IF)F

    move-result v6

    const v9, 0x3ef5c28f    # 0.48f

    cmpg-float v6, v6, v9

    const/4 v9, 0x2

    if-gez v6, :cond_40

    .line 324
    new-array v6, v9, [I

    aput v4, v6, v8

    aput v5, v6, v7

    return-object v6

    .line 326
    :cond_40
    aget v6, p4, v8

    aget v10, p4, v7

    add-int/2addr v6, v10

    add-int/2addr v4, v6

    .line 327
    add-int/lit8 v6, v0, -0x2

    invoke-static {p4, v9, p4, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 328
    add-int/lit8 v6, v0, -0x2

    aput v8, p4, v6

    .line 329
    add-int/lit8 v6, v0, -0x1

    aput v8, p4, v6

    .line 330
    add-int/lit8 v3, v3, -0x1

    .line 331
    goto :goto_58

    .line 332
    :cond_56
    add-int/lit8 v3, v3, 0x1

    .line 334
    :goto_58
    aput v7, p4, v3

    .line 335
    if-eqz v2, :cond_5e

    move v7, v8

    nop

    :cond_5e
    move v2, v7

    .line 318
    :goto_5f
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    .line 338
    .end local v5    # "x":I
    :cond_62
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method static findStartGuardPattern(Lcom/google/zxing/common/BitArray;)[I
    .registers 8
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 105
    const/4 v0, 0x0

    .line 106
    .local v0, "foundStart":Z
    const/4 v1, 0x0

    .line 107
    .local v1, "startRange":[I
    const/4 v2, 0x0

    .line 108
    .local v2, "nextStart":I
    sget-object v3, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    array-length v3, v3

    new-array v3, v3, [I

    .line 109
    .local v3, "counters":[I
    :cond_8
    :goto_8
    if-eqz v0, :cond_b

    .line 122
    return-object v1

    .line 110
    :cond_b
    sget-object v4, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    array-length v4, v4

    const/4 v5, 0x0

    invoke-static {v3, v5, v4, v5}, Ljava/util/Arrays;->fill([IIII)V

    .line 111
    sget-object v4, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    invoke-static {p0, v2, v5, v4, v3}, Lcom/google/zxing/oned/UPCEANReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I[I)[I

    move-result-object v1

    .line 112
    aget v4, v1, v5

    .line 113
    .local v4, "start":I
    const/4 v6, 0x1

    aget v2, v1, v6

    .line 117
    sub-int v6, v2, v4

    sub-int v6, v4, v6

    .line 118
    .local v6, "quietStart":I
    if-ltz v6, :cond_8

    .line 119
    invoke-virtual {p0, v6, v4, v5}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v0

    .end local v4    # "start":I
    .end local v6    # "quietStart":I
    goto :goto_8
.end method


# virtual methods
.method checkChecksum(Ljava/lang/String;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 249
    invoke-static {p1}, Lcom/google/zxing/oned/UPCEANReader;->checkStandardUPCEANChecksum(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method decodeEnd(Lcom/google/zxing/common/BitArray;I)[I
    .registers 5
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "endStart"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 286
    sget-object v0, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    const/4 v1, 0x0

    invoke-static {p1, p2, v1, v0}, Lcom/google/zxing/oned/UPCEANReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v0

    return-object v0
.end method

.method protected abstract decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 5
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
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 128
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-static {p2}, Lcom/google/zxing/oned/UPCEANReader;->findStartGuardPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/google/zxing/oned/UPCEANReader;->decodeRow(ILcom/google/zxing/common/BitArray;[ILjava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;[ILjava/util/Map;)Lcom/google/zxing/Result;
    .registers 28
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "startGuardRange"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "[I",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .local p4, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 151
    move-object/from16 v5, p4

    if-nez v5, :cond_e

    const/4 v0, 0x0

    goto :goto_16

    .line 152
    :cond_e
    sget-object v0, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/ResultPointCallback;

    .line 151
    :goto_16
    move-object v7, v0

    .line 154
    .local v7, "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    const/high16 v0, 0x40000000    # 2.0f

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v7, :cond_2d

    .line 155
    new-instance v10, Lcom/google/zxing/ResultPoint;

    .line 156
    aget v11, v4, v9

    aget v12, v4, v8

    add-int/2addr v11, v12

    int-to-float v11, v11

    div-float/2addr v11, v0

    int-to-float v12, v2

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 155
    invoke-interface {v7, v10}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 160
    :cond_2d
    iget-object v10, v1, Lcom/google/zxing/oned/UPCEANReader;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 161
    .local v10, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 162
    invoke-virtual {v1, v3, v4, v10}, Lcom/google/zxing/oned/UPCEANReader;->decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I

    move-result v11

    .line 164
    .local v11, "endStart":I
    if-eqz v7, :cond_42

    .line 165
    new-instance v12, Lcom/google/zxing/ResultPoint;

    .line 166
    int-to-float v13, v11

    int-to-float v14, v2

    invoke-direct {v12, v13, v14}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 165
    invoke-interface {v7, v12}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 170
    :cond_42
    invoke-virtual {v1, v3, v11}, Lcom/google/zxing/oned/UPCEANReader;->decodeEnd(Lcom/google/zxing/common/BitArray;I)[I

    move-result-object v12

    .line 172
    .local v12, "endRange":[I
    if-eqz v7, :cond_58

    .line 173
    new-instance v13, Lcom/google/zxing/ResultPoint;

    .line 174
    aget v14, v12, v9

    aget v15, v12, v8

    add-int/2addr v14, v15

    int-to-float v14, v14

    div-float/2addr v14, v0

    int-to-float v15, v2

    invoke-direct {v13, v14, v15}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 173
    invoke-interface {v7, v13}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 181
    :cond_58
    aget v13, v12, v8

    .line 182
    .local v13, "end":I
    aget v14, v12, v9

    sub-int v14, v13, v14

    add-int/2addr v14, v13

    .line 183
    .local v14, "quietEnd":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v15

    if-ge v14, v15, :cond_13d

    invoke-virtual {v3, v13, v14, v9}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v15

    if-eqz v15, :cond_13d

    .line 187
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 189
    .local v15, "resultString":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v0, 0x8

    if-lt v6, v0, :cond_134

    .line 192
    invoke-virtual {v1, v15}, Lcom/google/zxing/oned/UPCEANReader;->checkChecksum(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12b

    .line 196
    aget v0, v4, v8

    aget v6, v4, v9

    add-int/2addr v0, v6

    int-to-float v0, v0

    const/high16 v6, 0x40000000    # 2.0f

    div-float v9, v0, v6

    .line 197
    .local v9, "left":F
    aget v0, v12, v8

    const/16 v17, 0x0

    aget v18, v12, v17

    add-int v0, v0, v18

    int-to-float v0, v0

    div-float v6, v0, v6

    .line 198
    .local v6, "right":F
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/UPCEANReader;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v8

    .line 199
    .local v8, "format":Lcom/google/zxing/BarcodeFormat;
    new-instance v0, Lcom/google/zxing/Result;

    .line 200
    nop

    .line 201
    const/4 v4, 0x2

    new-array v4, v4, [Lcom/google/zxing/ResultPoint;

    .line 202
    move-object/from16 v19, v7

    new-instance v7, Lcom/google/zxing/ResultPoint;

    .end local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .local v19, "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    move-object/from16 v20, v10

    int-to-float v10, v2

    .end local v10    # "result":Ljava/lang/StringBuilder;
    .local v20, "result":Ljava/lang/StringBuilder;
    invoke-direct {v7, v9, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v10, 0x0

    aput-object v7, v4, v10

    .line 203
    new-instance v7, Lcom/google/zxing/ResultPoint;

    int-to-float v10, v2

    invoke-direct {v7, v6, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v10, 0x1

    aput-object v7, v4, v10

    .line 204
    nop

    .line 199
    const/4 v7, 0x0

    invoke-direct {v0, v15, v7, v4, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    move-object v4, v0

    .line 206
    .local v4, "decodeResult":Lcom/google/zxing/Result;
    const/16 v17, 0x0

    move/from16 v10, v17

    .line 209
    .local v10, "extensionLength":I
    :try_start_bc
    iget-object v0, v1, Lcom/google/zxing/oned/UPCEANReader;->extensionReader:Lcom/google/zxing/oned/UPCEANExtensionSupport;

    const/16 v16, 0x1

    aget v7, v12, v16

    invoke-virtual {v0, v2, v3, v7}, Lcom/google/zxing/oned/UPCEANExtensionSupport;->decodeRow(ILcom/google/zxing/common/BitArray;I)Lcom/google/zxing/Result;

    move-result-object v0

    .line 210
    .local v0, "extensionResult":Lcom/google/zxing/Result;
    sget-object v7, Lcom/google/zxing/ResultMetadataType;->UPC_EAN_EXTENSION:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v7, v2}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 211
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    .line 212
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/google/zxing/Result;->addResultPoints([Lcom/google/zxing/ResultPoint;)V

    .line 213
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2
    :try_end_e5
    .catch Lcom/google/zxing/ReaderException; {:try_start_bc .. :try_end_e5} :catch_e7

    move v10, v2

    .line 214
    .end local v0    # "extensionResult":Lcom/google/zxing/Result;
    goto :goto_e8

    :catch_e7
    move-exception v0

    .line 219
    :goto_e8
    if-nez v5, :cond_ec

    .line 218
    const/4 v0, 0x0

    goto :goto_f4

    .line 219
    :cond_ec
    sget-object v0, Lcom/google/zxing/DecodeHintType;->ALLOWED_EAN_EXTENSIONS:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 218
    :goto_f4
    nop

    .line 220
    .local v0, "allowedExtensions":[I
    if-eqz v0, :cond_115

    .line 221
    const/4 v2, 0x0

    .line 222
    .local v2, "valid":Z
    array-length v7, v0

    move/from16 v21, v2

    move/from16 v2, v17

    .end local v2    # "valid":Z
    .local v21, "valid":Z
    :goto_fd
    if-lt v2, v7, :cond_100

    goto :goto_108

    :cond_100
    aget v3, v0, v2

    .line 223
    .local v3, "length":I
    if-ne v10, v3, :cond_110

    .line 224
    const/4 v2, 0x1

    .line 225
    .end local v21    # "valid":Z
    .restart local v2    # "valid":Z
    nop

    .line 228
    move/from16 v21, v2

    .end local v2    # "valid":Z
    .end local v3    # "length":I
    .restart local v21    # "valid":Z
    :goto_108
    if-eqz v21, :cond_10b

    .end local v21    # "valid":Z
    goto :goto_115

    .line 229
    .restart local v21    # "valid":Z
    :cond_10b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 222
    :cond_110
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v3, p2

    goto :goto_fd

    .line 233
    .end local v21    # "valid":Z
    :cond_115
    :goto_115
    sget-object v2, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    if-eq v8, v2, :cond_11d

    sget-object v2, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    if-ne v8, v2, :cond_12a

    .line 234
    :cond_11d
    iget-object v2, v1, Lcom/google/zxing/oned/UPCEANReader;->eanManSupport:Lcom/google/zxing/oned/EANManufacturerOrgSupport;

    invoke-virtual {v2, v15}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->lookupCountryIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 235
    .local v2, "countryID":Ljava/lang/String;
    if-eqz v2, :cond_12a

    .line 236
    sget-object v3, Lcom/google/zxing/ResultMetadataType;->POSSIBLE_COUNTRY:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v4, v3, v2}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 240
    .end local v2    # "countryID":Ljava/lang/String;
    :cond_12a
    return-object v4

    .line 193
    .end local v0    # "allowedExtensions":[I
    .end local v4    # "decodeResult":Lcom/google/zxing/Result;
    .end local v6    # "right":F
    .end local v8    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local v9    # "left":F
    .end local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v20    # "result":Ljava/lang/StringBuilder;
    .restart local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .local v10, "result":Ljava/lang/StringBuilder;
    :cond_12b
    move-object/from16 v19, v7

    move-object/from16 v20, v10

    .end local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v10    # "result":Ljava/lang/StringBuilder;
    .restart local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .restart local v20    # "result":Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v0

    throw v0

    .line 190
    .end local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v20    # "result":Ljava/lang/StringBuilder;
    .restart local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .restart local v10    # "result":Ljava/lang/StringBuilder;
    :cond_134
    move-object/from16 v19, v7

    move-object/from16 v20, v10

    .end local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v10    # "result":Ljava/lang/StringBuilder;
    .restart local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .restart local v20    # "result":Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 184
    .end local v15    # "resultString":Ljava/lang/String;
    .end local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v20    # "result":Ljava/lang/StringBuilder;
    .restart local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .restart local v10    # "result":Ljava/lang/StringBuilder;
    :cond_13d
    move-object/from16 v19, v7

    move-object/from16 v20, v10

    .end local v7    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v10    # "result":Ljava/lang/StringBuilder;
    .restart local v19    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .restart local v20    # "result":Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method abstract getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
.end method
