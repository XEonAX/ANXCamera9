.class public final Lcom/google/zxing/aztec/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/aztec/decoder/Decoder$Table;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

.field private static final DIGIT_TABLE:[Ljava/lang/String;

.field private static final LOWER_TABLE:[Ljava/lang/String;

.field private static final MIXED_TABLE:[Ljava/lang/String;

.field private static final PUNCT_TABLE:[Ljava/lang/String;

.field private static final UPPER_TABLE:[Ljava/lang/String;


# instance fields
.field private ddata:Lcom/google/zxing/aztec/AztecDetectorResult;


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[I
    .locals 3

    .line 35
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->values()[Lcom/google/zxing/aztec/decoder/Decoder$Table;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    :try_start_1
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->LOWER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->MIXED:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

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
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->PUNCT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v1

    :goto_4
    :try_start_5
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v1

    :goto_5
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 33

    .line 46
    nop

    .line 47
    const-string v0, "CTRL_PS"

    const-string v1, " "

    const-string v2, "A"

    const-string v3, "B"

    const-string v4, "C"

    const-string v5, "D"

    const-string v6, "E"

    const-string v7, "F"

    const-string v8, "G"

    const-string v9, "H"

    const-string v10, "I"

    const-string v11, "J"

    const-string v12, "K"

    const-string v13, "L"

    const-string v14, "M"

    const-string v15, "N"

    const-string v16, "O"

    const-string v17, "P"

    .line 48
    const-string v18, "Q"

    const-string v19, "R"

    const-string v20, "S"

    const-string v21, "T"

    const-string v22, "U"

    const-string v23, "V"

    const-string v24, "W"

    const-string v25, "X"

    const-string v26, "Y"

    const-string v27, "Z"

    const-string v28, "CTRL_LL"

    const-string v29, "CTRL_ML"

    const-string v30, "CTRL_DL"

    const-string v31, "CTRL_BS"

    .line 46
    filled-new-array/range {v0 .. v31}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    .line 51
    nop

    .line 52
    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "a"

    const-string v4, "b"

    const-string v5, "c"

    const-string v6, "d"

    const-string v7, "e"

    const-string v8, "f"

    const-string v9, "g"

    const-string v10, "h"

    const-string v11, "i"

    const-string v12, "j"

    const-string v13, "k"

    const-string v14, "l"

    const-string v15, "m"

    const-string v16, "n"

    const-string v17, "o"

    const-string v18, "p"

    .line 53
    const-string v19, "q"

    const-string v20, "r"

    const-string v21, "s"

    const-string v22, "t"

    const-string v23, "u"

    const-string v24, "v"

    const-string v25, "w"

    const-string v26, "x"

    const-string v27, "y"

    const-string v28, "z"

    const-string v29, "CTRL_US"

    const-string v30, "CTRL_ML"

    const-string v31, "CTRL_DL"

    const-string v32, "CTRL_BS"

    .line 51
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    .line 56
    nop

    .line 57
    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "\u0001"

    const-string v4, "\u0002"

    const-string v5, "\u0003"

    const-string v6, "\u0004"

    const-string v7, "\u0005"

    const-string v8, "\u0006"

    const-string v9, "\u0007"

    const-string v10, "\u0008"

    const-string v11, "\t"

    const-string v12, "\n"

    .line 58
    const-string v13, "\u000b"

    const-string v14, "\u000c"

    const-string v15, "\r"

    const-string v16, "\u001b"

    const-string v17, "\u001c"

    const-string v18, "\u001d"

    const-string v19, "\u001e"

    const-string v20, "\u001f"

    const-string v21, "@"

    const-string v22, "\\"

    const-string v23, "^"

    const-string v24, "_"

    .line 59
    const-string v25, "`"

    const-string v26, "|"

    const-string v27, "~"

    const-string v28, "\u007f"

    const-string v29, "CTRL_LL"

    const-string v30, "CTRL_UL"

    const-string v31, "CTRL_PL"

    const-string v32, "CTRL_BS"

    .line 56
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    .line 62
    nop

    .line 63
    const-string v1, ""

    const-string v2, "\r"

    const-string v3, "\r\n"

    const-string v4, ". "

    const-string v5, ", "

    const-string v6, ": "

    const-string v7, "!"

    const-string v8, "\""

    const-string v9, "#"

    const-string v10, "$"

    const-string v11, "%"

    const-string v12, "&"

    const-string v13, "\'"

    const-string v14, "("

    const-string v15, ")"

    .line 64
    const-string v16, "*"

    const-string v17, "+"

    const-string v18, ","

    const-string v19, "-"

    const-string v20, "."

    const-string v21, "/"

    const-string v22, ":"

    const-string v23, ";"

    const-string v24, "<"

    const-string v25, "="

    const-string v26, ">"

    const-string v27, "?"

    const-string v28, "["

    const-string v29, "]"

    const-string v30, "{"

    const-string v31, "}"

    const-string v32, "CTRL_UL"

    .line 62
    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    .line 67
    nop

    .line 68
    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "0"

    const-string v4, "1"

    const-string v5, "2"

    const-string v6, "3"

    const-string v7, "4"

    const-string v8, "5"

    const-string v9, "6"

    const-string v10, "7"

    const-string v11, "8"

    const-string v12, "9"

    const-string v13, ","

    const-string v14, "."

    const-string v15, "CTRL_UL"

    const-string v16, "CTRL_US"

    .line 67
    filled-new-array/range {v1 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    .line 69
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private correctBits([Z)[Z
    .locals 21
    .param p1, "rawbits"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v1, p0

    .line 202
    move-object/from16 v2, p1

    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/4 v3, 0x2

    if-gt v0, v3, :cond_0

    .line 203
    const/4 v0, 0x6

    .line 204
    .local v0, "codewordSize":I
    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 205
    .local v3, "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    nop

    .line 213
    .end local v0    # "codewordSize":I
    .local v4, "codewordSize":I
    :goto_0
    move v4, v0

    goto :goto_1

    .line 205
    .end local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    .end local v4    # "codewordSize":I
    :cond_0
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/16 v3, 0x8

    if-gt v0, v3, :cond_1

    .line 206
    const/16 v0, 0x8

    .line 207
    .restart local v0    # "codewordSize":I
    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 208
    .restart local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    goto :goto_0

    .end local v0    # "codewordSize":I
    .end local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    :cond_1
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/16 v3, 0x16

    if-gt v0, v3, :cond_2

    .line 209
    const/16 v0, 0xa

    .line 210
    .restart local v0    # "codewordSize":I
    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 211
    .restart local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    goto :goto_0

    .line 212
    .end local v0    # "codewordSize":I
    .end local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    :cond_2
    const/16 v0, 0xc

    .line 213
    .restart local v0    # "codewordSize":I
    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    goto :goto_0

    .line 216
    .end local v0    # "codewordSize":I
    .restart local v3    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    .restart local v4    # "codewordSize":I
    :goto_1
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbDatablocks()I

    move-result v5

    .line 217
    .local v5, "numDataCodewords":I
    array-length v0, v2

    div-int v6, v0, v4

    .line 218
    .local v6, "numCodewords":I
    if-lt v6, v5, :cond_e

    .line 221
    array-length v0, v2

    rem-int/2addr v0, v4

    .line 222
    .local v0, "offset":I
    sub-int v7, v6, v5

    .line 224
    .local v7, "numECCodewords":I
    new-array v8, v6, [I

    .line 225
    .local v8, "dataWords":[I
    const/4 v9, 0x0

    .local v9, "i":I
    move v10, v0

    .end local v0    # "offset":I
    .local v10, "offset":I
    :goto_2
    if-lt v9, v6, :cond_d

    .line 230
    .end local v9    # "i":I
    :try_start_0
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-direct {v0, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    .line 231
    .local v0, "rsDecoder":Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
    invoke-virtual {v0, v8, v7}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    .end local v0    # "rsDecoder":Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
    nop

    .line 238
    const/4 v0, 0x1

    shl-int v9, v0, v4

    sub-int/2addr v9, v0

    .line 239
    .local v9, "mask":I
    const/4 v11, 0x0

    .line 240
    .local v11, "stuffedBits":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    if-lt v12, v5, :cond_9

    .line 249
    .end local v12    # "i":I
    mul-int v12, v5, v4

    sub-int/2addr v12, v11

    new-array v13, v12, [Z

    .line 250
    .local v13, "correctedBits":[Z
    const/4 v12, 0x0

    .line 251
    .local v12, "index":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_4
    if-lt v14, v5, :cond_3

    .line 263
    .end local v14    # "i":I
    return-object v13

    .line 252
    .restart local v14    # "i":I
    :cond_3
    aget v15, v8, v14

    .line 253
    .local v15, "dataWord":I
    const/16 v16, 0x0

    if-eq v15, v0, :cond_7

    add-int/lit8 v0, v9, -0x1

    if-ne v15, v0, :cond_4

    goto :goto_7

    .line 258
    :cond_4
    add-int/lit8 v0, v4, -0x1

    .local v0, "bit":I
    :goto_5
    if-gez v0, :cond_5

    .end local v0    # "bit":I
    .end local v15    # "dataWord":I
    goto :goto_9

    .line 259
    .restart local v0    # "bit":I
    .restart local v15    # "dataWord":I
    :cond_5
    add-int/lit8 v18, v12, 0x1

    .local v18, "index":I
    const/16 v17, 0x1

    shl-int v19, v17, v0

    and-int v19, v15, v19

    if-eqz v19, :cond_6

    const/16 v19, 0x1

    goto :goto_6

    :cond_6
    move/from16 v19, v16

    :goto_6
    aput-boolean v19, v13, v12

    .line 258
    .end local v12    # "index":I
    add-int/lit8 v0, v0, -0x1

    move/from16 v12, v18

    goto :goto_5

    .line 255
    .end local v0    # "bit":I
    .end local v18    # "index":I
    .restart local v12    # "index":I
    :cond_7
    :goto_7
    add-int v0, v12, v4

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le v15, v1, :cond_8

    const/4 v1, 0x1

    goto :goto_8

    :cond_8
    move/from16 v1, v16

    :goto_8
    invoke-static {v13, v12, v0, v1}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 256
    add-int/lit8 v0, v4, -0x1

    add-int/2addr v12, v0

    .line 257
    nop

    .line 251
    .end local v15    # "dataWord":I
    :goto_9
    add-int/lit8 v14, v14, 0x1

    const/4 v0, 0x1

    move-object/from16 v1, p0

    goto :goto_4

    .line 241
    .end local v13    # "correctedBits":[Z
    .end local v14    # "i":I
    .local v12, "i":I
    :cond_9
    aget v0, v8, v12

    .line 242
    .local v0, "dataWord":I
    if-eqz v0, :cond_c

    if-eq v0, v9, :cond_c

    .line 244
    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    add-int/lit8 v13, v9, -0x1

    if-ne v0, v13, :cond_b

    .line 245
    :cond_a
    add-int/lit8 v11, v11, 0x1

    .line 240
    .end local v0    # "dataWord":I
    :cond_b
    add-int/lit8 v12, v12, 0x1

    move v0, v1

    move-object/from16 v1, p0

    goto :goto_3

    .line 243
    .restart local v0    # "dataWord":I
    :cond_c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 232
    .end local v0    # "dataWord":I
    .end local v9    # "mask":I
    .end local v11    # "stuffedBits":I
    .end local v12    # "i":I
    :catch_0
    move-exception v0

    .line 233
    .local v0, "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 226
    .end local v0    # "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    .local v9, "i":I
    :cond_d
    invoke-static {v2, v10, v4}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v0

    aput v0, v8, v9

    .line 225
    add-int/lit8 v9, v9, 0x1

    add-int/2addr v10, v4

    move-object/from16 v1, p0

    goto/16 :goto_2

    .line 219
    .end local v7    # "numECCodewords":I
    .end local v8    # "dataWords":[I
    .end local v9    # "i":I
    .end local v10    # "offset":I
    :cond_e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static getCharacter(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;
    .locals 2
    .param p0, "table"    # Lcom/google/zxing/aztec/decoder/Decoder$Table;
    .param p1, "code"    # I

    .line 175
    invoke-static {}, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 188
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bad table"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :pswitch_0
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 185
    :pswitch_1
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 181
    :pswitch_2
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 179
    :pswitch_3
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 177
    :pswitch_4
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getEncodedData([Z)Ljava/lang/String;
    .locals 10
    .param p0, "correctedBits"    # [Z

    .line 93
    array-length v0, p0

    .line 94
    .local v0, "endIndex":I
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 95
    .local v1, "latchTable":Lcom/google/zxing/aztec/decoder/Decoder$Table;
    sget-object v2, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    .line 96
    .local v2, "shiftTable":Lcom/google/zxing/aztec/decoder/Decoder$Table;
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 97
    .local v3, "result":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 98
    .local v4, "index":I
    :cond_0
    :goto_0
    if-lt v4, v0, :cond_1

    goto :goto_4

    .line 99
    :cond_1
    sget-object v5, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    const/4 v6, 0x5

    if-ne v2, v5, :cond_7

    .line 100
    sub-int v5, v0, v4

    if-ge v5, v6, :cond_2

    .line 101
    goto :goto_4

    .line 103
    :cond_2
    invoke-static {p0, v4, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v5

    .line 104
    .local v5, "length":I
    add-int/lit8 v4, v4, 0x5

    .line 105
    if-nez v5, :cond_4

    .line 106
    sub-int v6, v0, v4

    const/16 v7, 0xb

    if-ge v6, v7, :cond_3

    .line 107
    goto :goto_4

    .line 109
    :cond_3
    invoke-static {p0, v4, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v6

    add-int/lit8 v5, v6, 0x1f

    .line 110
    add-int/lit8 v4, v4, 0xb

    .line 112
    :cond_4
    const/4 v6, 0x0

    .local v6, "charCount":I
    :goto_1
    if-lt v6, v5, :cond_5

    .end local v6    # "charCount":I
    goto :goto_2

    .line 113
    .restart local v6    # "charCount":I
    :cond_5
    sub-int v7, v0, v4

    const/16 v8, 0x8

    if-ge v7, v8, :cond_6

    .line 114
    move v4, v0

    .line 115
    nop

    .line 122
    .end local v6    # "charCount":I
    :goto_2
    move-object v2, v1

    .line 123
    .end local v5    # "length":I
    goto :goto_0

    .line 117
    .restart local v5    # "length":I
    .restart local v6    # "charCount":I
    :cond_6
    invoke-static {p0, v4, v8}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v7

    .line 118
    .local v7, "code":I
    int-to-char v8, v7

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    add-int/lit8 v4, v4, 0x8

    .line 112
    .end local v7    # "code":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 124
    .end local v5    # "length":I
    .end local v6    # "charCount":I
    :cond_7
    sget-object v5, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    if-ne v2, v5, :cond_8

    const/4 v5, 0x4

    goto :goto_3

    :cond_8
    move v5, v6

    .line 125
    .local v5, "size":I
    :goto_3
    sub-int v7, v0, v4

    if-ge v7, v5, :cond_9

    .line 126
    nop

    .line 144
    .end local v5    # "size":I
    :goto_4
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 128
    .restart local v5    # "size":I
    :cond_9
    invoke-static {p0, v4, v5}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v7

    .line 129
    .restart local v7    # "code":I
    add-int/2addr v4, v5

    .line 130
    invoke-static {v2, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->getCharacter(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;

    move-result-object v8

    .line 131
    .local v8, "str":Ljava/lang/String;
    const-string v9, "CTRL_"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 133
    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/google/zxing/aztec/decoder/Decoder;->getTable(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;

    move-result-object v2

    .line 134
    const/4 v6, 0x6

    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v9, 0x4c

    if-ne v6, v9, :cond_0

    .line 135
    move-object v1, v2

    .line 137
    goto :goto_0

    .line 138
    :cond_a
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    move-object v2, v1

    .end local v5    # "size":I
    .end local v7    # "code":I
    .end local v8    # "str":Ljava/lang/String;
    goto :goto_0
.end method

.method private static getTable(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;
    .locals 1
    .param p0, "t"    # C

    .line 151
    const/16 v0, 0x42

    if-eq p0, v0, :cond_2

    const/16 v0, 0x44

    if-eq p0, v0, :cond_1

    const/16 v0, 0x50

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 164
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    .line 157
    :pswitch_0
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->MIXED:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    .line 153
    :pswitch_1
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->LOWER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    .line 155
    :cond_0
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->PUNCT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    .line 159
    :cond_1
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    .line 161
    :cond_2
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x4c
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static highLevelDecode([Z)Ljava/lang/String;
    .locals 1
    .param p0, "correctedBits"    # [Z

    .line 84
    invoke-static {p0}, Lcom/google/zxing/aztec/decoder/Decoder;->getEncodedData([Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readCode([ZII)I
    .locals 3
    .param p0, "rawbits"    # [Z
    .param p1, "startIndex"    # I
    .param p2, "length"    # I

    .line 325
    const/4 v0, 0x0

    .line 326
    .local v0, "res":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    add-int v2, p1, p2

    if-lt v1, v2, :cond_0

    .line 332
    .end local v1    # "i":I
    return v0

    .line 327
    .restart local v1    # "i":I
    :cond_0
    shl-int/lit8 v0, v0, 0x1

    .line 328
    aget-boolean v2, p0, v1

    if-eqz v2, :cond_1

    .line 329
    or-int/lit8 v0, v0, 0x1

    .line 326
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static totalBitsInLayer(IZ)I
    .locals 2
    .param p0, "layers"    # I
    .param p1, "compact"    # Z

    .line 336
    if-eqz p1, :cond_0

    const/16 v0, 0x58

    goto :goto_0

    :cond_0
    const/16 v0, 0x70

    :goto_0
    const/16 v1, 0x10

    mul-int/2addr v1, p0

    add-int/2addr v0, v1

    mul-int/2addr v0, p0

    return v0
.end method


# virtual methods
.method public decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;
    .locals 6
    .param p1, "detectorResult"    # Lcom/google/zxing/aztec/AztecDetectorResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    .line 75
    invoke-virtual {p1}, Lcom/google/zxing/aztec/AztecDetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    .line 76
    .local v0, "matrix":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {p0, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->extractBits(Lcom/google/zxing/common/BitMatrix;)[Z

    move-result-object v1

    .line 77
    .local v1, "rawbits":[Z
    invoke-direct {p0, v1}, Lcom/google/zxing/aztec/decoder/Decoder;->correctBits([Z)[Z

    move-result-object v2

    .line 78
    .local v2, "correctedBits":[Z
    invoke-static {v2}, Lcom/google/zxing/aztec/decoder/Decoder;->getEncodedData([Z)Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "result":Ljava/lang/String;
    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v3, v5, v5}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v4
.end method

.method extractBits(Lcom/google/zxing/common/BitMatrix;)[Z
    .locals 21
    .param p1, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v0, p0

    .line 272
    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v2}, Lcom/google/zxing/aztec/AztecDetectorResult;->isCompact()Z

    move-result v2

    .line 273
    .local v2, "compact":Z
    iget-object v3, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v3}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v3

    .line 274
    .local v3, "layers":I
    if-eqz v2, :cond_0

    const/16 v4, 0xb

    :goto_0
    mul-int/lit8 v5, v3, 0x4

    add-int/2addr v4, v5

    goto :goto_1

    :cond_0
    const/16 v4, 0xe

    goto :goto_0

    .line 275
    .local v4, "baseMatrixSize":I
    :goto_1
    new-array v5, v4, [I

    .line 276
    .local v5, "alignmentMap":[I
    invoke-static {v3, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->totalBitsInLayer(IZ)I

    move-result v6

    new-array v6, v6, [Z

    .line 278
    .local v6, "rawbits":[Z
    const/4 v7, 0x2

    if-eqz v2, :cond_2

    .line 279
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    array-length v9, v5

    if-lt v8, v9, :cond_1

    .line 282
    .end local v8    # "i":I
    goto :goto_4

    .line 280
    .restart local v8    # "i":I
    :cond_1
    aput v8, v5, v8

    .line 279
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 283
    .end local v8    # "i":I
    :cond_2
    add-int/lit8 v8, v4, 0x1

    div-int/lit8 v9, v4, 0x2

    add-int/lit8 v9, v9, -0x1

    div-int/lit8 v9, v9, 0xf

    mul-int/2addr v9, v7

    add-int/2addr v8, v9

    .line 284
    .local v8, "matrixSize":I
    div-int/lit8 v9, v4, 0x2

    .line 285
    .local v9, "origCenter":I
    div-int/lit8 v10, v8, 0x2

    .line 286
    .local v10, "center":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_3
    if-lt v11, v9, :cond_7

    .line 292
    .end local v8    # "matrixSize":I
    .end local v9    # "origCenter":I
    .end local v10    # "center":I
    .end local v11    # "i":I
    :goto_4
    const/4 v8, 0x0

    .local v8, "i":I
    const/4 v9, 0x0

    .local v9, "rowOffset":I
    move v12, v8

    move v13, v9

    .end local v8    # "i":I
    .end local v9    # "rowOffset":I
    .local v12, "i":I
    .local v13, "rowOffset":I
    :goto_5
    if-lt v12, v3, :cond_3

    .line 318
    .end local v12    # "i":I
    .end local v13    # "rowOffset":I
    return-object v6

    .line 293
    .restart local v12    # "i":I
    .restart local v13    # "rowOffset":I
    :cond_3
    const/4 v14, 0x4

    if-eqz v2, :cond_4

    sub-int v8, v3, v12

    mul-int/2addr v8, v14

    add-int/lit8 v8, v8, 0x9

    goto :goto_6

    :cond_4
    sub-int v8, v3, v12

    mul-int/2addr v8, v14

    add-int/lit8 v8, v8, 0xc

    :goto_6
    move v15, v8

    .line 295
    .local v15, "rowSize":I
    mul-int/lit8 v16, v12, 0x2

    .line 297
    .local v16, "low":I
    add-int/lit8 v8, v4, -0x1

    sub-int v17, v8, v16

    .line 299
    .local v17, "high":I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_7
    if-lt v8, v15, :cond_5

    .line 316
    .end local v8    # "j":I
    mul-int/lit8 v8, v15, 0x8

    add-int/2addr v13, v8

    .line 292
    .end local v15    # "rowSize":I
    .end local v16    # "low":I
    .end local v17    # "high":I
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 300
    .restart local v8    # "j":I
    .restart local v15    # "rowSize":I
    .restart local v16    # "low":I
    .restart local v17    # "high":I
    :cond_5
    mul-int/lit8 v18, v8, 0x2

    .line 301
    .local v18, "columnOffset":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_8
    if-lt v9, v7, :cond_6

    .line 299
    .end local v9    # "k":I
    .end local v18    # "columnOffset":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 303
    .restart local v9    # "k":I
    .restart local v18    # "columnOffset":I
    :cond_6
    add-int v10, v13, v18

    add-int/2addr v10, v9

    .line 304
    add-int v11, v16, v9

    aget v11, v5, v11

    add-int v19, v16, v8

    aget v14, v5, v19

    invoke-virtual {v1, v11, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    .line 303
    aput-boolean v11, v6, v10

    .line 306
    mul-int v10, v7, v15

    add-int/2addr v10, v13

    add-int v10, v10, v18

    add-int/2addr v10, v9

    .line 307
    add-int v11, v16, v8

    aget v11, v5, v11

    sub-int v14, v17, v9

    aget v14, v5, v14

    invoke-virtual {v1, v11, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    .line 306
    aput-boolean v11, v6, v10

    .line 309
    const/4 v14, 0x4

    mul-int v10, v14, v15

    add-int/2addr v10, v13

    add-int v10, v10, v18

    add-int/2addr v10, v9

    .line 310
    sub-int v11, v17, v9

    aget v11, v5, v11

    sub-int v19, v17, v8

    aget v7, v5, v19

    invoke-virtual {v1, v11, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    .line 309
    aput-boolean v7, v6, v10

    .line 312
    const/4 v7, 0x6

    mul-int/2addr v7, v15

    add-int/2addr v7, v13

    add-int v7, v7, v18

    add-int/2addr v7, v9

    .line 313
    sub-int v10, v17, v8

    aget v10, v5, v10

    add-int v11, v16, v9

    aget v11, v5, v11

    invoke-virtual {v1, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    .line 312
    aput-boolean v10, v6, v7

    .line 301
    add-int/lit8 v9, v9, 0x1

    const/4 v7, 0x2

    goto :goto_8

    .line 287
    .end local v12    # "i":I
    .end local v13    # "rowOffset":I
    .end local v15    # "rowSize":I
    .end local v16    # "low":I
    .end local v17    # "high":I
    .end local v18    # "columnOffset":I
    .local v8, "matrixSize":I
    .local v9, "origCenter":I
    .restart local v10    # "center":I
    .restart local v11    # "i":I
    :cond_7
    div-int/lit8 v7, v11, 0xf

    add-int/2addr v7, v11

    .line 288
    .local v7, "newOffset":I
    sub-int v12, v9, v11

    add-int/lit8 v12, v12, -0x1

    sub-int v13, v10, v7

    add-int/lit8 v13, v13, -0x1

    aput v13, v5, v12

    .line 289
    add-int v12, v9, v11

    add-int v13, v10, v7

    add-int/lit8 v13, v13, 0x1

    aput v13, v5, v12

    .line 286
    .end local v7    # "newOffset":I
    add-int/lit8 v11, v11, 0x1

    const/4 v7, 0x2

    goto/16 :goto_3
.end method
