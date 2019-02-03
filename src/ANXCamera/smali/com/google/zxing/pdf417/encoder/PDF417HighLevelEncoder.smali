.class final Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;
.super Ljava/lang/Object;
.source "PDF417HighLevelEncoder.java"


# static fields
.field private static final BYTE_COMPACTION:I = 0x1

.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final LATCH_TO_BYTE:I = 0x39c

.field private static final LATCH_TO_BYTE_PADDED:I = 0x385

.field private static final LATCH_TO_NUMERIC:I = 0x386

.field private static final LATCH_TO_TEXT:I = 0x384

.field private static final MIXED:[B

.field private static final NUMERIC_COMPACTION:I = 0x2

.field private static final PUNCTUATION:[B

.field private static final SHIFT_TO_BYTE:I = 0x391

.field private static final SUBMODE_ALPHA:I = 0x0

.field private static final SUBMODE_LOWER:I = 0x1

.field private static final SUBMODE_MIXED:I = 0x2

.field private static final SUBMODE_PUNCTUATION:I = 0x3

.field private static final TEXT_COMPACTION:I

.field private static final TEXT_MIXED_RAW:[B

.field private static final TEXT_PUNCTUATION_RAW:[B


# direct methods
.method static constructor <clinit>()V
    .registers 18

    .line 114
    const/16 v0, 0x1e

    new-array v1, v0, [B

    .line 115
    const/4 v2, 0x0

    const/16 v3, 0x30

    aput-byte v3, v1, v2

    const/4 v3, 0x1

    const/16 v4, 0x31

    aput-byte v4, v1, v3

    const/4 v4, 0x2

    const/16 v5, 0x32

    aput-byte v5, v1, v4

    const/4 v5, 0x3

    const/16 v6, 0x33

    aput-byte v6, v1, v5

    const/4 v6, 0x4

    const/16 v7, 0x34

    aput-byte v7, v1, v6

    const/4 v7, 0x5

    const/16 v8, 0x35

    aput-byte v8, v1, v7

    const/4 v8, 0x6

    const/16 v9, 0x36

    aput-byte v9, v1, v8

    const/4 v9, 0x7

    const/16 v10, 0x37

    aput-byte v10, v1, v9

    const/16 v10, 0x8

    const/16 v11, 0x38

    aput-byte v11, v1, v10

    const/16 v11, 0x9

    const/16 v12, 0x39

    aput-byte v12, v1, v11

    const/16 v12, 0xa

    const/16 v13, 0x26

    aput-byte v13, v1, v12

    const/16 v13, 0xb

    const/16 v14, 0xd

    aput-byte v14, v1, v13

    const/16 v15, 0xc

    aput-byte v11, v1, v15

    const/16 v16, 0x2c

    aput-byte v16, v1, v14

    const/16 v16, 0xe

    const/16 v17, 0x3a

    aput-byte v17, v1, v16

    .line 116
    const/16 v16, 0xf

    const/16 v17, 0x23

    aput-byte v17, v1, v16

    const/16 v16, 0x10

    const/16 v17, 0x2d

    aput-byte v17, v1, v16

    const/16 v16, 0x11

    const/16 v17, 0x2e

    aput-byte v17, v1, v16

    const/16 v16, 0x12

    const/16 v17, 0x24

    aput-byte v17, v1, v16

    const/16 v16, 0x13

    const/16 v17, 0x2f

    aput-byte v17, v1, v16

    const/16 v16, 0x14

    const/16 v17, 0x2b

    aput-byte v17, v1, v16

    const/16 v16, 0x15

    const/16 v17, 0x25

    aput-byte v17, v1, v16

    const/16 v16, 0x16

    const/16 v17, 0x2a

    aput-byte v17, v1, v16

    const/16 v16, 0x17

    const/16 v17, 0x3d

    aput-byte v17, v1, v16

    const/16 v16, 0x18

    const/16 v17, 0x5e

    aput-byte v17, v1, v16

    const/16 v16, 0x1a

    const/16 v17, 0x20

    aput-byte v17, v1, v16

    .line 114
    sput-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    .line 121
    new-array v0, v0, [B

    .line 122
    const/16 v1, 0x3b

    aput-byte v1, v0, v2

    const/16 v1, 0x3c

    aput-byte v1, v0, v3

    const/16 v1, 0x3e

    aput-byte v1, v0, v4

    const/16 v1, 0x40

    aput-byte v1, v0, v5

    const/16 v1, 0x5b

    aput-byte v1, v0, v6

    const/16 v1, 0x5c

    aput-byte v1, v0, v7

    const/16 v1, 0x5d

    aput-byte v1, v0, v8

    const/16 v1, 0x5f

    aput-byte v1, v0, v9

    const/16 v1, 0x60

    aput-byte v1, v0, v10

    const/16 v1, 0x7e

    aput-byte v1, v0, v11

    const/16 v1, 0x21

    aput-byte v1, v0, v12

    aput-byte v14, v0, v13

    aput-byte v11, v0, v15

    const/16 v1, 0x2c

    aput-byte v1, v0, v14

    const/16 v1, 0xe

    const/16 v2, 0x3a

    aput-byte v2, v0, v1

    .line 123
    const/16 v1, 0xf

    aput-byte v12, v0, v1

    const/16 v1, 0x10

    const/16 v2, 0x2d

    aput-byte v2, v0, v1

    const/16 v1, 0x11

    const/16 v2, 0x2e

    aput-byte v2, v0, v1

    const/16 v1, 0x12

    const/16 v2, 0x24

    aput-byte v2, v0, v1

    const/16 v1, 0x13

    const/16 v2, 0x2f

    aput-byte v2, v0, v1

    const/16 v1, 0x14

    const/16 v2, 0x22

    aput-byte v2, v0, v1

    const/16 v1, 0x15

    const/16 v2, 0x7c

    aput-byte v2, v0, v1

    const/16 v1, 0x16

    const/16 v2, 0x2a

    aput-byte v2, v0, v1

    const/16 v1, 0x17

    const/16 v2, 0x28

    aput-byte v2, v0, v1

    const/16 v1, 0x18

    const/16 v2, 0x29

    aput-byte v2, v0, v1

    const/16 v1, 0x19

    const/16 v2, 0x3f

    aput-byte v2, v0, v1

    const/16 v1, 0x1a

    const/16 v2, 0x7b

    aput-byte v2, v0, v1

    const/16 v1, 0x1b

    const/16 v2, 0x7d

    aput-byte v2, v0, v1

    const/16 v1, 0x1c

    const/16 v2, 0x27

    aput-byte v2, v0, v1

    .line 121
    sput-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    .line 125
    const/16 v0, 0x80

    new-array v0, v0, [B

    sput-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    .line 126
    const/16 v0, 0x80

    new-array v0, v0, [B

    sput-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    .line 128
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 135
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 136
    const/4 v0, 0x0

    .local v0, "i":B
    :goto_141
    sget-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    array-length v1, v1

    if-lt v0, v1, :cond_161

    .line 142
    .end local v0    # "i":B
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 143
    const/4 v0, 0x0

    .restart local v0    # "i":B
    :goto_14d
    sget-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    array-length v1, v1

    if-lt v0, v1, :cond_153

    .line 149
    .end local v0    # "i":B
    return-void

    .line 144
    .restart local v0    # "i":B
    :cond_153
    sget-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    aget-byte v1, v1, v0

    .line 145
    .local v1, "b":B
    if-lez v1, :cond_15d

    .line 146
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aput-byte v0, v2, v1

    .line 143
    .end local v1    # "b":B
    :cond_15d
    add-int/lit8 v1, v0, 0x1

    int-to-byte v0, v1

    goto :goto_14d

    .line 137
    :cond_161
    sget-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    aget-byte v1, v1, v0

    .line 138
    .restart local v1    # "b":B
    if-lez v1, :cond_16b

    .line 139
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aput-byte v0, v2, v1

    .line 136
    .end local v1    # "b":B
    :cond_16b
    add-int/lit8 v1, v0, 0x1

    int-to-byte v0, v1

    goto :goto_141
.end method

.method private constructor <init>()V
    .registers 1

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    return-void
.end method

.method private static determineConsecutiveBinaryCount(Ljava/lang/CharSequence;[BI)I
    .registers 10
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "bytes"    # [B
    .param p2, "startpos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 539
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 540
    .local v0, "len":I
    move v1, p2

    .line 541
    .local v1, "idx":I
    :goto_5
    if-lt v1, v0, :cond_a

    .line 567
    sub-int v2, v1, p2

    return v2

    .line 542
    :cond_a
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 543
    .local v2, "ch":C
    const/4 v3, 0x0

    .line 545
    .local v3, "numericCount":I
    :goto_f
    const/16 v4, 0xd

    if-ge v3, v4, :cond_26

    invoke-static {v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v5

    if-nez v5, :cond_1a

    goto :goto_26

    .line 546
    :cond_1a
    add-int/lit8 v3, v3, 0x1

    .line 548
    add-int v5, v1, v3

    .line 549
    .local v5, "i":I
    if-lt v5, v0, :cond_21

    .line 550
    goto :goto_26

    .line 552
    :cond_21
    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .end local v5    # "i":I
    goto :goto_f

    .line 554
    :cond_26
    :goto_26
    if-lt v3, v4, :cond_2b

    .line 555
    sub-int v4, v1, p2

    return v4

    .line 557
    :cond_2b
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 562
    aget-byte v4, p1, v1

    const/16 v5, 0x3f

    if-ne v4, v5, :cond_59

    if-ne v2, v5, :cond_38

    goto :goto_59

    .line 563
    :cond_38
    new-instance v4, Lcom/google/zxing/WriterException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Non-encodable character detected: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v6, " (Unicode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 565
    :cond_59
    :goto_59
    add-int/lit8 v1, v1, 0x1

    .end local v2    # "ch":C
    .end local v3    # "numericCount":I
    goto :goto_5
.end method

.method private static determineConsecutiveDigitCount(Ljava/lang/CharSequence;I)I
    .registers 7
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I

    .line 475
    const/4 v0, 0x0

    .line 476
    .local v0, "count":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 477
    .local v1, "len":I
    move v2, p1

    .line 478
    .local v2, "idx":I
    if-ge v2, v1, :cond_20

    .line 479
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 480
    .local v3, "ch":C
    :cond_c
    :goto_c
    invoke-static {v3}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_20

    if-lt v2, v1, :cond_15

    .end local v3    # "ch":C
    goto :goto_20

    .line 481
    .restart local v3    # "ch":C
    :cond_15
    add-int/lit8 v0, v0, 0x1

    .line 482
    add-int/lit8 v2, v2, 0x1

    .line 483
    if-ge v2, v1, :cond_c

    .line 484
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    goto :goto_c

    .line 488
    .end local v3    # "ch":C
    :cond_20
    :goto_20
    return v0
.end method

.method private static determineConsecutiveTextCount(Ljava/lang/CharSequence;I)I
    .registers 8
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I

    .line 499
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 500
    .local v0, "len":I
    move v1, p1

    .line 501
    .local v1, "idx":I
    :goto_5
    if-lt v1, v0, :cond_8

    goto :goto_39

    .line 502
    :cond_8
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 503
    .local v2, "ch":C
    const/4 v3, 0x0

    .line 504
    .local v3, "numericCount":I
    :cond_d
    :goto_d
    const/16 v4, 0xd

    if-ge v3, v4, :cond_25

    invoke-static {v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_25

    if-lt v1, v0, :cond_1a

    goto :goto_25

    .line 505
    :cond_1a
    add-int/lit8 v3, v3, 0x1

    .line 506
    add-int/lit8 v1, v1, 0x1

    .line 507
    if-ge v1, v0, :cond_d

    .line 508
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    goto :goto_d

    .line 511
    :cond_25
    :goto_25
    if-lt v3, v4, :cond_2b

    .line 512
    sub-int v4, v1, p1

    sub-int/2addr v4, v3

    return v4

    .line 514
    :cond_2b
    if-lez v3, :cond_2e

    .line 516
    goto :goto_5

    .line 518
    :cond_2e
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 521
    invoke-static {v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isText(C)Z

    move-result v4

    if-nez v4, :cond_3c

    .line 522
    nop

    .line 526
    .end local v2    # "ch":C
    .end local v3    # "numericCount":I
    :goto_39
    sub-int v2, v1, p1

    return v2

    .line 524
    .restart local v2    # "ch":C
    .restart local v3    # "numericCount":I
    :cond_3c
    add-int/lit8 v1, v1, 0x1

    .end local v2    # "ch":C
    .end local v3    # "numericCount":I
    goto :goto_5
.end method

.method private static encodeBinary([BIIILjava/lang/StringBuilder;)V
    .registers 19
    .param p0, "bytes"    # [B
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "startmode"    # I
    .param p4, "sb"    # Ljava/lang/StringBuilder;

    move/from16 v0, p2

    .line 381
    move-object/from16 v1, p4

    const/4 v2, 0x1

    if-ne v0, v2, :cond_f

    if-nez p3, :cond_f

    .line 382
    const/16 v4, 0x391

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 383
    goto :goto_23

    .line 384
    :cond_f
    rem-int/lit8 v4, v0, 0x6

    if-nez v4, :cond_15

    move v4, v2

    goto :goto_16

    :cond_15
    const/4 v4, 0x0

    .line 385
    .local v4, "sixpack":Z
    :goto_16
    if-eqz v4, :cond_1e

    .line 386
    const/16 v5, 0x39c

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 387
    goto :goto_23

    .line 388
    :cond_1e
    const/16 v5, 0x385

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 392
    .end local v4    # "sixpack":Z
    :goto_23
    move v4, p1

    .line 394
    .local v4, "idx":I
    const/4 v5, 0x6

    if-lt v0, v5, :cond_65

    .line 395
    const/4 v6, 0x5

    new-array v7, v6, [C

    .line 396
    .local v7, "chars":[C
    move v8, v4

    .end local v4    # "idx":I
    .local v8, "idx":I
    :goto_2b
    add-int v4, p1, v0

    sub-int/2addr v4, v8

    if-ge v4, v5, :cond_31

    .end local v7    # "chars":[C
    goto :goto_66

    .line 397
    .restart local v7    # "chars":[C
    :cond_31
    const-wide/16 v9, 0x0

    .line 398
    .local v9, "t":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_34
    if-lt v4, v5, :cond_55

    .line 402
    .end local v4    # "i":I
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_37
    if-lt v4, v6, :cond_48

    .line 406
    .end local v4    # "i":I
    array-length v4, v7

    sub-int/2addr v4, v2

    .restart local v4    # "i":I
    :goto_3b
    if-gez v4, :cond_40

    .line 409
    .end local v4    # "i":I
    add-int/lit8 v8, v8, 0x6

    .end local v9    # "t":J
    goto :goto_2b

    .line 407
    .restart local v4    # "i":I
    .restart local v9    # "t":J
    :cond_40
    aget-char v11, v7, v4

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 406
    add-int/lit8 v4, v4, -0x1

    goto :goto_3b

    .line 403
    :cond_48
    const-wide/16 v11, 0x384

    rem-long v2, v9, v11

    long-to-int v2, v2

    int-to-char v2, v2

    aput-char v2, v7, v4

    .line 404
    div-long/2addr v9, v11

    .line 402
    add-int/lit8 v4, v4, 0x1

    const/4 v2, 0x1

    goto :goto_37

    .line 399
    :cond_55
    const/16 v2, 0x8

    shl-long v2, v9, v2

    .line 400
    .end local v9    # "t":J
    .local v2, "t":J
    add-int v9, v8, v4

    aget-byte v9, p0, v9

    and-int/lit16 v9, v9, 0xff

    int-to-long v9, v9

    add-long/2addr v9, v2

    .line 398
    .end local v2    # "t":J
    .restart local v9    # "t":J
    add-int/lit8 v4, v4, 0x1

    const/4 v2, 0x1

    goto :goto_34

    .line 413
    .end local v7    # "chars":[C
    .end local v8    # "idx":I
    .end local v9    # "t":J
    .local v4, "idx":I
    :cond_65
    move v8, v4

    .end local v4    # "idx":I
    .restart local v8    # "idx":I
    :goto_66
    move v2, v8

    .local v2, "i":I
    :goto_67
    add-int v3, p1, v0

    if-lt v2, v3, :cond_6c

    .line 417
    .end local v2    # "i":I
    return-void

    .line 414
    .restart local v2    # "i":I
    :cond_6c
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 415
    .local v3, "ch":I
    int-to-char v4, v3

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 413
    .end local v3    # "ch":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_67
.end method

.method static encodeHighLevel(Ljava/lang/String;Lcom/google/zxing/pdf417/encoder/Compaction;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 15
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "compaction"    # Lcom/google/zxing/pdf417/encoder/Compaction;
    .param p2, "encoding"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 167
    .local v0, "sb":Ljava/lang/StringBuilder;
    if-nez p2, :cond_e

    .line 168
    sget-object p2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 169
    goto :goto_27

    :cond_e
    sget-object v1, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    invoke-virtual {v1, p2}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_27

    .line 170
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByName(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v1

    .line 171
    .local v1, "eci":Lcom/google/zxing/common/CharacterSetECI;
    if-eqz v1, :cond_27

    .line 172
    invoke-virtual {v1}, Lcom/google/zxing/common/CharacterSetECI;->getValue()I

    move-result v2

    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodingECI(ILjava/lang/StringBuilder;)V

    .line 176
    .end local v1    # "eci":Lcom/google/zxing/common/CharacterSetECI;
    :cond_27
    :goto_27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 177
    .local v1, "len":I
    const/4 v2, 0x0

    .line 178
    .local v2, "p":I
    const/4 v3, 0x0

    .line 181
    .local v3, "textSubMode":I
    const/4 v4, 0x0

    .line 182
    .local v4, "bytes":[B
    sget-object v5, Lcom/google/zxing/pdf417/encoder/Compaction;->TEXT:Lcom/google/zxing/pdf417/encoder/Compaction;

    if-ne p1, v5, :cond_36

    .line 183
    invoke-static {p0, v2, v1, v0, v3}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    .line 185
    goto :goto_54

    :cond_36
    sget-object v5, Lcom/google/zxing/pdf417/encoder/Compaction;->BYTE:Lcom/google/zxing/pdf417/encoder/Compaction;

    const/4 v6, 0x1

    if-ne p1, v5, :cond_44

    .line 186
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    .line 187
    array-length v5, v4

    invoke-static {v4, v2, v5, v6, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    .line 189
    goto :goto_54

    :cond_44
    sget-object v5, Lcom/google/zxing/pdf417/encoder/Compaction;->NUMERIC:Lcom/google/zxing/pdf417/encoder/Compaction;

    const/16 v7, 0x386

    if-ne p1, v5, :cond_51

    .line 190
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    invoke-static {p0, v2, v1, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    .line 193
    goto :goto_54

    .line 194
    :cond_51
    const/4 v5, 0x0

    .line 195
    .local v5, "encodingMode":I
    :goto_52
    if-lt v2, v1, :cond_59

    .line 236
    .end local v5    # "encodingMode":I
    :goto_54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 196
    .restart local v5    # "encodingMode":I
    :cond_59
    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveDigitCount(Ljava/lang/CharSequence;I)I

    move-result v8

    .line 197
    .local v8, "n":I
    const/16 v9, 0xd

    if-lt v8, v9, :cond_6b

    .line 198
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 199
    const/4 v5, 0x2

    .line 200
    const/4 v3, 0x0

    .line 201
    invoke-static {p0, v2, v8, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    .line 202
    add-int/2addr v2, v8

    .line 203
    goto :goto_52

    .line 204
    :cond_6b
    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveTextCount(Ljava/lang/CharSequence;I)I

    move-result v9

    .line 205
    .local v9, "t":I
    const/4 v10, 0x5

    if-ge v9, v10, :cond_92

    if-ne v8, v1, :cond_75

    goto :goto_92

    .line 214
    :cond_75
    if-nez v4, :cond_7b

    .line 215
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    .line 217
    :cond_7b
    invoke-static {p0, v4, v2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveBinaryCount(Ljava/lang/CharSequence;[BI)I

    move-result v10

    .line 218
    .local v10, "b":I
    if-nez v10, :cond_82

    .line 219
    const/4 v10, 0x1

    .line 221
    :cond_82
    if-ne v10, v6, :cond_8b

    if-nez v5, :cond_8b

    .line 223
    const/4 v11, 0x0

    invoke-static {v4, v2, v6, v11, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    .line 224
    goto :goto_90

    .line 226
    :cond_8b
    invoke-static {v4, v2, v10, v5, v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    .line 227
    const/4 v5, 0x1

    .line 228
    const/4 v3, 0x0

    .line 230
    :goto_90
    add-int/2addr v2, v10

    .end local v8    # "n":I
    .end local v9    # "t":I
    .end local v10    # "b":I
    goto :goto_52

    .line 206
    .restart local v8    # "n":I
    .restart local v9    # "t":I
    :cond_92
    :goto_92
    if-eqz v5, :cond_9b

    .line 207
    const/16 v10, 0x384

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    const/4 v5, 0x0

    .line 209
    const/4 v3, 0x0

    .line 211
    :cond_9b
    invoke-static {p0, v2, v9, v0, v3}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    move-result v3

    .line 212
    add-int/2addr v2, v9

    .line 213
    goto :goto_52
.end method

.method private static encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V
    .registers 13
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "sb"    # Ljava/lang/StringBuilder;

    .line 420
    const/4 v0, 0x0

    .line 421
    .local v0, "idx":I
    new-instance v1, Ljava/lang/StringBuilder;

    div-int/lit8 v2, p2, 0x3

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 422
    .local v1, "tmp":Ljava/lang/StringBuilder;
    const-wide/16 v2, 0x384

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    .line 423
    .local v2, "num900":Ljava/math/BigInteger;
    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    .line 424
    .local v3, "num0":Ljava/math/BigInteger;
    :goto_16
    add-int/lit8 v4, p2, -0x1

    if-lt v0, v4, :cond_1b

    .line 440
    return-void

    .line 425
    :cond_1b
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 426
    const/16 v4, 0x2c

    sub-int v5, p2, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 427
    .local v4, "len":I
    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x31

    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int v6, p1, v0

    add-int v7, p1, v0

    add-int/2addr v7, v4

    invoke-virtual {p0, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 428
    .local v5, "part":Ljava/lang/String;
    new-instance v6, Ljava/math/BigInteger;

    invoke-direct {v6, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 430
    .local v6, "bigint":Ljava/math/BigInteger;
    :cond_47
    invoke-virtual {v6, v2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    int-to-char v7, v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 431
    invoke-virtual {v6, v2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 432
    invoke-virtual {v6, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 435
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    .local v7, "i":I
    :goto_63
    if-gez v7, :cond_67

    .line 438
    .end local v7    # "i":I
    add-int/2addr v0, v4

    .end local v4    # "len":I
    .end local v5    # "part":Ljava/lang/String;
    .end local v6    # "bigint":Ljava/math/BigInteger;
    goto :goto_16

    .line 436
    .restart local v4    # "len":I
    .restart local v5    # "part":Ljava/lang/String;
    .restart local v6    # "bigint":Ljava/math/BigInteger;
    .restart local v7    # "i":I
    :cond_67
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 435
    add-int/lit8 v7, v7, -0x1

    goto :goto_63
.end method

.method private static encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I
    .registers 20
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "sb"    # Ljava/lang/StringBuilder;
    .param p4, "initialSubmode"    # I

    move-object v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    .line 255
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 256
    .local v3, "tmp":Ljava/lang/StringBuilder;
    move/from16 v4, p4

    .line 257
    .local v4, "submode":I
    const/4 v5, 0x0

    move v6, v4

    move v4, v5

    .line 259
    .local v4, "idx":I
    .local v6, "submode":I
    :cond_f
    :goto_f
    add-int v7, p1, v4

    invoke-interface {v0, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    .line 260
    .local v7, "ch":C
    const/16 v8, 0x1a

    const/16 v9, 0x20

    const/16 v10, 0x1b

    const/16 v11, 0x1c

    const/16 v12, 0x1d

    const/4 v13, 0x1

    packed-switch v6, :pswitch_data_12c

    .line 335
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isPunctuation(C)Z

    move-result v8

    if-eqz v8, :cond_125

    .line 336
    sget-object v8, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v8, v8, v7

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 337
    goto/16 :goto_f1

    .line 309
    :pswitch_33
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v8

    if-eqz v8, :cond_43

    .line 310
    sget-object v8, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aget-byte v8, v8, v7

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 311
    goto/16 :goto_f1

    .line 312
    :cond_43
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v8

    if-eqz v8, :cond_4e

    .line 313
    const/4 v6, 0x0

    .line 314
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 315
    goto :goto_f

    .line 316
    :cond_4e
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v8

    if-eqz v8, :cond_59

    .line 317
    const/4 v6, 0x1

    .line 318
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 319
    goto :goto_f

    .line 321
    :cond_59
    add-int v8, p1, v4

    add-int/2addr v8, v13

    if-ge v8, v1, :cond_72

    .line 322
    add-int v8, p1, v4

    add-int/2addr v8, v13

    invoke-interface {v0, v8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    .line 323
    .local v8, "next":C
    invoke-static {v8}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isPunctuation(C)Z

    move-result v9

    if-eqz v9, :cond_72

    .line 324
    const/4 v6, 0x3

    .line 325
    const/16 v9, 0x19

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    goto :goto_f

    .line 329
    .end local v8    # "next":C
    :cond_72
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    sget-object v8, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v8, v8, v7

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    goto/16 :goto_f1

    .line 285
    :pswitch_7f
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v14

    if-eqz v14, :cond_92

    .line 286
    if-ne v7, v9, :cond_8b

    .line 287
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 288
    goto :goto_f1

    .line 289
    :cond_8b
    add-int/lit8 v8, v7, -0x61

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    goto :goto_f1

    .line 292
    :cond_92
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v8

    if-eqz v8, :cond_a2

    .line 293
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 294
    add-int/lit8 v8, v7, -0x41

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 296
    goto :goto_f1

    .line 297
    :cond_a2
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v8

    if-eqz v8, :cond_ae

    .line 298
    const/4 v6, 0x2

    .line 299
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 300
    goto/16 :goto_f

    .line 302
    :cond_ae
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 303
    sget-object v8, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v8, v8, v7

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 304
    goto :goto_f1

    .line 262
    :pswitch_ba
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v14

    if-eqz v14, :cond_cd

    .line 263
    if-ne v7, v9, :cond_c6

    .line 264
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 265
    goto :goto_f1

    .line 266
    :cond_c6
    add-int/lit8 v8, v7, -0x41

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 268
    goto :goto_f1

    .line 269
    :cond_cd
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v8

    if-eqz v8, :cond_d9

    .line 270
    const/4 v6, 0x1

    .line 271
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 272
    goto/16 :goto_f

    .line 273
    :cond_d9
    invoke-static {v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v8

    if-eqz v8, :cond_e5

    .line 274
    const/4 v6, 0x2

    .line 275
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 276
    goto/16 :goto_f

    .line 278
    :cond_e5
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 279
    sget-object v8, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v8, v8, v7

    int-to-char v8, v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 280
    nop

    .line 343
    :goto_f1
    add-int/lit8 v4, v4, 0x1

    .line 344
    if-lt v4, v1, :cond_f

    .line 348
    .end local v7    # "ch":C
    const/4 v7, 0x0

    .line 349
    .local v7, "h":C
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    .line 350
    .local v8, "len":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_fb
    if-lt v9, v8, :cond_109

    .line 359
    .end local v9    # "i":I
    rem-int/lit8 v5, v8, 0x2

    if-eqz v5, :cond_108

    .line 360
    mul-int/lit8 v5, v7, 0x1e

    add-int/2addr v5, v12

    int-to-char v5, v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 362
    :cond_108
    return v6

    .line 351
    .restart local v9    # "i":I
    :cond_109
    rem-int/lit8 v10, v9, 0x2

    if-eqz v10, :cond_10f

    move v10, v13

    goto :goto_110

    :cond_10f
    move v10, v5

    .line 352
    .local v10, "odd":Z
    :goto_110
    if-eqz v10, :cond_11e

    .line 353
    mul-int/lit8 v11, v7, 0x1e

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v14

    add-int/2addr v11, v14

    int-to-char v7, v11

    .line 354
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 355
    goto :goto_122

    .line 356
    :cond_11e
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    .line 350
    .end local v10    # "odd":Z
    :goto_122
    add-int/lit8 v9, v9, 0x1

    goto :goto_fb

    .line 338
    .end local v8    # "len":I
    .end local v9    # "i":I
    .local v7, "ch":C
    :cond_125
    const/4 v6, 0x0

    .line 339
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 340
    goto/16 :goto_f

    nop

    :pswitch_data_12c
    .packed-switch 0x0
        :pswitch_ba
        :pswitch_7f
        :pswitch_33
    .end packed-switch
.end method

.method private static encodingECI(ILjava/lang/StringBuilder;)V
    .registers 5
    .param p0, "eci"    # I
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 571
    if-ltz p0, :cond_10

    const/16 v0, 0x384

    if-ge p0, v0, :cond_10

    .line 572
    const/16 v0, 0x39f

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 573
    int-to-char v0, p0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 574
    goto :goto_39

    :cond_10
    const v0, 0xc5f94

    if-ge p0, v0, :cond_29

    .line 575
    const/16 v0, 0x39e

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 576
    div-int/lit16 v0, p0, 0x384

    add-int/lit8 v0, v0, -0x1

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 577
    rem-int/lit16 v0, p0, 0x384

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 578
    goto :goto_39

    :cond_29
    const v1, 0xc6318

    if-ge p0, v1, :cond_3a

    .line 579
    const/16 v1, 0x39d

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 580
    sub-int/2addr v0, p0

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 581
    nop

    .line 584
    :goto_39
    return-void

    .line 582
    :cond_3a
    new-instance v0, Lcom/google/zxing/WriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ECI number not in valid range from 0..811799, but was "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isAlphaLower(C)Z
    .registers 2
    .param p0, "ch"    # C

    .line 452
    const/16 v0, 0x20

    if-eq p0, v0, :cond_e

    const/16 v0, 0x61

    if-lt p0, v0, :cond_c

    const/16 v0, 0x7a

    if-le p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    return v0

    :cond_e
    const/4 v0, 0x1

    return v0
.end method

.method private static isAlphaUpper(C)Z
    .registers 2
    .param p0, "ch"    # C

    .line 448
    const/16 v0, 0x20

    if-eq p0, v0, :cond_e

    const/16 v0, 0x41

    if-lt p0, v0, :cond_c

    const/16 v0, 0x5a

    if-le p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    return v0

    :cond_e
    const/4 v0, 0x1

    return v0
.end method

.method private static isDigit(C)Z
    .registers 2
    .param p0, "ch"    # C

    .line 444
    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method private static isMixed(C)Z
    .registers 3
    .param p0, "ch"    # C

    .line 456
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    return v0

    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method private static isPunctuation(C)Z
    .registers 3
    .param p0, "ch"    # C

    .line 460
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    return v0

    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method private static isText(C)Z
    .registers 2
    .param p0, "ch"    # C

    .line 464
    const/16 v0, 0x9

    if-eq p0, v0, :cond_16

    const/16 v0, 0xa

    if-eq p0, v0, :cond_16

    const/16 v0, 0xd

    if-eq p0, v0, :cond_16

    const/16 v0, 0x20

    if-lt p0, v0, :cond_14

    const/16 v0, 0x7e

    if-le p0, v0, :cond_16

    :cond_14
    const/4 v0, 0x0

    return v0

    :cond_16
    const/4 v0, 0x1

    return v0
.end method
