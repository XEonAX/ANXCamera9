.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I = null

.field private static final AL:I = 0x1c

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final EXP900:[Ljava/math/BigInteger;

.field private static final LL:I = 0x1b

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMBER_OF_SEQUENCE_CODEWORDS:I = 0x2

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT_CHARS:[C

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I
    .registers 3

    .line 35
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->values()[Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v1

    :goto_17
    :try_start_17
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    move-exception v1

    :goto_22
    :try_start_22
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception v1

    :goto_2d
    :try_start_2d
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_36} :catch_37

    goto :goto_38

    :catch_37
    move-exception v1

    :goto_38
    :try_start_38
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_41} :catch_42

    goto :goto_43

    :catch_42
    move-exception v1

    :goto_43
    :try_start_43
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    move-exception v1

    :goto_4e
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 5

    .line 67
    const/16 v0, 0x1d

    new-array v0, v0, [C

    fill-array-data v0, :array_50

    .line 68
    nop

    .line 69
    nop

    .line 70
    nop

    .line 67
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    .line 72
    const/16 v0, 0x19

    new-array v0, v0, [C

    fill-array-data v0, :array_72

    .line 73
    nop

    .line 74
    nop

    .line 75
    nop

    .line 72
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    .line 77
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 85
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/math/BigInteger;

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    .line 86
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 87
    const-wide/16 v0, 0x384

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 88
    .local v0, "nineHundred":Ljava/math/BigInteger;
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v2, 0x1

    aput-object v0, v1, v2

    .line 89
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_39
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    array-length v2, v2

    if-lt v1, v2, :cond_3f

    .line 94
    .end local v0    # "nineHundred":Ljava/math/BigInteger;
    .end local v1    # "i":I
    return-void

    .line 90
    .restart local v0    # "nineHundred":Ljava/math/BigInteger;
    .restart local v1    # "i":I
    :cond_3f
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    add-int/lit8 v4, v1, -0x1

    aget-object v3, v3, v4

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    aput-object v3, v2, v1

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    :array_50
    .array-data 2
        0x3bs
        0x3cs
        0x3es
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5fs
        0x60s
        0x7es
        0x21s
        0xds
        0x9s
        0x2cs
        0x3as
        0xas
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x22s
        0x7cs
        0x2as
        0x28s
        0x29s
        0x3fs
        0x7bs
        0x7ds
        0x27s
    .end array-data

    nop

    :array_72
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
        0x26s
        0xds
        0x9s
        0x2cs
        0x3as
        0x23s
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x2bs
        0x25s
        0x2as
        0x3ds
        0x5es
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    return-void
.end method

.method private static byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I
    .registers 29
    .param p0, "mode"    # I
    .param p1, "codewords"    # [I
    .param p2, "encoding"    # Ljava/nio/charset/Charset;
    .param p3, "codeIndex"    # I
    .param p4, "result"    # Ljava/lang/StringBuilder;

    move/from16 v0, p0

    .line 448
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 449
    .local v2, "decodedBytes":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    const/16 v7, 0x386

    const-wide/16 v8, 0x384

    const/16 v10, 0x39c

    const/4 v11, 0x0

    const/4 v12, 0x6

    const/16 v13, 0x385

    const/16 v14, 0x384

    if-ne v0, v13, :cond_98

    .line 452
    const/4 v15, 0x0

    .line 453
    .local v15, "count":I
    const-wide/16 v16, 0x0

    .line 454
    .local v16, "value":J
    new-array v3, v12, [I

    .line 455
    .local v3, "byteCompactedCodewords":[I
    const/16 v19, 0x0

    .line 456
    .local v19, "end":Z
    add-int/lit8 v20, p3, 0x1

    .local v20, "codeIndex":I
    aget v1, p1, p3

    .line 457
    .end local p3    # "codeIndex":I
    .local v1, "nextCode":I
    move v12, v1

    move/from16 v1, v20

    .end local v20    # "codeIndex":I
    .local v1, "codeIndex":I
    .local v12, "nextCode":I
    :goto_27
    aget v4, p1, v11

    if-ge v1, v4, :cond_7e

    if-eqz v19, :cond_2e

    goto :goto_7e

    .line 458
    :cond_2e
    add-int/lit8 v4, v15, 0x1

    .local v4, "count":I
    aput v12, v3, v15

    .line 460
    .end local v15    # "count":I
    mul-long v21, v8, v16

    int-to-long v8, v12

    add-long v16, v21, v8

    .line 461
    add-int/lit8 v8, v1, 0x1

    .local v8, "codeIndex":I
    aget v12, p1, v1

    .line 463
    .end local v1    # "codeIndex":I
    if-eq v12, v14, :cond_71

    .line 464
    if-eq v12, v13, :cond_71

    .line 465
    if-eq v12, v7, :cond_71

    .line 466
    if-eq v12, v10, :cond_71

    .line 467
    if-eq v12, v6, :cond_71

    .line 468
    if-eq v12, v5, :cond_71

    .line 469
    const/16 v1, 0x39a

    if-ne v12, v1, :cond_4c

    goto :goto_71

    .line 473
    :cond_4c
    rem-int/lit8 v1, v4, 0x5

    if-nez v1, :cond_6e

    if-lez v4, :cond_6e

    .line 476
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_53
    const/4 v9, 0x6

    if-lt v1, v9, :cond_5b

    .line 479
    .end local v1    # "j":I
    const-wide/16 v16, 0x0

    .line 480
    const/4 v15, 0x0

    .line 457
    .end local v4    # "count":I
    .restart local v15    # "count":I
    move v1, v8

    goto :goto_7b

    .line 477
    .end local v15    # "count":I
    .restart local v1    # "j":I
    .restart local v4    # "count":I
    :cond_5b
    rsub-int/lit8 v9, v1, 0x5

    const/16 v15, 0x8

    mul-int/2addr v9, v15

    shr-long v5, v16, v9

    long-to-int v5, v5

    int-to-byte v5, v5

    invoke-virtual {v2, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 476
    add-int/lit8 v1, v1, 0x1

    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    goto :goto_53

    .line 457
    .end local v1    # "j":I
    :cond_6e
    move v15, v4

    move v1, v8

    goto :goto_77

    .line 470
    :cond_71
    :goto_71
    add-int/lit8 v1, v8, -0x1

    .line 471
    .end local v8    # "codeIndex":I
    .local v1, "codeIndex":I
    const/16 v19, 0x1

    .line 472
    nop

    .line 457
    move v15, v4

    .end local v4    # "count":I
    .restart local v15    # "count":I
    :goto_77
    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    :goto_7b
    const-wide/16 v8, 0x384

    goto :goto_27

    .line 486
    :cond_7e
    :goto_7e
    aget v4, p1, v11

    if-ne v1, v4, :cond_89

    if-ge v12, v14, :cond_89

    .line 487
    add-int/lit8 v4, v15, 0x1

    .restart local v4    # "count":I
    aput v12, v3, v15

    .end local v15    # "count":I
    goto :goto_8a

    .line 493
    .end local v4    # "count":I
    .restart local v15    # "count":I
    :cond_89
    move v4, v15

    .end local v15    # "count":I
    .restart local v4    # "count":I
    :goto_8a
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_8b
    if-lt v5, v4, :cond_8f

    .line 497
    .end local v3    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v5    # "i":I
    .end local v12    # "nextCode":I
    .end local v16    # "value":J
    .end local v19    # "end":Z
    goto/16 :goto_114

    .line 494
    .restart local v3    # "byteCompactedCodewords":[I
    .restart local v4    # "count":I
    .restart local v5    # "i":I
    .restart local v12    # "nextCode":I
    .restart local v16    # "value":J
    .restart local v19    # "end":Z
    :cond_8f
    aget v6, v3, v5

    int-to-byte v6, v6

    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 493
    add-int/lit8 v5, v5, 0x1

    goto :goto_8b

    .line 497
    .end local v1    # "codeIndex":I
    .end local v3    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v5    # "i":I
    .end local v12    # "nextCode":I
    .end local v16    # "value":J
    .end local v19    # "end":Z
    .restart local p3    # "codeIndex":I
    :cond_98
    if-ne v0, v10, :cond_112

    .line 500
    const/4 v3, 0x0

    .line 501
    .local v3, "count":I
    const-wide/16 v4, 0x0

    .line 502
    .local v4, "value":J
    const/4 v6, 0x0

    .line 503
    .local v6, "end":Z
    move/from16 v1, p3

    .end local p3    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :goto_a0
    aget v8, p1, v11

    if-ge v1, v8, :cond_114

    if-eqz v6, :cond_a8

    .end local v3    # "count":I
    .end local v4    # "value":J
    .end local v6    # "end":Z
    goto/16 :goto_114

    .line 504
    .restart local v3    # "count":I
    .restart local v4    # "value":J
    .restart local v6    # "end":Z
    :cond_a8
    add-int/lit8 v8, v1, 0x1

    .restart local v8    # "codeIndex":I
    aget v1, p1, v1

    .line 505
    .local v1, "code":I
    if-ge v1, v14, :cond_c1

    .line 506
    add-int/lit8 v3, v3, 0x1

    .line 508
    const-wide/16 v15, 0x384

    mul-long v19, v15, v4

    int-to-long v11, v1

    add-long v19, v19, v11

    .line 509
    .end local v4    # "value":J
    .local v19, "value":J
    nop

    .line 521
    move-wide/from16 v4, v19

    const/16 v9, 0x3a0

    const/16 v11, 0x39b

    const/16 v12, 0x39a

    goto :goto_e1

    .line 510
    .end local v19    # "value":J
    .restart local v4    # "value":J
    :cond_c1
    const-wide/16 v15, 0x384

    if-eq v1, v14, :cond_d8

    .line 511
    if-eq v1, v13, :cond_d8

    .line 512
    if-eq v1, v7, :cond_d8

    .line 513
    if-eq v1, v10, :cond_d8

    .line 514
    const/16 v9, 0x3a0

    if-eq v1, v9, :cond_da

    .line 515
    const/16 v11, 0x39b

    if-eq v1, v11, :cond_dc

    .line 516
    const/16 v12, 0x39a

    if-ne v1, v12, :cond_e1

    goto :goto_de

    .line 517
    :cond_d8
    const/16 v9, 0x3a0

    :cond_da
    const/16 v11, 0x39b

    :cond_dc
    const/16 v12, 0x39a

    :goto_de
    add-int/lit8 v8, v8, -0x1

    .line 518
    const/4 v6, 0x1

    .line 521
    :cond_e1
    :goto_e1
    rem-int/lit8 v17, v3, 0x5

    if-nez v17, :cond_109

    if-lez v3, :cond_109

    .line 524
    const/16 v17, 0x0

    .local v17, "j":I
    move/from16 v7, v17

    .end local v17    # "j":I
    .local v7, "j":I
    :goto_eb
    const/4 v9, 0x6

    if-lt v7, v9, :cond_f5

    .line 527
    .end local v7    # "j":I
    const-wide/16 v4, 0x0

    .line 528
    const/4 v3, 0x0

    .line 503
    .end local v1    # "code":I
    move v1, v8

    const/16 v7, 0x386

    goto :goto_110

    .line 525
    .restart local v1    # "code":I
    .restart local v7    # "j":I
    :cond_f5
    rsub-int/lit8 v17, v7, 0x5

    const/16 v18, 0x8

    mul-int v17, v17, v18

    shr-long v9, v4, v17

    long-to-int v9, v9

    int-to-byte v9, v9

    invoke-virtual {v2, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 524
    add-int/lit8 v7, v7, 0x1

    const/16 v9, 0x3a0

    const/16 v10, 0x39c

    goto :goto_eb

    .line 503
    .end local v1    # "code":I
    .end local v7    # "j":I
    :cond_109
    const/16 v18, 0x8

    move v1, v8

    const/16 v7, 0x386

    const/16 v10, 0x39c

    .end local v8    # "codeIndex":I
    .local v1, "codeIndex":I
    :goto_110
    const/4 v11, 0x0

    goto :goto_a0

    .line 532
    .end local v1    # "codeIndex":I
    .end local v3    # "count":I
    .end local v4    # "value":J
    .end local v6    # "end":Z
    .restart local p3    # "codeIndex":I
    :cond_112
    move/from16 v1, p3

    .end local p3    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :cond_114
    :goto_114
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    move-object/from16 v5, p2

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v4, p4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    return v1
.end method

.method static decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;
    .registers 10
    .param p0, "codewords"    # [I
    .param p1, "ecLevel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 101
    .local v0, "result":Ljava/lang/StringBuilder;
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 103
    .local v1, "encoding":Ljava/nio/charset/Charset;
    const/4 v2, 0x1

    .line 104
    .local v2, "codeIndex":I
    add-int/lit8 v3, v2, 0x1

    .local v3, "codeIndex":I
    aget v2, p0, v2

    .line 105
    .local v2, "code":I
    new-instance v4, Lcom/google/zxing/pdf417/PDF417ResultMetadata;

    invoke-direct {v4}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;-><init>()V

    .line 106
    .local v4, "resultMetadata":Lcom/google/zxing/pdf417/PDF417ResultMetadata;
    :goto_14
    const/4 v5, 0x0

    aget v5, p0, v5

    if-lt v3, v5, :cond_32

    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_2d

    .line 158
    new-instance v5, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, v7, v6, v7, p1}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 159
    .local v5, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    invoke-virtual {v5, v4}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V

    .line 160
    return-object v5

    .line 156
    .end local v5    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    :cond_2d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    .line 107
    :cond_32
    const/16 v5, 0x391

    if-eq v2, v5, :cond_74

    packed-switch v2, :pswitch_data_8e

    packed-switch v2, :pswitch_data_98

    .line 145
    add-int/lit8 v3, v3, -0x1

    .line 146
    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    goto :goto_7e

    .line 135
    :pswitch_43
    invoke-static {p0, v3, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I

    move-result v3

    .line 136
    goto :goto_7e

    .line 123
    :pswitch_48
    add-int/lit8 v5, v3, 0x1

    .local v5, "codeIndex":I
    aget v3, p0, v3

    .end local v3    # "codeIndex":I
    invoke-static {v3}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v3

    .line 122
    nop

    .line 124
    .local v3, "charsetECI":Lcom/google/zxing/common/CharacterSetECI;
    invoke-virtual {v3}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 125
    goto :goto_7d

    .line 128
    .end local v5    # "codeIndex":I
    .local v3, "codeIndex":I
    :pswitch_5a
    add-int/lit8 v3, v3, 0x2

    .line 129
    goto :goto_7e

    .line 132
    :pswitch_5d
    add-int/lit8 v3, v3, 0x1

    .line 133
    goto :goto_7e

    .line 140
    :pswitch_60
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    .line 119
    :pswitch_65
    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    .line 120
    goto :goto_7e

    .line 113
    :pswitch_6a
    invoke-static {v2, p0, v1, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I

    move-result v3

    .line 114
    goto :goto_7e

    .line 109
    :pswitch_6f
    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    .line 110
    goto :goto_7e

    .line 116
    :cond_74
    add-int/lit8 v5, v3, 0x1

    .restart local v5    # "codeIndex":I
    aget v3, p0, v3

    .end local v3    # "codeIndex":I
    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    nop

    .line 149
    .end local v5    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :goto_7d
    move v3, v5

    :goto_7e
    array-length v5, p0

    if-ge v3, v5, :cond_88

    .line 150
    add-int/lit8 v5, v3, 0x1

    .restart local v5    # "codeIndex":I
    aget v2, p0, v3

    .line 151
    .end local v3    # "codeIndex":I
    nop

    .line 106
    move v3, v5

    goto :goto_14

    .line 152
    .end local v5    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_88
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    nop

    :pswitch_data_8e
    .packed-switch 0x384
        :pswitch_6f
        :pswitch_6a
        :pswitch_65
    .end packed-switch

    :pswitch_data_98
    .packed-switch 0x39a
        :pswitch_60
        :pswitch_60
        :pswitch_6a
        :pswitch_5d
        :pswitch_5a
        :pswitch_48
        :pswitch_43
    .end packed-switch
.end method

.method private static decodeBase900toBase10([II)Ljava/lang/String;
    .registers 7
    .param p0, "codewords"    # [I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 630
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    .line 631
    .local v0, "result":Ljava/math/BigInteger;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    const/4 v2, 0x1

    if-lt v1, p1, :cond_1d

    .line 634
    .end local v1    # "i":I
    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v1

    .line 635
    .local v1, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    if-ne v3, v4, :cond_18

    .line 638
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 636
    :cond_18
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    .line 632
    .local v1, "i":I
    :cond_1d
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sub-int v4, p1, v1

    sub-int/2addr v4, v2

    aget-object v2, v3, v4

    aget v3, p0, v1

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 631
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method private static decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I
    .registers 13
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "resultMetadata"    # Lcom/google/zxing/pdf417/PDF417ResultMetadata;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 165
    add-int/lit8 v0, p1, 0x2

    const/4 v1, 0x0

    aget v2, p0, v1

    if-gt v0, v2, :cond_7e

    .line 169
    const/4 v0, 0x2

    new-array v2, v0, [I

    .line 170
    .local v2, "segmentIndexArray":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    if-lt v3, v0, :cond_75

    .line 173
    .end local v3    # "i":I
    nop

    .line 174
    nop

    .line 173
    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSegmentIndex(I)V

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v0, "fileId":Ljava/lang/StringBuilder;
    invoke-static {p0, p1, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 178
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileId(Ljava/lang/String;)V

    .line 180
    aget v3, p0, p1

    const/16 v4, 0x39b

    const/16 v5, 0x39a

    const/4 v6, 0x1

    if-ne v3, v4, :cond_6b

    .line 181
    add-int/lit8 p1, p1, 0x1

    .line 182
    aget v3, p0, v1

    sub-int/2addr v3, p1

    new-array v3, v3, [I

    .line 183
    .local v3, "additionalOptionCodeWords":[I
    const/4 v4, 0x0

    .line 185
    .local v4, "additionalOptionCodeWordsIndex":I
    const/4 v7, 0x0

    .line 186
    .local v7, "end":Z
    :goto_3c
    aget v8, p0, v1

    if-ge p1, v8, :cond_63

    if-eqz v7, :cond_43

    goto :goto_63

    .line 187
    :cond_43
    add-int/lit8 v8, p1, 0x1

    .local v8, "codeIndex":I
    aget p1, p0, p1

    .line 188
    .local p1, "code":I
    const/16 v9, 0x384

    if-ge p1, v9, :cond_53

    .line 189
    add-int/lit8 v9, v4, 0x1

    .local v9, "additionalOptionCodeWordsIndex":I
    aput p1, v3, v4

    .line 190
    .end local v4    # "additionalOptionCodeWordsIndex":I
    nop

    .line 186
    move p1, v8

    move v4, v9

    goto :goto_3c

    .line 191
    .end local v9    # "additionalOptionCodeWordsIndex":I
    .restart local v4    # "additionalOptionCodeWordsIndex":I
    :cond_53
    if-ne p1, v5, :cond_5e

    .line 193
    invoke-virtual {p2, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    .line 194
    add-int/lit8 v8, v8, 0x1

    .line 195
    const/4 v7, 0x1

    .line 196
    nop

    .line 186
    move p1, v8

    goto :goto_3c

    .line 198
    :cond_5e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 203
    .end local v8    # "codeIndex":I
    .local p1, "codeIndex":I
    :cond_63
    :goto_63
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setOptionalData([I)V

    .line 204
    .end local v3    # "additionalOptionCodeWords":[I
    .end local v4    # "additionalOptionCodeWordsIndex":I
    .end local v7    # "end":Z
    goto :goto_74

    :cond_6b
    aget v1, p0, p1

    if-ne v1, v5, :cond_74

    .line 205
    invoke-virtual {p2, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    .line 206
    add-int/lit8 p1, p1, 0x1

    .line 209
    :cond_74
    :goto_74
    return p1

    .line 171
    .end local v0    # "fileId":Ljava/lang/StringBuilder;
    .local v3, "i":I
    :cond_75
    aget v4, p0, p1

    aput v4, v2, v3

    .line 170
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_b

    .line 167
    .end local v2    # "segmentIndexArray":[I
    .end local v3    # "i":I
    :cond_7e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuilder;)V
    .registers 19
    .param p0, "textCompactionData"    # [I
    .param p1, "byteCompactionData"    # [I
    .param p2, "length"    # I
    .param p3, "result"    # Ljava/lang/StringBuilder;

    .line 294
    move-object/from16 v0, p3

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 295
    .local v1, "subMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 296
    .local v2, "priorToShiftMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    const/4 v3, 0x0

    .line 297
    .local v3, "i":I
    :goto_7
    move/from16 v4, p2

    if-lt v3, v4, :cond_c

    .line 429
    return-void

    .line 298
    :cond_c
    aget v5, p0, v3

    .line 299
    .local v5, "subModeCh":I
    const/4 v6, 0x0

    .line 300
    .local v6, "ch":C
    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I

    move-result-object v7

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v8

    aget v7, v7, v8

    const/16 v8, 0x41

    const/16 v10, 0x1b

    const/16 v11, 0x391

    const/16 v12, 0x384

    const/16 v13, 0x1a

    const/16 v9, 0x1d

    packed-switch v7, :pswitch_data_116

    goto/16 :goto_10c

    .line 407
    :pswitch_2a
    move-object v1, v2

    .line 408
    if-ge v5, v9, :cond_33

    .line 409
    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v6, v7, v5

    .line 410
    goto/16 :goto_10c

    .line 411
    :cond_33
    if-ne v5, v9, :cond_39

    .line 412
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 413
    goto/16 :goto_10c

    :cond_39
    if-ne v5, v11, :cond_43

    .line 416
    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 417
    goto/16 :goto_10c

    :cond_43
    if-ne v5, v12, :cond_10c

    .line 418
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    .line 393
    :pswitch_49
    move-object v1, v2

    .line 394
    if-ge v5, v13, :cond_50

    .line 395
    add-int/2addr v8, v5

    int-to-char v6, v8

    .line 396
    goto/16 :goto_10c

    .line 397
    :cond_50
    if-ne v5, v13, :cond_56

    .line 398
    const/16 v6, 0x20

    .line 399
    goto/16 :goto_10c

    :cond_56
    if-ne v5, v12, :cond_10c

    .line 400
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 403
    goto/16 :goto_10c

    .line 378
    :pswitch_5c
    if-ge v5, v9, :cond_64

    .line 379
    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v6, v7, v5

    .line 380
    goto/16 :goto_10c

    .line 381
    :cond_64
    if-ne v5, v9, :cond_6a

    .line 382
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 383
    goto/16 :goto_10c

    :cond_6a
    if-ne v5, v11, :cond_74

    .line 384
    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    goto/16 :goto_10c

    :cond_74
    if-ne v5, v12, :cond_10c

    .line 386
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 389
    goto/16 :goto_10c

    .line 353
    :pswitch_7a
    const/16 v7, 0x19

    if-ge v5, v7, :cond_84

    .line 354
    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v6, v7, v5

    .line 355
    goto/16 :goto_10c

    .line 356
    :cond_84
    if-ne v5, v7, :cond_8a

    .line 357
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 358
    goto/16 :goto_10c

    :cond_8a
    if-ne v5, v13, :cond_90

    .line 359
    const/16 v6, 0x20

    .line 360
    goto/16 :goto_10c

    :cond_90
    if-ne v5, v10, :cond_96

    .line 361
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 362
    goto/16 :goto_10c

    :cond_96
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_9e

    .line 363
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 364
    goto/16 :goto_10c

    :cond_9e
    if-ne v5, v9, :cond_a5

    .line 366
    move-object v2, v1

    .line 367
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 368
    goto/16 :goto_10c

    :cond_a5
    if-ne v5, v11, :cond_af

    .line 369
    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 370
    goto/16 :goto_10c

    :cond_af
    if-ne v5, v12, :cond_10c

    .line 371
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 374
    goto/16 :goto_10c

    .line 327
    :pswitch_b5
    if-ge v5, v13, :cond_bc

    .line 328
    const/16 v7, 0x61

    add-int/2addr v7, v5

    int-to-char v6, v7

    .line 329
    goto :goto_10c

    .line 330
    :cond_bc
    if-ne v5, v13, :cond_c1

    .line 331
    const/16 v6, 0x20

    .line 332
    goto :goto_10c

    :cond_c1
    if-ne v5, v10, :cond_c7

    .line 334
    move-object v2, v1

    .line 335
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 336
    goto :goto_10c

    :cond_c7
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_ce

    .line 337
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 338
    goto :goto_10c

    :cond_ce
    if-ne v5, v9, :cond_d4

    .line 340
    move-object v2, v1

    .line 341
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 342
    goto :goto_10c

    :cond_d4
    if-ne v5, v11, :cond_dd

    .line 344
    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    goto :goto_10c

    :cond_dd
    if-ne v5, v12, :cond_10c

    .line 346
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 349
    goto :goto_10c

    .line 303
    :pswitch_e2
    if-ge v5, v13, :cond_e7

    .line 305
    add-int/2addr v8, v5

    int-to-char v6, v8

    .line 306
    goto :goto_10c

    .line 307
    :cond_e7
    if-ne v5, v13, :cond_ec

    .line 308
    const/16 v6, 0x20

    .line 309
    goto :goto_10c

    :cond_ec
    if-ne v5, v10, :cond_f1

    .line 310
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 311
    goto :goto_10c

    :cond_f1
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_f8

    .line 312
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 313
    goto :goto_10c

    :cond_f8
    if-ne v5, v9, :cond_fe

    .line 315
    move-object v2, v1

    .line 316
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 317
    goto :goto_10c

    :cond_fe
    if-ne v5, v11, :cond_107

    .line 318
    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 319
    goto :goto_10c

    :cond_107
    if-ne v5, v12, :cond_10c

    .line 320
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 323
    nop

    .line 423
    :cond_10c
    :goto_10c
    if-eqz v6, :cond_111

    .line 425
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 427
    :cond_111
    add-int/lit8 v3, v3, 0x1

    .end local v5    # "subModeCh":I
    .end local v6    # "ch":C
    goto/16 :goto_7

    nop

    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_e2
        :pswitch_b5
        :pswitch_7a
        :pswitch_5c
        :pswitch_49
        :pswitch_2a
    .end packed-switch
.end method

.method private static numericCompaction([IILjava/lang/StringBuilder;)I
    .registers 8
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 545
    const/4 v0, 0x0

    .line 546
    .local v0, "count":I
    const/4 v1, 0x0

    .line 548
    .local v1, "end":Z
    const/16 v2, 0xf

    new-array v2, v2, [I

    .line 550
    .local v2, "numericCodewords":[I
    :goto_6
    const/4 v3, 0x0

    aget v4, p0, v3

    if-ge p1, v4, :cond_4f

    if-eqz v1, :cond_e

    goto :goto_4f

    .line 551
    :cond_e
    add-int/lit8 v4, p1, 0x1

    .local v4, "codeIndex":I
    aget p1, p0, p1

    .line 552
    .local p1, "code":I
    aget v3, p0, v3

    if-ne v4, v3, :cond_17

    .line 553
    const/4 v1, 0x1

    .line 555
    :cond_17
    const/16 v3, 0x384

    if-ge p1, v3, :cond_20

    .line 556
    aput p1, v2, v0

    .line 557
    add-int/lit8 v0, v0, 0x1

    .line 558
    goto :goto_39

    .line 559
    :cond_20
    if-eq p1, v3, :cond_36

    .line 560
    const/16 v3, 0x385

    if-eq p1, v3, :cond_36

    .line 561
    const/16 v3, 0x39c

    if-eq p1, v3, :cond_36

    .line 562
    const/16 v3, 0x3a0

    if-eq p1, v3, :cond_36

    .line 563
    const/16 v3, 0x39b

    if-eq p1, v3, :cond_36

    .line 564
    const/16 v3, 0x39a

    if-ne p1, v3, :cond_39

    .line 565
    :cond_36
    add-int/lit8 v4, v4, -0x1

    .line 566
    const/4 v1, 0x1

    .line 569
    :cond_39
    :goto_39
    rem-int/lit8 v3, v0, 0xf

    if-eqz v3, :cond_43

    .line 570
    const/16 v3, 0x386

    if-eq p1, v3, :cond_43

    .line 571
    if-eqz v1, :cond_4d

    .line 576
    :cond_43
    if-lez v0, :cond_4d

    .line 577
    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v3

    .line 578
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    const/4 v0, 0x0

    .line 550
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "codeIndex":I
    .local p1, "codeIndex":I
    :cond_4d
    move p1, v4

    goto :goto_6

    .line 583
    :cond_4f
    :goto_4f
    return p1
.end method

.method private static textCompaction([IILjava/lang/StringBuilder;)I
    .registers 11
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;

    .line 224
    const/4 v0, 0x0

    aget v1, p0, v0

    sub-int/2addr v1, p1

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    .line 226
    .local v1, "textCompactionData":[I
    aget v2, p0, v0

    sub-int/2addr v2, p1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    .line 228
    .local v2, "byteCompactionData":[I
    const/4 v3, 0x0

    .line 229
    .local v3, "index":I
    const/4 v4, 0x0

    .line 230
    .local v4, "end":Z
    :goto_11
    aget v5, p0, v0

    if-ge p1, v5, :cond_56

    if-eqz v4, :cond_18

    goto :goto_56

    .line 231
    :cond_18
    add-int/lit8 v5, p1, 0x1

    .local v5, "codeIndex":I
    aget p1, p0, p1

    .line 232
    .local p1, "code":I
    const/16 v6, 0x384

    if-ge p1, v6, :cond_2f

    .line 233
    div-int/lit8 v6, p1, 0x1e

    aput v6, v1, v3

    .line 234
    add-int/lit8 v6, v3, 0x1

    rem-int/lit8 v7, p1, 0x1e

    aput v7, v1, v6

    .line 235
    add-int/lit8 v3, v3, 0x2

    .line 236
    nop

    .line 230
    .end local v5    # "codeIndex":I
    .local p1, "codeIndex":I
    :goto_2d
    move p1, v5

    goto :goto_11

    .line 237
    .restart local v5    # "codeIndex":I
    .local p1, "code":I
    :cond_2f
    const/16 v7, 0x391

    if-eq p1, v7, :cond_4a

    const/16 v7, 0x3a0

    if-eq p1, v7, :cond_46

    packed-switch p1, :pswitch_data_5a

    packed-switch p1, :pswitch_data_64

    .end local p1    # "code":I
    goto :goto_2d

    .line 240
    .restart local p1    # "code":I
    :pswitch_3e
    add-int/lit8 v7, v3, 0x1

    .local v7, "index":I
    aput v6, v1, v3

    .line 241
    .end local v3    # "index":I
    nop

    .line 230
    move p1, v5

    move v3, v7

    goto :goto_11

    .line 248
    .end local v7    # "index":I
    .restart local v3    # "index":I
    :cond_46
    :pswitch_46
    add-int/lit8 v5, v5, -0x1

    .line 249
    const/4 v4, 0x1

    .line 250
    goto :goto_2d

    .line 258
    :cond_4a
    aput v7, v1, v3

    .line 259
    add-int/lit8 v6, v5, 0x1

    .local v6, "codeIndex":I
    aget p1, p0, v5

    .line 260
    .end local v5    # "codeIndex":I
    aput p1, v2, v3

    .line 261
    add-int/lit8 v3, v3, 0x1

    .line 230
    .end local p1    # "code":I
    move p1, v6

    goto :goto_11

    .line 266
    .end local v6    # "codeIndex":I
    .local p1, "codeIndex":I
    :cond_56
    :goto_56
    invoke-static {v1, v2, v3, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuilder;)V

    .line 267
    return p1

    :pswitch_data_5a
    .packed-switch 0x384
        :pswitch_3e
        :pswitch_46
        :pswitch_46
    .end packed-switch

    :pswitch_data_64
    .packed-switch 0x39a
        :pswitch_46
        :pswitch_46
        :pswitch_46
    .end packed-switch
.end method
