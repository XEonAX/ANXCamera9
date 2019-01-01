.class public final Lcom/google/zxing/oned/EAN13Reader;
.super Lcom/google/zxing/oned/UPCEANReader;
.source "EAN13Reader.java"


# static fields
.field static final FIRST_DIGIT_ENCODINGS:[I


# instance fields
.field private final decodeMiddleCounters:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 61
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 62
    const/4 v1, 0x1

    const/16 v2, 0xb

    aput v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0xd

    aput v2, v0, v1

    const/4 v1, 0x3

    const/16 v2, 0xe

    aput v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x13

    aput v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x19

    aput v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x1c

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x15

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x16

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x1a

    aput v2, v0, v1

    .line 61
    sput-object v0, Lcom/google/zxing/oned/EAN13Reader;->FIRST_DIGIT_ENCODINGS:[I

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANReader;-><init>()V

    .line 68
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/EAN13Reader;->decodeMiddleCounters:[I

    .line 69
    return-void
.end method

.method private static determineFirstDigit(Ljava/lang/StringBuilder;I)V
    .locals 3
    .param p0, "resultString"    # Ljava/lang/StringBuilder;
    .param p1, "lgPatternFound"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 129
    const/4 v0, 0x0

    .local v0, "d":I
    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 130
    sget-object v1, Lcom/google/zxing/oned/EAN13Reader;->FIRST_DIGIT_ENCODINGS:[I

    aget v1, v1, v0

    if-ne p1, v1, :cond_0

    .line 131
    const/4 v1, 0x0

    const/16 v2, 0x30

    add-int/2addr v2, v0

    int-to-char v2, v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 132
    return-void

    .line 129
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 135
    .end local v0    # "d":I
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method protected decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .locals 16
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startRange"    # [I
    .param p3, "resultString"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 75
    move-object/from16 v1, p3

    move-object/from16 v2, p0

    iget-object v3, v2, Lcom/google/zxing/oned/EAN13Reader;->decodeMiddleCounters:[I

    .line 76
    .local v3, "counters":[I
    const/4 v4, 0x0

    aput v4, v3, v4

    .line 77
    const/4 v5, 0x1

    aput v4, v3, v5

    .line 78
    const/4 v6, 0x2

    aput v4, v3, v6

    .line 79
    const/4 v6, 0x3

    aput v4, v3, v6

    .line 80
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    .line 81
    .local v6, "end":I
    aget v7, p2, v5

    .line 83
    .local v7, "rowOffset":I
    const/4 v8, 0x0

    .line 85
    .local v8, "lgPatternFound":I
    const/4 v9, 0x0

    .local v9, "x":I
    :goto_0
    const/16 v10, 0x30

    const/4 v11, 0x6

    if-ge v9, v11, :cond_3

    if-lt v7, v6, :cond_0

    .end local v9    # "x":I
    goto :goto_2

    .line 86
    .restart local v9    # "x":I
    :cond_0
    sget-object v11, Lcom/google/zxing/oned/EAN13Reader;->L_AND_G_PATTERNS:[[I

    invoke-static {v0, v3, v7, v11}, Lcom/google/zxing/oned/EAN13Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v12

    .line 87
    .local v12, "bestMatch":I
    rem-int/lit8 v11, v12, 0xa

    add-int/2addr v10, v11

    int-to-char v10, v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    array-length v13, v3

    move v10, v7

    move v7, v4

    .end local v7    # "rowOffset":I
    .local v10, "rowOffset":I
    :goto_1
    if-lt v7, v13, :cond_2

    .line 91
    const/16 v7, 0xa

    if-lt v12, v7, :cond_1

    .line 92
    rsub-int/lit8 v7, v9, 0x5

    shl-int v7, v5, v7

    or-int/2addr v7, v8

    .line 85
    .end local v8    # "lgPatternFound":I
    .end local v12    # "bestMatch":I
    .local v7, "lgPatternFound":I
    move v8, v7

    .end local v7    # "lgPatternFound":I
    .restart local v8    # "lgPatternFound":I
    :cond_1
    add-int/lit8 v9, v9, 0x1

    move v7, v10

    goto :goto_0

    .line 88
    .restart local v12    # "bestMatch":I
    :cond_2
    aget v11, v3, v7

    .line 89
    .local v11, "counter":I
    add-int/2addr v10, v11

    .line 88
    .end local v11    # "counter":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 96
    .end local v9    # "x":I
    .end local v10    # "rowOffset":I
    .end local v12    # "bestMatch":I
    .local v7, "rowOffset":I
    :cond_3
    :goto_2
    invoke-static {v1, v8}, Lcom/google/zxing/oned/EAN13Reader;->determineFirstDigit(Ljava/lang/StringBuilder;I)V

    .line 98
    sget-object v9, Lcom/google/zxing/oned/EAN13Reader;->MIDDLE_PATTERN:[I

    invoke-static {v0, v7, v5, v9}, Lcom/google/zxing/oned/EAN13Reader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v9

    .line 99
    .local v9, "middleRange":[I
    aget v5, v9, v5

    .line 101
    .end local v7    # "rowOffset":I
    .local v5, "rowOffset":I
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_3
    if-ge v7, v11, :cond_6

    if-lt v5, v6, :cond_4

    .end local v7    # "x":I
    goto :goto_5

    .line 102
    .restart local v7    # "x":I
    :cond_4
    sget-object v12, Lcom/google/zxing/oned/EAN13Reader;->L_PATTERNS:[[I

    invoke-static {v0, v3, v5, v12}, Lcom/google/zxing/oned/EAN13Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v12

    .line 103
    .restart local v12    # "bestMatch":I
    add-int v13, v10, v12

    int-to-char v13, v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    array-length v13, v3

    move v14, v5

    move v5, v4

    .end local v5    # "rowOffset":I
    .local v14, "rowOffset":I
    :goto_4
    if-lt v5, v13, :cond_5

    .line 101
    .end local v12    # "bestMatch":I
    add-int/lit8 v7, v7, 0x1

    move v5, v14

    goto :goto_3

    .line 104
    .restart local v12    # "bestMatch":I
    :cond_5
    aget v15, v3, v5

    .line 105
    .local v15, "counter":I
    add-int/2addr v14, v15

    .line 104
    .end local v15    # "counter":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 109
    .end local v7    # "x":I
    .end local v12    # "bestMatch":I
    .end local v14    # "rowOffset":I
    .restart local v5    # "rowOffset":I
    :cond_6
    :goto_5
    return v5
.end method

.method getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .locals 1

    .line 114
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method
