.class final Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder;
.source "AI01320xDecoder.java"


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .locals 0
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 37
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected addWeightCode(Ljava/lang/StringBuilder;I)V
    .locals 1
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "weight"    # I

    .line 42
    const/16 v0, 0x2710

    if-ge p2, v0, :cond_0

    .line 43
    const-string v0, "(3202)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string v0, "(3203)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    :goto_0
    return-void
.end method

.method protected checkWeight(I)I
    .locals 1
    .param p1, "weight"    # I

    .line 51
    const/16 v0, 0x2710

    if-ge p1, v0, :cond_0

    .line 52
    return p1

    .line 54
    :cond_0
    add-int/lit16 v0, p1, -0x2710

    return v0
.end method
