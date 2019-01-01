.class public final Lcom/google/zxing/client/result/ExpandedProductResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "ExpandedProductResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static findAIvalue(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "i"    # I
    .param p1, "rawText"    # Ljava/lang/String;

    .line 139
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 141
    .local v0, "c":C
    const/4 v1, 0x0

    const/16 v2, 0x28

    if-eq v0, v2, :cond_0

    .line 142
    return-object v1

    .line 145
    :cond_0
    add-int/lit8 v2, p0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "rawTextAux":Ljava/lang/CharSequence;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .local v3, "buf":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, "index":I
    :goto_0
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lt v4, v5, :cond_1

    .line 158
    .end local v4    # "index":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 149
    .restart local v4    # "index":I
    :cond_1
    invoke-interface {v2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    .line 150
    .local v5, "currentChar":C
    const/16 v6, 0x29

    if-ne v5, v6, :cond_2

    .line 151
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 152
    :cond_2
    const/16 v6, 0x30

    if-lt v5, v6, :cond_3

    const/16 v6, 0x39

    if-gt v5, v6, :cond_3

    .line 153
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 154
    nop

    .line 148
    .end local v5    # "currentChar":C
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 155
    .restart local v5    # "currentChar":C
    :cond_3
    return-object v1
.end method

.method private static findValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "i"    # I
    .param p1, "rawText"    # Ljava/lang/String;

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "rawTextAux":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    .end local v2    # "index":I
    goto :goto_1

    .line 166
    .restart local v2    # "index":I
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 167
    .local v3, "c":C
    const/16 v4, 0x28

    if-ne v3, v4, :cond_2

    .line 170
    invoke-static {v2, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findAIvalue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    .line 171
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 175
    goto :goto_2

    .line 179
    .end local v2    # "index":I
    .end local v3    # "c":C
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 176
    .restart local v2    # "index":I
    .restart local v3    # "c":C
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 165
    .end local v3    # "c":C
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;
    .locals 34
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 45
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v0

    .line 46
    .local v0, "format":Lcom/google/zxing/BarcodeFormat;
    sget-object v1, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 48
    return-object v2

    .line 50
    :cond_0
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "rawText":Ljava/lang/String;
    const/4 v3, 0x0

    .line 53
    .local v3, "productID":Ljava/lang/String;
    const/4 v4, 0x0

    .line 54
    .local v4, "sscc":Ljava/lang/String;
    const/4 v5, 0x0

    .line 55
    .local v5, "lotNumber":Ljava/lang/String;
    const/4 v6, 0x0

    .line 56
    .local v6, "productionDate":Ljava/lang/String;
    const/4 v7, 0x0

    .line 57
    .local v7, "packagingDate":Ljava/lang/String;
    const/4 v8, 0x0

    .line 58
    .local v8, "bestBeforeDate":Ljava/lang/String;
    const/4 v9, 0x0

    .line 59
    .local v9, "expirationDate":Ljava/lang/String;
    const/4 v10, 0x0

    .line 60
    .local v10, "weight":Ljava/lang/String;
    const/4 v11, 0x0

    .line 61
    .local v11, "weightType":Ljava/lang/String;
    const/4 v12, 0x0

    .line 62
    .local v12, "weightIncrement":Ljava/lang/String;
    const/4 v13, 0x0

    .line 63
    .local v13, "price":Ljava/lang/String;
    const/4 v14, 0x0

    .line 64
    .local v14, "priceIncrement":Ljava/lang/String;
    const/4 v15, 0x0

    .line 65
    .local v15, "priceCurrency":Ljava/lang/String;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 67
    .local v2, "uncommonAIs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v16, 0x0

    .line 69
    .local v16, "i":I
    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move-object/from16 v22, v5

    move-object/from16 v23, v6

    move-object/from16 v24, v7

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    move-object/from16 v27, v10

    move-object/from16 v28, v11

    move-object/from16 v29, v12

    move-object/from16 v30, v13

    move-object/from16 v31, v14

    move-object/from16 v32, v15

    move/from16 v15, v16

    .end local v3    # "productID":Ljava/lang/String;
    .end local v4    # "sscc":Ljava/lang/String;
    .end local v5    # "lotNumber":Ljava/lang/String;
    .end local v6    # "productionDate":Ljava/lang/String;
    .end local v7    # "packagingDate":Ljava/lang/String;
    .end local v8    # "bestBeforeDate":Ljava/lang/String;
    .end local v9    # "expirationDate":Ljava/lang/String;
    .end local v10    # "weight":Ljava/lang/String;
    .end local v11    # "weightType":Ljava/lang/String;
    .end local v12    # "weightIncrement":Ljava/lang/String;
    .end local v13    # "price":Ljava/lang/String;
    .end local v14    # "priceIncrement":Ljava/lang/String;
    .end local v16    # "i":I
    .local v15, "i":I
    .local v20, "productID":Ljava/lang/String;
    .local v21, "sscc":Ljava/lang/String;
    .local v22, "lotNumber":Ljava/lang/String;
    .local v23, "productionDate":Ljava/lang/String;
    .local v24, "packagingDate":Ljava/lang/String;
    .local v25, "bestBeforeDate":Ljava/lang/String;
    .local v26, "expirationDate":Ljava/lang/String;
    .local v27, "weight":Ljava/lang/String;
    .local v28, "weightType":Ljava/lang/String;
    .local v29, "weightIncrement":Ljava/lang/String;
    .local v30, "price":Ljava/lang/String;
    .local v31, "priceIncrement":Ljava/lang/String;
    .local v32, "priceCurrency":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v15, v3, :cond_1

    .line 121
    new-instance v19, Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    .line 122
    nop

    .line 123
    nop

    .line 124
    nop

    .line 125
    nop

    .line 126
    nop

    .line 127
    nop

    .line 128
    nop

    .line 129
    nop

    .line 130
    nop

    .line 131
    nop

    .line 132
    nop

    .line 133
    nop

    .line 134
    nop

    .line 135
    nop

    .line 121
    move-object/from16 v3, v19

    move-object v4, v1

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v7, v22

    move-object/from16 v8, v23

    move-object/from16 v9, v24

    move-object/from16 v10, v25

    move-object/from16 v11, v26

    move-object/from16 v12, v27

    move-object/from16 v13, v28

    move-object/from16 v14, v29

    move-object/from16 v33, v0

    move v0, v15

    move-object/from16 v15, v30

    .end local v15    # "i":I
    .local v0, "i":I
    .local v33, "format":Lcom/google/zxing/BarcodeFormat;
    move-object/from16 v16, v31

    move-object/from16 v17, v32

    move-object/from16 v18, v2

    invoke-direct/range {v3 .. v18}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v19

    .line 70
    .end local v33    # "format":Lcom/google/zxing/BarcodeFormat;
    .local v0, "format":Lcom/google/zxing/BarcodeFormat;
    .restart local v15    # "i":I
    :cond_1
    move-object/from16 v33, v0

    move v0, v15

    .end local v15    # "i":I
    .local v0, "i":I
    .restart local v33    # "format":Lcom/google/zxing/BarcodeFormat;
    invoke-static {v0, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findAIvalue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 71
    .local v3, "ai":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 74
    const/4 v4, 0x0

    return-object v4

    .line 76
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    add-int v15, v0, v4

    .line 77
    .end local v0    # "i":I
    .restart local v15    # "i":I
    invoke-static {v15, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v15, v4

    .line 81
    const-string v4, "00"

    if-ne v3, v4, :cond_3

    .line 82
    move-object/from16 v21, v0

    .line 83
    nop

    .line 69
    .end local v3    # "ai":Ljava/lang/String;
    .end local v33    # "format":Lcom/google/zxing/BarcodeFormat;
    .local v0, "format":Lcom/google/zxing/BarcodeFormat;
    :goto_1
    move-object/from16 v0, v33

    goto :goto_0

    .line 83
    .local v0, "value":Ljava/lang/String;
    .restart local v3    # "ai":Ljava/lang/String;
    .restart local v33    # "format":Lcom/google/zxing/BarcodeFormat;
    :cond_3
    const-string v4, "01"

    if-ne v3, v4, :cond_4

    .line 84
    move-object/from16 v20, v0

    .line 85
    goto :goto_1

    :cond_4
    const-string v4, "10"

    if-ne v3, v4, :cond_5

    .line 86
    move-object/from16 v22, v0

    .line 87
    goto :goto_1

    :cond_5
    const-string v4, "11"

    if-ne v3, v4, :cond_6

    .line 88
    move-object/from16 v23, v0

    .line 89
    goto :goto_1

    :cond_6
    const-string v4, "13"

    if-ne v3, v4, :cond_7

    .line 90
    move-object/from16 v24, v0

    .line 91
    goto :goto_1

    :cond_7
    const-string v4, "15"

    if-ne v3, v4, :cond_8

    .line 92
    move-object/from16 v25, v0

    .line 93
    goto :goto_1

    :cond_8
    const-string v4, "17"

    if-ne v3, v4, :cond_9

    .line 94
    move-object/from16 v26, v0

    .line 95
    goto :goto_1

    :cond_9
    const-string v4, "3100"

    const/4 v5, 0x3

    if-eq v3, v4, :cond_12

    const-string v4, "3101"

    if-eq v3, v4, :cond_12

    const-string v4, "3102"

    if-eq v3, v4, :cond_12

    const-string v4, "3103"

    if-eq v3, v4, :cond_12

    const-string v4, "3104"

    if-eq v3, v4, :cond_12

    const-string v4, "3105"

    if-eq v3, v4, :cond_12

    const-string v4, "3106"

    if-eq v3, v4, :cond_12

    const-string v4, "3107"

    if-eq v3, v4, :cond_12

    const-string v4, "3108"

    if-eq v3, v4, :cond_12

    const-string v4, "3109"

    if-ne v3, v4, :cond_a

    goto/16 :goto_5

    .line 99
    :cond_a
    const-string v4, "3200"

    if-eq v3, v4, :cond_11

    const-string v4, "3201"

    if-eq v3, v4, :cond_11

    const-string v4, "3202"

    if-eq v3, v4, :cond_11

    const-string v4, "3203"

    if-eq v3, v4, :cond_11

    const-string v4, "3204"

    if-eq v3, v4, :cond_11

    const-string v4, "3205"

    if-eq v3, v4, :cond_11

    const-string v4, "3206"

    if-eq v3, v4, :cond_11

    const-string v4, "3207"

    if-eq v3, v4, :cond_11

    const-string v4, "3208"

    if-eq v3, v4, :cond_11

    const-string v4, "3209"

    if-ne v3, v4, :cond_b

    goto :goto_4

    .line 103
    :cond_b
    const-string v4, "3920"

    if-eq v3, v4, :cond_10

    const-string v4, "3921"

    if-eq v3, v4, :cond_10

    const-string v4, "3922"

    if-eq v3, v4, :cond_10

    const-string v4, "3923"

    if-ne v3, v4, :cond_c

    goto :goto_3

    .line 106
    :cond_c
    const-string v4, "3930"

    if-eq v3, v4, :cond_e

    const-string v4, "3931"

    if-eq v3, v4, :cond_e

    const-string v4, "3932"

    if-eq v3, v4, :cond_e

    const-string v4, "3933"

    if-ne v3, v4, :cond_d

    goto :goto_2

    .line 118
    :cond_d
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v0    # "value":Ljava/lang/String;
    .end local v3    # "ai":Ljava/lang/String;
    goto/16 :goto_1

    .line 107
    .restart local v0    # "value":Ljava/lang/String;
    .restart local v3    # "ai":Ljava/lang/String;
    :cond_e
    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v6, 0x4

    if-ge v4, v6, :cond_f

    .line 111
    const/4 v4, 0x0

    return-object v4

    .line 113
    :cond_f
    const/4 v4, 0x0

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v30

    .line 114
    const/4 v6, 0x0

    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v32

    .line 115
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v31

    .line 116
    goto/16 :goto_1

    .line 104
    :cond_10
    :goto_3
    const/4 v4, 0x0

    move-object/from16 v30, v0

    .line 105
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v31

    .line 106
    goto/16 :goto_1

    .line 100
    :cond_11
    :goto_4
    const/4 v4, 0x0

    move-object/from16 v27, v0

    .line 101
    const-string v28, "LB"

    .line 102
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v29

    .line 103
    goto/16 :goto_1

    .line 96
    :cond_12
    :goto_5
    const/4 v4, 0x0

    move-object/from16 v27, v0

    .line 97
    const-string v28, "KG"

    .line 98
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v29

    .line 99
    goto/16 :goto_1
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    move-result-object p1

    return-object p1
.end method
