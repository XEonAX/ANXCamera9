.class public final Lcom/google/zxing/qrcode/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 42
    return-void
.end method

.method private correctErrors([BI)V
    .locals 5
    .param p1, "codewordBytes"    # [B
    .param p2, "numDataCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 194
    array-length v0, p1

    .line 196
    .local v0, "numCodewords":I
    new-array v1, v0, [I

    .line 197
    .local v1, "codewordsInts":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_1

    .line 200
    .end local v2    # "i":I
    array-length v2, p1

    sub-int/2addr v2, p2

    .line 202
    .local v2, "numECCodewords":I
    :try_start_0
    iget-object v3, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-virtual {v3, v1, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    nop

    .line 208
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-lt v3, p2, :cond_0

    .line 211
    .end local v3    # "i":I
    return-void

    .line 209
    .restart local v3    # "i":I
    :cond_0
    aget v4, v1, v3

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 208
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 203
    .end local v3    # "i":I
    :catch_0
    move-exception v3

    .line 204
    .local v3, "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    .line 198
    .end local v3    # "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    .local v2, "i":I
    :cond_1
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    .line 197
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 17
    .param p1, "parser"    # Lcom/google/zxing/qrcode/decoder/BitMatrixParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/qrcode/decoder/BitMatrixParser;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 155
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    .line 156
    .local v0, "version":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->getErrorCorrectionLevel()Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    move-result-object v1

    .line 159
    .local v1, "ecLevel":Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    .line 161
    .local v2, "codewords":[B
    invoke-static {v2, v0, v1}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;

    move-result-object v3

    .line 164
    .local v3, "dataBlocks":[Lcom/google/zxing/qrcode/decoder/DataBlock;
    const/4 v4, 0x0

    .line 165
    .local v4, "totalBytes":I
    array-length v5, v3

    const/4 v6, 0x0

    move v7, v4

    move v4, v6

    .end local v4    # "totalBytes":I
    .local v7, "totalBytes":I
    :goto_0
    if-lt v4, v5, :cond_2

    .line 168
    new-array v8, v7, [B

    .line 169
    .local v8, "resultBytes":[B
    const/4 v4, 0x0

    .line 172
    .local v4, "resultOffset":I
    array-length v9, v3

    move v10, v6

    :goto_1
    if-lt v10, v9, :cond_0

    .line 182
    move-object/from16 v11, p2

    invoke-static {v8, v0, v1, v11}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decode([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    return-object v5

    .line 172
    :cond_0
    move-object/from16 v11, p2

    aget-object v12, v3, v10

    .line 173
    .local v12, "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    invoke-virtual {v12}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getCodewords()[B

    move-result-object v13

    .line 174
    .local v13, "codewordBytes":[B
    invoke-virtual {v12}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v14

    .line 175
    .local v14, "numDataCodewords":I
    move-object/from16 v15, p0

    invoke-direct {v15, v13, v14}, Lcom/google/zxing/qrcode/decoder/Decoder;->correctErrors([BI)V

    .line 176
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-lt v5, v14, :cond_1

    .line 172
    .end local v5    # "i":I
    .end local v12    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    .end local v13    # "codewordBytes":[B
    .end local v14    # "numDataCodewords":I
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 177
    .restart local v5    # "i":I
    .restart local v12    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    .restart local v13    # "codewordBytes":[B
    .restart local v14    # "numDataCodewords":I
    :cond_1
    add-int/lit8 v6, v4, 0x1

    .local v6, "resultOffset":I
    aget-byte v16, v13, v5

    aput-byte v16, v8, v4

    .line 176
    .end local v4    # "resultOffset":I
    add-int/lit8 v5, v5, 0x1

    move v4, v6

    goto :goto_2

    .line 165
    .end local v5    # "i":I
    .end local v6    # "resultOffset":I
    .end local v8    # "resultBytes":[B
    .end local v12    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    .end local v13    # "codewordBytes":[B
    .end local v14    # "numDataCodewords":I
    :cond_2
    move-object/from16 v15, p0

    move-object/from16 v11, p2

    aget-object v8, v3, v4

    .line 166
    .local v8, "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v9

    add-int/2addr v7, v9

    .line 165
    .end local v8    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .locals 1
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 73
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 6
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitMatrix;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 89
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 90
    .local v0, "parser":Lcom/google/zxing/qrcode/decoder/BitMatrixParser;
    const/4 v1, 0x0

    .line 91
    .local v1, "fe":Lcom/google/zxing/FormatException;
    const/4 v2, 0x0

    .line 93
    .local v2, "ce":Lcom/google/zxing/ChecksumException;
    :try_start_0
    invoke-direct {p0, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v3
    :try_end_0
    .catch Lcom/google/zxing/FormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/zxing/ChecksumException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 96
    :catch_0
    move-exception v3

    .line 97
    .local v3, "e":Lcom/google/zxing/ChecksumException;
    move-object v2, v3

    .end local v3    # "e":Lcom/google/zxing/ChecksumException;
    goto :goto_0

    .line 94
    :catch_1
    move-exception v3

    .line 95
    .local v3, "e":Lcom/google/zxing/FormatException;
    move-object v1, v3

    .line 103
    .end local v3    # "e":Lcom/google/zxing/FormatException;
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->remask()V

    .line 106
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->setMirror(Z)V

    .line 109
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    .line 112
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    .line 121
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->mirror()V

    .line 123
    invoke-direct {p0, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v4

    .line 126
    .local v4, "result":Lcom/google/zxing/common/DecoderResult;
    new-instance v5, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    invoke-direct {v5, v3}, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;-><init>(Z)V

    invoke-virtual {v4, v5}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V
    :try_end_1
    .catch Lcom/google/zxing/FormatException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/google/zxing/ChecksumException; {:try_start_1 .. :try_end_1} :catch_2

    .line 128
    return-object v4

    .line 140
    .end local v4    # "result":Lcom/google/zxing/common/DecoderResult;
    :catch_2
    move-exception v3

    .line 142
    .local v3, "e":Lcom/google/zxing/ChecksumException;
    if-nez v1, :cond_1

    .line 145
    if-eqz v2, :cond_0

    .line 146
    throw v2

    .line 148
    :cond_0
    throw v3

    .line 143
    :cond_1
    throw v1

    .line 130
    .end local v3    # "e":Lcom/google/zxing/ChecksumException;
    :catch_3
    move-exception v3

    .line 132
    .local v3, "e":Lcom/google/zxing/FormatException;
    if-nez v1, :cond_3

    .line 135
    if-eqz v2, :cond_2

    .line 136
    throw v2

    .line 138
    :cond_2
    throw v3

    .line 133
    :cond_3
    throw v1
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .locals 1
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 45
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 5
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[Z",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 60
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    array-length v0, p1

    .line 61
    .local v0, "dimension":I
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 62
    .local v1, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 69
    .end local v2    # "i":I
    invoke-virtual {p0, v1, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    .line 63
    .restart local v2    # "i":I
    :cond_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-lt v3, v0, :cond_1

    .line 62
    .end local v3    # "j":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 64
    .restart local v3    # "j":I
    :cond_1
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_2

    .line 65
    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 63
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
