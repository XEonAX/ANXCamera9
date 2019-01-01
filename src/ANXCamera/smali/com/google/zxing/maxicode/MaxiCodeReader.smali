.class public final Lcom/google/zxing/maxicode/MaxiCodeReader;
.super Ljava/lang/Object;
.source "MaxiCodeReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# static fields
.field private static final MATRIX_HEIGHT:I = 0x21

.field private static final MATRIX_WIDTH:I = 0x1e

.field private static final NO_POINTS:[Lcom/google/zxing/ResultPoint;


# instance fields
.field private final decoder:Lcom/google/zxing/maxicode/decoder/Decoder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    sput-object v0, Lcom/google/zxing/maxicode/MaxiCodeReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Lcom/google/zxing/maxicode/decoder/Decoder;

    invoke-direct {v0}, Lcom/google/zxing/maxicode/decoder/Decoder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/maxicode/MaxiCodeReader;->decoder:Lcom/google/zxing/maxicode/decoder/Decoder;

    .line 38
    return-void
.end method

.method private static extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .locals 14
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getEnclosingRectangle()[I

    move-result-object v0

    .line 103
    .local v0, "enclosingRectangle":[I
    if-eqz v0, :cond_3

    .line 107
    const/4 v1, 0x0

    aget v1, v0, v1

    .line 108
    .local v1, "left":I
    const/4 v2, 0x1

    aget v2, v0, v2

    .line 109
    .local v2, "top":I
    const/4 v3, 0x2

    aget v4, v0, v3

    .line 110
    .local v4, "width":I
    const/4 v5, 0x3

    aget v5, v0, v5

    .line 113
    .local v5, "height":I
    new-instance v6, Lcom/google/zxing/common/BitMatrix;

    const/16 v7, 0x21

    const/16 v8, 0x1e

    invoke-direct {v6, v8, v7}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 114
    .local v6, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v9, 0x0

    .local v9, "y":I
    :goto_0
    if-lt v9, v7, :cond_0

    .line 123
    .end local v9    # "y":I
    return-object v6

    .line 115
    .restart local v9    # "y":I
    :cond_0
    mul-int v10, v9, v5

    div-int/lit8 v11, v5, 0x2

    add-int/2addr v10, v11

    div-int/2addr v10, v7

    add-int/2addr v10, v2

    .line 116
    .local v10, "iy":I
    const/4 v11, 0x0

    .local v11, "x":I
    :goto_1
    if-lt v11, v8, :cond_1

    .line 114
    .end local v10    # "iy":I
    .end local v11    # "x":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 117
    .restart local v10    # "iy":I
    .restart local v11    # "x":I
    :cond_1
    mul-int v12, v11, v4

    div-int/lit8 v13, v4, 0x2

    add-int/2addr v12, v13

    and-int/lit8 v13, v9, 0x1

    mul-int/2addr v13, v4

    div-int/2addr v13, v3

    add-int/2addr v12, v13

    div-int/2addr v12, v8

    add-int/2addr v12, v1

    .line 118
    .local v12, "ix":I
    invoke-virtual {p0, v12, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 119
    invoke-virtual {v6, v11, v9}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 116
    .end local v12    # "ix":I
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 104
    .end local v1    # "left":I
    .end local v2    # "top":I
    .end local v4    # "width":I
    .end local v5    # "height":I
    .end local v6    # "bits":Lcom/google/zxing/common/BitMatrix;
    .end local v9    # "y":I
    .end local v10    # "iy":I
    .end local v11    # "x":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 62
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/maxicode/MaxiCodeReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 6
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 69
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    if-eqz p2, :cond_1

    sget-object v0, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/maxicode/MaxiCodeReader;->extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    .line 71
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    iget-object v1, p0, Lcom/google/zxing/maxicode/MaxiCodeReader;->decoder:Lcom/google/zxing/maxicode/decoder/Decoder;

    invoke-virtual {v1, v0, p2}, Lcom/google/zxing/maxicode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    .line 72
    .local v0, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    nop

    .line 73
    nop

    .line 76
    sget-object v1, Lcom/google/zxing/maxicode/MaxiCodeReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    .line 77
    .local v1, "points":[Lcom/google/zxing/ResultPoint;
    new-instance v2, Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v4

    sget-object v5, Lcom/google/zxing/BarcodeFormat;->MAXICODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 79
    .local v2, "result":Lcom/google/zxing/Result;
    invoke-virtual {v0}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "ecLevel":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 81
    sget-object v4, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v2, v4, v3}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 83
    :cond_0
    return-object v2

    .line 73
    .end local v0    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    .end local v1    # "points":[Lcom/google/zxing/ResultPoint;
    .end local v2    # "result":Lcom/google/zxing/Result;
    .end local v3    # "ecLevel":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method public reset()V
    .locals 0

    .line 89
    return-void
.end method
