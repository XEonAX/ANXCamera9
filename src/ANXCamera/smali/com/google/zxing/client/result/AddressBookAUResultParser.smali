.class public final Lcom/google/zxing/client/result/AddressBookAUResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "AddressBookAUResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;
    .locals 4
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "max"    # I
    .param p2, "rawText"    # Ljava/lang/String;
    .param p3, "trim"    # Z

    .line 74
    const/4 v0, 0x0

    .line 75
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    if-le v1, p1, :cond_0

    .end local v1    # "i":I
    goto :goto_1

    .line 76
    .restart local v1    # "i":I
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd

    invoke-static {v2, p2, v3, p3}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 78
    nop

    .line 85
    .end local v1    # "i":I
    .end local v2    # "value":Ljava/lang/String;
    :goto_1
    if-nez v0, :cond_1

    .line 86
    const/4 v1, 0x0

    return-object v1

    .line 88
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 80
    .restart local v1    # "i":I
    .restart local v2    # "value":Ljava/lang/String;
    :cond_2
    if-nez v0, :cond_3

    .line 81
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v3

    .line 83
    :cond_3
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .end local v2    # "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .locals 26
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 36
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "rawText":Ljava/lang/String;
    const-string v1, "MEMORY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 44
    :cond_0
    const-string v1, "NAME1:"

    const/16 v3, 0xd

    const/4 v4, 0x1

    invoke-static {v1, v0, v3, v4}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "name":Ljava/lang/String;
    const-string v5, "NAME2:"

    invoke-static {v5, v0, v3, v4}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, "pronunciation":Ljava/lang/String;
    const-string v6, "TEL"

    const/4 v7, 0x3

    invoke-static {v6, v7, v0, v4}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;

    move-result-object v23

    .line 48
    .local v23, "phoneNumbers":[Ljava/lang/String;
    const-string v6, "MAIL"

    invoke-static {v6, v7, v0, v4}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;

    move-result-object v24

    .line 49
    .local v24, "emails":[Ljava/lang/String;
    const-string v6, "MEMORY:"

    const/4 v7, 0x0

    invoke-static {v6, v0, v3, v7}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v25

    .line 50
    .local v25, "note":Ljava/lang/String;
    const-string v6, "ADD:"

    invoke-static {v6, v0, v3, v4}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "address":Ljava/lang/String;
    if-nez v3, :cond_1

    :goto_0
    move-object/from16 v16, v2

    goto :goto_1

    :cond_1
    new-array v2, v4, [Ljava/lang/String;

    aput-object v3, v2, v7

    goto :goto_0

    .line 52
    .local v16, "addresses":[Ljava/lang/String;
    :goto_1
    new-instance v2, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 53
    const/4 v8, 0x0

    .line 54
    nop

    .line 55
    nop

    .line 56
    const/4 v11, 0x0

    .line 57
    nop

    .line 58
    const/4 v13, 0x0

    .line 59
    const/4 v14, 0x0

    .line 60
    nop

    .line 61
    nop

    .line 62
    const/16 v17, 0x0

    .line 63
    const/16 v18, 0x0

    .line 64
    const/16 v19, 0x0

    .line 65
    const/16 v20, 0x0

    .line 66
    const/16 v21, 0x0

    .line 67
    const/16 v22, 0x0

    .line 52
    move-object v6, v2

    move-object v9, v5

    move-object/from16 v10, v23

    move-object/from16 v12, v24

    move-object/from16 v15, v25

    invoke-direct/range {v6 .. v22}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v2

    .line 39
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "address":Ljava/lang/String;
    .end local v5    # "pronunciation":Ljava/lang/String;
    .end local v16    # "addresses":[Ljava/lang/String;
    .end local v23    # "phoneNumbers":[Ljava/lang/String;
    .end local v24    # "emails":[Ljava/lang/String;
    .end local v25    # "note":Ljava/lang/String;
    :cond_2
    :goto_2
    return-object v2
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object p1

    return-object p1
.end method
