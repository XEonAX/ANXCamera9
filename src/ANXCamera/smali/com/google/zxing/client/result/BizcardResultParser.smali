.class public final Lcom/google/zxing/client/result/BizcardResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "BizcardResultParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method

.method private static buildName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "firstName"    # Ljava/lang/String;
    .param p1, "lastName"    # Ljava/lang/String;

    .line 93
    if-nez p0, :cond_3

    .line 94
    return-object p1

    .line 96
    :cond_3
    if-nez p1, :cond_7

    move-object v0, p0

    goto :goto_1c

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1c
    return-object v0
.end method

.method private static buildPhoneNumbers(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 6
    .param p0, "number1"    # Ljava/lang/String;
    .param p1, "number2"    # Ljava/lang/String;
    .param p2, "number3"    # Ljava/lang/String;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 76
    .local v0, "numbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p0, :cond_b

    .line 77
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_b
    if-eqz p1, :cond_10

    .line 80
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_10
    if-eqz p2, :cond_15

    .line 83
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    :cond_15
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 86
    .local v1, "size":I
    if-nez v1, :cond_1d

    .line 87
    const/4 v2, 0x0

    return-object v2

    .line 89
    :cond_1d
    new-array v2, v1, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .registers 31
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 39
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/BizcardResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "rawText":Ljava/lang/String;
    const-string v1, "BIZCARD:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 41
    const/4 v1, 0x0

    return-object v1

    .line 43
    :cond_e
    const-string v1, "N:"

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "firstName":Ljava/lang/String;
    const-string v3, "X:"

    invoke-static {v3, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "lastName":Ljava/lang/String;
    invoke-static {v1, v3}, Lcom/google/zxing/client/result/BizcardResultParser;->buildName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 46
    .local v4, "fullName":Ljava/lang/String;
    const-string v5, "T:"

    invoke-static {v5, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, "title":Ljava/lang/String;
    const-string v6, "C:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v23

    .line 48
    .local v23, "org":Ljava/lang/String;
    const-string v6, "A:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v24

    .line 49
    .local v24, "addresses":[Ljava/lang/String;
    const-string v6, "B:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v15

    .line 50
    .local v15, "phoneNumber1":Ljava/lang/String;
    const-string v6, "M:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v14

    .line 51
    .local v14, "phoneNumber2":Ljava/lang/String;
    const-string v6, "F:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v13

    .line 52
    .local v13, "phoneNumber3":Ljava/lang/String;
    const-string v6, "E:"

    invoke-static {v6, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "email":Ljava/lang/String;
    new-instance v25, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v4}, Lcom/google/zxing/client/result/BizcardResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 55
    const/4 v8, 0x0

    .line 56
    const/4 v9, 0x0

    .line 57
    invoke-static {v15, v14, v13}, Lcom/google/zxing/client/result/BizcardResultParser;->buildPhoneNumbers(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 58
    const/4 v11, 0x0

    .line 59
    invoke-static {v2}, Lcom/google/zxing/client/result/BizcardResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 60
    const/16 v16, 0x0

    .line 61
    const/16 v17, 0x0

    .line 62
    const/16 v18, 0x0

    .line 63
    nop

    .line 64
    const/16 v19, 0x0

    .line 65
    nop

    .line 66
    const/16 v20, 0x0

    .line 67
    nop

    .line 68
    const/16 v21, 0x0

    .line 69
    const/16 v22, 0x0

    .line 54
    move-object/from16 v6, v25

    move-object/from16 v26, v13

    move-object/from16 v13, v16

    .end local v13    # "phoneNumber3":Ljava/lang/String;
    .local v26, "phoneNumber3":Ljava/lang/String;
    move-object/from16 v27, v14

    move-object/from16 v14, v17

    .end local v14    # "phoneNumber2":Ljava/lang/String;
    .local v27, "phoneNumber2":Ljava/lang/String;
    move-object/from16 v28, v15

    move-object/from16 v15, v18

    .end local v15    # "phoneNumber1":Ljava/lang/String;
    .local v28, "phoneNumber1":Ljava/lang/String;
    move-object/from16 v16, v24

    move-object/from16 v17, v19

    move-object/from16 v18, v23

    move-object/from16 v19, v20

    move-object/from16 v20, v5

    invoke-direct/range {v6 .. v22}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v25
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/BizcardResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object p1

    return-object p1
.end method
