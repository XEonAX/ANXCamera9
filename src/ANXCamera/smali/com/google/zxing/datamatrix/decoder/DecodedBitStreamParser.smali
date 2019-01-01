.class final Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

.field private static final C40_BASIC_SET_CHARS:[C

.field private static final C40_SHIFT2_SET_CHARS:[C

.field private static final TEXT_BASIC_SET_CHARS:[C

.field private static final TEXT_SHIFT3_SET_CHARS:[C


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode()[I
    .locals 3

    .line 37
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->values()[Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ANSIX12_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    :try_start_1
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->BASE256_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->C40_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->EDIFACT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v1

    :goto_4
    :try_start_5
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v1

    :goto_5
    :try_start_6
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->TEXT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v1

    :goto_6
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 53
    const/16 v0, 0x28

    new-array v1, v0, [C

    fill-array-data v1, :array_0

    .line 54
    nop

    .line 55
    nop

    .line 56
    nop

    .line 53
    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    .line 59
    const/16 v1, 0x1b

    new-array v1, v1, [C

    fill-array-data v1, :array_1

    .line 60
    nop

    .line 61
    nop

    .line 59
    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    .line 68
    new-array v0, v0, [C

    fill-array-data v0, :array_2

    .line 69
    nop

    .line 70
    nop

    .line 71
    nop

    .line 68
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    .line 74
    const/16 v0, 0x20

    new-array v0, v0, [C

    fill-array-data v0, :array_3

    .line 75
    nop

    .line 76
    nop

    .line 74
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    .line 77
    return-void

    nop

    :array_0
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
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
    .end array-data

    :array_1
    .array-data 2
        0x21s
        0x22s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5es
        0x5fs
    .end array-data

    nop

    :array_2
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
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
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data

    :array_3
    .array-data 2
        0x60s
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
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x7fs
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    return-void
.end method

.method static decode([B)Lcom/google/zxing/common/DecoderResult;
    .locals 9
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 83
    new-instance v0, Lcom/google/zxing/common/BitSource;

    invoke-direct {v0, p0}, Lcom/google/zxing/common/BitSource;-><init>([B)V

    .line 84
    .local v0, "bits":Lcom/google/zxing/common/BitSource;
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 85
    .local v1, "result":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 86
    .local v2, "resultTrailer":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 87
    .local v3, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 89
    .local v4, "mode":Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    :cond_0
    sget-object v5, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    if-ne v4, v5, :cond_1

    .line 90
    invoke-static {v0, v1, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeAsciiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    move-result-object v4

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    invoke-static {}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode()[I

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 109
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    .line 106
    :pswitch_0
    invoke-static {v0, v1, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeBase256Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/util/Collection;)V

    .line 107
    goto :goto_0

    .line 103
    :pswitch_1
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeEdifactSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    .line 104
    goto :goto_0

    .line 100
    :pswitch_2
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeAnsiX12Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    .line 101
    goto :goto_0

    .line 97
    :pswitch_3
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeTextSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    .line 98
    goto :goto_0

    .line 94
    :pswitch_4
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeC40Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    .line 95
    nop

    .line 111
    :goto_0
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 113
    :goto_1
    sget-object v5, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    if-eq v4, v5, :cond_2

    invoke-virtual {v0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v5

    .line 88
    if-gtz v5, :cond_0

    .line 114
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 117
    :cond_3
    new-instance v5, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_4

    move-object v7, v8

    goto :goto_2

    :cond_4
    move-object v7, v3

    :goto_2
    invoke-direct {v5, p0, v6, v7, v8}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v5

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static decodeAnsiX12Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .locals 6
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 368
    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 371
    .local v1, "cValues":[I
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    .line 372
    return-void

    .line 374
    :cond_1
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 375
    .local v2, "firstByte":I
    const/16 v4, 0xfe

    if-ne v2, v4, :cond_2

    .line 376
    return-void

    .line 379
    :cond_2
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    invoke-static {v2, v3, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    .line 381
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v0, :cond_3

    .line 399
    .end local v2    # "firstByte":I
    .end local v3    # "i":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    .line 369
    if-gtz v2, :cond_0

    .line 400
    return-void

    .line 382
    .restart local v2    # "firstByte":I
    .restart local v3    # "i":I
    :cond_3
    aget v4, v1, v3

    .line 383
    .local v4, "cValue":I
    if-nez v4, :cond_4

    .line 384
    const/16 v5, 0xd

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    goto :goto_1

    :cond_4
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 386
    const/16 v5, 0x2a

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 387
    goto :goto_1

    :cond_5
    const/4 v5, 0x2

    if-ne v4, v5, :cond_6

    .line 388
    const/16 v5, 0x3e

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 389
    goto :goto_1

    :cond_6
    if-ne v4, v0, :cond_7

    .line 390
    const/16 v5, 0x20

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 391
    goto :goto_1

    :cond_7
    const/16 v5, 0xe

    if-ge v4, v5, :cond_8

    .line 392
    add-int/lit8 v5, v4, 0x2c

    int-to-char v5, v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 393
    goto :goto_1

    :cond_8
    const/16 v5, 0x28

    if-ge v4, v5, :cond_9

    .line 394
    add-int/lit8 v5, v4, 0x33

    int-to-char v5, v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 395
    nop

    .line 381
    .end local v4    # "cValue":I
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 396
    .restart local v4    # "cValue":I
    :cond_9
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeAsciiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    .locals 5
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "resultTrailer"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 126
    const/4 v0, 0x0

    move v1, v0

    .line 128
    .local v1, "upperShift":Z
    :cond_0
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 129
    .local v2, "oneByte":I
    if-eqz v2, :cond_11

    .line 131
    const/16 v3, 0x80

    if-gt v2, v3, :cond_2

    .line 132
    if-eqz v1, :cond_1

    .line 133
    add-int/lit16 v2, v2, 0x80

    .line 136
    :cond_1
    add-int/lit8 v0, v2, -0x1

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 137
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 138
    :cond_2
    const/16 v3, 0x81

    if-ne v2, v3, :cond_3

    .line 139
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 140
    :cond_3
    const/16 v3, 0xe5

    if-gt v2, v3, :cond_5

    .line 141
    add-int/lit16 v3, v2, -0x82

    .line 142
    .local v3, "value":I
    const/16 v4, 0xa

    if-ge v3, v4, :cond_4

    .line 143
    const/16 v4, 0x30

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    :cond_4
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .end local v3    # "value":I
    goto/16 :goto_0

    :cond_5
    const/16 v3, 0xe6

    if-ne v2, v3, :cond_6

    .line 147
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->C40_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 148
    :cond_6
    const/16 v3, 0xe7

    if-ne v2, v3, :cond_7

    .line 149
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->BASE256_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 150
    :cond_7
    const/16 v3, 0xe8

    if-ne v2, v3, :cond_8

    .line 152
    const/16 v3, 0x1d

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 153
    goto :goto_0

    :cond_8
    const/16 v3, 0xe9

    if-eq v2, v3, :cond_10

    const/16 v3, 0xea

    if-eq v2, v3, :cond_10

    .line 157
    const/16 v3, 0xeb

    if-ne v2, v3, :cond_9

    .line 158
    const/4 v1, 0x1

    .line 159
    goto :goto_0

    :cond_9
    const/16 v3, 0xec

    if-ne v2, v3, :cond_a

    .line 160
    const-string v3, "[)>\u001e05\u001d"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    const-string v3, "\u001e\u0004"

    invoke-virtual {p2, v0, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    goto :goto_0

    :cond_a
    const/16 v3, 0xed

    if-ne v2, v3, :cond_b

    .line 163
    const-string v3, "[)>\u001e06\u001d"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    const-string v3, "\u001e\u0004"

    invoke-virtual {p2, v0, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    goto :goto_0

    :cond_b
    const/16 v3, 0xee

    if-ne v2, v3, :cond_c

    .line 166
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ANSIX12_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 167
    :cond_c
    const/16 v3, 0xef

    if-ne v2, v3, :cond_d

    .line 168
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->TEXT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 169
    :cond_d
    const/16 v3, 0xf0

    if-ne v2, v3, :cond_e

    .line 170
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->EDIFACT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 171
    :cond_e
    const/16 v3, 0xf1

    if-eq v2, v3, :cond_10

    .line 175
    const/16 v3, 0xf2

    if-lt v2, v3, :cond_10

    .line 177
    const/16 v3, 0xfe

    if-ne v2, v3, :cond_f

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-nez v3, :cond_f

    .end local v2    # "oneByte":I
    goto :goto_0

    .line 178
    .restart local v2    # "oneByte":I
    :cond_f
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 181
    .end local v2    # "oneByte":I
    :cond_10
    :goto_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    .line 127
    if-gtz v2, :cond_0

    .line 182
    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    .line 130
    .restart local v2    # "oneByte":I
    :cond_11
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeBase256Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/util/Collection;)V
    .locals 8
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitSource;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Collection<",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 451
    .local p2, "byteSegments":Ljava/util/Collection;, "Ljava/util/Collection<[B>;"
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->getByteOffset()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v1, v0

    .line 452
    .local v1, "codewordPosition":I
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    add-int/lit8 v3, v1, 0x1

    .local v3, "codewordPosition":I
    invoke-static {v2, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v1

    .line 454
    .local v1, "d1":I
    if-nez v1, :cond_0

    .line 455
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    div-int/2addr v2, v0

    .line 456
    .local v2, "count":I
    goto :goto_0

    .end local v2    # "count":I
    :cond_0
    const/16 v2, 0xfa

    if-ge v1, v2, :cond_1

    .line 457
    move v2, v1

    .line 458
    .restart local v2    # "count":I
    goto :goto_0

    .line 459
    .end local v2    # "count":I
    :cond_1
    add-int/lit16 v4, v1, -0xf9

    mul-int/2addr v2, v4

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    add-int/lit8 v5, v3, 0x1

    .local v5, "codewordPosition":I
    invoke-static {v4, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v3

    .end local v3    # "codewordPosition":I
    add-int/2addr v2, v3

    move v3, v5

    .line 463
    .end local v5    # "codewordPosition":I
    .restart local v2    # "count":I
    .restart local v3    # "codewordPosition":I
    :goto_0
    if-ltz v2, :cond_4

    .line 467
    new-array v4, v2, [B

    .line 468
    .local v4, "bytes":[B
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-lt v5, v2, :cond_2

    .line 476
    .end local v5    # "i":I
    invoke-interface {p2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 478
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v5, "ISO8859_1"

    invoke-direct {v0, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    nop

    .line 482
    return-void

    .line 479
    :catch_0
    move-exception v0

    .line 480
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Platform does not support required encoding: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 471
    .end local v0    # "uee":Ljava/io/UnsupportedEncodingException;
    .restart local v5    # "i":I
    :cond_2
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v6

    if-lt v6, v0, :cond_3

    .line 474
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v6

    add-int/lit8 v7, v3, 0x1

    .local v7, "codewordPosition":I
    invoke-static {v6, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v3

    .end local v3    # "codewordPosition":I
    int-to-byte v3, v3

    aput-byte v3, v4, v5

    .line 468
    add-int/lit8 v5, v5, 0x1

    move v3, v7

    goto :goto_1

    .line 472
    .end local v7    # "codewordPosition":I
    .restart local v3    # "codewordPosition":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 464
    .end local v4    # "bytes":[B
    .end local v5    # "i":I
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeC40Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .locals 9
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 192
    const/4 v0, 0x0

    .line 194
    .local v0, "upperShift":Z
    const/4 v1, 0x3

    new-array v2, v1, [I

    .line 195
    .local v2, "cValues":[I
    const/4 v3, 0x0

    .line 199
    .local v3, "shift":I
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    .line 200
    return-void

    .line 202
    :cond_1
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    .line 203
    .local v4, "firstByte":I
    const/16 v6, 0xfe

    if-ne v4, v6, :cond_2

    .line 204
    return-void

    .line 207
    :cond_2
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v5

    invoke-static {v4, v5, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    .line 209
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-lt v5, v1, :cond_3

    .line 267
    .end local v4    # "firstByte":I
    .end local v5    # "i":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    .line 197
    if-gtz v4, :cond_0

    .line 268
    return-void

    .line 210
    .restart local v4    # "firstByte":I
    .restart local v5    # "i":I
    :cond_3
    aget v6, v2, v5

    .line 211
    .local v6, "cValue":I
    packed-switch v3, :pswitch_data_0

    .line 264
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 255
    :pswitch_0
    if-eqz v0, :cond_4

    .line 256
    add-int/lit16 v7, v6, 0xe0

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 257
    const/4 v0, 0x0

    .line 258
    goto :goto_1

    .line 259
    :cond_4
    add-int/lit8 v7, v6, 0x60

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 261
    :goto_1
    const/4 v3, 0x0

    .line 262
    goto :goto_4

    .line 237
    :pswitch_1
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_6

    .line 238
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    aget-char v7, v7, v6

    .line 239
    .local v7, "c40char":C
    if-eqz v0, :cond_5

    .line 240
    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 241
    const/4 v0, 0x0

    .line 242
    goto :goto_2

    .line 243
    :cond_5
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 245
    .end local v7    # "c40char":C
    goto :goto_2

    :cond_6
    const/16 v7, 0x1b

    if-ne v6, v7, :cond_7

    .line 246
    const/16 v7, 0x1d

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 247
    goto :goto_2

    :cond_7
    const/16 v7, 0x1e

    if-ne v6, v7, :cond_8

    .line 248
    const/4 v0, 0x1

    .line 249
    nop

    .line 252
    :goto_2
    const/4 v3, 0x0

    .line 253
    goto :goto_4

    .line 250
    :cond_8
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 228
    :pswitch_2
    if-eqz v0, :cond_9

    .line 229
    add-int/lit16 v7, v6, 0x80

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 230
    const/4 v0, 0x0

    .line 231
    goto :goto_3

    .line 232
    :cond_9
    int-to-char v7, v6

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 234
    :goto_3
    const/4 v3, 0x0

    .line 235
    goto :goto_4

    .line 213
    :pswitch_3
    if-ge v6, v1, :cond_a

    .line 214
    add-int/lit8 v3, v6, 0x1

    .line 215
    goto :goto_4

    :cond_a
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_c

    .line 216
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    aget-char v7, v7, v6

    .line 217
    .restart local v7    # "c40char":C
    if-eqz v0, :cond_b

    .line 218
    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 219
    const/4 v0, 0x0

    .line 220
    goto :goto_4

    .line 221
    :cond_b
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 223
    .end local v7    # "c40char":C
    nop

    .line 209
    .end local v6    # "cValue":I
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 224
    .restart local v6    # "cValue":I
    :cond_c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static decodeEdifactSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .line 418
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    const/16 v1, 0x10

    if-gt v0, v1, :cond_1

    .line 419
    return-void

    .line 422
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x4

    if-lt v0, v1, :cond_2

    .line 440
    .end local v0    # "i":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    .line 416
    if-gtz v0, :cond_0

    .line 441
    return-void

    .line 423
    .restart local v0    # "i":I
    :cond_2
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 426
    .local v1, "edifactValue":I
    const/16 v2, 0x1f

    if-ne v1, v2, :cond_4

    .line 428
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->getBitOffset()I

    move-result v2

    const/16 v3, 0x8

    rsub-int/lit8 v2, v2, 0x8

    .line 429
    .local v2, "bitsLeft":I
    if-eq v2, v3, :cond_3

    .line 430
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    .line 432
    :cond_3
    return-void

    .line 435
    .end local v2    # "bitsLeft":I
    :cond_4
    and-int/lit8 v2, v1, 0x20

    if-nez v2, :cond_5

    .line 436
    or-int/lit8 v1, v1, 0x40

    .line 438
    :cond_5
    int-to-char v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    .end local v1    # "edifactValue":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static decodeTextSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .locals 9
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 277
    const/4 v0, 0x0

    .line 279
    .local v0, "upperShift":Z
    const/4 v1, 0x3

    new-array v2, v1, [I

    .line 280
    .local v2, "cValues":[I
    const/4 v3, 0x0

    .line 283
    .local v3, "shift":I
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    .line 284
    return-void

    .line 286
    :cond_1
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    .line 287
    .local v4, "firstByte":I
    const/16 v6, 0xfe

    if-ne v4, v6, :cond_2

    .line 288
    return-void

    .line 291
    :cond_2
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v5

    invoke-static {v4, v5, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    .line 293
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-lt v5, v1, :cond_3

    .line 357
    .end local v4    # "firstByte":I
    .end local v5    # "i":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    .line 281
    if-gtz v4, :cond_0

    .line 358
    return-void

    .line 294
    .restart local v4    # "firstByte":I
    .restart local v5    # "i":I
    :cond_3
    aget v6, v2, v5

    .line 295
    .local v6, "cValue":I
    packed-switch v3, :pswitch_data_0

    .line 354
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 340
    :pswitch_0
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_5

    .line 341
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    aget-char v7, v7, v6

    .line 342
    .local v7, "textChar":C
    if-eqz v0, :cond_4

    .line 343
    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 344
    const/4 v0, 0x0

    .line 345
    goto :goto_1

    .line 346
    :cond_4
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 348
    :goto_1
    const/4 v3, 0x0

    .line 349
    .end local v7    # "textChar":C
    goto :goto_4

    .line 350
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 322
    :pswitch_1
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_7

    .line 323
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    aget-char v7, v7, v6

    .line 324
    .local v7, "c40char":C
    if-eqz v0, :cond_6

    .line 325
    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    const/4 v0, 0x0

    .line 327
    goto :goto_2

    .line 328
    :cond_6
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    .end local v7    # "c40char":C
    goto :goto_2

    :cond_7
    const/16 v7, 0x1b

    if-ne v6, v7, :cond_8

    .line 331
    const/16 v7, 0x1d

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 332
    goto :goto_2

    :cond_8
    const/16 v7, 0x1e

    if-ne v6, v7, :cond_9

    .line 333
    const/4 v0, 0x1

    .line 334
    nop

    .line 337
    :goto_2
    const/4 v3, 0x0

    .line 338
    goto :goto_4

    .line 335
    :cond_9
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 312
    :pswitch_2
    if-eqz v0, :cond_a

    .line 313
    add-int/lit16 v7, v6, 0x80

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    const/4 v0, 0x0

    .line 315
    goto :goto_3

    .line 316
    :cond_a
    int-to-char v7, v6

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 318
    :goto_3
    const/4 v3, 0x0

    .line 319
    goto :goto_4

    .line 297
    :pswitch_3
    if-ge v6, v1, :cond_b

    .line 298
    add-int/lit8 v3, v6, 0x1

    .line 299
    goto :goto_4

    :cond_b
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_d

    .line 300
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    aget-char v7, v7, v6

    .line 301
    .local v7, "textChar":C
    if-eqz v0, :cond_c

    .line 302
    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 303
    const/4 v0, 0x0

    .line 304
    goto :goto_4

    .line 305
    :cond_c
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    .end local v7    # "textChar":C
    nop

    .line 293
    .end local v6    # "cValue":I
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 308
    .restart local v6    # "cValue":I
    :cond_d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static parseTwoBytes(II[I)V
    .locals 4
    .param p0, "firstByte"    # I
    .param p1, "secondByte"    # I
    .param p2, "result"    # [I

    .line 403
    shl-int/lit8 v0, p0, 0x8

    add-int/2addr v0, p1

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 404
    .local v0, "fullBitValue":I
    div-int/lit16 v2, v0, 0x640

    .line 405
    .local v2, "temp":I
    const/4 v3, 0x0

    aput v2, p2, v3

    .line 406
    mul-int/lit16 v3, v2, 0x640

    sub-int/2addr v0, v3

    .line 407
    div-int/lit8 v2, v0, 0x28

    .line 408
    aput v2, p2, v1

    .line 409
    mul-int/lit8 v1, v2, 0x28

    sub-int v1, v0, v1

    const/4 v3, 0x2

    aput v1, p2, v3

    .line 410
    return-void
.end method

.method private static unrandomize255State(II)I
    .locals 3
    .param p0, "randomizedBase256Codeword"    # I
    .param p1, "base256CodewordPosition"    # I

    .line 489
    const/16 v0, 0x95

    mul-int/2addr v0, p1

    rem-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0x1

    .line 490
    .local v0, "pseudoRandomNumber":I
    sub-int v1, p0, v0

    .line 491
    .local v1, "tempVariable":I
    if-ltz v1, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    add-int/lit16 v2, v1, 0x100

    :goto_0
    return v2
.end method
