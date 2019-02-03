.class public final Lcom/google/zxing/oned/EAN13Writer;
.super Lcom/google/zxing/oned/UPCEANWriter;
.source "EAN13Writer.java"


# static fields
.field private static final CODE_WIDTH:I = 0x5f


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANWriter;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 9
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

    .line 46
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_9

    .line 50
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/UPCEANWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0

    .line 47
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode EAN_13, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)[Z
    .registers 11
    .param p1, "contents"    # Ljava/lang/String;

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_83

    .line 60
    :try_start_8
    invoke-static {p1}, Lcom/google/zxing/oned/UPCEANReader;->checkStandardUPCEANChecksum(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_c
    .catch Lcom/google/zxing/FormatException; {:try_start_8 .. :try_end_c} :catch_7a

    if-eqz v0, :cond_72

    .line 67
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 68
    .local v2, "firstDigit":I
    sget-object v3, Lcom/google/zxing/oned/EAN13Reader;->FIRST_DIGIT_ENCODINGS:[I

    aget v3, v3, v2

    .line 69
    .local v3, "parities":I
    const/16 v4, 0x5f

    new-array v4, v4, [Z

    .line 70
    .local v4, "result":[Z
    const/4 v5, 0x0

    .line 72
    .local v5, "pos":I
    sget-object v6, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    invoke-static {v4, v5, v6, v1}, Lcom/google/zxing/oned/EAN13Writer;->appendPattern([ZI[IZ)I

    move-result v6

    add-int/2addr v5, v6

    .line 75
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_29
    const/4 v7, 0x6

    if-le v6, v7, :cond_54

    .line 83
    .end local v6    # "i":I
    sget-object v6, Lcom/google/zxing/oned/UPCEANReader;->MIDDLE_PATTERN:[I

    invoke-static {v4, v5, v6, v0}, Lcom/google/zxing/oned/EAN13Writer;->appendPattern([ZI[IZ)I

    move-result v0

    add-int/2addr v5, v0

    .line 85
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_34
    const/16 v6, 0xc

    if-le v0, v6, :cond_3e

    .line 89
    .end local v0    # "i":I
    sget-object v0, Lcom/google/zxing/oned/UPCEANReader;->START_END_PATTERN:[I

    invoke-static {v4, v5, v0, v1}, Lcom/google/zxing/oned/EAN13Writer;->appendPattern([ZI[IZ)I

    .line 91
    return-object v4

    .line 86
    .restart local v0    # "i":I
    :cond_3e
    add-int/lit8 v6, v0, 0x1

    invoke-virtual {p1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 87
    .local v6, "digit":I
    sget-object v7, Lcom/google/zxing/oned/UPCEANReader;->L_PATTERNS:[[I

    aget-object v7, v7, v6

    invoke-static {v4, v5, v7, v1}, Lcom/google/zxing/oned/EAN13Writer;->appendPattern([ZI[IZ)I

    move-result v7

    add-int/2addr v5, v7

    .line 85
    .end local v6    # "digit":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 76
    .end local v0    # "i":I
    .local v6, "i":I
    :cond_54
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {p1, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 77
    .local v8, "digit":I
    sub-int/2addr v7, v6

    shr-int v7, v3, v7

    and-int/2addr v7, v1

    if-ne v7, v1, :cond_66

    .line 78
    add-int/lit8 v8, v8, 0xa

    .line 80
    :cond_66
    sget-object v7, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    aget-object v7, v7, v8

    invoke-static {v4, v5, v7, v0}, Lcom/google/zxing/oned/EAN13Writer;->appendPattern([ZI[IZ)I

    move-result v7

    add-int/2addr v5, v7

    .line 75
    .end local v8    # "digit":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_29

    .line 61
    .end local v2    # "firstDigit":I
    .end local v3    # "parities":I
    .end local v4    # "result":[Z
    .end local v5    # "pos":I
    .end local v6    # "i":I
    :cond_72
    :try_start_72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Contents do not pass checksum"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_7a
    .catch Lcom/google/zxing/FormatException; {:try_start_72 .. :try_end_7a} :catch_7a

    .line 63
    :catch_7a
    move-exception v0

    .line 64
    .local v0, "ignored":Lcom/google/zxing/FormatException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Illegal contents"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 56
    .end local v0    # "ignored":Lcom/google/zxing/FormatException;
    :cond_83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requested contents should be 13 digits long, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 56
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
