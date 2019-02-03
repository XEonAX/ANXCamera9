.class public final Lcom/google/zxing/maxicode/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# static fields
.field private static final ALL:I = 0x0

.field private static final EVEN:I = 0x1

.field private static final ODD:I = 0x2


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->MAXICODE_FIELD_64:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/maxicode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 46
    return-void
.end method

.method private correctErrors([BIIII)V
    .registers 12
    .param p1, "codewordBytes"    # [B
    .param p2, "start"    # I
    .param p3, "dataCodewords"    # I
    .param p4, "ecCodewords"    # I
    .param p5, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 88
    add-int v0, p3, p4

    .line 91
    .local v0, "codewords":I
    if-nez p5, :cond_6

    const/4 v1, 0x1

    goto :goto_7

    :cond_6
    const/4 v1, 0x2

    .line 94
    .local v1, "divisor":I
    :goto_7
    div-int v2, v0, v1

    new-array v2, v2, [I

    .line 95
    .local v2, "codewordsInts":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c
    if-lt v3, v0, :cond_34

    .line 101
    .end local v3    # "i":I
    :try_start_e
    iget-object v3, p0, Lcom/google/zxing/maxicode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    div-int v4, p4, v1

    invoke-virtual {v3, v2, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_15
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_e .. :try_end_15} :catch_2e

    .line 102
    nop

    .line 107
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_17
    if-lt v3, p3, :cond_1a

    .line 112
    .end local v3    # "i":I
    return-void

    .line 108
    .restart local v3    # "i":I
    :cond_1a
    if-eqz p5, :cond_22

    rem-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, p5, -0x1

    if-ne v4, v5, :cond_2b

    .line 109
    :cond_22
    add-int v4, v3, p2

    div-int v5, v3, v1

    aget v5, v2, v5

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    .line 107
    :cond_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 102
    .end local v3    # "i":I
    :catch_2e
    move-exception v3

    .line 103
    .local v3, "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    .line 96
    .local v3, "i":I
    :cond_34
    if-eqz p5, :cond_3c

    rem-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, p5, -0x1

    if-ne v4, v5, :cond_46

    .line 97
    :cond_3c
    div-int v4, v3, v1

    add-int v5, v3, p2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    aput v5, v2, v4

    .line 95
    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_c
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .registers 3
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/maxicode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .registers 13
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

    .line 54
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v0, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 55
    .local v0, "parser":Lcom/google/zxing/maxicode/decoder/BitMatrixParser;
    invoke-virtual {v0}, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v7

    .line 57
    .local v7, "codewords":[B
    const/4 v3, 0x0

    const/16 v4, 0xa

    const/16 v5, 0xa

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    .line 58
    const/4 v8, 0x0

    aget-byte v1, v7, v8

    and-int/lit8 v9, v1, 0xf

    .line 60
    .local v9, "mode":I
    packed-switch v9, :pswitch_data_5e

    .line 74
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 69
    :pswitch_21
    const/16 v3, 0x14

    const/16 v4, 0x44

    const/16 v5, 0x38

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    .line 70
    const/4 v6, 0x2

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    .line 71
    const/16 v1, 0x4e

    new-array v1, v1, [B

    .line 72
    .local v1, "datawords":[B
    goto :goto_4b

    .line 64
    .end local v1    # "datawords":[B
    :pswitch_36
    const/16 v3, 0x14

    const/16 v4, 0x54

    const/16 v5, 0x28

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    .line 65
    const/4 v6, 0x2

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    .line 66
    const/16 v1, 0x5e

    new-array v1, v1, [B

    .line 67
    .restart local v1    # "datawords":[B
    nop

    .line 74
    :goto_4b
    nop

    .line 77
    const/16 v2, 0xa

    invoke-static {v7, v8, v1, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    const/16 v3, 0x14

    array-length v4, v1

    sub-int/2addr v4, v2

    invoke-static {v7, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    invoke-static {v1, v9}, Lcom/google/zxing/maxicode/decoder/DecodedBitStreamParser;->decode([BI)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    nop

    :pswitch_data_5e
    .packed-switch 0x2
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_21
    .end packed-switch
.end method
