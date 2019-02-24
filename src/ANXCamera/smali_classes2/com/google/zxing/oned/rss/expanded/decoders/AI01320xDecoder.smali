.class final Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder;
.source "AI01320xDecoder.java"


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .registers 2
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 37
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    .line 38
    return-void
.end method


# virtual methods
.method protected addWeightCode(Ljava/lang/StringBuilder;I)V
    .registers 4
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "weight"    # I

    .line 42
    const/16 v0, 0x2710

    if-ge p2, v0, :cond_a

    .line 43
    const-string v0, "(3202)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    goto :goto_f

    .line 45
    :cond_a
    const-string v0, "(3203)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    :goto_f
    return-void
.end method

.method protected checkWeight(I)I
    .registers 3
    .param p1, "weight"    # I

    .line 51
    const/16 v0, 0x2710

    if-ge p1, v0, :cond_5

    .line 52
    return p1

    .line 54
    :cond_5
    add-int/lit16 v0, p1, -0x2710

    return v0
.end method
