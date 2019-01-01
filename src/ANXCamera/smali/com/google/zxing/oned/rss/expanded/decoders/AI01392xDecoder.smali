.class final Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;
.source "AI01392xDecoder.java"


# static fields
.field private static final HEADER_SIZE:I = 0x8

.field private static final LAST_DIGIT_SIZE:I = 0x2


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .locals 0
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 42
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    .line 43
    return-void
.end method


# virtual methods
.method public parseInformation()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;->getInformation()Lcom/google/zxing/common/BitArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    const/16 v1, 0x30

    if-lt v0, v1, :cond_0

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v2, 0x8

    invoke-virtual {p0, v0, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;->encodeCompressedGtin(Ljava/lang/StringBuilder;I)V

    .line 56
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;->getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(II)I

    move-result v1

    .line 55
    nop

    .line 57
    .local v1, "lastAIdigit":I
    const-string v2, "(392"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    const/16 v2, 0x29

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;->getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    move-result-object v2

    const/16 v3, 0x32

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->decodeGeneralPurposeField(ILjava/lang/String;)Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;

    move-result-object v2

    .line 61
    nop

    .line 63
    .local v2, "decodedInformation":Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->getNewString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 48
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v1    # "lastAIdigit":I
    .end local v2    # "decodedInformation":Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
