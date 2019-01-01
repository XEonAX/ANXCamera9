.class public final Lcom/google/zxing/aztec/AztecReader;
.super Ljava/lang/Object;
.source "AztecReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/aztec/AztecReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 9
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
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 59
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v0, 0x0

    .line 60
    .local v0, "notFoundException":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 61
    .local v1, "formatException":Lcom/google/zxing/FormatException;
    new-instance v2, Lcom/google/zxing/aztec/detector/Detector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/zxing/aztec/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 62
    .local v2, "detector":Lcom/google/zxing/aztec/detector/Detector;
    const/4 v3, 0x0

    .line 63
    .local v3, "points":[Lcom/google/zxing/ResultPoint;
    const/4 v4, 0x0

    .line 65
    .local v4, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v2, v5}, Lcom/google/zxing/aztec/detector/Detector;->detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v6

    .line 66
    .local v6, "detectorResult":Lcom/google/zxing/aztec/AztecDetectorResult;
    invoke-virtual {v6}, Lcom/google/zxing/aztec/AztecDetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v7

    move-object v3, v7

    .line 67
    new-instance v7, Lcom/google/zxing/aztec/decoder/Decoder;

    invoke-direct {v7}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    invoke-virtual {v7, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v7
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/zxing/FormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v7

    .line 68
    .end local v6    # "detectorResult":Lcom/google/zxing/aztec/AztecDetectorResult;
    goto :goto_0

    .line 70
    :catch_0
    move-exception v6

    .line 71
    .local v6, "e":Lcom/google/zxing/FormatException;
    move-object v1, v6

    .end local v6    # "e":Lcom/google/zxing/FormatException;
    goto :goto_0

    .line 68
    :catch_1
    move-exception v6

    .line 69
    .local v6, "e":Lcom/google/zxing/NotFoundException;
    move-object v0, v6

    .line 73
    .end local v6    # "e":Lcom/google/zxing/NotFoundException;
    :goto_0
    if-nez v4, :cond_2

    .line 75
    const/4 v6, 0x1

    :try_start_1
    invoke-virtual {v2, v6}, Lcom/google/zxing/aztec/detector/Detector;->detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v6

    .line 76
    .local v6, "detectorResult":Lcom/google/zxing/aztec/AztecDetectorResult;
    invoke-virtual {v6}, Lcom/google/zxing/aztec/AztecDetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v7

    move-object v3, v7

    .line 77
    new-instance v7, Lcom/google/zxing/aztec/decoder/Decoder;

    invoke-direct {v7}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    invoke-virtual {v7, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object v4, v7

    .line 78
    .end local v6    # "detectorResult":Lcom/google/zxing/aztec/AztecDetectorResult;
    goto :goto_2

    :catch_2
    move-exception v6

    .line 79
    .local v6, "e":Ljava/lang/Exception;
    if-nez v0, :cond_0

    goto :goto_1

    .line 81
    :cond_0
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 82
    :catch_3
    move-exception v7

    .line 84
    .local v7, "e1":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 87
    .end local v7    # "e1":Ljava/lang/Exception;
    :goto_1
    if-eqz v1, :cond_1

    .line 88
    throw v1

    .line 91
    :cond_1
    :try_start_3
    throw v6
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 92
    :catch_4
    move-exception v7

    .line 94
    .restart local v7    # "e1":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v7    # "e1":Ljava/lang/Exception;
    :cond_2
    :goto_2
    if-eqz p2, :cond_4

    .line 100
    sget-object v6, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/ResultPointCallback;

    .line 101
    .local v6, "rpcb":Lcom/google/zxing/ResultPointCallback;
    if-eqz v6, :cond_4

    .line 102
    array-length v7, v3

    :goto_3
    if-lt v5, v7, :cond_3

    .end local v6    # "rpcb":Lcom/google/zxing/ResultPointCallback;
    goto :goto_4

    .restart local v6    # "rpcb":Lcom/google/zxing/ResultPointCallback;
    :cond_3
    aget-object v8, v3, v5

    .line 103
    .local v8, "point":Lcom/google/zxing/ResultPoint;
    invoke-interface {v6, v8}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 102
    .end local v8    # "point":Lcom/google/zxing/ResultPoint;
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 108
    .end local v6    # "rpcb":Lcom/google/zxing/ResultPointCallback;
    :cond_4
    :goto_4
    new-instance v5, Lcom/google/zxing/Result;

    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v7

    sget-object v8, Lcom/google/zxing/BarcodeFormat;->AZTEC:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v5, v6, v7, v3, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 110
    .local v5, "result":Lcom/google/zxing/Result;
    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v6

    .line 111
    .local v6, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-eqz v6, :cond_5

    .line 112
    sget-object v7, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5, v7, v6}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 114
    :cond_5
    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v7

    .line 115
    .local v7, "ecLevel":Ljava/lang/String;
    if-eqz v7, :cond_6

    .line 116
    sget-object v8, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5, v8, v7}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 119
    :cond_6
    return-object v5
.end method

.method public reset()V
    .locals 0

    .line 125
    return-void
.end method
