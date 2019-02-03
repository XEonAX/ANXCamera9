.class public final Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "AddressBookDoCoMoResultParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method

.method private static parseName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .line 84
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 85
    .local v0, "comma":I
    if-ltz v0, :cond_29

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 89
    :cond_29
    return-object p0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .registers 31
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 40
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "rawText":Ljava/lang/String;
    const-string v1, "MECARD:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_e

    .line 42
    return-object v2

    .line 44
    :cond_e
    const-string v1, "N:"

    const/4 v3, 0x1

    invoke-static {v1, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "rawName":[Ljava/lang/String;
    if-nez v1, :cond_18

    .line 46
    return-object v2

    .line 48
    :cond_18
    const/4 v2, 0x0

    aget-object v4, v1, v2

    invoke-static {v4}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "name":Ljava/lang/String;
    const-string v5, "SOUND:"

    invoke-static {v5, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 50
    .local v5, "pronunciation":Ljava/lang/String;
    const-string v6, "TEL:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v23

    .line 51
    .local v23, "phoneNumbers":[Ljava/lang/String;
    const-string v6, "EMAIL:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v24

    .line 52
    .local v24, "emails":[Ljava/lang/String;
    const-string v6, "NOTE:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "note":Ljava/lang/String;
    const-string v6, "ADR:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v25

    .line 54
    .local v25, "addresses":[Ljava/lang/String;
    const-string v6, "BDAY:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 55
    .local v6, "birthday":Ljava/lang/String;
    const/16 v7, 0x8

    invoke-static {v6, v7}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->isStringOfDigits(Ljava/lang/CharSequence;I)Z

    move-result v7

    if-nez v7, :cond_4c

    .line 57
    const/4 v6, 0x0

    .line 59
    .end local v6    # "birthday":Ljava/lang/String;
    .local v26, "birthday":Ljava/lang/String;
    :cond_4c
    move-object/from16 v26, v6

    const-string v6, "URL:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v27

    .line 63
    .local v27, "urls":[Ljava/lang/String;
    const-string v6, "ORG:"

    invoke-static {v6, v0, v3}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 65
    .local v3, "org":Ljava/lang/String;
    new-instance v28, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v4}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 66
    const/4 v8, 0x0

    .line 67
    nop

    .line 68
    nop

    .line 69
    const/4 v11, 0x0

    .line 70
    nop

    .line 71
    const/4 v13, 0x0

    .line 72
    const/4 v14, 0x0

    .line 73
    nop

    .line 74
    nop

    .line 75
    const/16 v17, 0x0

    .line 76
    nop

    .line 77
    nop

    .line 78
    const/16 v20, 0x0

    .line 79
    nop

    .line 80
    const/16 v22, 0x0

    .line 65
    move-object/from16 v6, v28

    move-object v9, v5

    move-object/from16 v10, v23

    move-object/from16 v12, v24

    move-object v15, v2

    move-object/from16 v16, v25

    move-object/from16 v18, v3

    move-object/from16 v19, v26

    move-object/from16 v21, v27

    invoke-direct/range {v6 .. v22}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v28
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object p1

    return-object p1
.end method
