.class public final Lcom/google/zxing/oned/CodaBarWriter;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "CodaBarWriter.java"


# static fields
.field private static final ALT_START_END_CHARS:[C

.field private static final CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

.field private static final START_END_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 28
    const/4 v0, 0x4

    new-array v1, v0, [C

    fill-array-data v1, :array_18

    sput-object v1, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    .line 29
    new-array v1, v0, [C

    fill-array-data v1, :array_20

    sput-object v1, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    .line 30
    new-array v0, v0, [C

    fill-array-data v0, :array_28

    sput-object v0, Lcom/google/zxing/oned/CodaBarWriter;->CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

    return-void

    nop

    :array_18
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data

    :array_20
    .array-data 2
        0x54s
        0x4es
        0x2as
        0x45s
    .end array-data

    :array_28
    .array-data 2
        0x2fs
        0x3as
        0x2bs
        0x2es
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;)[Z
    .registers 19
    .param p1, "contents"    # Ljava/lang/String;

    .line 35
    move-object/from16 v0, p1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_15c

    .line 39
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    .line 40
    .local v2, "firstChar":C
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 42
    .local v3, "lastChar":C
    sget-object v5, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v5, v2}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 43
    sget-object v5, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v5, v3}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 41
    move v5, v4

    goto :goto_33

    :cond_32
    move v5, v1

    .line 45
    .local v5, "startsEndsNormal":Z
    :goto_33
    sget-object v6, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v6, v2}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v6

    if-eqz v6, :cond_45

    .line 46
    sget-object v6, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v6, v3}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v6

    if-eqz v6, :cond_45

    .line 44
    move v6, v4

    goto :goto_46

    :cond_45
    move v6, v1

    .line 47
    .local v6, "startsEndsAlt":Z
    :goto_46
    if-nez v5, :cond_73

    if-eqz v6, :cond_4b

    goto :goto_73

    .line 48
    :cond_4b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "Codabar should start/end with "

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v7, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v7}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    const-string v7, ", or start/end with "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v7}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 48
    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_73
    :goto_73
    const/16 v7, 0x14

    .line 55
    .local v7, "resultLength":I
    const/4 v8, 0x1

    .local v8, "i":I
    :goto_76
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    if-lt v8, v9, :cond_10e

    .line 65
    .end local v8    # "i":I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v4

    add-int v9, v7, v8

    .line 67
    .end local v7    # "resultLength":I
    .local v9, "resultLength":I
    new-array v10, v9, [Z

    .line 68
    .local v10, "result":[Z
    const/4 v7, 0x0

    .line 69
    .local v7, "position":I
    const/4 v8, 0x0

    .local v8, "index":I
    move v12, v7

    move v11, v8

    .end local v7    # "position":I
    .end local v8    # "index":I
    .local v11, "index":I
    .local v12, "position":I
    :goto_8a
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v11, v7, :cond_91

    .line 115
    .end local v11    # "index":I
    return-object v10

    .line 70
    .restart local v11    # "index":I
    :cond_91
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v7

    .line 71
    .local v7, "c":C
    if-eqz v11, :cond_a2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v4

    if-ne v11, v8, :cond_b2

    .line 73
    :cond_a2
    const/16 v8, 0x2a

    if-eq v7, v8, :cond_bd

    const/16 v8, 0x45

    if-eq v7, v8, :cond_ba

    const/16 v8, 0x4e

    if-eq v7, v8, :cond_b7

    const/16 v8, 0x54

    if-eq v7, v8, :cond_b4

    .line 88
    .end local v7    # "c":C
    .local v13, "c":C
    :cond_b2
    :goto_b2
    move v13, v7

    goto :goto_c0

    .line 75
    .end local v13    # "c":C
    .restart local v7    # "c":C
    :cond_b4
    const/16 v7, 0x41

    .line 76
    goto :goto_b2

    .line 78
    :cond_b7
    const/16 v7, 0x42

    .line 79
    goto :goto_b2

    .line 84
    :cond_ba
    const/16 v7, 0x44

    goto :goto_b2

    .line 81
    :cond_bd
    const/16 v7, 0x43

    .line 82
    goto :goto_b2

    .line 88
    .end local v7    # "c":C
    .restart local v13    # "c":C
    :goto_c0
    const/4 v14, 0x0

    .line 89
    .local v14, "code":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_c2
    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    array-length v8, v8

    if-lt v7, v8, :cond_c9

    .line 96
    .end local v7    # "i":I
    .end local v14    # "code":I
    .local v8, "code":I
    :goto_c7
    move v8, v14

    goto :goto_d4

    .line 91
    .end local v8    # "code":I
    .restart local v7    # "i":I
    .restart local v14    # "code":I
    :cond_c9
    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    aget-char v8, v8, v7

    if-ne v13, v8, :cond_10b

    .line 92
    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    aget v14, v8, v7

    .line 93
    goto :goto_c7

    .line 96
    .end local v7    # "i":I
    .end local v14    # "code":I
    .restart local v8    # "code":I
    :goto_d4
    const/4 v7, 0x1

    .line 97
    .local v7, "color":Z
    const/4 v14, 0x0

    .line 98
    .local v14, "counter":I
    const/4 v15, 0x0

    .line 99
    .local v15, "bit":I
    :goto_d7
    const/4 v1, 0x7

    if-lt v15, v1, :cond_eb

    .line 110
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v4

    if-ge v11, v1, :cond_e7

    .line 111
    const/4 v1, 0x0

    aput-boolean v1, v10, v12

    .line 112
    add-int/lit8 v12, v12, 0x1

    .end local v7    # "color":Z
    .end local v8    # "code":I
    .end local v13    # "c":C
    .end local v14    # "counter":I
    .end local v15    # "bit":I
    goto :goto_e8

    .line 69
    :cond_e7
    const/4 v1, 0x0

    :goto_e8
    add-int/lit8 v11, v11, 0x1

    goto :goto_8a

    .line 100
    .restart local v7    # "color":Z
    .restart local v8    # "code":I
    .restart local v13    # "c":C
    .restart local v14    # "counter":I
    .restart local v15    # "bit":I
    :cond_eb
    const/4 v1, 0x0

    aput-boolean v7, v10, v12

    .line 101
    add-int/lit8 v12, v12, 0x1

    .line 102
    rsub-int/lit8 v16, v15, 0x6

    shr-int v16, v8, v16

    and-int/lit8 v16, v16, 0x1

    if-eqz v16, :cond_fe

    if-ne v14, v4, :cond_fb

    goto :goto_fe

    .line 107
    :cond_fb
    add-int/lit8 v14, v14, 0x1

    goto :goto_d7

    .line 103
    :cond_fe
    :goto_fe
    if-eqz v7, :cond_103

    move/from16 v16, v1

    goto :goto_105

    :cond_103
    move/from16 v16, v4

    :goto_105
    move/from16 v7, v16

    .line 104
    add-int/lit8 v15, v15, 0x1

    .line 105
    const/4 v14, 0x0

    .line 106
    goto :goto_d7

    .line 89
    .end local v8    # "code":I
    .end local v15    # "bit":I
    .local v7, "i":I
    .local v14, "code":I
    :cond_10b
    add-int/lit8 v7, v7, 0x1

    goto :goto_c2

    .line 56
    .end local v9    # "resultLength":I
    .end local v10    # "result":[Z
    .end local v11    # "index":I
    .end local v12    # "position":I
    .end local v13    # "c":C
    .end local v14    # "code":I
    .local v7, "resultLength":I
    .local v8, "i":I
    :cond_10e
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-nez v9, :cond_155

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-eq v9, v10, :cond_155

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x24

    if-ne v9, v10, :cond_129

    goto :goto_155

    .line 58
    :cond_129
    sget-object v9, Lcom/google/zxing/oned/CodaBarWriter;->CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v9

    if-eqz v9, :cond_138

    .line 59
    add-int/lit8 v7, v7, 0xa

    .line 60
    goto :goto_158

    .line 61
    :cond_138
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v9, "Cannot encode : \'"

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v9, 0x27

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_155
    :goto_155
    add-int/lit8 v7, v7, 0x9

    .line 58
    nop

    .line 55
    :goto_158
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_76

    .line 36
    .end local v2    # "firstChar":C
    .end local v3    # "lastChar":C
    .end local v5    # "startsEndsNormal":Z
    .end local v6    # "startsEndsAlt":Z
    .end local v7    # "resultLength":I
    .end local v8    # "i":I
    :cond_15c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Codabar should start/end with start/stop symbols"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
