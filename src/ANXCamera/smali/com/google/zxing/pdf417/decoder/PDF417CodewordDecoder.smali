.class final Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;
.super Ljava/lang/Object;
.source "PDF417CodewordDecoder.java"


# static fields
.field private static final RATIOS_TABLE:[[F


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 28
    sget-object v0, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    array-length v0, v0

    const/16 v1, 0x8

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v2, F

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[F

    .line 27
    sput-object v0, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    .line 32
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 45
    .end local v0    # "i":I
    return-void

    .line 33
    .restart local v0    # "i":I
    :cond_0
    sget-object v2, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    aget v2, v2, v0

    .line 34
    .local v2, "currentSymbol":I
    and-int/lit8 v3, v2, 0x1

    .line 35
    .local v3, "currentBit":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    if-lt v4, v1, :cond_1

    .line 32
    .end local v2    # "currentSymbol":I
    .end local v3    # "currentBit":I
    .end local v4    # "j":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 36
    .restart local v2    # "currentSymbol":I
    .restart local v3    # "currentBit":I
    .restart local v4    # "j":I
    :cond_1
    const/4 v5, 0x0

    .line 37
    .local v5, "size":F
    :goto_2
    and-int/lit8 v6, v2, 0x1

    if-eq v6, v3, :cond_2

    .line 41
    and-int/lit8 v3, v2, 0x1

    .line 42
    sget-object v6, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    aget-object v6, v6, v0

    rsub-int/lit8 v7, v4, 0x8

    add-int/lit8 v7, v7, -0x1

    const/high16 v8, 0x41880000    # 17.0f

    div-float v8, v5, v8

    aput v8, v6, v7

    .line 35
    .end local v5    # "size":F
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 38
    .restart local v5    # "size":F
    :cond_2
    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    .line 39
    shr-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method private static getBitValue([I)I
    .locals 9
    .param p0, "moduleBitCount"    # [I

    .line 82
    const-wide/16 v0, 0x0

    .line 83
    .local v0, "result":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-lt v2, v3, :cond_0

    .line 88
    .end local v2    # "i":I
    long-to-int v2, v0

    return v2

    .line 84
    .restart local v2    # "i":I
    :cond_0
    const/4 v3, 0x0

    .local v3, "bit":I
    :goto_1
    aget v4, p0, v2

    if-lt v3, v4, :cond_1

    .line 83
    .end local v3    # "bit":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 85
    .restart local v3    # "bit":I
    :cond_1
    const/4 v4, 0x1

    shl-long v5, v0, v4

    rem-int/lit8 v7, v2, 0x2

    if-nez v7, :cond_2

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    int-to-long v7, v4

    or-long v0, v5, v7

    .line 84
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private static getClosestDecodedValue([I)I
    .locals 11
    .param p0, "moduleBitCount"    # [I

    .line 92
    invoke-static {p0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v0

    .line 93
    .local v0, "bitCountSum":I
    const/16 v1, 0x8

    new-array v2, v1, [F

    .line 94
    .local v2, "bitCountRatios":[F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-lt v3, v4, :cond_4

    .line 97
    .end local v3    # "i":I
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 98
    .local v3, "bestMatchError":F
    const/4 v4, -0x1

    .line 99
    .local v4, "bestMatch":I
    const/4 v5, 0x0

    .local v5, "j":I
    move v6, v3

    .end local v3    # "bestMatchError":F
    .local v6, "bestMatchError":F
    :goto_1
    sget-object v3, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    array-length v3, v3

    if-lt v5, v3, :cond_0

    .line 114
    .end local v5    # "j":I
    return v4

    .line 100
    .restart local v5    # "j":I
    :cond_0
    const/4 v3, 0x0

    .line 101
    .local v3, "error":F
    sget-object v7, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    aget-object v7, v7, v5

    .line 102
    .local v7, "ratioTableRow":[F
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_2
    if-lt v8, v1, :cond_1

    .end local v8    # "k":I
    goto :goto_3

    .line 103
    .restart local v8    # "k":I
    :cond_1
    aget v9, v7, v8

    aget v10, v2, v8

    sub-float/2addr v9, v10

    .line 104
    .local v9, "diff":F
    mul-float v10, v9, v9

    add-float/2addr v3, v10

    .line 105
    cmpl-float v10, v3, v6

    if-ltz v10, :cond_3

    .line 106
    nop

    .line 109
    .end local v8    # "k":I
    .end local v9    # "diff":F
    :goto_3
    cmpg-float v8, v3, v6

    if-gez v8, :cond_2

    .line 110
    move v6, v3

    .line 111
    sget-object v8, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    aget v3, v8, v5

    .line 99
    .end local v4    # "bestMatch":I
    .end local v7    # "ratioTableRow":[F
    .local v3, "bestMatch":I
    move v4, v3

    .end local v3    # "bestMatch":I
    .restart local v4    # "bestMatch":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 102
    .local v3, "error":F
    .restart local v7    # "ratioTableRow":[F
    .restart local v8    # "k":I
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 95
    .end local v4    # "bestMatch":I
    .end local v5    # "j":I
    .end local v6    # "bestMatchError":F
    .end local v7    # "ratioTableRow":[F
    .end local v8    # "k":I
    .local v3, "i":I
    :cond_4
    aget v4, p0, v3

    int-to-float v4, v4

    int-to-float v5, v0

    div-float/2addr v4, v5

    aput v4, v2, v3

    .line 94
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static getDecodedCodewordValue([I)I
    .locals 3
    .param p0, "moduleBitCount"    # [I

    .line 77
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getBitValue([I)I

    move-result v0

    .line 78
    .local v0, "decodedValue":I
    invoke-static {v0}, Lcom/google/zxing/pdf417/PDF417Common;->getCodeword(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    return v2
.end method

.method static getDecodedValue([I)I
    .locals 2
    .param p0, "moduleBitCount"    # [I

    .line 51
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->sampleBitCounts([I)[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getDecodedCodewordValue([I)I

    move-result v0

    .line 52
    .local v0, "decodedValue":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 53
    return v0

    .line 55
    :cond_0
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getClosestDecodedValue([I)I

    move-result v1

    return v1
.end method

.method private static sampleBitCounts([I)[I
    .locals 8
    .param p0, "moduleBitCount"    # [I

    .line 59
    invoke-static {p0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v0

    int-to-float v0, v0

    .line 60
    .local v0, "bitCountSum":F
    const/16 v1, 0x8

    new-array v1, v1, [I

    .line 61
    .local v1, "result":[I
    const/4 v2, 0x0

    .line 62
    .local v2, "bitCountIndex":I
    const/4 v3, 0x0

    .line 63
    .local v3, "sumPreviousBits":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    const/16 v5, 0x11

    if-lt v4, v5, :cond_0

    .line 73
    .end local v4    # "i":I
    return-object v1

    .line 65
    .restart local v4    # "i":I
    :cond_0
    const/high16 v5, 0x42080000    # 34.0f

    div-float v5, v0, v5

    .line 66
    int-to-float v6, v4

    mul-float/2addr v6, v0

    const/high16 v7, 0x41880000    # 17.0f

    div-float/2addr v6, v7

    .line 65
    add-float/2addr v5, v6

    .line 64
    nop

    .line 67
    .local v5, "sampleIndex":F
    aget v6, p0, v2

    add-int/2addr v6, v3

    int-to-float v6, v6

    cmpg-float v6, v6, v5

    if-gtz v6, :cond_1

    .line 68
    aget v6, p0, v2

    add-int/2addr v3, v6

    .line 69
    add-int/lit8 v2, v2, 0x1

    .line 71
    :cond_1
    aget v6, v1, v2

    add-int/lit8 v6, v6, 0x1

    aput v6, v1, v2

    .line 63
    .end local v5    # "sampleIndex":F
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
