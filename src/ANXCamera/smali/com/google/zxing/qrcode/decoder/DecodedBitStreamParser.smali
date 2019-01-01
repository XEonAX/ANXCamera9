.class final Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# static fields
.field private static final ALPHANUMERIC_CHARS:[C

.field private static final GB2312_SUBSET:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/16 v0, 0x2d

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    .line 46
    nop

    .line 47
    nop

    .line 48
    nop

    .line 49
    nop

    .line 45
    sput-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    .line 51
    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x20s
        0x24s
        0x25s
        0x2as
        0x2bs
        0x2ds
        0x2es
        0x2fs
        0x3as
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method

.method static decode([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 17
    .param p0, "bytes"    # [B
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/google/zxing/qrcode/decoder/Version;",
            "Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v1, p1

    .line 60
    new-instance v0, Lcom/google/zxing/common/BitSource;

    move-object/from16 v9, p0

    invoke-direct {v0, v9}, Lcom/google/zxing/common/BitSource;-><init>([B)V

    move-object v10, v0

    .line 61
    .local v10, "bits":Lcom/google/zxing/common/BitSource;
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x32

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v11, v0

    .line 62
    .local v11, "result":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v0, v8}, Ljava/util/ArrayList;-><init>(I)V

    move-object v12, v0

    .line 63
    .local v12, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v0, -0x1

    .line 64
    .local v0, "symbolSequence":I
    const/4 v2, -0x1

    .line 67
    .local v2, "parityData":I
    const/4 v3, 0x0

    .line 68
    .local v3, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    const/4 v4, 0x0

    move v13, v0

    move v14, v2

    move-object v0, v3

    .end local v2    # "parityData":I
    .end local v3    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v4, "fc1InEffect":Z
    .local v13, "symbolSequence":I
    .local v14, "parityData":I
    :goto_0
    move v15, v4

    .line 72
    .end local v4    # "fc1InEffect":Z
    .local v15, "fc1InEffect":Z
    :try_start_0
    invoke-virtual {v10}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 74
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    .line 75
    .local v2, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    goto :goto_1

    .line 76
    .end local v2    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_0
    invoke-virtual {v10, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/Mode;->forBits(I)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v2

    .restart local v2    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :goto_1
    move-object v7, v2

    .line 78
    .end local v2    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .local v7, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    if-eq v7, v2, :cond_d

    .line 79
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_FIRST_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    if-eq v7, v2, :cond_c

    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_SECOND_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_1

    .line 81
    move-object/from16 v16, v0

    move-object v0, v7

    goto/16 :goto_4

    .line 82
    :cond_1
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->STRUCTURED_APPEND:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_3

    .line 83
    invoke-virtual {v10}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2

    .line 88
    const/16 v2, 0x8

    invoke-virtual {v10, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    move v13, v3

    .line 89
    invoke-virtual {v10, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 90
    .end local v14    # "parityData":I
    .local v2, "parityData":I
    nop

    .line 124
    move-object/from16 v16, v0

    move v14, v2

    .end local v2    # "parityData":I
    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .end local v15    # "fc1InEffect":Z
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v4    # "fc1InEffect":Z
    .restart local v14    # "parityData":I
    .local v16, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :goto_2
    move-object v0, v7

    goto/16 :goto_5

    .line 84
    .end local v4    # "fc1InEffect":Z
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v15    # "fc1InEffect":Z
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    .line 90
    :cond_3
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_5

    .line 92
    invoke-static {v10}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->parseECIValue(Lcom/google/zxing/common/BitSource;)I

    move-result v2

    .line 93
    .local v2, "value":I
    invoke-static {v2}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v3

    move-object v0, v3

    .line 94
    if-eqz v0, :cond_4

    .line 124
    .end local v2    # "value":I
    move-object/from16 v16, v0

    goto :goto_2

    .line 95
    .restart local v2    # "value":I
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 99
    .end local v2    # "value":I
    :cond_5
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->HANZI:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_7

    .line 101
    invoke-virtual {v10, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 102
    .local v2, "subset":I
    invoke-virtual {v7, v1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v3

    invoke-virtual {v10, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    .line 103
    .local v3, "countHanzi":I
    if-ne v2, v8, :cond_6

    .line 104
    invoke-static {v10, v11, v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeHanziSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    .line 106
    .end local v2    # "subset":I
    .end local v3    # "countHanzi":I
    nop

    .line 124
    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :cond_6
    :goto_3
    move-object/from16 v16, v0

    goto :goto_2

    .line 109
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_7
    invoke-virtual {v7, v1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v2

    invoke-virtual {v10, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    move v6, v2

    .line 110
    .local v6, "count":I
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_8

    .line 111
    invoke-static {v10, v11, v6}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeNumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    .line 112
    goto :goto_3

    :cond_8
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_9

    .line 113
    invoke-static {v10, v11, v6, v15}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeAlphanumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;IZ)V

    .line 114
    goto :goto_3

    :cond_9
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v7, v2, :cond_a

    .line 115
    move-object v2, v10

    move-object v3, v11

    move v4, v6

    move-object v5, v0

    move v8, v6

    move-object v6, v12

    .end local v6    # "count":I
    .local v8, "count":I
    move-object/from16 v16, v0

    move-object v0, v7

    move-object/from16 v7, p3

    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    invoke-static/range {v2 .. v7}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeByteSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;ILcom/google/zxing/common/CharacterSetECI;Ljava/util/Collection;Ljava/util/Map;)V

    .line 116
    goto :goto_5

    .end local v8    # "count":I
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v6    # "count":I
    .restart local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_a
    move-object/from16 v16, v0

    move v8, v6

    move-object v0, v7

    .end local v6    # "count":I
    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v8    # "count":I
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v0, v2, :cond_b

    .line 117
    invoke-static {v10, v11, v8}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeKanjiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    .line 118
    goto :goto_5

    .line 119
    :cond_b
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    .line 81
    .end local v8    # "count":I
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_c
    move-object/from16 v16, v0

    move-object v0, v7

    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :goto_4
    const/4 v2, 0x1

    .line 82
    .end local v15    # "fc1InEffect":Z
    .local v2, "fc1InEffect":Z
    nop

    .line 124
    move v4, v2

    goto :goto_6

    .end local v2    # "fc1InEffect":Z
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .local v0, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v15    # "fc1InEffect":Z
    :cond_d
    move-object/from16 v16, v0

    move-object v0, v7

    .end local v7    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .end local v15    # "fc1InEffect":Z
    .local v0, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .restart local v4    # "fc1InEffect":Z
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :goto_5
    move v4, v15

    :goto_6
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v0, v2, :cond_10

    .line 125
    .end local v0    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    .end local v4    # "fc1InEffect":Z
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    nop

    .line 130
    new-instance v0, Lcom/google/zxing/common/DecoderResult;

    .line 131
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 132
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_e

    .line 133
    move-object v5, v3

    goto :goto_7

    :cond_e
    move-object v5, v12

    :goto_7
    if-nez p2, :cond_f

    .line 134
    move-object v6, v3

    goto :goto_8

    .line 133
    :cond_f
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->toString()Ljava/lang/String;

    move-result-object v2

    .line 134
    move-object v6, v2

    .line 135
    :goto_8
    nop

    .line 130
    move-object v2, v0

    move-object v3, v9

    move v7, v13

    move v8, v14

    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;II)V

    return-object v0

    .line 68
    .restart local v4    # "fc1InEffect":Z
    .restart local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :cond_10
    move-object/from16 v0, v16

    const/4 v8, 0x1

    goto/16 :goto_0

    .line 125
    .end local v4    # "fc1InEffect":Z
    .end local v16    # "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    :catch_0
    move-exception v0

    .line 127
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2
.end method

.method private static decodeAlphanumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;IZ)V
    .locals 5
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .param p3, "fc1InEffect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 259
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 260
    .local v0, "start":I
    :goto_0
    const/4 v1, 0x1

    if-gt p2, v1, :cond_6

    .line 269
    if-ne p2, v1, :cond_1

    .line 271
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    const/4 v3, 0x6

    if-lt v2, v3, :cond_0

    .line 274
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 272
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 277
    :cond_1
    :goto_1
    if-eqz p3, :cond_5

    .line 279
    move v2, v0

    .local v2, "i":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lt v2, v3, :cond_2

    .end local v2    # "i":I
    goto :goto_4

    .line 280
    .restart local v2    # "i":I
    :cond_2
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x25

    if-ne v3, v4, :cond_4

    .line 281
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v1

    if-ge v2, v3, :cond_3

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_3

    .line 283
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 284
    goto :goto_3

    .line 286
    :cond_3
    const/16 v3, 0x1d

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 279
    :cond_4
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 291
    .end local v2    # "i":I
    :cond_5
    :goto_4
    return-void

    .line 261
    :cond_6
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v1

    const/16 v2, 0xb

    if-lt v1, v2, :cond_7

    .line 264
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 265
    .local v1, "nextTwoCharsBits":I
    div-int/lit8 v2, v1, 0x2d

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 266
    rem-int/lit8 v2, v1, 0x2d

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 267
    add-int/lit8 p2, p2, -0x2

    .end local v1    # "nextTwoCharsBits":I
    goto :goto_0

    .line 262
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method private static decodeByteSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;ILcom/google/zxing/common/CharacterSetECI;Ljava/util/Collection;Ljava/util/Map;)V
    .locals 4
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .param p3, "currentCharacterSetECI"    # Lcom/google/zxing/common/CharacterSetECI;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitSource;",
            "Ljava/lang/StringBuilder;",
            "I",
            "Lcom/google/zxing/common/CharacterSetECI;",
            "Ljava/util/Collection<",
            "[B>;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 220
    .local p4, "byteSegments":Ljava/util/Collection;, "Ljava/util/Collection<[B>;"
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/16 v0, 0x8

    mul-int v1, v0, p2

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    if-gt v1, v2, :cond_2

    .line 224
    new-array v1, p2, [B

    .line 225
    .local v1, "readBytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, p2, :cond_1

    .line 229
    .end local v2    # "i":I
    if-nez p3, :cond_0

    .line 235
    invoke-static {v1, p5}, Lcom/google/zxing/common/StringUtils;->guessEncoding([BLjava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "encoding":Ljava/lang/String;
    goto :goto_1

    .line 237
    .end local v0    # "encoding":Ljava/lang/String;
    :cond_0
    invoke-virtual {p3}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v0

    .line 240
    .restart local v0    # "encoding":Ljava/lang/String;
    :goto_1
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    nop

    .line 244
    invoke-interface {p4, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 245
    return-void

    .line 241
    :catch_0
    move-exception v2

    .line 242
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 226
    .end local v0    # "encoding":Ljava/lang/String;
    .local v2, "i":I
    :cond_1
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 225
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 221
    .end local v1    # "readBytes":[B
    .end local v2    # "i":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeHanziSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 6
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 145
    mul-int/lit8 v0, p2, 0xd

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 151
    const/4 v0, 0x2

    mul-int/2addr v0, p2

    new-array v0, v0, [B

    .line 152
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 153
    .local v1, "offset":I
    :goto_0
    if-gtz p2, :cond_0

    .line 171
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "GB2312"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    nop

    .line 175
    return-void

    .line 172
    :catch_0
    move-exception v2

    .line 173
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 155
    .end local v2    # "ignored":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 156
    .local v2, "twoBytes":I
    div-int/lit8 v3, v2, 0x60

    shl-int/lit8 v3, v3, 0x8

    rem-int/lit8 v4, v2, 0x60

    or-int/2addr v3, v4

    .line 157
    .local v3, "assembledTwoBytes":I
    const/16 v4, 0x3bf

    if-ge v3, v4, :cond_1

    .line 159
    const v4, 0xa1a1

    add-int/2addr v3, v4

    .line 160
    goto :goto_1

    .line 162
    :cond_1
    const v4, 0xa6a1

    add-int/2addr v3, v4

    .line 164
    :goto_1
    shr-int/lit8 v4, v3, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 165
    add-int/lit8 v4, v1, 0x1

    and-int/lit16 v5, v3, 0xff

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    .line 166
    add-int/lit8 v1, v1, 0x2

    .line 167
    add-int/lit8 p2, p2, -0x1

    .end local v2    # "twoBytes":I
    .end local v3    # "assembledTwoBytes":I
    goto :goto_0

    .line 146
    .end local v0    # "buffer":[B
    .end local v1    # "offset":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeKanjiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 6
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 181
    mul-int/lit8 v0, p2, 0xd

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 187
    const/4 v0, 0x2

    mul-int/2addr v0, p2

    new-array v0, v0, [B

    .line 188
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 189
    .local v1, "offset":I
    :goto_0
    if-gtz p2, :cond_0

    .line 207
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "SJIS"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    nop

    .line 211
    return-void

    .line 208
    :catch_0
    move-exception v2

    .line 209
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 191
    .end local v2    # "ignored":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 192
    .local v2, "twoBytes":I
    div-int/lit16 v3, v2, 0xc0

    shl-int/lit8 v3, v3, 0x8

    rem-int/lit16 v4, v2, 0xc0

    or-int/2addr v3, v4

    .line 193
    .local v3, "assembledTwoBytes":I
    const/16 v4, 0x1f00

    if-ge v3, v4, :cond_1

    .line 195
    const v4, 0x8140

    add-int/2addr v3, v4

    .line 196
    goto :goto_1

    .line 198
    :cond_1
    const v4, 0xc140

    add-int/2addr v3, v4

    .line 200
    :goto_1
    shr-int/lit8 v4, v3, 0x8

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 201
    add-int/lit8 v4, v1, 0x1

    int-to-byte v5, v3

    aput-byte v5, v0, v4

    .line 202
    add-int/lit8 v1, v1, 0x2

    .line 203
    add-int/lit8 p2, p2, -0x1

    .end local v2    # "twoBytes":I
    .end local v3    # "assembledTwoBytes":I
    goto :goto_0

    .line 182
    .end local v0    # "buffer":[B
    .end local v1    # "offset":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeNumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 3
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 297
    :goto_0
    const/4 v0, 0x3

    const/16 v1, 0xa

    if-ge p2, v0, :cond_6

    .line 311
    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    .line 313
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    const/4 v1, 0x7

    if-lt v0, v1, :cond_1

    .line 316
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v0

    .line 317
    .local v0, "twoDigitsBits":I
    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    .line 320
    div-int/lit8 v1, v0, 0xa

    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 321
    rem-int/lit8 v1, v0, 0xa

    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 322
    .end local v0    # "twoDigitsBits":I
    goto :goto_1

    .line 318
    .restart local v0    # "twoDigitsBits":I
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 314
    .end local v0    # "twoDigitsBits":I
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 322
    :cond_2
    const/4 v0, 0x1

    if-ne p2, v0, :cond_5

    .line 324
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    const/4 v2, 0x4

    if-lt v0, v2, :cond_4

    .line 327
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v0

    .line 328
    .local v0, "digitBits":I
    if-ge v0, v1, :cond_3

    .line 331
    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .end local v0    # "digitBits":I
    goto :goto_1

    .line 329
    .restart local v0    # "digitBits":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 325
    .end local v0    # "digitBits":I
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 333
    :cond_5
    :goto_1
    return-void

    .line 299
    :cond_6
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    if-lt v0, v1, :cond_8

    .line 302
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v0

    .line 303
    .local v0, "threeDigitsBits":I
    const/16 v2, 0x3e8

    if-ge v0, v2, :cond_7

    .line 306
    div-int/lit8 v2, v0, 0x64

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    div-int/lit8 v2, v0, 0xa

    rem-int/2addr v2, v1

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    rem-int/lit8 v1, v0, 0xa

    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 309
    add-int/lit8 p2, p2, -0x3

    .end local v0    # "threeDigitsBits":I
    goto/16 :goto_0

    .line 304
    .restart local v0    # "threeDigitsBits":I
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 300
    .end local v0    # "threeDigitsBits":I
    :cond_8
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static parseECIValue(Lcom/google/zxing/common/BitSource;)I
    .locals 4
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 336
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 337
    .local v1, "firstByte":I
    and-int/lit16 v2, v1, 0x80

    if-nez v2, :cond_0

    .line 339
    and-int/lit8 v0, v1, 0x7f

    return v0

    .line 341
    :cond_0
    and-int/lit16 v2, v1, 0xc0

    const/16 v3, 0x80

    if-ne v2, v3, :cond_1

    .line 343
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 344
    .local v2, "secondByte":I
    and-int/lit8 v3, v1, 0x3f

    shl-int/lit8 v0, v3, 0x8

    or-int/2addr v0, v2

    return v0

    .line 346
    .end local v2    # "secondByte":I
    :cond_1
    and-int/lit16 v0, v1, 0xe0

    const/16 v2, 0xc0

    if-ne v0, v2, :cond_2

    .line 348
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 349
    .local v2, "secondThirdBytes":I
    and-int/lit8 v3, v1, 0x1f

    shl-int/lit8 v0, v3, 0x10

    or-int/2addr v0, v2

    return v0

    .line 351
    .end local v2    # "secondThirdBytes":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static toAlphaNumericChar(I)C
    .locals 1
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 248
    sget-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 251
    sget-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    aget-char v0, v0, p0

    return v0

    .line 249
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method
