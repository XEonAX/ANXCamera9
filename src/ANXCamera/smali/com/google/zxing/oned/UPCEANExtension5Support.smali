.class final Lcom/google/zxing/oned/UPCEANExtension5Support;
.super Ljava/lang/Object;
.source "UPCEANExtension5Support.java"


# static fields
.field private static final CHECK_DIGIT_ENCODINGS:[I


# instance fields
.field private final decodeMiddleCounters:[I

.field private final decodeRowStringBuffer:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 34
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    .line 35
    nop

    .line 34
    sput-object v0, Lcom/google/zxing/oned/UPCEANExtension5Support;->CHECK_DIGIT_ENCODINGS:[I

    .line 36
    return-void

    nop

    :array_c
    .array-data 4
        0x18
        0x14
        0x12
        0x11
        0xc
        0x6
        0x3
        0xa
        0x9
        0x5
    .end array-data
.end method

.method constructor <init>()V
    .registers 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeMiddleCounters:[I

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 32
    return-void
.end method

.method private static determineCheckDigit(I)I
    .registers 3
    .param p0, "lgPatternFound"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    .local v0, "d":I
    :goto_1
    const/16 v1, 0xa

    if-ge v0, v1, :cond_f

    .line 120
    sget-object v1, Lcom/google/zxing/oned/UPCEANExtension5Support;->CHECK_DIGIT_ENCODINGS:[I

    aget v1, v1, v0

    if-ne p0, v1, :cond_c

    .line 121
    return v0

    .line 119
    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 124
    .end local v0    # "d":I
    :cond_f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static extensionChecksum(Ljava/lang/CharSequence;)I
    .registers 5
    .param p0, "s"    # Ljava/lang/CharSequence;

    .line 104
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 105
    .local v0, "length":I
    const/4 v1, 0x0

    .line 106
    .local v1, "sum":I
    add-int/lit8 v2, v0, -0x2

    .local v2, "i":I
    :goto_7
    if-gez v2, :cond_1e

    .line 109
    .end local v2    # "i":I
    mul-int/lit8 v1, v1, 0x3

    .line 110
    add-int/lit8 v2, v0, -0x1

    .restart local v2    # "i":I
    :goto_d
    if-gez v2, :cond_14

    .line 113
    .end local v2    # "i":I
    mul-int/lit8 v1, v1, 0x3

    .line 114
    rem-int/lit8 v2, v1, 0xa

    return v2

    .line 111
    .restart local v2    # "i":I
    :cond_14
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v1, v3

    .line 110
    add-int/lit8 v2, v2, -0x2

    goto :goto_d

    .line 107
    :cond_1e
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v1, v3

    .line 106
    add-int/lit8 v2, v2, -0x2

    goto :goto_7
.end method

.method private static parseExtension5String(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "raw"    # Ljava/lang/String;

    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-eq v0, v1, :cond_3a

    const/16 v1, 0x35

    if-eq v0, v1, :cond_37

    const/16 v1, 0x39

    if-eq v0, v1, :cond_14

    .line 171
    const-string v0, ""

    goto :goto_3d

    .line 156
    :cond_14
    const-string v0, "90000"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 158
    const/4 v0, 0x0

    return-object v0

    .line 160
    :cond_1e
    const-string v0, "99991"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 162
    const-string v0, "0.00"

    return-object v0

    .line 164
    :cond_29
    const-string v0, "99990"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 165
    const-string v0, "Used"

    return-object v0

    .line 168
    :cond_34
    const-string v0, ""

    .line 169
    .local v0, "currency":Ljava/lang/String;
    goto :goto_3d

    .line 152
    .end local v0    # "currency":Ljava/lang/String;
    :cond_37
    const-string v0, "$"

    .line 153
    .restart local v0    # "currency":Ljava/lang/String;
    goto :goto_3d

    .line 149
    .end local v0    # "currency":Ljava/lang/String;
    :cond_3a
    const-string v0, "\u00a3"

    .line 150
    .restart local v0    # "currency":Ljava/lang/String;
    nop

    .line 171
    :goto_3d
    nop

    .line 174
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 175
    .local v1, "rawAmount":I
    div-int/lit8 v2, v1, 0x64

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 176
    .local v2, "unitsString":Ljava/lang/String;
    rem-int/lit8 v3, v1, 0x64

    .line 177
    .local v3, "hundredths":I
    const/16 v4, 0xa

    if-ge v3, v4, :cond_62

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "0"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_66

    :cond_62
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "hundredthsString":Ljava/lang/String;
    :goto_66
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private static parseExtensionString(Ljava/lang/String;)Ljava/util/Map;
    .registers 4
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

    .line 133
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x5

    if-eq v0, v2, :cond_9

    .line 134
    return-object v1

    .line 136
    :cond_9
    invoke-static {p0}, Lcom/google/zxing/oned/UPCEANExtension5Support;->parseExtension5String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_10

    .line 138
    return-object v1

    .line 140
    :cond_10
    new-instance v1, Ljava/util/EnumMap;

    const-class v2, Lcom/google/zxing/ResultMetadataType;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 141
    .local v1, "result":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    sget-object v2, Lcom/google/zxing/ResultMetadataType;->SUGGESTED_PRICE:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    return-object v1
.end method


# virtual methods
.method decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .registers 15
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startRange"    # [I
    .param p3, "resultString"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeMiddleCounters:[I

    .line 66
    .local v0, "counters":[I
    const/4 v1, 0x0

    aput v1, v0, v1

    .line 67
    const/4 v2, 0x1

    aput v1, v0, v2

    .line 68
    const/4 v3, 0x2

    aput v1, v0, v3

    .line 69
    const/4 v3, 0x3

    aput v1, v0, v3

    .line 70
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    .line 71
    .local v3, "end":I
    aget v4, p2, v2

    .line 73
    .local v4, "rowOffset":I
    const/4 v5, 0x0

    .line 75
    .local v5, "lgPatternFound":I
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_16
    const/4 v7, 0x5

    if-ge v6, v7, :cond_4f

    if-lt v4, v3, :cond_1c

    .end local v6    # "x":I
    goto :goto_4f

    .line 76
    .restart local v6    # "x":I
    :cond_1c
    sget-object v7, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    invoke-static {p1, v0, v4, v7}, Lcom/google/zxing/oned/UPCEANReader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    .line 77
    .local v8, "bestMatch":I
    const/16 v7, 0x30

    rem-int/lit8 v9, v8, 0xa

    add-int/2addr v7, v9

    int-to-char v7, v7

    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    array-length v9, v0

    move v7, v4

    move v4, v1

    .end local v4    # "rowOffset":I
    .local v7, "rowOffset":I
    :goto_2e
    if-lt v4, v9, :cond_49

    .line 81
    const/4 v4, 0x4

    const/16 v9, 0xa

    if-lt v8, v9, :cond_3a

    .line 82
    rsub-int/lit8 v9, v6, 0x4

    shl-int v9, v2, v9

    or-int/2addr v5, v9

    .line 84
    :cond_3a
    if-eq v6, v4, :cond_45

    .line 86
    invoke-virtual {p1, v7}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v4

    .line 87
    .end local v7    # "rowOffset":I
    .restart local v4    # "rowOffset":I
    invoke-virtual {p1, v4}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v4

    .end local v8    # "bestMatch":I
    goto :goto_46

    .line 75
    .end local v4    # "rowOffset":I
    .restart local v7    # "rowOffset":I
    :cond_45
    move v4, v7

    .end local v7    # "rowOffset":I
    .restart local v4    # "rowOffset":I
    :goto_46
    add-int/lit8 v6, v6, 0x1

    goto :goto_16

    .line 78
    .end local v4    # "rowOffset":I
    .restart local v7    # "rowOffset":I
    .restart local v8    # "bestMatch":I
    :cond_49
    aget v10, v0, v4

    .line 79
    .local v10, "counter":I
    add-int/2addr v7, v10

    .line 78
    .end local v10    # "counter":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    .line 91
    .end local v6    # "x":I
    .end local v7    # "rowOffset":I
    .end local v8    # "bestMatch":I
    .restart local v4    # "rowOffset":I
    :cond_4f
    :goto_4f
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ne v1, v7, :cond_69

    .line 95
    invoke-static {v5}, Lcom/google/zxing/oned/UPCEANExtension5Support;->determineCheckDigit(I)I

    move-result v1

    .line 96
    .local v1, "checkDigit":I
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/oned/UPCEANExtension5Support;->extensionChecksum(Ljava/lang/CharSequence;)I

    move-result v2

    if-ne v2, v1, :cond_64

    .line 100
    return v4

    .line 97
    :cond_64
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 92
    .end local v1    # "checkDigit":I
    :cond_69
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method decodeRow(ILcom/google/zxing/common/BitArray;[I)Lcom/google/zxing/Result;
    .registers 15
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "extensionStartRange"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 43
    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    .line 44
    .local v0, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 45
    invoke-virtual {p0, p2, p3, v0}, Lcom/google/zxing/oned/UPCEANExtension5Support;->decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I

    move-result v2

    .line 47
    .local v2, "end":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 48
    .local v3, "resultString":Ljava/lang/String;
    invoke-static {v3}, Lcom/google/zxing/oned/UPCEANExtension5Support;->parseExtensionString(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 51
    .local v4, "extensionData":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    new-instance v5, Lcom/google/zxing/Result;

    .line 52
    nop

    .line 53
    const/4 v6, 0x2

    new-array v6, v6, [Lcom/google/zxing/ResultPoint;

    .line 54
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

    .line 55
    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v7, v2

    int-to-float v8, p1

    invoke-direct {v1, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v1, v6, v9

    .line 57
    sget-object v1, Lcom/google/zxing/BarcodeFormat;->UPC_EAN_EXTENSION:Lcom/google/zxing/BarcodeFormat;

    .line 51
    const/4 v7, 0x0

    invoke-direct {v5, v3, v7, v6, v1}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 50
    move-object v1, v5

    .line 58
    .local v1, "extensionResult":Lcom/google/zxing/Result;
    if-eqz v4, :cond_3f

    .line 59
    invoke-virtual {v1, v4}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    .line 61
    :cond_3f
    return-object v1
.end method
