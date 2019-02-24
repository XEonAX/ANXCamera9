.class public final Lcom/google/zxing/oned/EAN8Reader;
.super Lcom/google/zxing/oned/UPCEANReader;
.source "EAN8Reader.java"


# instance fields
.field private final decodeMiddleCounters:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 32
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANReader;-><init>()V

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/EAN8Reader;->decodeMiddleCounters:[I

    .line 34
    return-void
.end method


# virtual methods
.method protected decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .registers 16
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startRange"    # [I
    .param p3, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/google/zxing/oned/EAN8Reader;->decodeMiddleCounters:[I

    .line 41
    .local v0, "counters":[I
    const/4 v1, 0x0

    aput v1, v0, v1

    .line 42
    const/4 v2, 0x1

    aput v1, v0, v2

    .line 43
    const/4 v3, 0x2

    aput v1, v0, v3

    .line 44
    const/4 v3, 0x3

    aput v1, v0, v3

    .line 45
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    .line 46
    .local v3, "end":I
    aget v4, p2, v2

    .line 48
    .local v4, "rowOffset":I
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_15
    const/16 v6, 0x30

    const/4 v7, 0x4

    if-ge v5, v7, :cond_37

    if-lt v4, v3, :cond_1d

    .end local v5    # "x":I
    goto :goto_37

    .line 49
    .restart local v5    # "x":I
    :cond_1d
    sget-object v7, Lcom/google/zxing/oned/EAN8Reader;->L_PATTERNS:[[I

    invoke-static {p1, v0, v4, v7}, Lcom/google/zxing/oned/EAN8Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    .line 50
    .local v8, "bestMatch":I
    add-int/2addr v6, v8

    int-to-char v6, v6

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    array-length v9, v0

    move v6, v4

    move v4, v1

    .end local v4    # "rowOffset":I
    .local v6, "rowOffset":I
    :goto_2b
    if-lt v4, v9, :cond_31

    .line 48
    .end local v8    # "bestMatch":I
    add-int/lit8 v5, v5, 0x1

    move v4, v6

    goto :goto_15

    .line 51
    .restart local v8    # "bestMatch":I
    :cond_31
    aget v7, v0, v4

    .line 52
    .local v7, "counter":I
    add-int/2addr v6, v7

    .line 51
    .end local v7    # "counter":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2b

    .line 56
    .end local v5    # "x":I
    .end local v6    # "rowOffset":I
    .end local v8    # "bestMatch":I
    .restart local v4    # "rowOffset":I
    :cond_37
    :goto_37
    sget-object v5, Lcom/google/zxing/oned/EAN8Reader;->MIDDLE_PATTERN:[I

    invoke-static {p1, v4, v2, v5}, Lcom/google/zxing/oned/EAN8Reader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v5

    .line 57
    .local v5, "middleRange":[I
    aget v2, v5, v2

    .line 59
    .end local v4    # "rowOffset":I
    .local v2, "rowOffset":I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_40
    if-ge v4, v7, :cond_60

    if-lt v2, v3, :cond_45

    .end local v4    # "x":I
    goto :goto_60

    .line 60
    .restart local v4    # "x":I
    :cond_45
    sget-object v8, Lcom/google/zxing/oned/EAN8Reader;->L_PATTERNS:[[I

    invoke-static {p1, v0, v2, v8}, Lcom/google/zxing/oned/EAN8Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    .line 61
    .restart local v8    # "bestMatch":I
    add-int v9, v6, v8

    int-to-char v9, v9

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    array-length v9, v0

    move v10, v2

    move v2, v1

    .end local v2    # "rowOffset":I
    .local v10, "rowOffset":I
    :goto_54
    if-lt v2, v9, :cond_5a

    .line 59
    .end local v8    # "bestMatch":I
    add-int/lit8 v4, v4, 0x1

    move v2, v10

    goto :goto_40

    .line 62
    .restart local v8    # "bestMatch":I
    :cond_5a
    aget v11, v0, v2

    .line 63
    .local v11, "counter":I
    add-int/2addr v10, v11

    .line 62
    .end local v11    # "counter":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_54

    .line 67
    .end local v4    # "x":I
    .end local v8    # "bestMatch":I
    .end local v10    # "rowOffset":I
    .restart local v2    # "rowOffset":I
    :cond_60
    :goto_60
    return v2
.end method

.method getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .registers 2

    .line 72
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_8:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method
