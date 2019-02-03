.class public final Lcom/google/zxing/datamatrix/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 39
    return-void
.end method

.method private correctErrors([BI)V
    .registers 8
    .param p1, "codewordBytes"    # [B
    .param p2, "numDataCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 117
    array-length v0, p1

    .line 119
    .local v0, "numCodewords":I
    new-array v1, v0, [I

    .line 120
    .local v1, "codewordsInts":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-lt v2, v0, :cond_20

    .line 123
    .end local v2    # "i":I
    array-length v2, p1

    sub-int/2addr v2, p2

    .line 125
    .local v2, "numECCodewords":I
    :try_start_8
    iget-object v3, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-virtual {v3, v1, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_d
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_8 .. :try_end_d} :catch_1a

    .line 126
    nop

    .line 131
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    if-lt v3, p2, :cond_12

    .line 134
    .end local v3    # "i":I
    return-void

    .line 132
    .restart local v3    # "i":I
    :cond_12
    aget v4, v1, v3

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 131
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 126
    .end local v3    # "i":I
    :catch_1a
    move-exception v3

    .line 127
    .local v3, "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    .line 121
    .end local v3    # "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    .local v2, "i":I
    :cond_20
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    .line 120
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .registers 16
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 75
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 76
    .local v0, "parser":Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;
    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->getVersion()Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v1

    .line 79
    .local v1, "version":Lcom/google/zxing/datamatrix/decoder/Version;
    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    .line 81
    .local v2, "codewords":[B
    invoke-static {v2, v1}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;

    move-result-object v3

    .line 83
    .local v3, "dataBlocks":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    array-length v4, v3

    .line 86
    .local v4, "dataBlocksCount":I
    const/4 v5, 0x0

    .line 87
    .local v5, "totalBytes":I
    array-length v6, v3

    const/4 v7, 0x0

    :goto_15
    if-lt v7, v6, :cond_3f

    .line 90
    new-array v8, v5, [B

    .line 93
    .local v8, "resultBytes":[B
    const/4 v6, 0x0

    .local v6, "j":I
    move v9, v6

    .end local v6    # "j":I
    .local v9, "j":I
    :goto_1b
    if-lt v9, v4, :cond_22

    .line 105
    .end local v9    # "j":I
    invoke-static {v8}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decode([B)Lcom/google/zxing/common/DecoderResult;

    move-result-object v6

    return-object v6

    .line 94
    .restart local v9    # "j":I
    :cond_22
    aget-object v10, v3, v9

    .line 95
    .local v10, "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getCodewords()[B

    move-result-object v11

    .line 96
    .local v11, "codewordBytes":[B
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v12

    .line 97
    .local v12, "numDataCodewords":I
    invoke-direct {p0, v11, v12}, Lcom/google/zxing/datamatrix/decoder/Decoder;->correctErrors([BI)V

    .line 98
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_30
    if-lt v6, v12, :cond_35

    .line 93
    .end local v6    # "i":I
    .end local v10    # "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .end local v11    # "codewordBytes":[B
    .end local v12    # "numDataCodewords":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_1b

    .line 100
    .restart local v6    # "i":I
    .restart local v10    # "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .restart local v11    # "codewordBytes":[B
    .restart local v12    # "numDataCodewords":I
    :cond_35
    mul-int v7, v6, v4

    add-int/2addr v7, v9

    aget-byte v13, v11, v6

    aput-byte v13, v8, v7

    .line 98
    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    .line 87
    .end local v6    # "i":I
    .end local v8    # "resultBytes":[B
    .end local v9    # "j":I
    .end local v10    # "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .end local v11    # "codewordBytes":[B
    .end local v12    # "numDataCodewords":I
    :cond_3f
    aget-object v8, v3, v7

    .line 88
    .local v8, "db":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v9

    add-int/2addr v5, v9

    .line 87
    .end local v8    # "db":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    add-int/lit8 v7, v7, 0x1

    goto :goto_15
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .registers 7
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 51
    array-length v0, p1

    .line 52
    .local v0, "dimension":I
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 53
    .local v1, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-lt v2, v0, :cond_e

    .line 60
    .end local v2    # "i":I
    invoke-virtual {p0, v1}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    .line 54
    .restart local v2    # "i":I
    :cond_e
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_f
    if-lt v3, v0, :cond_14

    .line 53
    .end local v3    # "j":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 55
    .restart local v3    # "j":I
    :cond_14
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_1d

    .line 56
    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 54
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method
