.class public final Lcom/google/zxing/oned/Code128Writer;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "Code128Writer.java"


# static fields
.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_FNC_1:I = 0x66

.field private static final CODE_FNC_2:I = 0x61

.field private static final CODE_FNC_3:I = 0x60

.field private static final CODE_FNC_4_B:I = 0x64

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a

.field private static final ESCAPE_FNC_1:C = '\u00f1'

.field private static final ESCAPE_FNC_2:C = '\u00f2'

.field private static final ESCAPE_FNC_3:C = '\u00f3'

.field private static final ESCAPE_FNC_4:C = '\u00f4'


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method

.method private static isDigits(Ljava/lang/CharSequence;II)Z
    .locals 6
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I
    .param p2, "length"    # I

    .line 186
    add-int v0, p1, p2

    .line 187
    .local v0, "end":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 188
    .local v1, "last":I
    move v2, p1

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x0

    if-ge v2, v0, :cond_4

    if-lt v2, v1, :cond_0

    .end local v2    # "i":I
    goto :goto_1

    .line 189
    .restart local v2    # "i":I
    :cond_0
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 190
    .local v4, "c":C
    const/16 v5, 0x30

    if-lt v4, v5, :cond_1

    const/16 v5, 0x39

    if-le v4, v5, :cond_3

    .line 191
    :cond_1
    const/16 v5, 0xf1

    if-eq v4, v5, :cond_2

    .line 192
    return v3

    .line 194
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 188
    .end local v4    # "c":C
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 197
    .end local v2    # "i":I
    :cond_4
    :goto_1
    if-gt v0, v1, :cond_5

    const/4 v2, 0x1

    return v2

    :cond_5
    return v3
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .locals 3
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 58
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_0

    .line 61
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0

    .line 59
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode CODE_128, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)[Z
    .locals 13
    .param p1, "contents"    # Ljava/lang/String;

    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 68
    .local v0, "length":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_e

    const/16 v2, 0x50

    if-gt v0, v2, :cond_e

    .line 73
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x20

    if-lt v2, v0, :cond_b

    .line 88
    .end local v2    # "i":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v2

    .line 89
    .local v4, "patterns":Ljava/util/Collection;, "Ljava/util/Collection<[I>;"
    const/4 v2, 0x0

    .line 90
    .local v2, "checkSum":I
    const/4 v5, 0x1

    .line 91
    .local v5, "checkWeight":I
    const/4 v6, 0x0

    .line 92
    .local v6, "codeSet":I
    const/4 v7, 0x0

    .line 94
    .local v7, "position":I
    :cond_0
    :goto_1
    if-lt v7, v0, :cond_4

    .line 161
    rem-int/lit8 v8, v2, 0x67

    .line 162
    .end local v2    # "checkSum":I
    .local v8, "checkSum":I
    sget-object v2, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v2, v2, v8

    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 165
    sget-object v2, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    const/16 v3, 0x6a

    aget-object v2, v2, v3

    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 168
    const/4 v2, 0x0

    .line 169
    .local v2, "codeWidth":I
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 176
    new-array v3, v2, [Z

    .line 177
    .local v3, "result":[Z
    const/4 v9, 0x0

    .line 178
    .local v9, "pos":I
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_1

    .line 182
    return-object v3

    .line 178
    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [I

    .line 179
    .local v11, "pattern":[I
    invoke-static {v3, v9, v11, v1}, Lcom/google/zxing/oned/Code128Writer;->appendPattern([ZI[IZ)I

    move-result v12

    add-int/2addr v9, v12

    .end local v11    # "pattern":[I
    goto :goto_3

    .line 169
    .end local v3    # "result":[Z
    .end local v9    # "pos":I
    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, [I

    .line 170
    .local v10, "pattern":[I
    array-length v11, v10

    const/4 v3, 0x0

    :goto_4
    if-lt v3, v11, :cond_3

    .end local v10    # "pattern":[I
    goto :goto_2

    .restart local v10    # "pattern":[I
    :cond_3
    aget v12, v10, v3

    .line 171
    .local v12, "width":I
    add-int/2addr v2, v12

    .line 170
    .end local v12    # "width":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 96
    .end local v8    # "checkSum":I
    .end local v10    # "pattern":[I
    .local v2, "checkSum":I
    :cond_4
    const/16 v8, 0x63

    if-ne v6, v8, :cond_5

    const/4 v8, 0x2

    goto :goto_5

    :cond_5
    const/4 v8, 0x4

    .line 98
    .local v8, "requiredDigitCount":I
    :goto_5
    invoke-static {p1, v7, v8}, Lcom/google/zxing/oned/Code128Writer;->isDigits(Ljava/lang/CharSequence;II)Z

    move-result v9

    const/16 v10, 0x64

    if-eqz v9, :cond_6

    .line 99
    const/16 v9, 0x63

    .line 100
    .local v9, "newCodeSet":I
    goto :goto_6

    .line 101
    .end local v9    # "newCodeSet":I
    :cond_6
    move v9, v10

    .line 106
    .restart local v9    # "newCodeSet":I
    :goto_6
    if-ne v9, v6, :cond_8

    .line 109
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    packed-switch v11, :pswitch_data_0

    .line 124
    if-ne v6, v10, :cond_7

    .line 125
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v10

    sub-int/2addr v10, v3

    .line 126
    .local v10, "patternIndex":I
    goto :goto_7

    .line 120
    .end local v10    # "patternIndex":I
    :pswitch_0
    const/16 v10, 0x64

    .line 121
    .restart local v10    # "patternIndex":I
    goto :goto_7

    .line 117
    .end local v10    # "patternIndex":I
    :pswitch_1
    const/16 v10, 0x60

    .line 118
    .restart local v10    # "patternIndex":I
    goto :goto_7

    .line 114
    .end local v10    # "patternIndex":I
    :pswitch_2
    const/16 v10, 0x61

    .line 115
    .restart local v10    # "patternIndex":I
    goto :goto_7

    .line 111
    .end local v10    # "patternIndex":I
    :pswitch_3
    const/16 v10, 0x66

    .line 112
    .restart local v10    # "patternIndex":I
    goto :goto_7

    .line 127
    .end local v10    # "patternIndex":I
    :cond_7
    add-int/lit8 v10, v7, 0x2

    invoke-virtual {p1, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 128
    .restart local v10    # "patternIndex":I
    add-int/lit8 v7, v7, 0x1

    .line 131
    :goto_7
    add-int/2addr v7, v1

    .line 132
    goto :goto_9

    .line 135
    .end local v10    # "patternIndex":I
    :cond_8
    if-nez v6, :cond_a

    .line 137
    if-ne v9, v10, :cond_9

    .line 138
    const/16 v10, 0x68

    .line 139
    .restart local v10    # "patternIndex":I
    goto :goto_8

    .line 141
    .end local v10    # "patternIndex":I
    :cond_9
    const/16 v10, 0x69

    .line 143
    .restart local v10    # "patternIndex":I
    goto :goto_8

    .line 145
    .end local v10    # "patternIndex":I
    :cond_a
    move v10, v9

    .line 147
    .restart local v10    # "patternIndex":I
    :goto_8
    move v6, v9

    .line 151
    :goto_9
    sget-object v11, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v11, v11, v10

    invoke-interface {v4, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 154
    mul-int v11, v10, v5

    add-int/2addr v2, v11

    .line 155
    if-eqz v7, :cond_0

    .line 156
    add-int/lit8 v5, v5, 0x1

    .end local v8    # "requiredDigitCount":I
    .end local v9    # "newCodeSet":I
    .end local v10    # "patternIndex":I
    goto/16 :goto_1

    .line 74
    .end local v4    # "patterns":Ljava/util/Collection;, "Ljava/util/Collection<[I>;"
    .end local v5    # "checkWeight":I
    .end local v6    # "codeSet":I
    .end local v7    # "position":I
    .local v2, "i":I
    :cond_b
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 75
    .local v4, "c":C
    if-lt v4, v3, :cond_c

    const/16 v3, 0x7e

    if-le v4, v3, :cond_d

    .line 76
    :cond_c
    packed-switch v4, :pswitch_data_1

    .line 83
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Bad character in input: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 81
    :pswitch_4
    nop

    .line 73
    .end local v4    # "c":C
    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 69
    .end local v2    # "i":I
    :cond_e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Contents length should be between 1 and 80 characters, but got "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0xf1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xf1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
