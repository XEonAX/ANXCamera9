.class final Lcom/google/zxing/datamatrix/encoder/TextEncoder;
.super Lcom/google/zxing/datamatrix/encoder/C40Encoder;
.source "TextEncoder.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Lcom/google/zxing/datamatrix/encoder/C40Encoder;-><init>()V

    return-void
.end method


# virtual methods
.method encodeChar(CLjava/lang/StringBuilder;)I
    .registers 6
    .param p1, "c"    # C
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .line 28
    const/4 v0, 0x1

    const/16 v1, 0x20

    if-ne p1, v1, :cond_a

    .line 29
    const/4 v1, 0x3

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    return v0

    .line 32
    :cond_a
    const/16 v1, 0x30

    if-lt p1, v1, :cond_1b

    const/16 v1, 0x39

    if-gt p1, v1, :cond_1b

    .line 33
    add-int/lit8 v1, p1, -0x30

    add-int/lit8 v1, v1, 0x4

    int-to-char v1, v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    return v0

    .line 36
    :cond_1b
    const/16 v1, 0x61

    if-lt p1, v1, :cond_2c

    const/16 v1, 0x7a

    if-gt p1, v1, :cond_2c

    .line 37
    add-int/lit8 v1, p1, -0x61

    add-int/lit8 v1, v1, 0xe

    int-to-char v1, v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    return v0

    .line 40
    :cond_2c
    const/4 v1, 0x2

    if-ltz p1, :cond_3b

    const/16 v2, 0x1f

    if-gt p1, v2, :cond_3b

    .line 41
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 43
    return v1

    .line 45
    :cond_3b
    const/16 v2, 0x21

    if-lt p1, v2, :cond_4d

    const/16 v2, 0x2f

    if-gt p1, v2, :cond_4d

    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    add-int/lit8 v0, p1, -0x21

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    return v1

    .line 50
    :cond_4d
    const/16 v2, 0x3a

    if-lt p1, v2, :cond_61

    const/16 v2, 0x40

    if-gt p1, v2, :cond_61

    .line 51
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    add-int/lit8 v0, p1, -0x3a

    add-int/lit8 v0, v0, 0xf

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    return v1

    .line 55
    :cond_61
    const/16 v2, 0x5b

    if-lt p1, v2, :cond_75

    const/16 v2, 0x5f

    if-gt p1, v2, :cond_75

    .line 56
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    add-int/lit8 v0, p1, -0x5b

    add-int/lit8 v0, v0, 0x16

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    return v1

    .line 60
    :cond_75
    const/16 v2, 0x60

    if-ne p1, v2, :cond_83

    .line 61
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    add-int/lit8 v0, p1, -0x60

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    return v1

    .line 65
    :cond_83
    const/16 v2, 0x41

    if-lt p1, v2, :cond_96

    const/16 v2, 0x5a

    if-gt p1, v2, :cond_96

    .line 66
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    add-int/lit8 v2, p1, -0x41

    add-int/2addr v2, v0

    int-to-char v0, v2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    return v1

    .line 70
    :cond_96
    const/16 v0, 0x7b

    if-lt p1, v0, :cond_aa

    const/16 v0, 0x7f

    if-gt p1, v0, :cond_aa

    .line 71
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 72
    add-int/lit8 v0, p1, -0x7b

    add-int/lit8 v0, v0, 0x1b

    int-to-char v0, v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    return v1

    .line 75
    :cond_aa
    const/16 v0, 0x80

    if-lt p1, v0, :cond_bd

    .line 76
    const-string v0, "\u0001\u001e"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    const/4 v0, 0x2

    .line 78
    .local v0, "len":I
    add-int/lit8 v1, p1, -0x80

    int-to-char v1, v1

    invoke-virtual {p0, v1, p2}, Lcom/google/zxing/datamatrix/encoder/TextEncoder;->encodeChar(CLjava/lang/StringBuilder;)I

    move-result v1

    add-int/2addr v0, v1

    .line 79
    return v0

    .line 81
    .end local v0    # "len":I
    :cond_bd
    invoke-static {p1}, Lcom/google/zxing/datamatrix/encoder/HighLevelEncoder;->illegalCharacter(C)V

    .line 82
    const/4 v0, -0x1

    return v0
.end method

.method public getEncodingMode()I
    .registers 2

    .line 23
    const/4 v0, 0x2

    return v0
.end method
