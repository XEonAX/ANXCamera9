.class public final Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;
.super Lcom/google/zxing/qrcode/QRCodeReader;
.source "QRCodeMultiReader.java"

# interfaces
.implements Lcom/google/zxing/multi/MultipleBarcodeReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;
    }
.end annotation


# static fields
.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

.field private static final NO_POINTS:[Lcom/google/zxing/ResultPoint;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 50
    const/4 v0, 0x0

    new-array v1, v0, [Lcom/google/zxing/Result;

    sput-object v1, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

    .line 51
    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    sput-object v0, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/google/zxing/qrcode/QRCodeReader;-><init>()V

    return-void
.end method

.method private static processStructuredAppend(Ljava/util/List;)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;"
        }
    .end annotation

    .line 100
    .local p0, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    const/4 v0, 0x0

    .line 103
    .local v0, "hasSA":Z
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 109
    .end local v0    # "hasSA":Z
    .local v2, "hasSA":Z
    :goto_0
    move v2, v0

    goto :goto_1

    .line 103
    .end local v2    # "hasSA":Z
    .restart local v0    # "hasSA":Z
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/Result;

    .line 104
    .local v2, "result":Lcom/google/zxing/Result;
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v4, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 105
    const/4 v0, 0x1

    .line 106
    goto :goto_0

    .line 109
    .end local v0    # "hasSA":Z
    .local v2, "hasSA":Z
    :goto_1
    if-nez v2, :cond_2

    .line 110
    return-object p0

    .line 114
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    .line 115
    .local v4, "newResults":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    .line 116
    .local v5, "saResults":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_a

    .line 123
    new-instance v0, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;-><init>(Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;)V

    invoke-static {v5, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .local v0, "concatedText":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 126
    .local v1, "rawBytesLen":I
    const/4 v6, 0x0

    .line 127
    .local v6, "byteSegmentLength":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_7

    .line 139
    new-array v8, v1, [B

    .line 140
    .local v8, "newRawBytes":[B
    new-array v9, v6, [B

    .line 141
    .local v9, "newByteSegment":[B
    const/4 v7, 0x0

    .line 142
    .local v7, "newRawBytesIndex":I
    const/4 v10, 0x0

    .line 143
    .local v10, "byteSegmentIndex":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_5

    .line 156
    new-instance v11, Lcom/google/zxing/Result;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    sget-object v14, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v11, v12, v8, v13, v14}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 157
    .local v11, "newResult":Lcom/google/zxing/Result;
    if-lez v6, :cond_4

    .line 158
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .local v12, "byteSegmentList":Ljava/util/Collection;, "Ljava/util/Collection<[B>;"
    invoke-interface {v12, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 160
    sget-object v13, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v11, v13, v12}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 162
    .end local v12    # "byteSegmentList":Ljava/util/Collection;, "Ljava/util/Collection<[B>;"
    :cond_4
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    return-object v4

    .line 143
    .end local v11    # "newResult":Lcom/google/zxing/Result;
    :cond_5
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/zxing/Result;

    .line 144
    .local v12, "saResult":Lcom/google/zxing/Result;
    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v13

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v14

    array-length v14, v14

    const/4 v15, 0x0

    invoke-static {v13, v15, v8, v7, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v13

    array-length v13, v13

    add-int/2addr v7, v13

    .line 146
    invoke-virtual {v12}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v13

    sget-object v14, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v13, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 149
    invoke-virtual {v12}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v13

    sget-object v14, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Iterable;

    .line 148
    nop

    .line 150
    .local v13, "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_6

    .end local v12    # "saResult":Lcom/google/zxing/Result;
    .end local v13    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    goto :goto_4

    .restart local v12    # "saResult":Lcom/google/zxing/Result;
    .restart local v13    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    :cond_6
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v15, v16

    check-cast v15, [B

    .line 151
    .local v15, "segment":[B
    move/from16 v17, v2

    array-length v2, v15

    .end local v2    # "hasSA":Z
    .local v17, "hasSA":Z
    const/4 v3, 0x0

    invoke-static {v15, v3, v9, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    array-length v2, v15

    add-int/2addr v10, v2

    .line 150
    .end local v15    # "segment":[B
    move v15, v3

    move/from16 v2, v17

    goto :goto_5

    .line 127
    .end local v7    # "newRawBytesIndex":I
    .end local v8    # "newRawBytes":[B
    .end local v9    # "newByteSegment":[B
    .end local v10    # "byteSegmentIndex":I
    .end local v12    # "saResult":Lcom/google/zxing/Result;
    .end local v13    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    .end local v17    # "hasSA":Z
    .restart local v2    # "hasSA":Z
    :cond_7
    move/from16 v17, v2

    .end local v2    # "hasSA":Z
    .restart local v17    # "hasSA":Z
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/Result;

    .line 128
    .local v2, "saResult":Lcom/google/zxing/Result;
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v1, v3

    .line 130
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v8, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 133
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v8, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    .line 132
    nop

    .line 134
    .local v3, "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_8

    .end local v2    # "saResult":Lcom/google/zxing/Result;
    .end local v3    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    goto :goto_7

    .restart local v2    # "saResult":Lcom/google/zxing/Result;
    .restart local v3    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    :cond_8
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 135
    .local v9, "segment":[B
    array-length v10, v9

    add-int/2addr v6, v10

    .end local v9    # "segment":[B
    goto :goto_6

    .line 127
    .end local v2    # "saResult":Lcom/google/zxing/Result;
    .end local v3    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    :cond_9
    :goto_7
    move/from16 v2, v17

    goto/16 :goto_3

    .line 116
    .end local v0    # "concatedText":Ljava/lang/StringBuilder;
    .end local v1    # "rawBytesLen":I
    .end local v6    # "byteSegmentLength":I
    .end local v17    # "hasSA":Z
    .local v2, "hasSA":Z
    :cond_a
    move/from16 v17, v2

    .end local v2    # "hasSA":Z
    .restart local v17    # "hasSA":Z
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/Result;

    .line 117
    .local v0, "result":Lcom/google/zxing/Result;
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v1

    sget-object v2, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 119
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .end local v0    # "result":Lcom/google/zxing/Result;
    .end local v17    # "hasSA":Z
    .restart local v2    # "hasSA":Z
    :cond_b
    move/from16 v2, v17

    goto/16 :goto_2
.end method


# virtual methods
.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    .locals 12
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 60
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v0, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    new-instance v1, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v1, p2}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->detectMulti(Ljava/util/Map;)[Lcom/google/zxing/common/DetectorResult;

    move-result-object v1

    .line 62
    .local v1, "detectorResults":[Lcom/google/zxing/common/DetectorResult;
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v2, :cond_1

    .line 91
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    sget-object v2, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

    return-object v2

    .line 94
    :cond_0
    invoke-static {v0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->processStructuredAppend(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 95
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/zxing/Result;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/zxing/Result;

    return-object v2

    .line 62
    :cond_1
    aget-object v4, v1, v3

    .line 64
    .local v4, "detectorResult":Lcom/google/zxing/common/DetectorResult;
    :try_start_0
    invoke-virtual {p0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->getDecoder()Lcom/google/zxing/qrcode/decoder/Decoder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/zxing/common/DetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v6

    invoke-virtual {v5, v6, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    .line 65
    .local v5, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    invoke-virtual {v4}, Lcom/google/zxing/common/DetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    .line 67
    .local v6, "points":[Lcom/google/zxing/ResultPoint;
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v7

    instance-of v7, v7, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    if-eqz v7, :cond_2

    .line 68
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    invoke-virtual {v7, v6}, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->applyMirroredCorrection([Lcom/google/zxing/ResultPoint;)V

    .line 70
    :cond_2
    new-instance v7, Lcom/google/zxing/Result;

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v9

    .line 71
    sget-object v10, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    .line 70
    invoke-direct {v7, v8, v9, v6, v10}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 72
    .local v7, "result":Lcom/google/zxing/Result;
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v8

    .line 73
    .local v8, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-eqz v8, :cond_3

    .line 74
    sget-object v9, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v7, v9, v8}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 76
    :cond_3
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v9

    .line 77
    .local v9, "ecLevel":Ljava/lang/String;
    if-eqz v9, :cond_4

    .line 78
    sget-object v10, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v7, v10, v9}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 80
    :cond_4
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->hasStructuredAppend()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 81
    sget-object v10, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    .line 82
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendSequenceNumber()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 81
    invoke-virtual {v7, v10, v11}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 83
    sget-object v10, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_PARITY:Lcom/google/zxing/ResultMetadataType;

    .line 84
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendParity()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 83
    invoke-virtual {v7, v10, v11}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 86
    :cond_5
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .end local v5    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    .end local v6    # "points":[Lcom/google/zxing/ResultPoint;
    .end local v7    # "result":Lcom/google/zxing/Result;
    .end local v8    # "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v9    # "ecLevel":Ljava/lang/String;
    goto :goto_1

    :catch_0
    move-exception v5

    .line 62
    .end local v4    # "detectorResult":Lcom/google/zxing/common/DetectorResult;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0
.end method
