.class public final Lcom/google/zxing/qrcode/encoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I = null

.field private static final ALPHANUMERIC_TABLE:[I

.field static final DEFAULT_BYTE_MODE_ENCODING:Ljava/lang/String; = "ISO-8859-1"


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode()[I
    .locals 3

    .line 38
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/zxing/qrcode/decoder/Mode;->values()[Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    :try_start_1
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_FIRST_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_SECOND_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v1

    :goto_4
    :try_start_5
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->HANZI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v1

    :goto_5
    :try_start_6
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v1

    :goto_6
    :try_start_7
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v1

    :goto_7
    :try_start_8
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->STRUCTURED_APPEND:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v1

    :goto_8
    :try_start_9
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v1

    :goto_9
    sput-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 18

    .line 41
    const/16 v0, 0x60

    new-array v0, v0, [I

    .line 42
    const/4 v1, -0x1

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v3, 0x2

    aput v1, v0, v3

    const/4 v4, 0x3

    aput v1, v0, v4

    const/4 v5, 0x4

    aput v1, v0, v5

    const/4 v6, 0x5

    aput v1, v0, v6

    const/4 v7, 0x6

    aput v1, v0, v7

    const/4 v8, 0x7

    aput v1, v0, v8

    const/16 v9, 0x8

    aput v1, v0, v9

    const/16 v10, 0x9

    aput v1, v0, v10

    const/16 v11, 0xa

    aput v1, v0, v11

    const/16 v12, 0xb

    aput v1, v0, v12

    const/16 v13, 0xc

    aput v1, v0, v13

    const/16 v14, 0xd

    aput v1, v0, v14

    const/16 v15, 0xe

    aput v1, v0, v15

    const/16 v16, 0xf

    aput v1, v0, v16

    .line 43
    const/16 v16, 0x10

    aput v1, v0, v16

    const/16 v16, 0x11

    aput v1, v0, v16

    const/16 v16, 0x12

    aput v1, v0, v16

    const/16 v16, 0x13

    aput v1, v0, v16

    const/16 v16, 0x14

    aput v1, v0, v16

    const/16 v16, 0x15

    aput v1, v0, v16

    const/16 v16, 0x16

    aput v1, v0, v16

    const/16 v16, 0x17

    aput v1, v0, v16

    const/16 v16, 0x18

    aput v1, v0, v16

    const/16 v16, 0x19

    aput v1, v0, v16

    const/16 v16, 0x1a

    aput v1, v0, v16

    const/16 v16, 0x1b

    aput v1, v0, v16

    const/16 v16, 0x1c

    aput v1, v0, v16

    const/16 v16, 0x1d

    aput v1, v0, v16

    const/16 v16, 0x1e

    aput v1, v0, v16

    const/16 v16, 0x1f

    aput v1, v0, v16

    .line 44
    const/16 v16, 0x20

    const/16 v17, 0x24

    aput v17, v0, v16

    const/16 v16, 0x21

    aput v1, v0, v16

    const/16 v16, 0x22

    aput v1, v0, v16

    const/16 v16, 0x23

    aput v1, v0, v16

    const/16 v16, 0x24

    const/16 v17, 0x25

    aput v17, v0, v16

    const/16 v16, 0x25

    const/16 v17, 0x26

    aput v17, v0, v16

    const/16 v16, 0x26

    aput v1, v0, v16

    const/16 v16, 0x27

    aput v1, v0, v16

    const/16 v16, 0x28

    aput v1, v0, v16

    const/16 v16, 0x29

    aput v1, v0, v16

    const/16 v16, 0x2a

    const/16 v17, 0x27

    aput v17, v0, v16

    const/16 v16, 0x2b

    const/16 v17, 0x28

    aput v17, v0, v16

    const/16 v16, 0x2c

    aput v1, v0, v16

    const/16 v16, 0x2d

    const/16 v17, 0x29

    aput v17, v0, v16

    const/16 v16, 0x2e

    const/16 v17, 0x2a

    aput v17, v0, v16

    const/16 v16, 0x2f

    const/16 v17, 0x2b

    aput v17, v0, v16

    .line 45
    const/16 v16, 0x31

    aput v2, v0, v16

    const/16 v2, 0x32

    aput v3, v0, v2

    const/16 v2, 0x33

    aput v4, v0, v2

    const/16 v2, 0x34

    aput v5, v0, v2

    const/16 v2, 0x35

    aput v6, v0, v2

    const/16 v2, 0x36

    aput v7, v0, v2

    const/16 v2, 0x37

    aput v8, v0, v2

    const/16 v2, 0x38

    aput v9, v0, v2

    const/16 v2, 0x39

    aput v10, v0, v2

    const/16 v2, 0x3a

    const/16 v3, 0x2c

    aput v3, v0, v2

    const/16 v2, 0x3b

    aput v1, v0, v2

    const/16 v2, 0x3c

    aput v1, v0, v2

    const/16 v2, 0x3d

    aput v1, v0, v2

    const/16 v2, 0x3e

    aput v1, v0, v2

    const/16 v2, 0x3f

    aput v1, v0, v2

    .line 46
    const/16 v2, 0x40

    aput v1, v0, v2

    const/16 v2, 0x41

    aput v11, v0, v2

    const/16 v2, 0x42

    aput v12, v0, v2

    const/16 v2, 0x43

    aput v13, v0, v2

    const/16 v2, 0x44

    aput v14, v0, v2

    const/16 v2, 0x45

    aput v15, v0, v2

    const/16 v2, 0x46

    const/16 v3, 0xf

    aput v3, v0, v2

    const/16 v2, 0x47

    const/16 v3, 0x10

    aput v3, v0, v2

    const/16 v2, 0x48

    const/16 v3, 0x11

    aput v3, v0, v2

    const/16 v2, 0x49

    const/16 v3, 0x12

    aput v3, v0, v2

    const/16 v2, 0x4a

    const/16 v3, 0x13

    aput v3, v0, v2

    const/16 v2, 0x4b

    const/16 v3, 0x14

    aput v3, v0, v2

    const/16 v2, 0x4c

    const/16 v3, 0x15

    aput v3, v0, v2

    const/16 v2, 0x4d

    const/16 v3, 0x16

    aput v3, v0, v2

    const/16 v2, 0x4e

    const/16 v3, 0x17

    aput v3, v0, v2

    const/16 v2, 0x4f

    const/16 v3, 0x18

    aput v3, v0, v2

    .line 47
    const/16 v2, 0x50

    const/16 v3, 0x19

    aput v3, v0, v2

    const/16 v2, 0x51

    const/16 v3, 0x1a

    aput v3, v0, v2

    const/16 v2, 0x52

    const/16 v3, 0x1b

    aput v3, v0, v2

    const/16 v2, 0x53

    const/16 v3, 0x1c

    aput v3, v0, v2

    const/16 v2, 0x54

    const/16 v3, 0x1d

    aput v3, v0, v2

    const/16 v2, 0x55

    const/16 v3, 0x1e

    aput v3, v0, v2

    const/16 v2, 0x56

    const/16 v3, 0x1f

    aput v3, v0, v2

    const/16 v2, 0x57

    const/16 v3, 0x20

    aput v3, v0, v2

    const/16 v2, 0x58

    const/16 v3, 0x21

    aput v3, v0, v2

    const/16 v2, 0x59

    const/16 v3, 0x22

    aput v3, v0, v2

    const/16 v2, 0x5a

    const/16 v3, 0x23

    aput v3, v0, v2

    const/16 v2, 0x5b

    aput v1, v0, v2

    const/16 v2, 0x5c

    aput v1, v0, v2

    const/16 v2, 0x5d

    aput v1, v0, v2

    const/16 v2, 0x5e

    aput v1, v0, v2

    const/16 v2, 0x5f

    aput v1, v0, v2

    .line 41
    sput-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    .line 50
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method static append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .locals 5
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 537
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 538
    .local v0, "bytes":[B
    nop

    .line 539
    nop

    .line 541
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_0

    .line 544
    return-void

    .line 541
    :cond_0
    aget-byte v3, v0, v2

    .line 542
    .local v3, "b":B
    const/16 v4, 0x8

    invoke-virtual {p1, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 541
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 538
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v0

    .line 539
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .locals 6
    .param p0, "content"    # Ljava/lang/CharSequence;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 510
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 511
    .local v0, "length":I
    const/4 v1, 0x0

    .line 512
    .local v1, "i":I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 531
    return-void

    .line 513
    :cond_0
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v2

    .line 514
    .local v2, "code1":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 517
    add-int/lit8 v4, v1, 0x1

    if-ge v4, v0, :cond_2

    .line 518
    add-int/lit8 v4, v1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    .line 519
    .local v4, "code2":I
    if-eq v4, v3, :cond_1

    .line 523
    mul-int/lit8 v3, v2, 0x2d

    add-int/2addr v3, v4

    const/16 v5, 0xb

    invoke-virtual {p1, v3, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 524
    add-int/lit8 v1, v1, 0x2

    .line 525
    .end local v4    # "code2":I
    goto :goto_0

    .line 520
    .restart local v4    # "code2":I
    :cond_1
    new-instance v3, Lcom/google/zxing/WriterException;

    invoke-direct {v3}, Lcom/google/zxing/WriterException;-><init>()V

    throw v3

    .line 527
    .end local v4    # "code2":I
    :cond_2
    const/4 v3, 0x6

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 528
    add-int/lit8 v1, v1, 0x1

    .end local v2    # "code1":I
    goto :goto_0

    .line 515
    .restart local v2    # "code1":I
    :cond_3
    new-instance v3, Lcom/google/zxing/WriterException;

    invoke-direct {v3}, Lcom/google/zxing/WriterException;-><init>()V

    throw v3
.end method

.method static appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p2, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 467
    invoke-static {}, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 481
    new-instance v0, Lcom/google/zxing/WriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid mode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 472
    :pswitch_0
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    .line 473
    goto :goto_0

    .line 469
    :pswitch_1
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    .line 470
    goto :goto_0

    .line 478
    :cond_0
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V

    .line 479
    goto :goto_0

    .line 475
    :cond_1
    invoke-static {p0, p2, p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    .line 476
    nop

    .line 483
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V
    .locals 2
    .param p0, "eci"    # Lcom/google/zxing/common/CharacterSetECI;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 573
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 575
    invoke-virtual {p0}, Lcom/google/zxing/common/CharacterSetECI;->getValue()I

    move-result v0

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 576
    return-void
.end method

.method static appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V
    .locals 9
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 549
    :try_start_0
    const-string v0, "Shift_JIS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 550
    .local v0, "bytes":[B
    nop

    .line 551
    nop

    .line 553
    array-length v1, v0

    .line 554
    .local v1, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 570
    .end local v2    # "i":I
    return-void

    .line 555
    .restart local v2    # "i":I
    :cond_0
    aget-byte v3, v0, v2

    and-int/lit16 v3, v3, 0xff

    .line 556
    .local v3, "byte1":I
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    .line 557
    .local v4, "byte2":I
    shl-int/lit8 v5, v3, 0x8

    or-int/2addr v5, v4

    .line 558
    .local v5, "code":I
    const/4 v6, -0x1

    .line 559
    .local v6, "subtracted":I
    const v7, 0x8140

    if-lt v5, v7, :cond_1

    const v8, 0x9ffc

    if-gt v5, v8, :cond_1

    .line 560
    sub-int v6, v5, v7

    .line 561
    goto :goto_1

    :cond_1
    const v7, 0xe040

    if-lt v5, v7, :cond_2

    const v7, 0xebbf

    if-gt v5, v7, :cond_2

    .line 562
    const v7, 0xc140

    sub-int v6, v5, v7

    .line 564
    :cond_2
    :goto_1
    const/4 v7, -0x1

    if-eq v6, v7, :cond_3

    .line 567
    shr-int/lit8 v7, v6, 0x8

    mul-int/lit16 v7, v7, 0xc0

    and-int/lit16 v8, v6, 0xff

    add-int/2addr v7, v8

    .line 568
    .local v7, "encoded":I
    const/16 v8, 0xd

    invoke-virtual {p1, v7, v8}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 554
    .end local v3    # "byte1":I
    .end local v4    # "byte2":I
    .end local v5    # "code":I
    .end local v6    # "subtracted":I
    .end local v7    # "encoded":I
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 565
    .restart local v3    # "byte1":I
    .restart local v4    # "byte2":I
    .restart local v5    # "code":I
    .restart local v6    # "subtracted":I
    :cond_3
    new-instance v7, Lcom/google/zxing/WriterException;

    const-string v8, "Invalid byte sequence"

    invoke-direct {v7, v8}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 550
    .end local v0    # "bytes":[B
    .end local v1    # "length":I
    .end local v2    # "i":I
    .end local v3    # "byte1":I
    .end local v4    # "byte2":I
    .end local v5    # "code":I
    .end local v6    # "subtracted":I
    :catch_0
    move-exception v0

    .line 551
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .locals 5
    .param p0, "numLetters"    # I
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p3, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 453
    invoke-virtual {p2, p1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v0

    .line 454
    .local v0, "numBits":I
    const/4 v1, 0x1

    shl-int v2, v1, v0

    if-ge p0, v2, :cond_0

    .line 457
    invoke-virtual {p3, p0, v0}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 458
    return-void

    .line 455
    :cond_0
    new-instance v2, Lcom/google/zxing/WriterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " is bigger than "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shl-int v4, v1, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .locals 2
    .param p0, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 445
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 446
    return-void
.end method

.method static appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .locals 7
    .param p0, "content"    # Ljava/lang/CharSequence;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 486
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 487
    .local v0, "length":I
    const/4 v1, 0x0

    .line 488
    .local v1, "i":I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 507
    return-void

    .line 489
    :cond_0
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    .line 490
    .local v2, "num1":I
    add-int/lit8 v3, v1, 0x2

    if-ge v3, v0, :cond_1

    .line 492
    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    .line 493
    .local v3, "num2":I
    add-int/lit8 v4, v1, 0x2

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x30

    .line 494
    .local v4, "num3":I
    mul-int/lit8 v5, v2, 0x64

    mul-int/lit8 v6, v3, 0xa

    add-int/2addr v5, v6

    add-int/2addr v5, v4

    const/16 v6, 0xa

    invoke-virtual {p1, v5, v6}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 495
    add-int/lit8 v1, v1, 0x3

    .line 496
    .end local v3    # "num2":I
    .end local v4    # "num3":I
    goto :goto_0

    :cond_1
    add-int/lit8 v3, v1, 0x1

    if-ge v3, v0, :cond_2

    .line 498
    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    .line 499
    .restart local v3    # "num2":I
    mul-int/lit8 v4, v2, 0xa

    add-int/2addr v4, v3

    const/4 v5, 0x7

    invoke-virtual {p1, v4, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 500
    add-int/lit8 v1, v1, 0x2

    .line 501
    .end local v3    # "num2":I
    goto :goto_0

    .line 503
    :cond_2
    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 504
    add-int/lit8 v1, v1, 0x1

    .end local v2    # "num1":I
    goto :goto_0
.end method

.method private static calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .locals 2
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 58
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v0

    .line 59
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule2(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    .line 58
    add-int/2addr v0, v1

    .line 60
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule3(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    .line 58
    add-int/2addr v0, v1

    .line 61
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule4(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    .line 58
    add-int/2addr v0, v1

    return v0
.end method

.method private static chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .locals 4
    .param p0, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p2, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p3, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 234
    const v0, 0x7fffffff

    .line 235
    .local v0, "minPenalty":I
    const/4 v1, -0x1

    .line 237
    .local v1, "bestMaskPattern":I
    const/4 v2, 0x0

    .local v2, "maskPattern":I
    :goto_0
    const/16 v3, 0x8

    if-lt v2, v3, :cond_0

    .line 245
    .end local v2    # "maskPattern":I
    return v1

    .line 238
    .restart local v2    # "maskPattern":I
    :cond_0
    invoke-static {p0, p1, p2, v2, p3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 239
    invoke-static {p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v3

    .line 240
    .local v3, "penalty":I
    if-ge v3, v0, :cond_1

    .line 241
    move v0, v3

    .line 242
    move v1, v2

    .line 237
    .end local v3    # "penalty":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static chooseMode(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;

    .line 176
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v0

    return-object v0
.end method

.method private static chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .locals 6
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .line 184
    const-string v0, "Shift_JIS"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->isOnlyDoubleByteKanji(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    :goto_0
    return-object v0

    .line 188
    :cond_1
    const/4 v0, 0x0

    .line 189
    .local v0, "hasNumeric":Z
    const/4 v1, 0x0

    .line 190
    .local v1, "hasAlphanumeric":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_4

    .line 200
    .end local v2    # "i":I
    if-eqz v1, :cond_2

    .line 201
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    .line 203
    :cond_2
    if-eqz v0, :cond_3

    .line 204
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    .line 206
    :cond_3
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    .line 191
    .restart local v2    # "i":I
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 192
    .local v3, "c":C
    const/16 v4, 0x30

    if-lt v3, v4, :cond_5

    const/16 v4, 0x39

    if-gt v3, v4, :cond_5

    .line 193
    const/4 v0, 0x1

    .line 194
    goto :goto_2

    :cond_5
    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_6

    .line 195
    const/4 v1, 0x1

    .line 196
    nop

    .line 190
    .end local v3    # "c":C
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 197
    .restart local v3    # "c":C
    :cond_6
    sget-object v4, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v4
.end method

.method private static chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 7
    .param p0, "numInputBits"    # I
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 250
    const/4 v0, 0x1

    .local v0, "versionNum":I
    :goto_0
    const/16 v1, 0x28

    if-gt v0, v1, :cond_1

    .line 251
    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    .line 253
    .local v1, "version":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v2

    .line 255
    .local v2, "numBytes":I
    invoke-virtual {v1, p1}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v3

    .line 256
    .local v3, "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v4

    .line 258
    .local v4, "numEcBytes":I
    sub-int v5, v2, v4

    .line 259
    .local v5, "numDataBytes":I
    add-int/lit8 v6, p0, 0x7

    div-int/lit8 v6, v6, 0x8

    .line 260
    .local v6, "totalInputBytes":I
    if-lt v5, v6, :cond_0

    .line 261
    return-object v1

    .line 250
    .end local v1    # "version":Lcom/google/zxing/qrcode/decoder/Version;
    .end local v2    # "numBytes":I
    .end local v3    # "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .end local v4    # "numEcBytes":I
    .end local v5    # "numDataBytes":I
    .end local v6    # "totalInputBytes":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 264
    .end local v0    # "versionNum":I
    :cond_1
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Data too big"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 72
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .locals 18
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/encoder/QRCode;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 80
    move-object/from16 v2, p2

    if-nez v2, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 81
    .local v3, "encoding":Ljava/lang/String;
    :goto_0
    if-nez v3, :cond_1

    .line 82
    const-string v3, "ISO-8859-1"

    .line 87
    :cond_1
    invoke-static {v0, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v4

    .line 91
    .local v4, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    new-instance v5, Lcom/google/zxing/common/BitArray;

    invoke-direct {v5}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 94
    .local v5, "headerBits":Lcom/google/zxing/common/BitArray;
    sget-object v6, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v6, :cond_2

    const-string v6, "ISO-8859-1"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 95
    invoke-static {v3}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByName(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v6

    .line 96
    .local v6, "eci":Lcom/google/zxing/common/CharacterSetECI;
    if-eqz v6, :cond_2

    .line 97
    invoke-static {v6, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V

    .line 102
    .end local v6    # "eci":Lcom/google/zxing/common/CharacterSetECI;
    :cond_2
    invoke-static {v4, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    .line 106
    new-instance v6, Lcom/google/zxing/common/BitArray;

    invoke-direct {v6}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 107
    .local v6, "dataBits":Lcom/google/zxing/common/BitArray;
    invoke-static {v0, v4, v6, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    .line 113
    invoke-virtual {v5}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    .line 114
    const/4 v8, 0x1

    invoke-static {v8}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v8

    .line 113
    add-int/2addr v7, v8

    .line 115
    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    .line 113
    add-int/2addr v7, v8

    .line 116
    .local v7, "provisionalBitsNeeded":I
    invoke-static {v7, v1}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v8

    .line 120
    .local v8, "provisionalVersion":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-virtual {v5}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v9

    .line 121
    invoke-virtual {v4, v8}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v10

    .line 120
    add-int/2addr v9, v10

    .line 122
    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v10

    .line 120
    add-int/2addr v9, v10

    .line 123
    .local v9, "bitsNeeded":I
    invoke-static {v9, v1}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v10

    .line 125
    .local v10, "version":Lcom/google/zxing/qrcode/decoder/Version;
    new-instance v11, Lcom/google/zxing/common/BitArray;

    invoke-direct {v11}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 126
    .local v11, "headerAndDataBits":Lcom/google/zxing/common/BitArray;
    invoke-virtual {v11, v5}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    .line 128
    sget-object v12, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v12, :cond_3

    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v12

    goto :goto_1

    :cond_3
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v12

    .line 129
    .local v12, "numLetters":I
    :goto_1
    invoke-static {v12, v10, v4, v11}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    .line 131
    invoke-virtual {v11, v6}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    .line 133
    invoke-virtual {v10, v1}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v13

    .line 134
    .local v13, "ecBlocks":Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v14

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v15

    sub-int/2addr v14, v15

    .line 137
    .local v14, "numDataBytes":I
    invoke-static {v14, v11}, Lcom/google/zxing/qrcode/encoder/Encoder;->terminateBits(ILcom/google/zxing/common/BitArray;)V

    .line 140
    nop

    .line 141
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v15

    .line 142
    nop

    .line 143
    invoke-virtual {v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getNumBlocks()I

    move-result v0

    .line 140
    invoke-static {v11, v15, v14, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 145
    .local v0, "finalBits":Lcom/google/zxing/common/BitArray;
    new-instance v15, Lcom/google/zxing/qrcode/encoder/QRCode;

    invoke-direct {v15}, Lcom/google/zxing/qrcode/encoder/QRCode;-><init>()V

    .line 147
    .local v15, "qrCode":Lcom/google/zxing/qrcode/encoder/QRCode;
    invoke-virtual {v15, v1}, Lcom/google/zxing/qrcode/encoder/QRCode;->setECLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)V

    .line 148
    invoke-virtual {v15, v4}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMode(Lcom/google/zxing/qrcode/decoder/Mode;)V

    .line 149
    invoke-virtual {v15, v10}, Lcom/google/zxing/qrcode/encoder/QRCode;->setVersion(Lcom/google/zxing/qrcode/decoder/Version;)V

    .line 152
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v2

    .line 153
    .local v2, "dimension":I
    move-object/from16 v16, v3

    new-instance v3, Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .end local v3    # "encoding":Ljava/lang/String;
    .local v16, "encoding":Ljava/lang/String;
    invoke-direct {v3, v2, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;-><init>(II)V

    .line 154
    .local v3, "matrix":Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    move/from16 v17, v2

    invoke-static {v0, v1, v10, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v2

    .line 155
    .local v2, "maskPattern":I
    .local v17, "dimension":I
    invoke-virtual {v15, v2}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMaskPattern(I)V

    .line 158
    invoke-static {v0, v1, v10, v2, v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 159
    invoke-virtual {v15, v3}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 161
    return-object v15
.end method

.method static generateECBytes([BI)[B
    .locals 5
    .param p0, "dataBytes"    # [B
    .param p1, "numEcBytesInBlock"    # I

    .line 427
    array-length v0, p0

    .line 428
    .local v0, "numDataBytes":I
    add-int v1, v0, p1

    new-array v1, v1, [I

    .line 429
    .local v1, "toEncode":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_1

    .line 432
    .end local v2    # "i":I
    new-instance v2, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v2, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    invoke-virtual {v2, v1, p1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->encode([II)V

    .line 434
    new-array v3, p1, [B

    .line 435
    .local v3, "ecBytes":[B
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    if-lt v2, p1, :cond_0

    .line 438
    .end local v2    # "i":I
    return-object v3

    .line 436
    .restart local v2    # "i":I
    :cond_0
    add-int v4, v0, v2

    aget v4, v1, v4

    int-to-byte v4, v4

    aput-byte v4, v3, v2

    .line 435
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 430
    .end local v3    # "ecBytes":[B
    :cond_1
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    .line 429
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method static getAlphanumericCode(I)I
    .locals 1
    .param p0, "code"    # I

    .line 169
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 170
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    aget v0, v0, p0

    return v0

    .line 172
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method static getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V
    .locals 10
    .param p0, "numTotalBytes"    # I
    .param p1, "numDataBytes"    # I
    .param p2, "numRSBlocks"    # I
    .param p3, "blockID"    # I
    .param p4, "numDataBytesInBlock"    # [I
    .param p5, "numECBytesInBlock"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 308
    if-ge p3, p2, :cond_4

    .line 312
    rem-int v0, p0, p2

    .line 314
    .local v0, "numRsBlocksInGroup2":I
    sub-int v1, p2, v0

    .line 316
    .local v1, "numRsBlocksInGroup1":I
    div-int v2, p0, p2

    .line 318
    .local v2, "numTotalBytesInGroup1":I
    add-int/lit8 v3, v2, 0x1

    .line 320
    .local v3, "numTotalBytesInGroup2":I
    div-int v4, p1, p2

    .line 322
    .local v4, "numDataBytesInGroup1":I
    add-int/lit8 v5, v4, 0x1

    .line 324
    .local v5, "numDataBytesInGroup2":I
    sub-int v6, v2, v4

    .line 326
    .local v6, "numEcBytesInGroup1":I
    sub-int v7, v3, v5

    .line 329
    .local v7, "numEcBytesInGroup2":I
    if-ne v6, v7, :cond_3

    .line 333
    add-int v8, v1, v0

    if-ne p2, v8, :cond_2

    .line 337
    nop

    .line 338
    add-int v8, v4, v6

    .line 339
    nop

    .line 338
    mul-int/2addr v8, v1

    .line 340
    add-int v9, v5, v7

    .line 341
    nop

    .line 340
    mul-int/2addr v9, v0

    .line 338
    add-int/2addr v8, v9

    .line 337
    if-ne p0, v8, :cond_1

    .line 345
    const/4 v8, 0x0

    if-ge p3, v1, :cond_0

    .line 346
    aput v4, p4, v8

    .line 347
    aput v6, p5, v8

    .line 348
    goto :goto_0

    .line 349
    :cond_0
    aput v5, p4, v8

    .line 350
    aput v7, p5, v8

    .line 352
    :goto_0
    return-void

    .line 342
    :cond_1
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "Total bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 334
    :cond_2
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "RS blocks mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 330
    :cond_3
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "EC bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 309
    .end local v0    # "numRsBlocksInGroup2":I
    .end local v1    # "numRsBlocksInGroup1":I
    .end local v2    # "numTotalBytesInGroup1":I
    .end local v3    # "numTotalBytesInGroup2":I
    .end local v4    # "numDataBytesInGroup1":I
    .end local v5    # "numDataBytesInGroup2":I
    .end local v6    # "numEcBytesInGroup1":I
    .end local v7    # "numEcBytesInGroup2":I
    :cond_4
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Block ID too large"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;
    .locals 17
    .param p0, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "numTotalBytes"    # I
    .param p2, "numDataBytes"    # I
    .param p3, "numRSBlocks"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    move/from16 v6, p1

    move/from16 v7, p2

    .line 364
    move/from16 v8, p3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v0

    if-ne v0, v7, :cond_9

    .line 370
    const/4 v0, 0x0

    .line 371
    .local v0, "dataBytesOffset":I
    const/4 v1, 0x0

    .line 372
    .local v1, "maxNumDataBytes":I
    const/4 v2, 0x0

    .line 375
    .local v2, "maxNumEcBytes":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    move-object v9, v3

    .line 377
    .local v9, "blocks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/qrcode/encoder/BlockPair;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    move v11, v0

    move v12, v1

    move v13, v2

    move v10, v3

    .end local v0    # "dataBytesOffset":I
    .end local v1    # "maxNumDataBytes":I
    .end local v2    # "maxNumEcBytes":I
    .end local v3    # "i":I
    .local v10, "i":I
    .local v11, "dataBytesOffset":I
    .local v12, "maxNumDataBytes":I
    .local v13, "maxNumEcBytes":I
    :goto_0
    const/16 v14, 0x8

    if-lt v10, v8, :cond_8

    .line 394
    .end local v10    # "i":I
    if-ne v7, v11, :cond_7

    .line 398
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 401
    .local v0, "result":Lcom/google/zxing/common/BitArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-lt v1, v12, :cond_4

    .line 410
    .end local v1    # "i":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_2
    if-lt v2, v13, :cond_1

    .line 418
    .end local v2    # "i":I
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v1

    if-ne v6, v1, :cond_0

    .line 423
    return-object v0

    .line 419
    :cond_0
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Interleaving error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " differ."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 419
    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 411
    .restart local v2    # "i":I
    :cond_1
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 410
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 411
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/qrcode/encoder/BlockPair;

    .line 412
    .local v1, "block":Lcom/google/zxing/qrcode/encoder/BlockPair;
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getErrorCorrectionBytes()[B

    move-result-object v4

    .line 413
    .local v4, "ecBytes":[B
    array-length v5, v4

    if-ge v2, v5, :cond_2

    .line 414
    aget-byte v5, v4, v2

    invoke-virtual {v0, v5, v14}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .end local v1    # "block":Lcom/google/zxing/qrcode/encoder/BlockPair;
    .end local v4    # "ecBytes":[B
    goto :goto_3

    .line 402
    .end local v2    # "i":I
    .local v1, "i":I
    :cond_4
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_6

    .line 401
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 402
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/encoder/BlockPair;

    .line 403
    .local v3, "block":Lcom/google/zxing/qrcode/encoder/BlockPair;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getDataBytes()[B

    move-result-object v4

    .line 404
    .local v4, "dataBytes":[B
    array-length v5, v4

    if-ge v1, v5, :cond_5

    .line 405
    aget-byte v5, v4, v1

    invoke-virtual {v0, v5, v14}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .end local v3    # "block":Lcom/google/zxing/qrcode/encoder/BlockPair;
    .end local v4    # "dataBytes":[B
    goto :goto_4

    .line 395
    .end local v0    # "result":Lcom/google/zxing/common/BitArray;
    .end local v1    # "i":I
    :cond_7
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Data bytes does not match offset"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 378
    .restart local v10    # "i":I
    :cond_8
    const/4 v0, 0x1

    new-array v15, v0, [I

    .line 379
    .local v15, "numDataBytesInBlock":[I
    new-array v5, v0, [I

    .line 381
    .local v5, "numEcBytesInBlock":[I
    nop

    .line 382
    nop

    .line 380
    move v0, v6

    move v1, v7

    move v2, v8

    move v3, v10

    move-object v4, v15

    move-object/from16 v16, v5

    .end local v5    # "numEcBytesInBlock":[I
    .local v16, "numEcBytesInBlock":[I
    invoke-static/range {v0 .. v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V

    .line 384
    const/4 v0, 0x0

    aget v1, v15, v0

    .line 385
    .local v1, "size":I
    new-array v2, v1, [B

    .line 386
    .local v2, "dataBytes":[B
    mul-int/2addr v14, v11

    move-object/from16 v3, p0

    invoke-virtual {v3, v14, v2, v0, v1}, Lcom/google/zxing/common/BitArray;->toBytes(I[BII)V

    .line 387
    aget v4, v16, v0

    invoke-static {v2, v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->generateECBytes([BI)[B

    move-result-object v4

    .line 388
    .local v4, "ecBytes":[B
    new-instance v5, Lcom/google/zxing/qrcode/encoder/BlockPair;

    invoke-direct {v5, v2, v4}, Lcom/google/zxing/qrcode/encoder/BlockPair;-><init>([B[B)V

    invoke-interface {v9, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 390
    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 391
    array-length v5, v4

    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 392
    aget v0, v15, v0

    add-int/2addr v11, v0

    .line 377
    .end local v1    # "size":I
    .end local v2    # "dataBytes":[B
    .end local v4    # "ecBytes":[B
    .end local v15    # "numDataBytesInBlock":[I
    .end local v16    # "numEcBytesInBlock":[I
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 365
    .end local v9    # "blocks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/qrcode/encoder/BlockPair;>;"
    .end local v10    # "i":I
    .end local v11    # "dataBytesOffset":I
    .end local v12    # "maxNumDataBytes":I
    .end local v13    # "maxNumEcBytes":I
    :cond_9
    move-object/from16 v3, p0

    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Number of bits and data bytes does not match"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isOnlyDoubleByteKanji(Ljava/lang/String;)Z
    .locals 6
    .param p0, "content"    # Ljava/lang/String;

    .line 212
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "Shift_JIS"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    .local v1, "bytes":[B
    nop

    .line 214
    nop

    .line 216
    array-length v2, v1

    .line 217
    .local v2, "length":I
    rem-int/lit8 v3, v2, 0x2

    if-eqz v3, :cond_0

    .line 218
    return v0

    .line 220
    :cond_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v2, :cond_1

    .line 226
    .end local v3    # "i":I
    const/4 v0, 0x1

    return v0

    .line 221
    .restart local v3    # "i":I
    :cond_1
    aget-byte v4, v1, v3

    and-int/lit16 v4, v4, 0xff

    .line 222
    .local v4, "byte1":I
    const/16 v5, 0x81

    if-lt v4, v5, :cond_2

    const/16 v5, 0x9f

    if-le v4, v5, :cond_3

    :cond_2
    const/16 v5, 0xe0

    if-lt v4, v5, :cond_4

    const/16 v5, 0xeb

    if-le v4, v5, :cond_3

    goto :goto_1

    .line 220
    .end local v4    # "byte1":I
    :cond_3
    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    .line 223
    .restart local v4    # "byte1":I
    :cond_4
    :goto_1
    return v0

    .line 213
    .end local v1    # "bytes":[B
    .end local v2    # "length":I
    .end local v3    # "i":I
    .end local v4    # "byte1":I
    :catch_0
    move-exception v1

    .line 214
    .local v1, "ignored":Ljava/io/UnsupportedEncodingException;
    return v0
.end method

.method static terminateBits(ILcom/google/zxing/common/BitArray;)V
    .locals 6
    .param p0, "numDataBytes"    # I
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 271
    mul-int/lit8 v0, p0, 0x8

    .line 272
    .local v0, "capacity":I
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    if-gt v1, v0, :cond_7

    .line 276
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x4

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-lt v2, v0, :cond_0

    .end local v1    # "i":I
    goto :goto_1

    .line 277
    .restart local v1    # "i":I
    :cond_0
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 276
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 281
    .end local v1    # "i":I
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    .line 282
    .local v1, "numBitsInLastByte":I
    const/16 v2, 0x8

    if-lez v1, :cond_3

    .line 283
    move v4, v1

    .local v4, "i":I
    :goto_2
    if-lt v4, v2, :cond_2

    .end local v4    # "i":I
    goto :goto_3

    .line 284
    .restart local v4    # "i":I
    :cond_2
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 283
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 288
    .end local v4    # "i":I
    :cond_3
    :goto_3
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v3

    sub-int v3, p0, v3

    .line 289
    .local v3, "numPaddingBytes":I
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_4
    if-lt v4, v3, :cond_5

    .line 292
    .end local v4    # "i":I
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ne v2, v0, :cond_4

    .line 295
    return-void

    .line 293
    :cond_4
    new-instance v2, Lcom/google/zxing/WriterException;

    const-string v4, "Bits size does not equal capacity"

    invoke-direct {v2, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 290
    .restart local v4    # "i":I
    :cond_5
    and-int/lit8 v5, v4, 0x1

    if-nez v5, :cond_6

    const/16 v5, 0xec

    goto :goto_5

    :cond_6
    const/16 v5, 0x11

    :goto_5
    invoke-virtual {p1, v5, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 289
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 273
    .end local v1    # "numBitsInLastByte":I
    .end local v3    # "numPaddingBytes":I
    .end local v4    # "i":I
    :cond_7
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "data bits cannot fit in the QR Code"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 273
    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
