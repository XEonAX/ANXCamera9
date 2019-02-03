.class abstract Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
.source "AI01decoder.java"


# static fields
.field protected static final GTIN_SIZE:I = 0x28


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .registers 2
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 40
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    .line 41
    return-void
.end method

.method private static appendCheckDigit(Ljava/lang/StringBuilder;I)V
    .registers 6
    .param p0, "buf"    # Ljava/lang/StringBuilder;
    .param p1, "currentPos"    # I

    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, "checkDigit":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    const/16 v2, 0xd

    if-lt v1, v2, :cond_13

    .line 73
    .end local v1    # "i":I
    rem-int/lit8 v1, v0, 0xa

    const/16 v2, 0xa

    rsub-int/lit8 v0, v1, 0xa

    .line 74
    if-ne v0, v2, :cond_f

    .line 75
    const/4 v0, 0x0

    .line 78
    :cond_f
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    return-void

    .line 69
    .restart local v1    # "i":I
    :cond_13
    add-int v2, v1, p1

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    .line 70
    .local v2, "digit":I
    and-int/lit8 v3, v1, 0x1

    if-nez v3, :cond_22

    const/4 v3, 0x3

    mul-int/2addr v3, v2

    goto :goto_23

    :cond_22
    move v3, v2

    :goto_23
    add-int/2addr v0, v3

    .line 68
    .end local v2    # "digit":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method


# virtual methods
.method protected final encodeCompressedGtin(Ljava/lang/StringBuilder;I)V
    .registers 5
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "currentPos"    # I

    .line 44
    const-string v0, "(01)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 46
    .local v0, "initialPosition":I
    const/16 v1, 0x39

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->encodeCompressedGtinWithoutAI(Ljava/lang/StringBuilder;II)V

    .line 49
    return-void
.end method

.method protected final encodeCompressedGtinWithoutAI(Ljava/lang/StringBuilder;II)V
    .registers 8
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "currentPos"    # I
    .param p3, "initialBufferPosition"    # I

    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x4

    if-lt v0, v1, :cond_8

    .line 63
    .end local v0    # "i":I
    invoke-static {p1, p3}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->appendCheckDigit(Ljava/lang/StringBuilder;I)V

    .line 64
    return-void

    .line 53
    .restart local v0    # "i":I
    :cond_8
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    move-result-object v1

    const/16 v2, 0xa

    mul-int v3, v2, v0

    add-int/2addr v3, p2

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(II)I

    move-result v1

    .line 54
    .local v1, "currentBlock":I
    div-int/lit8 v2, v1, 0x64

    const/16 v3, 0x30

    if-nez v2, :cond_1e

    .line 55
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    :cond_1e
    div-int/lit8 v2, v1, 0xa

    if-nez v2, :cond_25

    .line 58
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    :cond_25
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .end local v1    # "currentBlock":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
