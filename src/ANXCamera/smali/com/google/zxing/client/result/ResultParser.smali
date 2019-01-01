.class public abstract Lcom/google/zxing/client/result/ResultParser;
.super Ljava/lang/Object;
.source "ResultParser.java"


# static fields
.field private static final AMPERSAND:Ljava/util/regex/Pattern;

.field private static final BYTE_ORDER_MARK:Ljava/lang/String; = "\ufeff"

.field private static final DIGITS:Ljava/util/regex/Pattern;

.field private static final EQUALS:Ljava/util/regex/Pattern;

.field private static final PARSERS:[Lcom/google/zxing/client/result/ResultParser;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 42
    const/16 v0, 0x14

    new-array v0, v0, [Lcom/google/zxing/client/result/ResultParser;

    .line 43
    new-instance v1, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 44
    new-instance v1, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;-><init>()V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 45
    new-instance v1, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;-><init>()V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 46
    new-instance v1, Lcom/google/zxing/client/result/AddressBookAUResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;-><init>()V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 47
    new-instance v1, Lcom/google/zxing/client/result/VCardResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VCardResultParser;-><init>()V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 48
    new-instance v1, Lcom/google/zxing/client/result/BizcardResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/BizcardResultParser;-><init>()V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 49
    new-instance v1, Lcom/google/zxing/client/result/VEventResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VEventResultParser;-><init>()V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 50
    new-instance v1, Lcom/google/zxing/client/result/EmailAddressResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/EmailAddressResultParser;-><init>()V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 51
    new-instance v1, Lcom/google/zxing/client/result/SMTPResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMTPResultParser;-><init>()V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    .line 52
    new-instance v1, Lcom/google/zxing/client/result/TelResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/TelResultParser;-><init>()V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 53
    new-instance v1, Lcom/google/zxing/client/result/SMSMMSResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMSMMSResultParser;-><init>()V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    .line 54
    new-instance v1, Lcom/google/zxing/client/result/SMSTOMMSTOResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMSTOMMSTOResultParser;-><init>()V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    .line 55
    new-instance v1, Lcom/google/zxing/client/result/GeoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/GeoResultParser;-><init>()V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    .line 56
    new-instance v1, Lcom/google/zxing/client/result/WifiResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/WifiResultParser;-><init>()V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    .line 57
    new-instance v1, Lcom/google/zxing/client/result/URLTOResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/URLTOResultParser;-><init>()V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    .line 58
    new-instance v1, Lcom/google/zxing/client/result/URIResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/URIResultParser;-><init>()V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    .line 59
    new-instance v1, Lcom/google/zxing/client/result/ISBNResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ISBNResultParser;-><init>()V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    .line 60
    new-instance v1, Lcom/google/zxing/client/result/ProductResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ProductResultParser;-><init>()V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    .line 61
    new-instance v1, Lcom/google/zxing/client/result/ExpandedProductResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;-><init>()V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    .line 62
    new-instance v1, Lcom/google/zxing/client/result/VINResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VINResultParser;-><init>()V

    const/16 v2, 0x13

    aput-object v1, v0, v2

    .line 42
    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->PARSERS:[Lcom/google/zxing/client/result/ResultParser;

    .line 65
    const-string v0, "\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    .line 66
    const-string v0, "&"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->AMPERSAND:Ljava/util/regex/Pattern;

    .line 67
    const-string v0, "="

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->EQUALS:Ljava/util/regex/Pattern;

    .line 68
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendKeyValue(Ljava/lang/CharSequence;Ljava/util/Map;)V
    .locals 4
    .param p0, "keyValue"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 177
    .local p1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->EQUALS:Ljava/util/regex/Pattern;

    const/4 v1, 0x2

    invoke-virtual {v0, p0, v1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;I)[Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "keyValueTokens":[Ljava/lang/String;
    array-length v2, v0

    if-ne v2, v1, :cond_0

    .line 179
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 180
    .local v1, "key":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v0, v2

    .line 182
    .local v2, "value":Ljava/lang/String;
    :try_start_0
    invoke-static {v2}, Lcom/google/zxing/client/result/ResultParser;->urlDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    .line 183
    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    goto :goto_0

    :catch_0
    move-exception v3

    .line 188
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void
.end method

.method protected static getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;
    .locals 2
    .param p0, "result"    # Lcom/google/zxing/Result;

    .line 81
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "text":Ljava/lang/String;
    const-string v1, "\ufeff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 85
    :cond_0
    return-object v0
.end method

.method protected static isStringOfDigits(Ljava/lang/CharSequence;I)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "length"    # I

    .line 153
    if-eqz p0, :cond_0

    if-lez p1, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected static isSubstringOfDigits(Ljava/lang/CharSequence;II)Z
    .locals 4
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .line 157
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    add-int v1, p1, p2

    .line 161
    .local v1, "max":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v2, v1, :cond_1

    sget-object v2, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    invoke-interface {p0, p1, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 158
    .end local v1    # "max":I
    :cond_2
    :goto_0
    return v0
.end method

.method static matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;
    .locals 7
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "endChar"    # C
    .param p3, "trim"    # Z

    .line 199
    const/4 v0, 0x0

    .line 200
    .local v0, "matches":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 201
    .local v1, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 202
    .local v2, "max":I
    :goto_0
    if-lt v1, v2, :cond_0

    goto :goto_1

    .line 203
    :cond_0
    invoke-virtual {p1, p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 204
    if-gez v1, :cond_3

    .line 205
    nop

    .line 236
    :goto_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    .line 239
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    .line 237
    :cond_2
    :goto_2
    const/4 v3, 0x0

    return-object v3

    .line 207
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    .line 208
    move v3, v1

    .line 209
    .local v3, "start":I
    const/4 v4, 0x1

    .line 210
    .local v4, "more":Z
    :goto_3
    if-nez v4, :cond_4

    .end local v3    # "start":I
    .end local v4    # "more":Z
    goto :goto_0

    .line 211
    .restart local v3    # "start":I
    .restart local v4    # "more":Z
    :cond_4
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 212
    if-gez v1, :cond_5

    .line 214
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 215
    const/4 v4, 0x0

    .line 216
    goto :goto_3

    :cond_5
    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_6

    .line 218
    add-int/lit8 v1, v1, 0x1

    .line 219
    goto :goto_3

    .line 221
    :cond_6
    if-nez v0, :cond_7

    .line 222
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x3

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v5

    .line 224
    :cond_7
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/zxing/client/result/ResultParser;->unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, "element":Ljava/lang/String;
    if-eqz p3, :cond_8

    .line 226
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 228
    :cond_8
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_9

    .line 229
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    :cond_9
    add-int/lit8 v1, v1, 0x1

    .line 232
    const/4 v4, 0x0

    .end local v5    # "element":Ljava/lang/String;
    goto :goto_3
.end method

.method static matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "endChar"    # C
    .param p3, "trim"    # Z

    .line 243
    invoke-static {p0, p1, p2, p3}, Lcom/google/zxing/client/result/ResultParser;->matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, "matches":[Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_0
    return-object v1
.end method

.method protected static maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .line 99
    if-eqz p0, :cond_0

    .line 100
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_0
    return-void
.end method

.method protected static maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p0, "value"    # [Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .line 106
    if-eqz p0, :cond_1

    .line 107
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    :cond_0
    aget-object v2, p0, v1

    .line 108
    .local v2, "s":Ljava/lang/String;
    const/16 v3, 0xa

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .end local v2    # "s":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    :cond_1
    :goto_1
    return-void
.end method

.method protected static maybeWrap(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .line 115
    if-nez p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    :goto_0
    return-object v0
.end method

.method protected static parseHexDigit(C)I
    .locals 2
    .param p0, "c"    # C

    .line 140
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 141
    add-int/lit8 v0, p0, -0x30

    return v0

    .line 143
    :cond_0
    const/16 v0, 0xa

    const/16 v1, 0x61

    if-lt p0, v1, :cond_1

    const/16 v1, 0x66

    if-gt p0, v1, :cond_1

    .line 144
    add-int/lit8 v1, p0, -0x61

    add-int/2addr v0, v1

    return v0

    .line 146
    :cond_1
    const/16 v1, 0x41

    if-lt p0, v1, :cond_2

    const/16 v1, 0x46

    if-gt p0, v1, :cond_2

    .line 147
    add-int/lit8 v1, p0, -0x41

    add-int/2addr v0, v1

    return v0

    .line 149
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method static parseNameValuePairs(Ljava/lang/String;)Ljava/util/Map;
    .locals 6
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 165
    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 166
    .local v0, "paramStart":I
    if-gez v0, :cond_0

    .line 167
    const/4 v1, 0x0

    return-object v1

    .line 169
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 170
    .local v1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v2, Lcom/google/zxing/client/result/ResultParser;->AMPERSAND:Ljava/util/regex/Pattern;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v3, :cond_1

    .line 173
    return-object v1

    .line 170
    :cond_1
    aget-object v5, v2, v4

    .line 171
    .local v5, "keyValue":Ljava/lang/String;
    invoke-static {v5, v1}, Lcom/google/zxing/client/result/ResultParser;->appendKeyValue(Ljava/lang/CharSequence;Ljava/util/Map;)V

    .line 170
    .end local v5    # "keyValue":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 5
    .param p0, "theResult"    # Lcom/google/zxing/Result;

    .line 89
    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->PARSERS:[Lcom/google/zxing/client/result/ResultParser;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_0

    .line 95
    new-instance v0, Lcom/google/zxing/client/result/TextParsedResult;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/client/result/TextParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 89
    :cond_0
    aget-object v3, v0, v2

    .line 90
    .local v3, "parser":Lcom/google/zxing/client/result/ResultParser;
    invoke-virtual {v3, p0}, Lcom/google/zxing/client/result/ResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v4

    .line 91
    .local v4, "result":Lcom/google/zxing/client/result/ParsedResult;
    if-eqz v4, :cond_1

    .line 92
    return-object v4

    .line 89
    .end local v3    # "parser":Lcom/google/zxing/client/result/ResultParser;
    .end local v4    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected static unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "escaped"    # Ljava/lang/String;

    .line 119
    const/16 v0, 0x5c

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 120
    .local v1, "backslash":I
    if-gez v1, :cond_0

    .line 121
    return-object p0

    .line 123
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 124
    .local v2, "max":I
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v2, -0x1

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 125
    .local v3, "unescaped":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 126
    const/4 v4, 0x0

    .line 127
    .local v4, "nextIsEscaped":Z
    move v5, v1

    .local v5, "i":I
    :goto_0
    if-lt v5, v2, :cond_1

    .line 136
    .end local v5    # "i":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 128
    .restart local v5    # "i":I
    :cond_1
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 129
    .local v6, "c":C
    if-nez v4, :cond_3

    if-eq v6, v0, :cond_2

    goto :goto_1

    .line 133
    :cond_2
    const/4 v4, 0x1

    .end local v6    # "c":C
    goto :goto_2

    .line 130
    .restart local v6    # "c":C
    :cond_3
    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    const/4 v4, 0x0

    .line 132
    nop

    .line 127
    .end local v6    # "c":C
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method static urlDecode(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "encoded"    # Ljava/lang/String;

    .line 192
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 193
    :catch_0
    move-exception v0

    .line 194
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public abstract parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
.end method
