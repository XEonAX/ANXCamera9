.class public final Lcom/google/zxing/oned/Code39Writer;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "Code39Writer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method

.method private static toIntArray(I[I)V
    .locals 3
    .param p0, "a"    # I
    .param p1, "toReturn"    # [I

    .line 83
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 87
    .end local v0    # "i":I
    return-void

    .line 84
    .restart local v0    # "i":I
    :cond_0
    rsub-int/lit8 v1, v0, 0x8

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v1, p0

    .line 85
    .local v1, "temp":I
    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x2

    :goto_1
    aput v2, p1, v0

    .line 83
    .end local v1    # "temp":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .locals 3
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 39
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_0

    .line 42
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0

    .line 40
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode CODE_39, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)[Z
    .locals 12
    .param p1, "contents"    # Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 48
    .local v0, "length":I
    const/16 v1, 0x50

    if-gt v0, v1, :cond_4

    .line 53
    const/16 v1, 0x9

    new-array v1, v1, [I

    .line 54
    .local v1, "widths":[I
    const/16 v2, 0x19

    add-int/2addr v2, v0

    .line 55
    .local v2, "codeWidth":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v4, 0x0

    if-lt v3, v0, :cond_1

    .line 65
    .end local v3    # "i":I
    new-array v5, v2, [Z

    .line 66
    .local v5, "result":[Z
    sget-object v3, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    const/16 v6, 0x27

    aget v3, v3, v6

    invoke-static {v3, v1}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 67
    const/4 v7, 0x1

    invoke-static {v5, v4, v1, v7}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v3

    .line 68
    .local v3, "pos":I
    new-array v8, v7, [I

    aput v7, v8, v4

    .line 69
    .local v8, "narrowWhite":[I
    invoke-static {v5, v3, v8, v4}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v9

    add-int/2addr v3, v9

    .line 71
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    if-lt v9, v0, :cond_0

    .line 77
    .end local v9    # "i":I
    sget-object v4, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v4, v4, v6

    invoke-static {v4, v1}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 78
    invoke-static {v5, v3, v1, v7}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    .line 79
    return-object v5

    .line 72
    .restart local v9    # "i":I
    :cond_0
    const-string v10, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    .line 73
    .local v10, "indexInString":I
    sget-object v11, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v11, v11, v10

    invoke-static {v11, v1}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 74
    invoke-static {v5, v3, v1, v7}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v11

    add-int/2addr v3, v11

    .line 75
    invoke-static {v5, v3, v8, v4}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v11

    add-int/2addr v3, v11

    .line 71
    .end local v10    # "indexInString":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 56
    .end local v5    # "result":[Z
    .end local v8    # "narrowWhite":[I
    .end local v9    # "i":I
    .local v3, "i":I
    :cond_1
    const-string v5, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 57
    .local v5, "indexInString":I
    if-ltz v5, :cond_3

    .line 60
    sget-object v6, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v6, v6, v5

    invoke-static {v6, v1}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 61
    array-length v6, v1

    :goto_2
    if-lt v4, v6, :cond_2

    .line 55
    .end local v5    # "indexInString":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 61
    .restart local v5    # "indexInString":I
    :cond_2
    aget v7, v1, v4

    .line 62
    .local v7, "width":I
    add-int/2addr v2, v7

    .line 61
    .end local v7    # "width":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 58
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Bad contents: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 49
    .end local v1    # "widths":[I
    .end local v2    # "codeWidth":I
    .end local v3    # "i":I
    .end local v5    # "indexInString":I
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Requested contents should be less than 80 digits long, but got "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
