.class public final Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
.super Ljava/lang/Object;
.source "ReedSolomonDecoder.java"


# instance fields
.field private final field:Lcom/google/zxing/common/reedsolomon/GenericGF;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V
    .locals 0
    .param p1, "field"    # Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 47
    return-void
.end method

.method private findErrorLocations(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[I
    .locals 5
    .param p1, "errorLocator"    # Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    .line 145
    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v0

    .line 146
    .local v0, "numErrors":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 147
    new-array v2, v1, [I

    const/4 v3, 0x0

    invoke-virtual {p1, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v1

    aput v1, v2, v3

    return-object v2

    .line 149
    :cond_0
    new-array v1, v0, [I

    .line 150
    .local v1, "result":[I
    const/4 v2, 0x0

    .line 151
    .local v2, "e":I
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getSize()I

    move-result v4

    if-ge v3, v4, :cond_3

    if-lt v2, v0, :cond_1

    .end local v3    # "i":I
    goto :goto_1

    .line 152
    .restart local v3    # "i":I
    :cond_1
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v4

    if-nez v4, :cond_2

    .line 153
    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v4, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v4

    aput v4, v1, v2

    .line 154
    add-int/lit8 v2, v2, 0x1

    .line 151
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 157
    .end local v3    # "i":I
    :cond_3
    :goto_1
    if-ne v2, v0, :cond_4

    .line 160
    return-object v1

    .line 158
    :cond_4
    new-instance v3, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v4, "Error locator degree does not match number of roots"

    invoke-direct {v3, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private findErrorMagnitudes(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;[I)[I
    .locals 9
    .param p1, "errorEvaluator"    # Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .param p2, "errorLocations"    # [I

    .line 165
    array-length v0, p2

    .line 166
    .local v0, "s":I
    new-array v1, v0, [I

    .line 167
    .local v1, "result":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 187
    .end local v2    # "i":I
    return-object v1

    .line 168
    .restart local v2    # "i":I
    :cond_0
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v4, p2, v2

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v3

    .line 169
    .local v3, "xiInverse":I
    const/4 v4, 0x1

    .line 170
    .local v4, "denominator":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    if-lt v5, v0, :cond_2

    .line 181
    .end local v5    # "j":I
    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {p1, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v6

    .line 182
    iget-object v7, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v7, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v7

    .line 181
    invoke-virtual {v5, v6, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v5

    aput v5, v1, v2

    .line 183
    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getGeneratorBase()I

    move-result v5

    if-eqz v5, :cond_1

    .line 184
    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v6, v1, v2

    invoke-virtual {v5, v6, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v5

    aput v5, v1, v2

    .line 167
    .end local v3    # "xiInverse":I
    .end local v4    # "denominator":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    .restart local v3    # "xiInverse":I
    .restart local v4    # "denominator":I
    .restart local v5    # "j":I
    :cond_2
    if-eq v2, v5, :cond_4

    .line 176
    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v7, p2, v5

    invoke-virtual {v6, v7, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v6

    .line 177
    .local v6, "term":I
    and-int/lit8 v7, v6, 0x1

    if-nez v7, :cond_3

    or-int/lit8 v7, v6, 0x1

    goto :goto_2

    :cond_3
    and-int/lit8 v7, v6, -0x2

    .line 178
    .local v7, "termPlus1":I
    :goto_2
    iget-object v8, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v4, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v4

    .line 170
    .end local v6    # "term":I
    .end local v7    # "termPlus1":I
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1
.end method

.method private runEuclideanAlgorithm(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;Lcom/google/zxing/common/reedsolomon/GenericGFPoly;I)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .locals 12
    .param p1, "a"    # Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .param p2, "b"    # Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .param p3, "R"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    .line 91
    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v0

    invoke-virtual {p2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 92
    move-object v0, p1

    .line 93
    .local v0, "temp":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    move-object p1, p2

    .line 94
    move-object p2, v0

    .line 97
    .end local v0    # "temp":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    :cond_0
    move-object v0, p1

    .line 98
    .local v0, "rLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    move-object v1, p2

    .line 99
    .local v1, "r":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v2}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v2

    .line 100
    .local v2, "tLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getOne()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v3

    .line 103
    .local v3, "t":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    :goto_0
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v4

    div-int/lit8 v5, p3, 0x2

    if-ge v4, v5, :cond_2

    .line 132
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v5

    .line 133
    .local v5, "sigmaTildeAtZero":I
    if-eqz v5, :cond_1

    .line 137
    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v6, v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v6

    .line 138
    .local v6, "inverse":I
    invoke-virtual {v3, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v7

    .line 139
    .local v7, "sigma":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    invoke-virtual {v1, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    .line 140
    .local v8, "omega":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    const/4 v9, 0x2

    new-array v9, v9, [Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    aput-object v7, v9, v4

    const/4 v4, 0x1

    aput-object v8, v9, v4

    return-object v9

    .line 134
    .end local v6    # "inverse":I
    .end local v7    # "sigma":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v8    # "omega":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    :cond_1
    new-instance v4, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v6, "sigmaTilde(0) was zero"

    invoke-direct {v4, v6}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 104
    .end local v5    # "sigmaTildeAtZero":I
    :cond_2
    move-object v4, v0

    .line 105
    .local v4, "rLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    move-object v5, v2

    .line 106
    .local v5, "tLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    move-object v0, v1

    .line 107
    move-object v2, v3

    .line 110
    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v6

    if-nez v6, :cond_6

    .line 114
    move-object v1, v4

    .line 115
    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v6}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    .line 116
    .local v6, "q":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v7

    invoke-virtual {v0, v7}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v7

    .line 117
    .local v7, "denominatorLeadingTerm":I
    iget-object v8, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v8

    .line 118
    .local v8, "dltInverse":I
    :goto_1
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    if-lt v9, v10, :cond_4

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v9

    if-eqz v9, :cond_3

    goto :goto_2

    .line 119
    :cond_3
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    sub-int/2addr v9, v10

    .line 120
    .local v9, "degreeDiff":I
    iget-object v10, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v11

    invoke-virtual {v10, v11, v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v10

    .line 121
    .local v10, "scale":I
    iget-object v11, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v11, v9, v10}, Lcom/google/zxing/common/reedsolomon/GenericGF;->buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v11

    invoke-virtual {v6, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    .line 122
    invoke-virtual {v0, v9, v10}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiplyByMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v1

    .end local v9    # "degreeDiff":I
    .end local v10    # "scale":I
    goto :goto_1

    .line 125
    :cond_4
    :goto_2
    invoke-virtual {v6, v2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v3

    .line 127
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    if-ge v9, v10, :cond_5

    .end local v4    # "rLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v5    # "tLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v6    # "q":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v7    # "denominatorLeadingTerm":I
    .end local v8    # "dltInverse":I
    goto/16 :goto_0

    .line 128
    .restart local v4    # "rLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .restart local v5    # "tLastLast":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .restart local v6    # "q":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .restart local v7    # "denominatorLeadingTerm":I
    .restart local v8    # "dltInverse":I
    :cond_5
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "Division algorithm failed to reduce polynomial?"

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 112
    .end local v6    # "q":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v7    # "denominatorLeadingTerm":I
    .end local v8    # "dltInverse":I
    :cond_6
    new-instance v6, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v7, "r_{i-1} was zero"

    invoke-direct {v6, v7}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v6
.end method


# virtual methods
.method public decode([II)V
    .locals 17
    .param p1, "received"    # [I
    .param p2, "twoS"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 59
    move/from16 v2, p2

    new-instance v3, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v4, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v3, v4, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    .line 60
    .local v3, "poly":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    new-array v4, v2, [I

    .line 61
    .local v4, "syndromeCoefficients":[I
    const/4 v5, 0x1

    .line 62
    .local v5, "noError":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/4 v7, 0x1

    if-lt v6, v2, :cond_3

    .line 69
    .end local v6    # "i":I
    if-eqz v5, :cond_0

    .line 70
    return-void

    .line 72
    :cond_0
    new-instance v6, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v6, v8, v4}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    .line 74
    .local v6, "syndrome":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v2, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    invoke-direct {v0, v8, v6, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->runEuclideanAlgorithm(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;Lcom/google/zxing/common/reedsolomon/GenericGFPoly;I)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    .line 73
    nop

    .line 75
    .local v8, "sigmaOmega":[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    const/4 v9, 0x0

    aget-object v9, v8, v9

    .line 76
    .local v9, "sigma":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    aget-object v10, v8, v7

    .line 77
    .local v10, "omega":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    invoke-direct {v0, v9}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->findErrorLocations(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[I

    move-result-object v11

    .line 78
    .local v11, "errorLocations":[I
    invoke-direct {v0, v10, v11}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->findErrorMagnitudes(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;[I)[I

    move-result-object v12

    .line 79
    .local v12, "errorMagnitudes":[I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    array-length v14, v11

    if-lt v13, v14, :cond_1

    .line 86
    .end local v13    # "i":I
    return-void

    .line 80
    .restart local v13    # "i":I
    :cond_1
    array-length v14, v1

    sub-int/2addr v14, v7

    iget-object v15, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v7, v11, v13

    invoke-virtual {v15, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->log(I)I

    move-result v7

    sub-int/2addr v14, v7

    .line 81
    .local v14, "position":I
    if-ltz v14, :cond_2

    .line 84
    aget v7, v1, v14

    aget v15, v12, v13

    invoke-static {v7, v15}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v7

    aput v7, v1, v14

    .line 79
    .end local v14    # "position":I
    add-int/lit8 v13, v13, 0x1

    const/4 v7, 0x1

    goto :goto_1

    .line 82
    .restart local v14    # "position":I
    :cond_2
    new-instance v7, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v15, "Bad error location"

    invoke-direct {v7, v15}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 63
    .end local v8    # "sigmaOmega":[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v9    # "sigma":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v10    # "omega":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v11    # "errorLocations":[I
    .end local v12    # "errorMagnitudes":[I
    .end local v13    # "i":I
    .end local v14    # "position":I
    .local v6, "i":I
    :cond_3
    iget-object v7, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getGeneratorBase()I

    move-result v8

    add-int/2addr v8, v6

    invoke-virtual {v7, v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->exp(I)I

    move-result v7

    invoke-virtual {v3, v7}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v7

    .line 64
    .local v7, "eval":I
    array-length v8, v4

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    sub-int/2addr v8, v6

    aput v7, v4, v8

    .line 65
    if-eqz v7, :cond_4

    .line 66
    const/4 v5, 0x0

    .line 62
    .end local v7    # "eval":I
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method
