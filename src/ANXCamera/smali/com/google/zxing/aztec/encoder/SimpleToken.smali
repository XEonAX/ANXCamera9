.class final Lcom/google/zxing/aztec/encoder/SimpleToken;
.super Lcom/google/zxing/aztec/encoder/Token;
.source "SimpleToken.java"


# instance fields
.field private final bitCount:S

.field private final value:S


# direct methods
.method constructor <init>(Lcom/google/zxing/aztec/encoder/Token;II)V
    .locals 1
    .param p1, "previous"    # Lcom/google/zxing/aztec/encoder/Token;
    .param p2, "value"    # I
    .param p3, "bitCount"    # I

    .line 28
    invoke-direct {p0, p1}, Lcom/google/zxing/aztec/encoder/Token;-><init>(Lcom/google/zxing/aztec/encoder/Token;)V

    .line 29
    int-to-short v0, p2

    iput-short v0, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->value:S

    .line 30
    int-to-short v0, p3

    iput-short v0, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->bitCount:S

    .line 31
    return-void
.end method


# virtual methods
.method appendTo(Lcom/google/zxing/common/BitArray;[B)V
    .locals 2
    .param p1, "bitArray"    # Lcom/google/zxing/common/BitArray;
    .param p2, "text"    # [B

    .line 35
    iget-short v0, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->value:S

    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->bitCount:S

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 36
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 40
    iget-short v0, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->value:S

    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->bitCount:S

    const/4 v2, 0x1

    shl-int v1, v2, v1

    sub-int/2addr v1, v2

    and-int/2addr v0, v1

    .line 41
    .local v0, "value":I
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->bitCount:S

    shl-int v1, v2, v1

    or-int/2addr v0, v1

    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v3, 0x3c

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-short v3, p0, Lcom/google/zxing/aztec/encoder/SimpleToken;->bitCount:S

    shl-int v3, v2, v3

    or-int/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
