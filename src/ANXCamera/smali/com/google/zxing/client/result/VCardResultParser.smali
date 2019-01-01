.class public final Lcom/google/zxing/client/result/VCardResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "VCardResultParser.java"


# static fields
.field private static final BEGIN_VCARD:Ljava/util/regex/Pattern;

.field private static final COMMA:Ljava/util/regex/Pattern;

.field private static final CR_LF_SPACE_TAB:Ljava/util/regex/Pattern;

.field private static final EQUALS:Ljava/util/regex/Pattern;

.field private static final NEWLINE_ESCAPE:Ljava/util/regex/Pattern;

.field private static final SEMICOLON:Ljava/util/regex/Pattern;

.field private static final SEMICOLON_OR_COMMA:Ljava/util/regex/Pattern;

.field private static final UNESCAPED_SEMICOLONS:Ljava/util/regex/Pattern;

.field private static final VCARD_ESCAPES:Ljava/util/regex/Pattern;

.field private static final VCARD_LIKE_DATE:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    const-string v0, "BEGIN:VCARD"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->BEGIN_VCARD:Ljava/util/regex/Pattern;

    .line 39
    const-string v0, "\\d{4}-?\\d{2}-?\\d{2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->VCARD_LIKE_DATE:Ljava/util/regex/Pattern;

    .line 40
    const-string v0, "\r\n[ \t]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->CR_LF_SPACE_TAB:Ljava/util/regex/Pattern;

    .line 41
    const-string v0, "\\\\[nN]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->NEWLINE_ESCAPE:Ljava/util/regex/Pattern;

    .line 42
    const-string v0, "\\\\([,;\\\\])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->VCARD_ESCAPES:Ljava/util/regex/Pattern;

    .line 43
    const-string v0, "="

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->EQUALS:Ljava/util/regex/Pattern;

    .line 44
    const-string v0, ";"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->SEMICOLON:Ljava/util/regex/Pattern;

    .line 45
    const-string v0, "(?<!\\\\);+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->UNESCAPED_SEMICOLONS:Ljava/util/regex/Pattern;

    .line 46
    const-string v0, ","

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->COMMA:Ljava/util/regex/Pattern;

    .line 47
    const-string v0, "[;,]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VCardResultParser;->SEMICOLON_OR_COMMA:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static decodeQuotedPrintable(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "charset"    # Ljava/lang/String;

    .line 210
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 211
    .local v0, "length":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 212
    .local v1, "result":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 213
    .local v2, "fragmentBuffer":Ljava/io/ByteArrayOutputStream;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v0, :cond_0

    .line 238
    .end local v3    # "i":I
    invoke-static {v2, p1, v1}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 239
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 214
    .restart local v3    # "i":I
    :cond_0
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 215
    .local v4, "c":C
    const/16 v5, 0xa

    if-eq v4, v5, :cond_3

    const/16 v6, 0xd

    if-eq v4, v6, :cond_3

    const/16 v7, 0x3d

    if-eq v4, v7, :cond_1

    .line 234
    invoke-static {v2, p1, v1}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 235
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .end local v4    # "c":C
    goto :goto_1

    .line 220
    .restart local v4    # "c":C
    :cond_1
    add-int/lit8 v7, v0, -0x2

    if-ge v3, v7, :cond_4

    .line 221
    add-int/lit8 v7, v3, 0x1

    invoke-interface {p0, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    .line 222
    .local v7, "nextChar":C
    if-eq v7, v6, :cond_4

    if-eq v7, v5, :cond_4

    .line 223
    add-int/lit8 v5, v3, 0x2

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    .line 224
    .local v5, "nextNextChar":C
    invoke-static {v7}, Lcom/google/zxing/client/result/VCardResultParser;->parseHexDigit(C)I

    move-result v6

    .line 225
    .local v6, "firstDigit":I
    invoke-static {v5}, Lcom/google/zxing/client/result/VCardResultParser;->parseHexDigit(C)I

    move-result v8

    .line 226
    .local v8, "secondDigit":I
    if-ltz v6, :cond_2

    if-ltz v8, :cond_2

    .line 227
    shl-int/lit8 v9, v6, 0x4

    add-int/2addr v9, v8

    invoke-virtual {v2, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 229
    :cond_2
    add-int/lit8 v3, v3, 0x2

    .line 232
    .end local v5    # "nextNextChar":C
    .end local v6    # "firstDigit":I
    .end local v7    # "nextChar":C
    .end local v8    # "secondDigit":I
    goto :goto_1

    .line 218
    :cond_3
    nop

    .line 213
    .end local v4    # "c":C
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static formatNames(Ljava/lang/Iterable;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 324
    .local p0, "names":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz p0, :cond_3

    .line 325
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_3

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 326
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 327
    .local v3, "name":Ljava/lang/String;
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    .line 328
    .local v4, "components":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 330
    .local v5, "start":I
    const/4 v6, 0x0

    .line 331
    .local v6, "componentIndex":I
    :goto_1
    array-length v7, v4

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    if-ge v6, v7, :cond_2

    const/16 v7, 0x3b

    invoke-virtual {v3, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    move v9, v7

    .local v9, "end":I
    if-gez v7, :cond_1

    .end local v9    # "end":I
    goto :goto_2

    .line 332
    .restart local v9    # "end":I
    :cond_1
    invoke-virtual {v3, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    .line 333
    add-int/lit8 v6, v6, 0x1

    .line 334
    add-int/lit8 v5, v9, 0x1

    .end local v9    # "end":I
    goto :goto_1

    .line 336
    :cond_2
    :goto_2
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    .line 337
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v9, 0x64

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 338
    .local v7, "newName":Ljava/lang/StringBuilder;
    const/4 v9, 0x3

    invoke-static {v4, v9, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V

    .line 339
    invoke-static {v4, v8, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V

    .line 340
    const/4 v8, 0x2

    invoke-static {v4, v8, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V

    .line 341
    invoke-static {v4, v2, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V

    .line 342
    const/4 v8, 0x4

    invoke-static {v4, v8, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V

    .line 343
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v2, v8}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "components":[Ljava/lang/String;
    .end local v5    # "start":I
    .end local v6    # "componentIndex":I
    .end local v7    # "newName":Ljava/lang/StringBuilder;
    goto :goto_0

    .line 346
    :cond_3
    :goto_3
    return-void
.end method

.method private static isLikeVCardDate(Ljava/lang/CharSequence;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/CharSequence;

    .line 314
    if-eqz p0, :cond_0

    sget-object v0, Lcom/google/zxing/client/result/VCardResultParser;->VCARD_LIKE_DATE:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method static matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/CharSequence;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z
    .param p3, "parseFieldDivider"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 266
    invoke-static {p0, p1, p2, p3}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v0

    .line 267
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method

.method static matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;
    .locals 18
    .param p0, "prefix"    # Ljava/lang/CharSequence;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z
    .param p3, "parseFieldDivider"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    move-object/from16 v0, p1

    .line 106
    const/4 v1, 0x0

    .line 107
    .local v1, "matches":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v2, 0x0

    .line 108
    .local v2, "i":I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 110
    .local v3, "max":I
    :goto_0
    if-lt v2, v3, :cond_0

    .line 206
    move-object/from16 v5, p0

    goto :goto_1

    .line 114
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "(?:^|\n)"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v5, p0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, "(?:;([^:]*))?:"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 115
    nop

    .line 114
    const/4 v6, 0x2

    invoke-static {v4, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 115
    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 114
    nop

    .line 116
    .local v4, "matcher":Ljava/util/regex/Matcher;
    if-lez v2, :cond_1

    .line 117
    add-int/lit8 v2, v2, -0x1

    .line 119
    :cond_1
    invoke-virtual {v4, v2}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v7

    if-nez v7, :cond_2

    .line 120
    nop

    .line 206
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    :goto_1
    return-object v1

    .line 122
    .restart local v4    # "matcher":Ljava/util/regex/Matcher;
    :cond_2
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->end(I)I

    move-result v2

    .line 124
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 125
    .local v9, "metadataString":Ljava/lang/String;
    const/4 v10, 0x0

    .line 126
    .local v10, "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v11, 0x0

    .line 127
    .local v11, "quotedPrintable":Z
    const/4 v12, 0x0

    .line 128
    .local v12, "quotedPrintableCharset":Ljava/lang/String;
    if-eqz v9, :cond_7

    .line 129
    sget-object v13, Lcom/google/zxing/client/result/VCardResultParser;->SEMICOLON:Ljava/util/regex/Pattern;

    invoke-virtual {v13, v9}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v13

    array-length v14, v13

    move-object v15, v12

    move v12, v11

    move-object v11, v10

    move v10, v7

    .end local v10    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v11, "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v12, "quotedPrintable":Z
    .local v15, "quotedPrintableCharset":Ljava/lang/String;
    :goto_2
    if-lt v10, v14, :cond_3

    .line 147
    move-object/from16 v16, v4

    move-object v10, v11

    move v11, v12

    move-object v12, v15

    goto :goto_4

    .line 129
    :cond_3
    aget-object v7, v13, v10

    .line 130
    .local v7, "metadatum":Ljava/lang/String;
    if-nez v11, :cond_4

    .line 131
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 133
    .end local v11    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v6, "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v11, v6

    .end local v6    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v11    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    invoke-interface {v11, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    sget-object v6, Lcom/google/zxing/client/result/VCardResultParser;->EQUALS:Ljava/util/regex/Pattern;

    const/4 v8, 0x2

    invoke-virtual {v6, v7, v8}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;I)[Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "metadatumTokens":[Ljava/lang/String;
    array-length v8, v6

    move-object/from16 v16, v4

    const/4 v4, 0x1

    if-le v8, v4, :cond_6

    .line 136
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .local v16, "matcher":Ljava/util/regex/Matcher;
    const/4 v8, 0x0

    aget-object v5, v6, v8

    .line 137
    .local v5, "key":Ljava/lang/String;
    aget-object v8, v6, v4

    .line 138
    .local v8, "value":Ljava/lang/String;
    const-string v4, "ENCODING"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "QUOTED-PRINTABLE"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 139
    const/4 v4, 0x1

    .line 140
    .end local v12    # "quotedPrintable":Z
    .local v4, "quotedPrintable":Z
    nop

    .line 129
    move v12, v4

    goto :goto_3

    .line 140
    .end local v4    # "quotedPrintable":Z
    .restart local v12    # "quotedPrintable":Z
    :cond_5
    const-string v4, "CHARSET"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 141
    move-object v4, v8

    .line 129
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "metadatumTokens":[Ljava/lang/String;
    .end local v7    # "metadatum":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    .end local v15    # "quotedPrintableCharset":Ljava/lang/String;
    .local v4, "quotedPrintableCharset":Ljava/lang/String;
    move-object v15, v4

    .end local v4    # "quotedPrintableCharset":Ljava/lang/String;
    .restart local v15    # "quotedPrintableCharset":Ljava/lang/String;
    :cond_6
    :goto_3
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v4, v16

    move-object/from16 v5, p0

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    goto :goto_2

    .line 147
    .end local v15    # "quotedPrintableCharset":Ljava/lang/String;
    .end local v16    # "matcher":Ljava/util/regex/Matcher;
    .local v4, "matcher":Ljava/util/regex/Matcher;
    .restart local v10    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v11, "quotedPrintable":Z
    .local v12, "quotedPrintableCharset":Ljava/lang/String;
    :cond_7
    move-object/from16 v16, v4

    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .restart local v16    # "matcher":Ljava/util/regex/Matcher;
    :goto_4
    move v4, v2

    .line 149
    .local v4, "matchStart":I
    :goto_5
    const/16 v5, 0xa

    invoke-virtual {v0, v5, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    move v2, v5

    if-gez v5, :cond_8

    goto :goto_8

    .line 150
    :cond_8
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-ge v2, v5, :cond_a

    .line 151
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x20

    if-eq v5, v6, :cond_9

    .line 152
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x9

    if-ne v5, v6, :cond_a

    .line 153
    :cond_9
    add-int/lit8 v2, v2, 0x2

    .line 154
    goto :goto_5

    :cond_a
    if-eqz v11, :cond_d

    .line 155
    const/16 v5, 0x3d

    const/4 v6, 0x1

    if-lt v2, v6, :cond_c

    add-int/lit8 v6, v2, -0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v5, :cond_b

    goto :goto_6

    .line 157
    :cond_b
    const/4 v6, 0x2

    goto :goto_7

    .line 156
    :cond_c
    :goto_6
    const/4 v6, 0x2

    if-lt v2, v6, :cond_d

    add-int/lit8 v7, v2, -0x2

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v5, :cond_d

    .line 157
    :goto_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 163
    :cond_d
    :goto_8
    if-gez v2, :cond_e

    .line 165
    move v2, v3

    .line 166
    goto/16 :goto_0

    :cond_e
    if-le v2, v4, :cond_16

    .line 168
    if-nez v1, :cond_f

    .line 169
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    move-object v1, v5

    goto :goto_9

    .line 171
    :cond_f
    const/4 v6, 0x1

    :goto_9
    if-lt v2, v6, :cond_10

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_10

    .line 172
    add-int/lit8 v2, v2, -0x1

    .line 174
    :cond_10
    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 175
    .local v5, "element":Ljava/lang/String;
    if-eqz p2, :cond_11

    .line 176
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 178
    :cond_11
    if-eqz v11, :cond_12

    .line 179
    invoke-static {v5, v12}, Lcom/google/zxing/client/result/VCardResultParser;->decodeQuotedPrintable(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 180
    if-eqz p3, :cond_14

    .line 181
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->UNESCAPED_SEMICOLONS:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 183
    goto :goto_a

    .line 184
    :cond_12
    if-eqz p3, :cond_13

    .line 185
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->UNESCAPED_SEMICOLONS:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 187
    :cond_13
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->CR_LF_SPACE_TAB:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 188
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->NEWLINE_ESCAPE:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 189
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->VCARD_ESCAPES:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const-string v8, "$1"

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 191
    :cond_14
    :goto_a
    if-nez v10, :cond_15

    .line 192
    new-instance v7, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 193
    .local v7, "match":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    .end local v7    # "match":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_b

    .line 196
    :cond_15
    const/4 v7, 0x0

    invoke-interface {v10, v7, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 197
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    :goto_b
    add-int/lit8 v2, v2, 0x1

    .line 200
    .end local v5    # "element":Ljava/lang/String;
    goto/16 :goto_0

    .line 201
    :cond_16
    add-int/lit8 v2, v2, 0x1

    .end local v4    # "matchStart":I
    .end local v9    # "metadataString":Ljava/lang/String;
    .end local v10    # "metadata":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v11    # "quotedPrintable":Z
    .end local v12    # "quotedPrintableCharset":Ljava/lang/String;
    .end local v16    # "matcher":Ljava/util/regex/Matcher;
    goto/16 :goto_0
.end method

.method private static maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuilder;)V
    .locals 1
    .param p0, "components"    # [Ljava/lang/String;
    .param p1, "i"    # I
    .param p2, "newName"    # Ljava/lang/StringBuilder;

    .line 349
    aget-object v0, p0, p1

    if-eqz v0, :cond_1

    aget-object v0, p0, p1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 350
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 351
    const/16 v0, 0x20

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    :cond_0
    aget-object v0, p0, p1

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    :cond_1
    return-void
.end method

.method private static maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p0, "fragmentBuffer"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/StringBuilder;

    .line 245
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 246
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 248
    .local v0, "fragmentBytes":[B
    if-nez p1, :cond_0

    .line 249
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 250
    .local v1, "fragment":Ljava/lang/String;
    goto :goto_0

    .line 252
    .end local v1    # "fragment":Ljava/lang/String;
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .restart local v1    # "fragment":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "fragment":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 254
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    move-object v1, v2

    .line 257
    .local v1, "fragment":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 258
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .end local v0    # "fragmentBytes":[B
    .end local v1    # "fragment":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private static toPrimaryValue(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 271
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    return-object v0
.end method

.method private static toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 275
    .local p0, "lists":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 278
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 279
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 285
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 279
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 280
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 281
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 282
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "value":Ljava/lang/String;
    goto :goto_0

    .line 276
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static toTypes(Ljava/util/Collection;)[Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 289
    .local p0, "lists":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 292
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 293
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 310
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 293
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 294
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 295
    .local v3, "type":Ljava/lang/String;
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-lt v4, v5, :cond_2

    .end local v4    # "i":I
    goto :goto_2

    .line 296
    .restart local v4    # "i":I
    :cond_2
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 297
    .local v5, "metadatum":Ljava/lang/String;
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 298
    .local v6, "equals":I
    if-gez v6, :cond_3

    .line 300
    move-object v3, v5

    .line 301
    goto :goto_2

    .line 303
    :cond_3
    const-string v7, "TYPE"

    const/4 v8, 0x0

    invoke-virtual {v5, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 304
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 305
    nop

    .line 308
    .end local v4    # "i":I
    .end local v5    # "metadatum":Ljava/lang/String;
    .end local v6    # "equals":I
    :goto_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "type":Ljava/lang/String;
    goto :goto_0

    .line 295
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "type":Ljava/lang/String;
    .restart local v4    # "i":I
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 290
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "type":Ljava/lang/String;
    .end local v4    # "i":I
    :cond_5
    :goto_3
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .locals 37
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 54
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/VCardResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "rawText":Ljava/lang/String;
    sget-object v1, Lcom/google/zxing/client/result/VCardResultParser;->BEGIN_VCARD:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 56
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    move-object/from16 v27, v0

    move-object/from16 v26, v1

    goto/16 :goto_3

    .line 59
    :cond_0
    const-string v2, "FN"

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v2

    .line 60
    .local v2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    if-nez v2, :cond_1

    .line 62
    const-string v6, "N"

    invoke-static {v6, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v2

    .line 63
    invoke-static {v2}, Lcom/google/zxing/client/result/VCardResultParser;->formatNames(Ljava/lang/Iterable;)V

    .line 65
    :cond_1
    const-string v6, "NICKNAME"

    invoke-static {v6, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v6

    .line 66
    .local v6, "nicknameString":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v6, :cond_2

    const/4 v10, 0x0

    goto :goto_0

    :cond_2
    sget-object v7, Lcom/google/zxing/client/result/VCardResultParser;->COMMA:Ljava/util/regex/Pattern;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/CharSequence;

    invoke-virtual {v7, v8}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v7

    move-object v10, v7

    .line 67
    .local v10, "nicknames":[Ljava/lang/String;
    :goto_0
    const-string v7, "TEL"

    invoke-static {v7, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v7

    .line 68
    .local v7, "phoneNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v8, "EMAIL"

    invoke-static {v8, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v15

    .line 69
    .local v15, "emails":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v8, "NOTE"

    invoke-static {v8, v0, v5, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v14

    .line 70
    .local v14, "note":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v8, "ADR"

    invoke-static {v8, v0, v4, v4}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v13

    .line 71
    .local v13, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v8, "ORG"

    invoke-static {v8, v0, v4, v4}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v12

    .line 72
    .local v12, "org":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v8, "BDAY"

    invoke-static {v8, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v8

    .line 73
    .local v8, "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v8, :cond_3

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lcom/google/zxing/client/result/VCardResultParser;->isLikeVCardDate(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 74
    const/4 v8, 0x0

    .line 76
    .end local v8    # "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v11, "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    move-object v11, v8

    const-string v8, "TITLE"

    invoke-static {v8, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v9

    .line 77
    .local v9, "title":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v8, "URL"

    invoke-static {v8, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v8

    .line 78
    .local v8, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v3, "IMPP"

    invoke-static {v3, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v3

    .line 79
    .local v3, "instantMessenger":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v26, v1

    const-string v1, "GEO"

    .end local v1    # "m":Ljava/util/regex/Matcher;
    .local v26, "m":Ljava/util/regex/Matcher;
    invoke-static {v1, v0, v4, v5}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    .line 80
    .local v1, "geoString":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_4

    const/4 v4, 0x0

    goto :goto_1

    :cond_4
    sget-object v4, Lcom/google/zxing/client/result/VCardResultParser;->SEMICOLON_OR_COMMA:Ljava/util/regex/Pattern;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "geo":[Ljava/lang/String;
    :goto_1
    if-eqz v4, :cond_5

    array-length v5, v4

    move-object/from16 v27, v0

    const/4 v0, 0x2

    .end local v0    # "rawText":Ljava/lang/String;
    .local v27, "rawText":Ljava/lang/String;
    if-eq v5, v0, :cond_6

    .line 82
    const/4 v0, 0x0

    .end local v4    # "geo":[Ljava/lang/String;
    .local v0, "geo":[Ljava/lang/String;
    goto :goto_2

    .line 84
    .end local v27    # "rawText":Ljava/lang/String;
    .local v0, "rawText":Ljava/lang/String;
    .restart local v4    # "geo":[Ljava/lang/String;
    :cond_5
    move-object/from16 v27, v0

    .end local v0    # "rawText":Ljava/lang/String;
    .restart local v27    # "rawText":Ljava/lang/String;
    :cond_6
    move-object v0, v4

    .end local v4    # "geo":[Ljava/lang/String;
    .local v0, "geo":[Ljava/lang/String;
    :goto_2
    new-instance v4, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v2}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v5

    .line 85
    nop

    .line 86
    const/16 v16, 0x0

    .line 87
    invoke-static {v7}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v17

    .line 88
    invoke-static {v7}, Lcom/google/zxing/client/result/VCardResultParser;->toTypes(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v18

    .line 89
    invoke-static {v15}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v19

    .line 90
    invoke-static {v15}, Lcom/google/zxing/client/result/VCardResultParser;->toTypes(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v20

    .line 91
    invoke-static {v3}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object v21

    .line 92
    invoke-static {v14}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object v22

    .line 93
    invoke-static {v13}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v23

    .line 94
    invoke-static {v13}, Lcom/google/zxing/client/result/VCardResultParser;->toTypes(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v24

    .line 95
    invoke-static {v12}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object v25

    .line 96
    invoke-static {v11}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object v28

    .line 97
    invoke-static {v9}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object v29

    .line 98
    invoke-static {v8}, Lcom/google/zxing/client/result/VCardResultParser;->toPrimaryValues(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v30

    .line 99
    nop

    .line 84
    move-object/from16 v31, v8

    move-object v8, v4

    .end local v8    # "urls":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .local v31, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    move-object/from16 v32, v9

    move-object v9, v5

    .end local v9    # "title":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v32, "title":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v5, v11

    move-object/from16 v11, v16

    .end local v11    # "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v5, "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v33, v12

    move-object/from16 v12, v17

    .end local v12    # "org":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v33, "org":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v34, v13

    move-object/from16 v13, v18

    .end local v13    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .local v34, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    move-object/from16 v35, v14

    move-object/from16 v14, v19

    .end local v14    # "note":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v35, "note":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v36, v15

    move-object/from16 v15, v20

    .end local v15    # "emails":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .local v36, "emails":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    move-object/from16 v16, v21

    move-object/from16 v17, v22

    move-object/from16 v18, v23

    move-object/from16 v19, v24

    move-object/from16 v20, v25

    move-object/from16 v21, v28

    move-object/from16 v22, v29

    move-object/from16 v23, v30

    move-object/from16 v24, v0

    invoke-direct/range {v8 .. v24}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v4

    .line 57
    .end local v2    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v3    # "instantMessenger":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "birthday":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "nicknameString":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "phoneNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v10    # "nicknames":[Ljava/lang/String;
    .end local v26    # "m":Ljava/util/regex/Matcher;
    .end local v27    # "rawText":Ljava/lang/String;
    .end local v31    # "urls":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v32    # "title":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v33    # "org":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v34    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v35    # "note":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v36    # "emails":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    .local v0, "rawText":Ljava/lang/String;
    .local v1, "m":Ljava/util/regex/Matcher;
    :cond_7
    move-object/from16 v27, v0

    move-object/from16 v26, v1

    .end local v0    # "rawText":Ljava/lang/String;
    .end local v1    # "m":Ljava/util/regex/Matcher;
    .restart local v26    # "m":Ljava/util/regex/Matcher;
    .restart local v27    # "rawText":Ljava/lang/String;
    :goto_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/VCardResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object p1

    return-object p1
.end method
