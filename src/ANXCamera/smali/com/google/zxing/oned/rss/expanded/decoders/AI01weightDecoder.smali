.class abstract Lcom/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;
.source "AI01weightDecoder.java"


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .locals 0
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 37
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected abstract addWeightCode(Ljava/lang/StringBuilder;I)V
.end method

.method protected abstract checkWeight(I)I
.end method

.method protected final encodeCompressedWeight(Ljava/lang/StringBuilder;II)V
    .locals 5
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "currentPos"    # I
    .param p3, "weightSize"    # I

    .line 41
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder;->getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(II)I

    move-result v0

    .line 42
    .local v0, "originalWeightNumeric":I
    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder;->addWeightCode(Ljava/lang/StringBuilder;I)V

    .line 44
    invoke-virtual {p0, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder;->checkWeight(I)I

    move-result v1

    .line 46
    .local v1, "weightNumeric":I
    const v2, 0x186a0

    .line 47
    .local v2, "currentDivisor":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v4, 0x5

    if-lt v3, v4, :cond_0

    .line 53
    .end local v3    # "i":I
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    return-void

    .line 48
    .restart local v3    # "i":I
    :cond_0
    div-int v4, v1, v2

    if-nez v4, :cond_1

    .line 49
    const/16 v4, 0x30

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    :cond_1
    div-int/lit8 v2, v2, 0xa

    .line 47
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
