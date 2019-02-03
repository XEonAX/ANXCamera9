.class final Lcom/google/zxing/datamatrix/encoder/EncoderContext;
.super Ljava/lang/Object;
.source "EncoderContext.java"


# instance fields
.field private final codewords:Ljava/lang/StringBuilder;

.field private maxSize:Lcom/google/zxing/Dimension;

.field private minSize:Lcom/google/zxing/Dimension;

.field private final msg:Ljava/lang/String;

.field private newEncoding:I

.field pos:I

.field private shape:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

.field private skipAtEnd:I

.field private symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 9
    .param p1, "msg"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 38
    .local v0, "msgBinary":[B
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 39
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v3, v0

    .local v3, "c":I
    :goto_15
    if-lt v2, v3, :cond_30

    .line 46
    .end local v2    # "i":I
    .end local v3    # "c":I
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->msg:Ljava/lang/String;

    .line 47
    sget-object v2, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_NONE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    iput-object v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->shape:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->codewords:Ljava/lang/StringBuilder;

    .line 49
    const/4 v2, -0x1

    iput v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->newEncoding:I

    .line 50
    return-void

    .line 40
    .restart local v2    # "i":I
    .restart local v3    # "c":I
    :cond_30
    aget-byte v4, v0, v2

    and-int/lit16 v4, v4, 0xff

    int-to-char v4, v4

    .line 41
    .local v4, "ch":C
    const/16 v5, 0x3f

    if-ne v4, v5, :cond_48

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v5, :cond_40

    goto :goto_48

    .line 42
    :cond_40
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Message contains characters outside ISO-8859-1 encoding."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 44
    :cond_48
    :goto_48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .end local v4    # "ch":C
    add-int/lit8 v2, v2, 0x1

    goto :goto_15
.end method

.method private getTotalMessageCharCount()I
    .registers 3

    .line 110
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->msg:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->skipAtEnd:I

    sub-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public getCodewordCount()I
    .registers 2

    .line 90
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->codewords:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    return v0
.end method

.method public getCodewords()Ljava/lang/StringBuilder;
    .registers 2

    .line 78
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->codewords:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public getCurrent()C
    .registers 3

    .line 74
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->msg:Ljava/lang/String;

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public getCurrentChar()C
    .registers 3

    .line 70
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->msg:Ljava/lang/String;

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .line 62
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public getNewEncoding()I
    .registers 2

    .line 94
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->newEncoding:I

    return v0
.end method

.method public getRemainingCharacters()I
    .registers 3

    .line 114
    invoke-direct {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getTotalMessageCharCount()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getSymbolInfo()Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    .registers 2

    .line 118
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    return-object v0
.end method

.method public hasMoreCharacters()Z
    .registers 3

    .line 106
    iget v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-direct {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getTotalMessageCharCount()I

    move-result v1

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method public resetEncoderSignal()V
    .registers 2

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->newEncoding:I

    .line 103
    return-void
.end method

.method public resetSymbolInfo()V
    .registers 2

    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 133
    return-void
.end method

.method public setSizeConstraints(Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;)V
    .registers 3
    .param p1, "minSize"    # Lcom/google/zxing/Dimension;
    .param p2, "maxSize"    # Lcom/google/zxing/Dimension;

    .line 57
    iput-object p1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->minSize:Lcom/google/zxing/Dimension;

    .line 58
    iput-object p2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->maxSize:Lcom/google/zxing/Dimension;

    .line 59
    return-void
.end method

.method public setSkipAtEnd(I)V
    .registers 2
    .param p1, "count"    # I

    .line 66
    iput p1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->skipAtEnd:I

    .line 67
    return-void
.end method

.method public setSymbolShape(Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)V
    .registers 2
    .param p1, "shape"    # Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 53
    iput-object p1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->shape:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 54
    return-void
.end method

.method public signalEncoderChange(I)V
    .registers 2
    .param p1, "encoding"    # I

    .line 98
    iput p1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->newEncoding:I

    .line 99
    return-void
.end method

.method public updateSymbolInfo()V
    .registers 2

    .line 122
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->updateSymbolInfo(I)V

    .line 123
    return-void
.end method

.method public updateSymbolInfo(I)V
    .registers 6
    .param p1, "len"    # I

    .line 126
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v0

    if-le p1, v0, :cond_19

    .line 127
    :cond_c
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->shape:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    iget-object v1, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->minSize:Lcom/google/zxing/Dimension;

    iget-object v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->maxSize:Lcom/google/zxing/Dimension;

    const/4 v3, 0x1

    invoke-static {p1, v0, v1, v2, v3}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->lookup(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->symbolInfo:Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    .line 129
    :cond_19
    return-void
.end method

.method public writeCodeword(C)V
    .registers 3
    .param p1, "codeword"    # C

    .line 86
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->codewords:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    return-void
.end method

.method public writeCodewords(Ljava/lang/String;)V
    .registers 3
    .param p1, "codewords"    # Ljava/lang/String;

    .line 82
    iget-object v0, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->codewords:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    return-void
.end method
