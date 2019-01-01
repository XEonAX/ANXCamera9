.class public final Lcom/google/zxing/oned/UPCEReader;
.super Lcom/google/zxing/oned/UPCEANReader;
.source "UPCEReader.java"


# static fields
.field private static final MIDDLE_END_PATTERN:[I

.field private static final NUMSYS_AND_CHECK_DIGIT_PATTERNS:[[I


# instance fields
.field private final decodeMiddleCounters:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 37
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/oned/UPCEReader;->MIDDLE_END_PATTERN:[I

    .line 44
    const/4 v0, 0x2

    new-array v0, v0, [[I

    .line 45
    const/16 v1, 0xa

    new-array v2, v1, [I

    fill-array-data v2, :array_1

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 46
    new-array v1, v1, [I

    fill-array-data v1, :array_2

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 44
    sput-object v0, Lcom/google/zxing/oned/UPCEReader;->NUMSYS_AND_CHECK_DIGIT_PATTERNS:[[I

    .line 47
    return-void

    :array_0
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_1
    .array-data 4
        0x38
        0x34
        0x32
        0x31
        0x2c
        0x26
        0x23
        0x2a
        0x29
        0x25
    .end array-data

    :array_2
    .array-data 4
        0x7
        0xb
        0xd
        0xe
        0x13
        0x19
        0x1c
        0x15
        0x16
        0x1a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANReader;-><init>()V

    .line 52
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEReader;->decodeMiddleCounters:[I

    .line 53
    return-void
.end method

.method public static convertUPCEtoUPCA(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "upce"    # Ljava/lang/String;

    .line 121
    const/4 v0, 0x6

    new-array v0, v0, [C

    .line 122
    .local v0, "upceChars":[C
    const/4 v1, 0x7

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v3, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 123
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0xc

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 124
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 125
    const/4 v4, 0x5

    aget-char v5, v0, v4

    .line 126
    .local v5, "lastChar":C
    const/4 v6, 0x2

    const/4 v7, 0x3

    packed-switch v5, :pswitch_data_0

    .line 146
    invoke-virtual {v3, v0, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 147
    const-string v2, "0000"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 141
    :pswitch_0
    const/4 v4, 0x4

    invoke-virtual {v3, v0, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 142
    const-string v2, "00000"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    aget-char v2, v0, v4

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    goto :goto_0

    .line 136
    :pswitch_1
    invoke-virtual {v3, v0, v2, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 137
    const-string v2, "00000"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v3, v0, v7, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 139
    goto :goto_0

    .line 130
    :pswitch_2
    invoke-virtual {v3, v0, v2, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    const-string v2, "0000"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {v3, v0, v6, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 134
    nop

    .line 151
    :goto_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 152
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static determineNumSysAndCheckDigit(Ljava/lang/StringBuilder;I)V
    .locals 5
    .param p0, "resultString"    # Ljava/lang/StringBuilder;
    .param p1, "lgPatternFound"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 97
    const/4 v0, 0x0

    .local v0, "numSys":I
    :goto_0
    const/4 v1, 0x1

    if-gt v0, v1, :cond_2

    .line 98
    const/4 v1, 0x0

    .local v1, "d":I
    :goto_1
    const/16 v2, 0xa

    if-lt v1, v2, :cond_0

    .line 97
    .end local v1    # "d":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 99
    .restart local v1    # "d":I
    :cond_0
    sget-object v2, Lcom/google/zxing/oned/UPCEReader;->NUMSYS_AND_CHECK_DIGIT_PATTERNS:[[I

    aget-object v2, v2, v0

    aget v2, v2, v1

    if-ne p1, v2, :cond_1

    .line 100
    const/4 v2, 0x0

    const/16 v3, 0x30

    add-int v4, v3, v0

    int-to-char v4, v4

    invoke-virtual {p0, v2, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 101
    add-int/2addr v3, v1

    int-to-char v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    return-void

    .line 98
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 106
    .end local v0    # "numSys":I
    .end local v1    # "d":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method protected checkChecksum(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 91
    invoke-static {p1}, Lcom/google/zxing/oned/UPCEReader;->convertUPCEtoUPCA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/google/zxing/oned/UPCEANReader;->checkChecksum(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected decodeEnd(Lcom/google/zxing/common/BitArray;I)[I
    .locals 2
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "endStart"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 86
    sget-object v0, Lcom/google/zxing/oned/UPCEReader;->MIDDLE_END_PATTERN:[I

    const/4 v1, 0x1

    invoke-static {p1, p2, v1, v0}, Lcom/google/zxing/oned/UPCEReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v0

    return-object v0
.end method

.method protected decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .locals 11
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "startRange"    # [I
    .param p3, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/google/zxing/oned/UPCEReader;->decodeMiddleCounters:[I

    .line 59
    .local v0, "counters":[I
    const/4 v1, 0x0

    aput v1, v0, v1

    .line 60
    const/4 v2, 0x1

    aput v1, v0, v2

    .line 61
    const/4 v3, 0x2

    aput v1, v0, v3

    .line 62
    const/4 v3, 0x3

    aput v1, v0, v3

    .line 63
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    .line 64
    .local v3, "end":I
    aget v4, p2, v2

    .line 66
    .local v4, "rowOffset":I
    const/4 v5, 0x0

    .line 68
    .local v5, "lgPatternFound":I
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_0
    const/4 v7, 0x6

    if-ge v6, v7, :cond_3

    if-lt v4, v3, :cond_0

    .end local v6    # "x":I
    goto :goto_2

    .line 69
    .restart local v6    # "x":I
    :cond_0
    sget-object v7, Lcom/google/zxing/oned/UPCEReader;->L_AND_G_PATTERNS:[[I

    invoke-static {p1, v0, v4, v7}, Lcom/google/zxing/oned/UPCEReader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v7

    .line 70
    .local v7, "bestMatch":I
    const/16 v8, 0x30

    rem-int/lit8 v9, v7, 0xa

    add-int/2addr v8, v9

    int-to-char v8, v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    array-length v8, v0

    move v9, v4

    move v4, v1

    .end local v4    # "rowOffset":I
    .local v9, "rowOffset":I
    :goto_1
    if-lt v4, v8, :cond_2

    .line 74
    const/16 v4, 0xa

    if-lt v7, v4, :cond_1

    .line 75
    rsub-int/lit8 v4, v6, 0x5

    shl-int v4, v2, v4

    or-int/2addr v4, v5

    .line 68
    .end local v5    # "lgPatternFound":I
    .end local v7    # "bestMatch":I
    .local v4, "lgPatternFound":I
    move v5, v4

    .end local v4    # "lgPatternFound":I
    .restart local v5    # "lgPatternFound":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    move v4, v9

    goto :goto_0

    .line 71
    .restart local v7    # "bestMatch":I
    :cond_2
    aget v10, v0, v4

    .line 72
    .local v10, "counter":I
    add-int/2addr v9, v10

    .line 71
    .end local v10    # "counter":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 79
    .end local v6    # "x":I
    .end local v7    # "bestMatch":I
    .end local v9    # "rowOffset":I
    .local v4, "rowOffset":I
    :cond_3
    :goto_2
    invoke-static {p3, v5}, Lcom/google/zxing/oned/UPCEReader;->determineNumSysAndCheckDigit(Ljava/lang/StringBuilder;I)V

    .line 81
    return v4
.end method

.method getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .locals 1

    .line 111
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->UPC_E:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method
