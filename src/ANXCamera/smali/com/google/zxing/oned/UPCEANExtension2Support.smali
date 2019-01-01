.class final Lcom/google/zxing/oned/UPCEANExtension2Support;
.super Ljava/lang/Object;
.source "UPCEANExtension2Support.java"


# instance fields
.field private final decodeMiddleCounters:[I

.field private final decodeRowStringBuffer:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddleCounters:[I

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 32
    return-void
.end method

.method private static parseExtensionString(Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .param p0, "raw"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 104
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 105
    const/4 v0, 0x0

    return-object v0

    .line 107
    :cond_0
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/google/zxing/ResultMetadataType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 108
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    sget-object v1, Lcom/google/zxing/ResultMetadataType;->ISSUE_NUMBER:Lcom/google/zxing/ResultMetadataType;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    return-object v0
.end method


# virtual methods
.method decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .locals 12
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startRange"    # [I
    .param p3, "resultString"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddleCounters:[I

    .line 62
    .local v0, "counters":[I
    const/4 v1, 0x0

    aput v1, v0, v1

    .line 63
    const/4 v2, 0x1

    aput v1, v0, v2

    .line 64
    const/4 v3, 0x2

    aput v1, v0, v3

    .line 65
    const/4 v4, 0x3

    aput v1, v0, v4

    .line 66
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v4

    .line 67
    .local v4, "end":I
    aget v5, p2, v2

    .line 69
    .local v5, "rowOffset":I
    const/4 v6, 0x0

    .line 71
    .local v6, "checkParity":I
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_0
    if-ge v7, v3, :cond_4

    if-lt v5, v4, :cond_0

    .end local v7    # "x":I
    goto :goto_3

    .line 72
    .restart local v7    # "x":I
    :cond_0
    sget-object v8, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    invoke-static {p1, v0, v5, v8}, Lcom/google/zxing/oned/UPCEANReader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    .line 73
    .local v8, "bestMatch":I
    const/16 v9, 0x30

    rem-int/lit8 v10, v8, 0xa

    add-int/2addr v9, v10

    int-to-char v9, v9

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    array-length v9, v0

    move v10, v5

    move v5, v1

    .end local v5    # "rowOffset":I
    .local v10, "rowOffset":I
    :goto_1
    if-lt v5, v9, :cond_3

    .line 77
    const/16 v5, 0xa

    if-lt v8, v5, :cond_1

    .line 78
    rsub-int/lit8 v5, v7, 0x1

    shl-int v5, v2, v5

    or-int/2addr v5, v6

    .line 80
    .end local v6    # "checkParity":I
    .local v5, "checkParity":I
    move v6, v5

    .end local v5    # "checkParity":I
    .restart local v6    # "checkParity":I
    :cond_1
    if-eq v7, v2, :cond_2

    .line 82
    invoke-virtual {p1, v10}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    .line 83
    .end local v10    # "rowOffset":I
    .local v5, "rowOffset":I
    invoke-virtual {p1, v5}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v5

    .end local v8    # "bestMatch":I
    goto :goto_2

    .line 71
    .end local v5    # "rowOffset":I
    .restart local v10    # "rowOffset":I
    :cond_2
    move v5, v10

    .end local v10    # "rowOffset":I
    .restart local v5    # "rowOffset":I
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 74
    .end local v5    # "rowOffset":I
    .restart local v8    # "bestMatch":I
    .restart local v10    # "rowOffset":I
    :cond_3
    aget v11, v0, v5

    .line 75
    .local v11, "counter":I
    add-int/2addr v10, v11

    .line 74
    .end local v11    # "counter":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 87
    .end local v7    # "x":I
    .end local v8    # "bestMatch":I
    .end local v10    # "rowOffset":I
    .restart local v5    # "rowOffset":I
    :cond_4
    :goto_3
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ne v1, v3, :cond_6

    .line 91
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    rem-int/lit8 v1, v1, 0x4

    if-ne v1, v6, :cond_5

    .line 95
    return v5

    .line 92
    :cond_5
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 88
    :cond_6
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method decodeRow(ILcom/google/zxing/common/BitArray;[I)Lcom/google/zxing/Result;
    .locals 11
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "extensionStartRange"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 40
    .local v0, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 41
    invoke-virtual {p0, p2, p3, v0}, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I

    move-result v2

    .line 43
    .local v2, "end":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 44
    .local v3, "resultString":Ljava/lang/String;
    invoke-static {v3}, Lcom/google/zxing/oned/UPCEANExtension2Support;->parseExtensionString(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 47
    .local v4, "extensionData":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    new-instance v5, Lcom/google/zxing/Result;

    .line 48
    nop

    .line 49
    const/4 v6, 0x2

    new-array v6, v6, [Lcom/google/zxing/ResultPoint;

    .line 50
    new-instance v7, Lcom/google/zxing/ResultPoint;

    aget v8, p3, v1

    const/4 v9, 0x1

    aget v10, p3, v9

    add-int/2addr v8, v10

    int-to-float v8, v8

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v8, v10

    int-to-float v10, p1

    invoke-direct {v7, v8, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v7, v6, v1

    .line 51
    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v7, v2

    int-to-float v8, p1

    invoke-direct {v1, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v1, v6, v9

    .line 53
    sget-object v1, Lcom/google/zxing/BarcodeFormat;->UPC_EAN_EXTENSION:Lcom/google/zxing/BarcodeFormat;

    .line 47
    const/4 v7, 0x0

    invoke-direct {v5, v3, v7, v6, v1}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 46
    move-object v1, v5

    .line 54
    .local v1, "extensionResult":Lcom/google/zxing/Result;
    if-eqz v4, :cond_0

    .line 55
    invoke-virtual {v1, v4}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    .line 57
    :cond_0
    return-object v1
.end method
