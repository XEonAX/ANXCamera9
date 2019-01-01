.class public final Lcom/google/zxing/common/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final ASSUME_SHIFT_JIS:Z

.field private static final EUC_JP:Ljava/lang/String; = "EUC_JP"

.field public static final GB2312:Ljava/lang/String; = "GB2312"

.field private static final ISO88591:Ljava/lang/String; = "ISO8859_1"

.field private static final PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

.field public static final SHIFT_JIS:Ljava/lang/String; = "SJIS"

.field private static final UTF8:Ljava/lang/String; = "UTF8"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 32
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    .line 39
    const-string v0, "SJIS"

    sget-object v1, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    const-string v0, "EUC_JP"

    sget-object v1, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 38
    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/zxing/common/StringUtils;->ASSUME_SHIFT_JIS:Z

    .line 40
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static guessEncoding([BLjava/util/Map;)Ljava/lang/String;
    .locals 22
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v0, p0

    .line 52
    move-object/from16 v1, p1

    if-eqz v1, :cond_0

    .line 53
    sget-object v2, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 54
    .local v2, "characterSet":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 55
    return-object v2

    .line 60
    .end local v2    # "characterSet":Ljava/lang/String;
    :cond_0
    array-length v2, v0

    .line 61
    .local v2, "length":I
    const/4 v3, 0x1

    .line 62
    .local v3, "canBeISO88591":Z
    const/4 v4, 0x1

    .line 63
    .local v4, "canBeShiftJIS":Z
    const/4 v5, 0x1

    .line 64
    .local v5, "canBeUTF8":Z
    const/4 v6, 0x0

    .line 66
    .local v6, "utf8BytesLeft":I
    const/4 v7, 0x0

    .line 67
    .local v7, "utf2BytesChars":I
    const/4 v8, 0x0

    .line 68
    .local v8, "utf3BytesChars":I
    const/4 v9, 0x0

    .line 69
    .local v9, "utf4BytesChars":I
    const/4 v10, 0x0

    .line 71
    .local v10, "sjisBytesLeft":I
    const/4 v11, 0x0

    .line 73
    .local v11, "sjisKatakanaChars":I
    const/4 v12, 0x0

    .line 74
    .local v12, "sjisCurKatakanaWordLength":I
    const/4 v13, 0x0

    .line 75
    .local v13, "sjisCurDoubleBytesWordLength":I
    const/4 v14, 0x0

    .line 76
    .local v14, "sjisMaxKatakanaWordLength":I
    const/4 v15, 0x0

    .line 79
    .local v15, "sjisMaxDoubleBytesWordLength":I
    const/16 v16, 0x0

    .line 81
    .local v16, "isoHighOther":I
    array-length v1, v0

    const/16 v17, 0x0

    move/from16 v18, v3

    .end local v3    # "canBeISO88591":Z
    .local v18, "canBeISO88591":Z
    const/4 v3, 0x3

    const/16 v19, 0x1

    if-le v1, v3, :cond_1

    .line 82
    aget-byte v1, v0, v17

    const/16 v3, -0x11

    if-ne v1, v3, :cond_1

    .line 83
    aget-byte v1, v0, v19

    const/16 v3, -0x45

    if-ne v1, v3, :cond_1

    .line 84
    const/4 v1, 0x2

    aget-byte v3, v0, v1

    const/16 v1, -0x41

    if-ne v3, v1, :cond_1

    .line 81
    move/from16 v17, v19

    nop

    :cond_1
    move/from16 v1, v17

    .line 86
    .local v1, "utf8bom":Z
    const/4 v3, 0x0

    .line 87
    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_17

    if-nez v18, :cond_2

    if-nez v4, :cond_2

    if-nez v5, :cond_2

    .line 174
    .end local v3    # "i":I
    move/from16 v20, v2

    goto/16 :goto_8

    .line 90
    .restart local v3    # "i":I
    :cond_2
    move/from16 v20, v2

    aget-byte v2, v0, v3

    .end local v2    # "length":I
    .local v20, "length":I
    and-int/lit16 v2, v2, 0xff

    .line 93
    .local v2, "value":I
    if-eqz v5, :cond_9

    .line 94
    if-lez v6, :cond_4

    .line 95
    and-int/lit16 v0, v2, 0x80

    if-nez v0, :cond_3

    .line 96
    const/4 v0, 0x0

    .line 97
    .end local v5    # "canBeUTF8":Z
    .local v0, "canBeUTF8":Z
    nop

    .line 127
    .end local v0    # "canBeUTF8":Z
    .restart local v5    # "canBeUTF8":Z
    :goto_1
    move v5, v0

    goto :goto_2

    .line 98
    :cond_3
    add-int/lit8 v6, v6, -0x1

    .line 100
    goto :goto_2

    :cond_4
    and-int/lit16 v0, v2, 0x80

    if-eqz v0, :cond_9

    .line 101
    and-int/lit8 v0, v2, 0x40

    if-nez v0, :cond_5

    .line 102
    const/4 v0, 0x0

    .line 103
    .end local v5    # "canBeUTF8":Z
    .restart local v0    # "canBeUTF8":Z
    goto :goto_1

    .line 104
    .end local v0    # "canBeUTF8":Z
    .restart local v5    # "canBeUTF8":Z
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 105
    and-int/lit8 v0, v2, 0x20

    if-nez v0, :cond_6

    .line 106
    add-int/lit8 v7, v7, 0x1

    .line 107
    goto :goto_2

    .line 108
    :cond_6
    add-int/lit8 v6, v6, 0x1

    .line 109
    and-int/lit8 v0, v2, 0x10

    if-nez v0, :cond_7

    .line 110
    add-int/lit8 v8, v8, 0x1

    .line 111
    goto :goto_2

    .line 112
    :cond_7
    add-int/lit8 v6, v6, 0x1

    .line 113
    and-int/lit8 v0, v2, 0x8

    if-nez v0, :cond_8

    .line 114
    add-int/lit8 v9, v9, 0x1

    .line 115
    goto :goto_2

    .line 116
    :cond_8
    const/4 v0, 0x0

    .end local v5    # "canBeUTF8":Z
    .restart local v0    # "canBeUTF8":Z
    goto :goto_1

    .line 127
    .end local v0    # "canBeUTF8":Z
    .restart local v5    # "canBeUTF8":Z
    :cond_9
    :goto_2
    const/16 v0, 0x7f

    if-eqz v18, :cond_c

    .line 128
    if-le v2, v0, :cond_a

    const/16 v0, 0xa0

    if-ge v2, v0, :cond_a

    .line 129
    const/4 v0, 0x0

    .line 130
    .end local v18    # "canBeISO88591":Z
    .local v0, "canBeISO88591":Z
    nop

    .line 142
    move/from16 v18, v0

    goto :goto_3

    .line 130
    .end local v0    # "canBeISO88591":Z
    .restart local v18    # "canBeISO88591":Z
    :cond_a
    const/16 v0, 0x9f

    if-le v2, v0, :cond_c

    .line 131
    const/16 v0, 0xc0

    if-lt v2, v0, :cond_b

    const/16 v0, 0xd7

    if-eq v2, v0, :cond_b

    const/16 v0, 0xf7

    if-ne v2, v0, :cond_c

    .line 132
    :cond_b
    add-int/lit8 v16, v16, 0x1

    .line 142
    :cond_c
    :goto_3
    if-eqz v4, :cond_16

    .line 143
    if-lez v10, :cond_f

    .line 144
    const/16 v0, 0x40

    if-lt v2, v0, :cond_e

    const/16 v0, 0x7f

    if-eq v2, v0, :cond_e

    const/16 v0, 0xfc

    if-le v2, v0, :cond_d

    goto :goto_4

    .line 147
    :cond_d
    add-int/lit8 v10, v10, -0x1

    .line 149
    goto :goto_7

    .line 145
    :cond_e
    :goto_4
    const/4 v0, 0x0

    .line 146
    .end local v4    # "canBeShiftJIS":Z
    .local v0, "canBeShiftJIS":Z
    nop

    .line 88
    .end local v0    # "canBeShiftJIS":Z
    .end local v2    # "value":I
    .restart local v4    # "canBeShiftJIS":Z
    :goto_5
    move v4, v0

    goto :goto_7

    .line 149
    .restart local v2    # "value":I
    :cond_f
    const/16 v0, 0x80

    if-eq v2, v0, :cond_15

    const/16 v0, 0xa0

    if-eq v2, v0, :cond_15

    const/16 v0, 0xef

    if-le v2, v0, :cond_10

    goto :goto_6

    .line 151
    :cond_10
    const/16 v0, 0xa0

    if-le v2, v0, :cond_12

    const/16 v0, 0xe0

    if-ge v2, v0, :cond_12

    .line 152
    add-int/lit8 v11, v11, 0x1

    .line 153
    const/4 v0, 0x0

    .line 154
    .end local v13    # "sjisCurDoubleBytesWordLength":I
    .local v0, "sjisCurDoubleBytesWordLength":I
    add-int/lit8 v12, v12, 0x1

    .line 155
    if-le v12, v14, :cond_11

    .line 156
    move v13, v12

    .line 158
    .end local v14    # "sjisMaxKatakanaWordLength":I
    .local v13, "sjisMaxKatakanaWordLength":I
    nop

    .line 88
    move v14, v13

    .end local v0    # "sjisCurDoubleBytesWordLength":I
    .end local v2    # "value":I
    .local v13, "sjisCurDoubleBytesWordLength":I
    .restart local v14    # "sjisMaxKatakanaWordLength":I
    :cond_11
    move v13, v0

    goto :goto_7

    .line 158
    .restart local v2    # "value":I
    :cond_12
    const/16 v0, 0x7f

    if-le v2, v0, :cond_14

    .line 159
    add-int/lit8 v10, v10, 0x1

    .line 161
    const/4 v0, 0x0

    .line 162
    .end local v12    # "sjisCurKatakanaWordLength":I
    .local v0, "sjisCurKatakanaWordLength":I
    add-int/lit8 v13, v13, 0x1

    .line 163
    if-le v13, v15, :cond_13

    .line 164
    move v12, v13

    .line 166
    .end local v15    # "sjisMaxDoubleBytesWordLength":I
    .local v12, "sjisMaxDoubleBytesWordLength":I
    nop

    .line 88
    move v15, v12

    .end local v0    # "sjisCurKatakanaWordLength":I
    .end local v2    # "value":I
    .local v12, "sjisCurKatakanaWordLength":I
    .restart local v15    # "sjisMaxDoubleBytesWordLength":I
    :cond_13
    move v12, v0

    goto :goto_7

    .line 168
    .restart local v2    # "value":I
    :cond_14
    const/4 v0, 0x0

    .line 169
    .end local v12    # "sjisCurKatakanaWordLength":I
    .restart local v0    # "sjisCurKatakanaWordLength":I
    const/4 v2, 0x0

    .line 88
    .end local v13    # "sjisCurDoubleBytesWordLength":I
    .local v2, "sjisCurDoubleBytesWordLength":I
    move v12, v0

    move v13, v2

    goto :goto_7

    .line 150
    .end local v0    # "sjisCurKatakanaWordLength":I
    .local v2, "value":I
    .restart local v12    # "sjisCurKatakanaWordLength":I
    .restart local v13    # "sjisCurDoubleBytesWordLength":I
    :cond_15
    :goto_6
    const/4 v0, 0x0

    .line 151
    .end local v4    # "canBeShiftJIS":Z
    .local v0, "canBeShiftJIS":Z
    goto :goto_5

    .line 88
    .end local v0    # "canBeShiftJIS":Z
    .end local v2    # "value":I
    .restart local v4    # "canBeShiftJIS":Z
    :cond_16
    :goto_7
    add-int/lit8 v3, v3, 0x1

    .line 87
    move/from16 v2, v20

    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 174
    .end local v3    # "i":I
    .end local v20    # "length":I
    .local v2, "length":I
    :cond_17
    move/from16 v20, v2

    .end local v2    # "length":I
    .restart local v20    # "length":I
    :goto_8
    if-eqz v5, :cond_18

    if-lez v6, :cond_18

    .line 175
    const/4 v5, 0x0

    .line 177
    :cond_18
    if-eqz v4, :cond_19

    if-lez v10, :cond_19

    .line 178
    const/4 v4, 0x0

    .line 182
    :cond_19
    if-eqz v5, :cond_1b

    if-nez v1, :cond_1a

    add-int v0, v7, v8

    add-int/2addr v0, v9

    if-lez v0, :cond_1b

    .line 183
    :cond_1a
    const-string v0, "UTF8"

    return-object v0

    .line 186
    :cond_1b
    if-eqz v4, :cond_1d

    sget-boolean v0, Lcom/google/zxing/common/StringUtils;->ASSUME_SHIFT_JIS:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x3

    if-ge v14, v0, :cond_1c

    if-lt v15, v0, :cond_1d

    .line 187
    :cond_1c
    const-string v0, "SJIS"

    return-object v0

    .line 194
    :cond_1d
    if-eqz v18, :cond_21

    if-eqz v4, :cond_21

    .line 195
    const/4 v0, 0x2

    if-ne v14, v0, :cond_1f

    if-eq v11, v0, :cond_1e

    goto :goto_9

    .line 196
    :cond_1e
    move/from16 v2, v20

    goto :goto_a

    .line 195
    :cond_1f
    :goto_9
    mul-int/lit8 v0, v16, 0xa

    move/from16 v2, v20

    if-lt v0, v2, :cond_20

    .line 196
    .end local v20    # "length":I
    .restart local v2    # "length":I
    :goto_a
    const-string v0, "SJIS"

    goto :goto_b

    :cond_20
    const-string v0, "ISO8859_1"

    .line 195
    :goto_b
    return-object v0

    .line 200
    .end local v2    # "length":I
    .restart local v20    # "length":I
    :cond_21
    move/from16 v2, v20

    .end local v20    # "length":I
    .restart local v2    # "length":I
    if-eqz v18, :cond_22

    .line 201
    const-string v0, "ISO8859_1"

    return-object v0

    .line 203
    :cond_22
    if-eqz v4, :cond_23

    .line 204
    const-string v0, "SJIS"

    return-object v0

    .line 206
    :cond_23
    if-eqz v5, :cond_24

    .line 207
    const-string v0, "UTF8"

    return-object v0

    .line 210
    :cond_24
    sget-object v0, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    return-object v0
.end method
