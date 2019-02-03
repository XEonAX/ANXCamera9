.class final Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;
.super Ljava/lang/Object;
.source "EdifactEncoder.java"

# interfaces
.implements Lcom/google/zxing/datamatrix/encoder/Encoder;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encodeChar(CLjava/lang/StringBuilder;)V
    .registers 3
    .param p0, "c"    # C
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .line 103
    const/16 v0, 0x20

    if-lt p0, v0, :cond_c

    const/16 v0, 0x3f

    if-gt p0, v0, :cond_c

    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    goto :goto_1e

    :cond_c
    const/16 v0, 0x40

    if-lt p0, v0, :cond_1b

    const/16 v0, 0x5e

    if-gt p0, v0, :cond_1b

    .line 106
    add-int/lit8 v0, p0, -0x40

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    goto :goto_1e

    .line 108
    :cond_1b
    invoke-static {p0}, Lcom/google/zxing/datamatrix/encoder/HighLevelEncoder;->illegalCharacter(C)V

    .line 110
    :goto_1e
    return-void
.end method

.method private static encodeToCodewords(Ljava/lang/CharSequence;I)Ljava/lang/String;
    .registers 14
    .param p0, "sb"    # Ljava/lang/CharSequence;
    .param p1, "startPos"    # I

    .line 113
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, p1

    .line 114
    .local v0, "len":I
    if-eqz v0, :cond_59

    .line 117
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 118
    .local v1, "c1":C
    const/4 v2, 0x0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_16

    add-int/lit8 v4, p1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    goto :goto_17

    :cond_16
    move v4, v2

    .line 119
    .local v4, "c2":C
    :goto_17
    const/4 v5, 0x3

    if-lt v0, v5, :cond_21

    add-int/lit8 v6, p1, 0x2

    invoke-interface {p0, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    goto :goto_22

    :cond_21
    move v6, v2

    .line 120
    .local v6, "c3":C
    :goto_22
    const/4 v7, 0x4

    if-lt v0, v7, :cond_2c

    add-int/lit8 v2, p1, 0x3

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    nop

    .line 122
    .local v2, "c4":C
    :cond_2c
    shl-int/lit8 v7, v1, 0x12

    shl-int/lit8 v8, v4, 0xc

    add-int/2addr v7, v8

    shl-int/lit8 v8, v6, 0x6

    add-int/2addr v7, v8

    add-int/2addr v7, v2

    .line 123
    .local v7, "v":I
    shr-int/lit8 v8, v7, 0x10

    and-int/lit16 v8, v8, 0xff

    int-to-char v8, v8

    .line 124
    .local v8, "cw1":C
    shr-int/lit8 v9, v7, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-char v9, v9

    .line 125
    .local v9, "cw2":C
    and-int/lit16 v10, v7, 0xff

    int-to-char v10, v10

    .line 126
    .local v10, "cw3":C
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 127
    .local v11, "res":Ljava/lang/StringBuilder;
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    if-lt v0, v3, :cond_4f

    .line 129
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    :cond_4f
    if-lt v0, v5, :cond_54

    .line 132
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 134
    :cond_54
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 115
    .end local v1    # "c1":C
    .end local v2    # "c4":C
    .end local v4    # "c2":C
    .end local v6    # "c3":C
    .end local v7    # "v":I
    .end local v8    # "cw1":C
    .end local v9    # "cw2":C
    .end local v10    # "cw3":C
    .end local v11    # "res":Ljava/lang/StringBuilder;
    :cond_59
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "StringBuilder must not be empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static handleEOD(Lcom/google/zxing/datamatrix/encoder/EncoderContext;Ljava/lang/CharSequence;)V
    .registers 11
    .param p0, "context"    # Lcom/google/zxing/datamatrix/encoder/EncoderContext;
    .param p1, "buffer"    # Ljava/lang/CharSequence;

    .line 59
    const/4 v0, 0x0

    :try_start_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_81

    .line 60
    .local v1, "count":I
    if-nez v1, :cond_b

    .line 98
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    .line 61
    return-void

    .line 63
    :cond_b
    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2b

    .line 65
    :try_start_f
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->updateSymbolInfo()V

    .line 66
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getSymbolInfo()Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v4

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v5

    sub-int/2addr v4, v5

    .line 67
    .local v4, "available":I
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getRemainingCharacters()I

    move-result v5
    :try_end_23
    .catchall {:try_start_f .. :try_end_23} :catchall_81

    .line 68
    .local v5, "remaining":I
    if-nez v5, :cond_2b

    if-gt v4, v2, :cond_2b

    .line 98
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    .line 69
    return-void

    .line 73
    .end local v4    # "available":I
    .end local v5    # "remaining":I
    :cond_2b
    const/4 v4, 0x4

    if-gt v1, v4, :cond_79

    .line 76
    add-int/lit8 v4, v1, -0x1

    .line 77
    .local v4, "restChars":I
    :try_start_30
    invoke-static {p1, v0}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->encodeToCodewords(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "encoded":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->hasMoreCharacters()Z

    move-result v6

    xor-int/2addr v6, v3

    .line 79
    .local v6, "endOfSymbolReached":Z
    if-eqz v6, :cond_3e

    if-gt v4, v2, :cond_3e

    goto :goto_3f

    :cond_3e
    move v3, v0

    .line 81
    .local v3, "restInAscii":Z
    :goto_3f
    if-gt v4, v2, :cond_66

    .line 82
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v2

    add-int/2addr v2, v4

    invoke-virtual {p0, v2}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->updateSymbolInfo(I)V

    .line 83
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getSymbolInfo()Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v7

    sub-int/2addr v2, v7

    .line 84
    .local v2, "available":I
    const/4 v7, 0x3

    if-lt v2, v7, :cond_66

    .line 85
    const/4 v3, 0x0

    .line 86
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v7

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0, v7}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->updateSymbolInfo(I)V

    .line 91
    .end local v2    # "available":I
    :cond_66
    if-eqz v3, :cond_71

    .line 92
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->resetSymbolInfo()V

    .line 93
    iget v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    sub-int/2addr v2, v4

    iput v2, p0, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    .line 94
    goto :goto_75

    .line 95
    :cond_71
    invoke-virtual {p0, v5}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->writeCodewords(Ljava/lang/String;)V
    :try_end_74
    .catchall {:try_start_30 .. :try_end_74} :catchall_81

    .line 97
    .end local v1    # "count":I
    .end local v3    # "restInAscii":Z
    .end local v4    # "restChars":I
    .end local v5    # "encoded":Ljava/lang/String;
    .end local v6    # "endOfSymbolReached":Z
    nop

    .line 98
    :goto_75
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    .line 100
    return-void

    .line 74
    .restart local v1    # "count":I
    :cond_79
    :try_start_79
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Count must not exceed 4"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_81
    .catchall {:try_start_79 .. :try_end_81} :catchall_81

    .line 97
    .end local v1    # "count":I
    :catchall_81
    move-exception v1

    .line 98
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    .line 99
    throw v1
.end method


# virtual methods
.method public encode(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V
    .registers 9
    .param p1, "context"    # Lcom/google/zxing/datamatrix/encoder/EncoderContext;

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .local v0, "buffer":Ljava/lang/StringBuilder;
    :cond_5
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->hasMoreCharacters()Z

    move-result v1

    if-nez v1, :cond_c

    goto :goto_43

    .line 31
    :cond_c
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCurrentChar()C

    move-result v1

    .line 32
    .local v1, "c":C
    invoke-static {v1, v0}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->encodeChar(CLjava/lang/StringBuilder;)V

    .line 33
    iget v2, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 36
    .local v2, "count":I
    const/4 v3, 0x4

    if-lt v2, v3, :cond_5

    .line 37
    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->encodeToCodewords(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->writeCodewords(Ljava/lang/String;)V

    .line 38
    invoke-virtual {v0, v4, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 40
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget v5, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->getEncodingMode()I

    move-result v6

    invoke-static {v3, v5, v6}, Lcom/google/zxing/datamatrix/encoder/HighLevelEncoder;->lookAheadTest(Ljava/lang/CharSequence;II)I

    move-result v3

    .line 41
    .local v3, "newMode":I
    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->getEncodingMode()I

    move-result v5

    if-eq v3, v5, :cond_5

    .line 42
    invoke-virtual {p1, v4}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    .line 43
    nop

    .line 47
    .end local v1    # "c":C
    .end local v2    # "count":I
    .end local v3    # "newMode":I
    :goto_43
    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    invoke-static {p1, v0}, Lcom/google/zxing/datamatrix/encoder/EdifactEncoder;->handleEOD(Lcom/google/zxing/datamatrix/encoder/EncoderContext;Ljava/lang/CharSequence;)V

    .line 49
    return-void
.end method

.method public getEncodingMode()I
    .registers 2

    .line 23
    const/4 v0, 0x4

    return v0
.end method
