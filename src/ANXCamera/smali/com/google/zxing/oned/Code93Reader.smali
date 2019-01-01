.class public final Lcom/google/zxing/oned/Code93Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code93Reader.java"


# static fields
.field private static final ALPHABET:[C

.field private static final ALPHABET_STRING:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

.field private static final ASTERISK_ENCODING:I

.field private static final CHARACTER_ENCODINGS:[I


# instance fields
.field private final counters:[I

.field private final decodeRowResult:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 41
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    .line 47
    const/16 v0, 0x30

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 48
    nop

    .line 49
    nop

    .line 50
    nop

    .line 51
    nop

    .line 52
    nop

    .line 53
    nop

    .line 47
    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    .line 55
    sget-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    const/16 v1, 0x2f

    aget v0, v0, v1

    sput v0, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    return-void

    :array_0
    .array-data 4
        0x114
        0x148
        0x144
        0x142
        0x128
        0x124
        0x122
        0x150
        0x112
        0x10a
        0x1a8
        0x1a4
        0x1a2
        0x194
        0x192
        0x18a
        0x168
        0x164
        0x162
        0x134
        0x11a
        0x158
        0x14c
        0x146
        0x12c
        0x116
        0x1b4
        0x1b2
        0x1ac
        0x1a6
        0x196
        0x19a
        0x16c
        0x166
        0x136
        0x13a
        0x12e
        0x1d4
        0x1d2
        0x1ca
        0x16e
        0x176
        0x1ae
        0x126
        0x1da
        0x1d6
        0x132
        0x15e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 60
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/Code93Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    .line 62
    const/4 v0, 0x6

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    .line 63
    return-void
.end method

.method private static checkChecksums(Ljava/lang/CharSequence;)V
    .locals 3
    .param p0, "result"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 257
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 258
    .local v0, "length":I
    add-int/lit8 v1, v0, -0x2

    const/16 v2, 0x14

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    .line 259
    add-int/lit8 v1, v0, -0x1

    const/16 v2, 0xf

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    .line 260
    return-void
.end method

.method private static checkOneChecksum(Ljava/lang/CharSequence;II)V
    .locals 5
    .param p0, "result"    # Ljava/lang/CharSequence;
    .param p1, "checkPosition"    # I
    .param p2, "weightMax"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 264
    const/4 v0, 0x1

    .line 265
    .local v0, "weight":I
    const/4 v1, 0x0

    .line 266
    .local v1, "total":I
    add-int/lit8 v2, p1, -0x1

    .local v2, "i":I
    :goto_0
    if-gez v2, :cond_1

    .line 272
    .end local v2    # "i":I
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    sget-object v3, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    rem-int/lit8 v4, v1, 0x2f

    aget-char v3, v3, v4

    if-ne v2, v3, :cond_0

    .line 275
    return-void

    .line 273
    :cond_0
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v2

    throw v2

    .line 267
    .restart local v2    # "i":I
    :cond_1
    const-string v3, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    mul-int/2addr v3, v0

    add-int/2addr v1, v3

    .line 268
    add-int/lit8 v0, v0, 0x1

    if-le v0, p2, :cond_2

    .line 269
    const/4 v0, 0x1

    .line 266
    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method private static decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 8
    .param p0, "encoded"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 198
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 199
    .local v0, "length":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 200
    .local v1, "decoded":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 253
    .end local v2    # "i":I
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 201
    .restart local v2    # "i":I
    :cond_0
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 202
    .local v3, "c":C
    const/16 v4, 0x61

    if-lt v3, v4, :cond_8

    const/16 v4, 0x64

    if-gt v3, v4, :cond_8

    .line 203
    add-int/lit8 v4, v0, -0x1

    if-ge v2, v4, :cond_7

    .line 206
    add-int/lit8 v4, v2, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 207
    .local v4, "next":C
    const/4 v5, 0x0

    .line 208
    .local v5, "decodedChar":C
    const/16 v6, 0x5a

    const/16 v7, 0x41

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 211
    :pswitch_0
    if-lt v4, v7, :cond_1

    if-gt v4, v6, :cond_1

    .line 212
    add-int/lit8 v6, v4, 0x20

    int-to-char v5, v6

    .line 213
    goto :goto_1

    .line 214
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 237
    :pswitch_1
    if-lt v4, v7, :cond_2

    const/16 v7, 0x4f

    if-gt v4, v7, :cond_2

    .line 238
    add-int/lit8 v6, v4, -0x20

    int-to-char v5, v6

    .line 239
    goto :goto_1

    :cond_2
    if-ne v4, v6, :cond_3

    .line 240
    const/16 v5, 0x3a

    .line 241
    goto :goto_1

    .line 242
    :cond_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 227
    :pswitch_2
    if-lt v4, v7, :cond_4

    const/16 v6, 0x45

    if-gt v4, v6, :cond_4

    .line 228
    add-int/lit8 v6, v4, -0x26

    int-to-char v5, v6

    .line 229
    goto :goto_1

    :cond_4
    const/16 v6, 0x46

    if-lt v4, v6, :cond_5

    const/16 v6, 0x57

    if-gt v4, v6, :cond_5

    .line 230
    add-int/lit8 v6, v4, -0xb

    int-to-char v5, v6

    .line 231
    goto :goto_1

    .line 232
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 219
    :pswitch_3
    if-lt v4, v7, :cond_6

    if-gt v4, v6, :cond_6

    .line 220
    add-int/lit8 v6, v4, -0x40

    int-to-char v5, v6

    .line 221
    goto :goto_1

    .line 222
    :cond_6
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 246
    :goto_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 248
    add-int/lit8 v2, v2, 0x1

    .line 249
    .end local v4    # "next":C
    .end local v5    # "decodedChar":C
    goto :goto_2

    .line 204
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    .line 250
    :cond_8
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    .end local v3    # "c":C
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x61
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I
    .locals 13
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 132
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    .line 133
    .local v0, "width":I
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v2

    .line 135
    .local v2, "rowOffset":I
    iget-object v3, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    invoke-static {v3, v1}, Ljava/util/Arrays;->fill([II)V

    .line 136
    iget-object v3, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    .line 137
    .local v3, "theCounters":[I
    move v4, v2

    .line 138
    .local v4, "patternStart":I
    const/4 v5, 0x0

    .line 139
    .local v5, "isWhite":Z
    array-length v6, v3

    .line 141
    .local v6, "patternLength":I
    const/4 v7, 0x0

    .line 142
    .local v7, "counterPosition":I
    move v8, v2

    .local v8, "i":I
    :goto_0
    if-ge v8, v0, :cond_4

    .line 143
    invoke-virtual {p1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v9

    xor-int/2addr v9, v5

    const/4 v10, 0x1

    if-eqz v9, :cond_0

    .line 144
    aget v9, v3, v7

    add-int/2addr v9, v10

    aput v9, v3, v7

    .line 145
    goto :goto_2

    .line 146
    :cond_0
    add-int/lit8 v9, v6, -0x1

    if-ne v7, v9, :cond_2

    .line 147
    invoke-static {v3}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v9

    sget v11, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    const/4 v12, 0x2

    if-ne v9, v11, :cond_1

    .line 148
    new-array v9, v12, [I

    aput v4, v9, v1

    aput v8, v9, v10

    return-object v9

    .line 150
    :cond_1
    aget v9, v3, v1

    aget v11, v3, v10

    add-int/2addr v9, v11

    add-int/2addr v4, v9

    .line 151
    add-int/lit8 v9, v6, -0x2

    invoke-static {v3, v12, v3, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    add-int/lit8 v9, v6, -0x2

    aput v1, v3, v9

    .line 153
    add-int/lit8 v9, v6, -0x1

    aput v1, v3, v9

    .line 154
    add-int/lit8 v7, v7, -0x1

    .line 155
    goto :goto_1

    .line 156
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 158
    :goto_1
    aput v10, v3, v7

    .line 159
    if-eqz v5, :cond_3

    move v10, v1

    nop

    :cond_3
    move v5, v10

    .line 142
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 162
    .end local v8    # "i":I
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private static patternToChar(I)C
    .locals 2
    .param p0, "pattern"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 190
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_0

    .line 191
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    aget-char v1, v1, v0

    return v1

    .line 189
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    .end local v0    # "i":I
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static toPattern([I)I
    .locals 8
    .param p0, "counters"    # [I

    .line 166
    array-length v0, p0

    .line 167
    .local v0, "max":I
    const/4 v1, 0x0

    .line 168
    .local v1, "sum":I
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v2, :cond_5

    .line 171
    const/4 v2, 0x0

    .line 172
    .local v2, "pattern":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-lt v3, v0, :cond_0

    .line 185
    .end local v3    # "i":I
    return v2

    .line 173
    .restart local v3    # "i":I
    :cond_0
    aget v4, p0, v3

    int-to-float v4, v4

    const/high16 v5, 0x41100000    # 9.0f

    mul-float/2addr v4, v5

    int-to-float v5, v1

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 174
    .local v4, "scaled":I
    const/4 v5, 0x1

    if-lt v4, v5, :cond_4

    const/4 v6, 0x4

    if-le v4, v6, :cond_1

    goto :goto_4

    .line 177
    :cond_1
    and-int/lit8 v6, v3, 0x1

    if-nez v6, :cond_3

    .line 178
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    if-lt v6, v4, :cond_2

    .line 181
    .end local v6    # "j":I
    goto :goto_3

    .line 179
    .restart local v6    # "j":I
    :cond_2
    shl-int/lit8 v7, v2, 0x1

    or-int/lit8 v2, v7, 0x1

    .line 178
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 182
    .end local v6    # "j":I
    :cond_3
    shl-int/2addr v2, v4

    .line 172
    .end local v4    # "scaled":I
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 175
    .restart local v4    # "scaled":I
    :cond_4
    :goto_4
    const/4 v5, -0x1

    return v5

    .line 168
    .end local v2    # "pattern":I
    .end local v3    # "i":I
    .end local v4    # "scaled":I
    :cond_5
    aget v4, p0, v3

    .line 169
    .local v4, "counter":I
    add-int/2addr v1, v4

    .line 168
    .end local v4    # "counter":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 18
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 69
    invoke-direct {v0, v2}, Lcom/google/zxing/oned/Code93Reader;->findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v3

    .line 71
    .local v3, "start":[I
    const/4 v4, 0x1

    aget v5, v3, v4

    invoke-virtual {v2, v5}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    .line 72
    .local v5, "nextStart":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    .line 74
    .local v6, "end":I
    iget-object v7, v0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    .line 75
    .local v7, "theCounters":[I
    const/4 v8, 0x0

    invoke-static {v7, v8}, Ljava/util/Arrays;->fill([II)V

    .line 76
    iget-object v9, v0, Lcom/google/zxing/oned/Code93Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    .line 77
    .local v9, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 82
    :goto_0
    invoke-static {v2, v5, v7}, Lcom/google/zxing/oned/Code93Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 83
    invoke-static {v7}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v10

    .line 84
    .local v10, "pattern":I
    if-ltz v10, :cond_5

    .line 87
    invoke-static {v10}, Lcom/google/zxing/oned/Code93Reader;->patternToChar(I)C

    move-result v11

    .line 88
    .local v11, "decodedChar":C
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    move v12, v5

    .line 90
    .local v12, "lastStart":I
    array-length v13, v7

    move v14, v5

    move v5, v8

    .end local v5    # "nextStart":I
    .local v14, "nextStart":I
    :goto_1
    if-lt v5, v13, :cond_4

    .line 94
    invoke-virtual {v2, v14}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    .line 95
    .end local v10    # "pattern":I
    .end local v14    # "nextStart":I
    .restart local v5    # "nextStart":I
    const/16 v10, 0x2a

    if-ne v11, v10, :cond_3

    .line 96
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 98
    const/4 v10, 0x0

    .line 99
    .local v10, "lastPatternSize":I
    array-length v13, v7

    move v14, v10

    move v10, v8

    .end local v10    # "lastPatternSize":I
    .local v14, "lastPatternSize":I
    :goto_2
    if-lt v10, v13, :cond_2

    .line 104
    if-eq v5, v6, :cond_1

    invoke-virtual {v2, v5}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 108
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    const/4 v13, 0x2

    if-lt v10, v13, :cond_0

    .line 113
    invoke-static {v9}, Lcom/google/zxing/oned/Code93Reader;->checkChecksums(Ljava/lang/CharSequence;)V

    .line 115
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 117
    invoke-static {v9}, Lcom/google/zxing/oned/Code93Reader;->decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 119
    .local v10, "resultString":Ljava/lang/String;
    aget v15, v3, v4

    aget v16, v3, v8

    add-int v15, v15, v16

    int-to-float v15, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    .line 120
    .local v15, "left":F
    int-to-float v4, v12

    int-to-float v8, v14

    div-float v8, v8, v16

    add-float/2addr v4, v8

    .line 121
    .local v4, "right":F
    new-instance v8, Lcom/google/zxing/Result;

    .line 122
    nop

    .line 123
    nop

    .line 124
    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    .line 125
    new-instance v0, Lcom/google/zxing/ResultPoint;

    int-to-float v2, v1

    invoke-direct {v0, v15, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x0

    aput-object v0, v13, v2

    .line 126
    new-instance v0, Lcom/google/zxing/ResultPoint;

    int-to-float v2, v1

    invoke-direct {v0, v4, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v0, v13, v16

    .line 127
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_93:Lcom/google/zxing/BarcodeFormat;

    .line 121
    const/4 v2, 0x0

    invoke-direct {v8, v10, v2, v13, v0}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v8

    .line 110
    .end local v4    # "right":F
    .end local v10    # "resultString":Ljava/lang/String;
    .end local v15    # "left":F
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 105
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 99
    :cond_2
    move/from16 v16, v4

    move v2, v8

    aget v0, v7, v10

    .line 100
    .local v0, "counter":I
    add-int/2addr v14, v0

    .line 99
    .end local v0    # "counter":I
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto :goto_2

    .line 82
    .end local v11    # "decodedChar":C
    .end local v12    # "lastStart":I
    .end local v14    # "lastPatternSize":I
    :cond_3
    move-object/from16 v2, p2

    goto/16 :goto_0

    .line 90
    .end local v5    # "nextStart":I
    .local v10, "pattern":I
    .restart local v11    # "decodedChar":C
    .restart local v12    # "lastStart":I
    .local v14, "nextStart":I
    :cond_4
    move/from16 v16, v4

    move v2, v8

    aget v0, v7, v5

    .line 91
    .restart local v0    # "counter":I
    add-int/2addr v14, v0

    .line 90
    .end local v0    # "counter":I
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto/16 :goto_1

    .line 85
    .end local v11    # "decodedChar":C
    .end local v12    # "lastStart":I
    .end local v14    # "nextStart":I
    .restart local v5    # "nextStart":I
    :cond_5
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
