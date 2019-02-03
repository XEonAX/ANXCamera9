.class final Lcom/google/zxing/aztec/encoder/BinaryShiftToken;
.super Lcom/google/zxing/aztec/encoder/Token;
.source "BinaryShiftToken.java"


# instance fields
.field private final binaryShiftByteCount:S

.field private final binaryShiftStart:S


# direct methods
.method constructor <init>(Lcom/google/zxing/aztec/encoder/Token;II)V
    .registers 5
    .param p1, "previous"    # Lcom/google/zxing/aztec/encoder/Token;
    .param p2, "binaryShiftStart"    # I
    .param p3, "binaryShiftByteCount"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/google/zxing/aztec/encoder/Token;-><init>(Lcom/google/zxing/aztec/encoder/Token;)V

    .line 30
    int-to-short v0, p2

    iput-short v0, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftStart:S

    .line 31
    int-to-short v0, p3

    iput-short v0, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    .line 32
    return-void
.end method


# virtual methods
.method public appendTo(Lcom/google/zxing/common/BitArray;[B)V
    .registers 8
    .param p1, "bitArray"    # Lcom/google/zxing/common/BitArray;
    .param p2, "text"    # [B

    .line 36
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    if-lt v0, v1, :cond_6

    .line 53
    .end local v0    # "i":I
    return-void

    .line 37
    .restart local v0    # "i":I
    :cond_6
    const/16 v1, 0x3e

    const/16 v2, 0x1f

    if-eqz v0, :cond_12

    if-ne v0, v2, :cond_35

    iget-short v3, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    if-gt v3, v1, :cond_35

    .line 40
    :cond_12
    const/4 v3, 0x5

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 41
    iget-short v4, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    if-le v4, v1, :cond_23

    .line 42
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    sub-int/2addr v1, v2

    const/16 v2, 0x10

    invoke-virtual {p1, v1, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 43
    goto :goto_35

    :cond_23
    if-nez v0, :cond_2f

    .line 45
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p1, v1, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 46
    goto :goto_35

    .line 48
    :cond_2f
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    sub-int/2addr v1, v2

    invoke-virtual {p1, v1, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 51
    :cond_35
    :goto_35
    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftStart:S

    add-int/2addr v1, v0

    aget-byte v1, p2, v1

    const/16 v2, 0x8

    invoke-virtual {p1, v1, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 36
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftStart:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-short v1, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftStart:S

    iget-short v2, p0, Lcom/google/zxing/aztec/encoder/BinaryShiftToken;->binaryShiftByteCount:S

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
