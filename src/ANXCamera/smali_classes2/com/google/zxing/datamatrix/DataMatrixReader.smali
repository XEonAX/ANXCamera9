.class public final Lcom/google/zxing/datamatrix/DataMatrixReader;
.super Ljava/lang/Object;
.source "DataMatrixReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# static fields
.field private static final NO_POINTS:[Lcom/google/zxing/ResultPoint;


# instance fields
.field private final decoder:Lcom/google/zxing/datamatrix/decoder/Decoder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 45
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    sput-object v0, Lcom/google/zxing/datamatrix/DataMatrixReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Decoder;

    invoke-direct {v0}, Lcom/google/zxing/datamatrix/decoder/Decoder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/DataMatrixReader;->decoder:Lcom/google/zxing/datamatrix/decoder/Decoder;

    .line 43
    return-void
.end method

.method private static extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .registers 16
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 104
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getTopLeftOnBit()[I

    move-result-object v0

    .line 105
    .local v0, "leftTopBlack":[I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getBottomRightOnBit()[I

    move-result-object v1

    .line 106
    .local v1, "rightBottomBlack":[I
    if-eqz v0, :cond_55

    if-eqz v1, :cond_55

    .line 110
    invoke-static {v0, p0}, Lcom/google/zxing/datamatrix/DataMatrixReader;->moduleSize([ILcom/google/zxing/common/BitMatrix;)I

    move-result v2

    .line 112
    .local v2, "moduleSize":I
    const/4 v3, 0x1

    aget v4, v0, v3

    .line 113
    .local v4, "top":I
    aget v5, v1, v3

    .line 114
    .local v5, "bottom":I
    const/4 v6, 0x0

    aget v7, v0, v6

    .line 115
    .local v7, "left":I
    aget v6, v1, v6

    .line 117
    .local v6, "right":I
    sub-int v8, v6, v7

    add-int/2addr v8, v3

    div-int/2addr v8, v2

    .line 118
    .local v8, "matrixWidth":I
    sub-int v9, v5, v4

    add-int/2addr v9, v3

    div-int/2addr v9, v2

    .line 119
    .local v9, "matrixHeight":I
    if-lez v8, :cond_50

    if-lez v9, :cond_50

    .line 126
    div-int/lit8 v3, v2, 0x2

    .line 127
    .local v3, "nudge":I
    add-int v10, v4, v3

    .line 128
    .end local v4    # "top":I
    .local v10, "top":I
    add-int v11, v7, v3

    .line 131
    .end local v7    # "left":I
    .local v11, "left":I
    new-instance v4, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v4, v8, v9}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    move-object v12, v4

    .line 132
    .local v12, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v4, 0x0

    .local v4, "y":I
    move v13, v4

    .end local v4    # "y":I
    .local v13, "y":I
    :goto_34
    if-lt v13, v9, :cond_37

    .line 140
    .end local v13    # "y":I
    return-object v12

    .line 133
    .restart local v13    # "y":I
    :cond_37
    mul-int v4, v13, v2

    add-int v14, v10, v4

    .line 134
    .local v14, "iOffset":I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_3c
    if-lt v4, v8, :cond_41

    .line 132
    .end local v4    # "x":I
    .end local v14    # "iOffset":I
    add-int/lit8 v13, v13, 0x1

    goto :goto_34

    .line 135
    .restart local v4    # "x":I
    .restart local v14    # "iOffset":I
    :cond_41
    mul-int v7, v4, v2

    add-int/2addr v7, v11

    invoke-virtual {p0, v7, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 136
    invoke-virtual {v12, v4, v13}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 134
    :cond_4d
    add-int/lit8 v4, v4, 0x1

    goto :goto_3c

    .line 120
    .end local v3    # "nudge":I
    .end local v10    # "top":I
    .end local v11    # "left":I
    .end local v12    # "bits":Lcom/google/zxing/common/BitMatrix;
    .end local v13    # "y":I
    .end local v14    # "iOffset":I
    .local v4, "top":I
    .restart local v7    # "left":I
    :cond_50
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    .line 107
    .end local v2    # "moduleSize":I
    .end local v4    # "top":I
    .end local v5    # "bottom":I
    .end local v6    # "right":I
    .end local v7    # "left":I
    .end local v8    # "matrixWidth":I
    .end local v9    # "matrixHeight":I
    :cond_55
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method private static moduleSize([ILcom/google/zxing/common/BitMatrix;)I
    .registers 7
    .param p0, "leftTopBlack"    # [I
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 144
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    .line 145
    .local v0, "width":I
    const/4 v1, 0x0

    aget v2, p0, v1

    .line 146
    .local v2, "x":I
    const/4 v3, 0x1

    aget v3, p0, v3

    .line 147
    .local v3, "y":I
    :goto_a
    if-ge v2, v0, :cond_16

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-nez v4, :cond_13

    goto :goto_16

    .line 148
    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 150
    :cond_16
    :goto_16
    if-eq v2, v0, :cond_24

    .line 154
    aget v1, p0, v1

    sub-int v1, v2, v1

    .line 155
    .local v1, "moduleSize":I
    if-eqz v1, :cond_1f

    .line 158
    return v1

    .line 156
    :cond_1f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v4

    throw v4

    .line 151
    .end local v1    # "moduleSize":I
    :cond_24
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 3
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/datamatrix/DataMatrixReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 9
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

    .line 67
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    if-eqz p2, :cond_1b

    sget-object v0, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 68
    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/datamatrix/DataMatrixReader;->extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    .line 69
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    iget-object v1, p0, Lcom/google/zxing/datamatrix/DataMatrixReader;->decoder:Lcom/google/zxing/datamatrix/decoder/Decoder;

    invoke-virtual {v1, v0}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1

    .line 70
    .local v1, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    sget-object v0, Lcom/google/zxing/datamatrix/DataMatrixReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    .line 71
    .local v0, "points":[Lcom/google/zxing/ResultPoint;
    goto :goto_36

    .line 72
    .end local v0    # "points":[Lcom/google/zxing/ResultPoint;
    .end local v1    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    :cond_1b
    new-instance v0, Lcom/google/zxing/datamatrix/detector/Detector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/datamatrix/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/detector/Detector;->detect()Lcom/google/zxing/common/DetectorResult;

    move-result-object v0

    .line 73
    .local v0, "detectorResult":Lcom/google/zxing/common/DetectorResult;
    iget-object v1, p0, Lcom/google/zxing/datamatrix/DataMatrixReader;->decoder:Lcom/google/zxing/datamatrix/decoder/Decoder;

    invoke-virtual {v0}, Lcom/google/zxing/common/DetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1

    .line 74
    .restart local v1    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    invoke-virtual {v0}, Lcom/google/zxing/common/DetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 76
    .local v0, "points":[Lcom/google/zxing/ResultPoint;
    :goto_36
    new-instance v2, Lcom/google/zxing/Result;

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v4

    .line 77
    sget-object v5, Lcom/google/zxing/BarcodeFormat;->DATA_MATRIX:Lcom/google/zxing/BarcodeFormat;

    .line 76
    invoke-direct {v2, v3, v4, v0, v5}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 78
    .local v2, "result":Lcom/google/zxing/Result;
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v3

    .line 79
    .local v3, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-eqz v3, :cond_50

    .line 80
    sget-object v4, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v2, v4, v3}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 82
    :cond_50
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "ecLevel":Ljava/lang/String;
    if-eqz v4, :cond_5b

    .line 84
    sget-object v5, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v2, v5, v4}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 86
    :cond_5b
    return-object v2
.end method

.method public reset()V
    .registers 1

    .line 92
    return-void
.end method
