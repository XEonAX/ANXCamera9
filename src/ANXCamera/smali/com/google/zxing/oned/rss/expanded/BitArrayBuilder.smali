.class final Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;
.super Ljava/lang/Object;
.source "BitArrayBuilder.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method static buildBitArray(Ljava/util/List;)Lcom/google/zxing/common/BitArray;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)",
            "Lcom/google/zxing/common/BitArray;"
        }
    .end annotation

    .line 43
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 44
    .local v0, "charNumber":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v2

    if-nez v2, :cond_1b

    .line 45
    add-int/lit8 v0, v0, -0x1

    .line 48
    :cond_1b
    const/16 v2, 0xc

    mul-int/2addr v2, v0

    .line 50
    .local v2, "size":I
    new-instance v3, Lcom/google/zxing/common/BitArray;

    invoke-direct {v3, v2}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    .line 51
    .local v3, "binary":Lcom/google/zxing/common/BitArray;
    const/4 v4, 0x0

    .line 53
    .local v4, "accPos":I
    const/4 v5, 0x0

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 54
    .local v5, "firstPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v6

    .line 55
    .local v6, "firstValue":I
    const/16 v7, 0xb

    .local v7, "i":I
    :goto_35
    if-gez v7, :cond_83

    .line 62
    .end local v7    # "i":I
    const/4 v7, 0x1

    .restart local v7    # "i":I
    move v8, v7

    .end local v7    # "i":I
    .local v8, "i":I
    :goto_39
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-lt v8, v7, :cond_40

    .line 83
    .end local v8    # "i":I
    return-object v3

    .line 63
    .restart local v8    # "i":I
    :cond_40
    invoke-interface {p0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 65
    .local v9, "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v10

    .line 66
    .local v10, "leftValue":I
    const/16 v7, 0xb

    .local v7, "j":I
    :goto_51
    if-gez v7, :cond_76

    .line 73
    .end local v7    # "j":I
    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    if-eqz v7, :cond_73

    .line 74
    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v7

    .line 75
    .local v7, "rightValue":I
    const/16 v11, 0xb

    .local v11, "j":I
    :goto_63
    if-gez v11, :cond_66

    .end local v7    # "rightValue":I
    .end local v9    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v10    # "leftValue":I
    .end local v11    # "j":I
    goto :goto_73

    .line 76
    .restart local v7    # "rightValue":I
    .restart local v9    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .restart local v10    # "leftValue":I
    .restart local v11    # "j":I
    :cond_66
    shl-int v12, v1, v11

    and-int/2addr v12, v7

    if-eqz v12, :cond_6e

    .line 77
    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    .line 79
    :cond_6e
    add-int/lit8 v4, v4, 0x1

    .line 75
    add-int/lit8 v11, v11, -0x1

    goto :goto_63

    .line 62
    .end local v7    # "rightValue":I
    .end local v9    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v10    # "leftValue":I
    .end local v11    # "j":I
    :cond_73
    :goto_73
    add-int/lit8 v8, v8, 0x1

    goto :goto_39

    .line 67
    .local v7, "j":I
    .restart local v9    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .restart local v10    # "leftValue":I
    :cond_76
    shl-int v11, v1, v7

    and-int/2addr v11, v10

    if-eqz v11, :cond_7e

    .line 68
    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    .line 70
    :cond_7e
    add-int/lit8 v4, v4, 0x1

    .line 66
    add-int/lit8 v7, v7, -0x1

    goto :goto_51

    .line 56
    .end local v8    # "i":I
    .end local v9    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v10    # "leftValue":I
    .local v7, "i":I
    :cond_83
    shl-int v8, v1, v7

    and-int/2addr v8, v6

    if-eqz v8, :cond_8b

    .line 57
    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    .line 59
    :cond_8b
    add-int/lit8 v4, v4, 0x1

    .line 55
    add-int/lit8 v7, v7, -0x1

    goto :goto_35
.end method
