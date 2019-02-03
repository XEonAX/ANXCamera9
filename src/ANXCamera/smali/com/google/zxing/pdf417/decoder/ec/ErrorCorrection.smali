.class public final Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;
.super Ljava/lang/Object;
.source "ErrorCorrection.java"


# instance fields
.field private final field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    sget-object v0, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->PDF417_GF:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    .line 36
    return-void
.end method

.method private findErrorLocations(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)[I
    .registers 7
    .param p1, "errorLocator"    # Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 150
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v0

    .line 151
    .local v0, "numErrors":I
    new-array v1, v0, [I

    .line 152
    .local v1, "result":[I
    const/4 v2, 0x0

    .line 153
    .local v2, "e":I
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_8
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->getSize()I

    move-result v4

    if-ge v3, v4, :cond_26

    if-lt v2, v0, :cond_13

    .end local v3    # "i":I
    goto :goto_26

    .line 154
    .restart local v3    # "i":I
    :cond_13
    invoke-virtual {p1, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->evaluateAt(I)I

    move-result v4

    if-nez v4, :cond_23

    .line 155
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v4, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->inverse(I)I

    move-result v4

    aput v4, v1, v2

    .line 156
    add-int/lit8 v2, v2, 0x1

    .line 153
    :cond_23
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 159
    .end local v3    # "i":I
    :cond_26
    :goto_26
    if-ne v2, v0, :cond_29

    .line 162
    return-object v1

    .line 160
    :cond_29
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v3

    throw v3
.end method

.method private findErrorMagnitudes(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;[I)[I
    .registers 14
    .param p1, "errorEvaluator"    # Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .param p2, "errorLocator"    # Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .param p3, "errorLocations"    # [I

    .line 168
    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v0

    .line 169
    .local v0, "errorLocatorDegree":I
    new-array v1, v0, [I

    .line 170
    .local v1, "formalDerivativeCoefficients":[I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_7
    if-le v2, v0, :cond_40

    .line 174
    .end local v2    # "i":I
    new-instance v2, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-direct {v2, v3, v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    move-object v3, v2

    .line 177
    .local v3, "formalDerivative":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    array-length v4, p3

    .line 178
    .local v4, "s":I
    new-array v5, v4, [I

    .line 179
    .local v5, "result":[I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_15
    if-lt v2, v4, :cond_18

    .line 185
    .end local v2    # "i":I
    return-object v5

    .line 180
    .restart local v2    # "i":I
    :cond_18
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    aget v7, p3, v2

    invoke-virtual {v6, v7}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->inverse(I)I

    move-result v6

    .line 181
    .local v6, "xiInverse":I
    iget-object v7, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    const/4 v8, 0x0

    invoke-virtual {p1, v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->evaluateAt(I)I

    move-result v9

    invoke-virtual {v7, v8, v9}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->subtract(II)I

    move-result v7

    .line 182
    .local v7, "numerator":I
    iget-object v8, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v3, v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->evaluateAt(I)I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->inverse(I)I

    move-result v8

    .line 183
    .local v8, "denominator":I
    iget-object v9, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v9, v7, v8}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->multiply(II)I

    move-result v9

    aput v9, v5, v2

    .line 179
    .end local v6    # "xiInverse":I
    .end local v7    # "numerator":I
    .end local v8    # "denominator":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 171
    .end local v3    # "formalDerivative":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v4    # "s":I
    .end local v5    # "result":[I
    :cond_40
    sub-int v3, v0, v2

    .line 172
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {p2, v2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getCoefficient(I)I

    move-result v5

    invoke-virtual {v4, v2, v5}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->multiply(II)I

    move-result v4

    .line 171
    aput v4, v1, v3

    .line 170
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method private runEuclideanAlgorithm(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;I)[Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .registers 16
    .param p1, "a"    # Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .param p2, "b"    # Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .param p3, "R"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .line 100
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v0

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v1

    if-ge v0, v1, :cond_d

    .line 101
    move-object v0, p1

    .line 102
    .local v0, "temp":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    move-object p1, p2

    .line 103
    move-object p2, v0

    .line 106
    .end local v0    # "temp":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :cond_d
    move-object v0, p1

    .line 107
    .local v0, "rLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    move-object v1, p2

    .line 108
    .local v1, "r":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->getZero()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v2

    .line 109
    .local v2, "tLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->getOne()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v3

    .line 112
    .local v3, "t":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :goto_1b
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v4

    div-int/lit8 v5, p3, 0x2

    if-ge v4, v5, :cond_46

    .line 137
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getCoefficient(I)I

    move-result v5

    .line 138
    .local v5, "sigmaTildeAtZero":I
    if-eqz v5, :cond_41

    .line 142
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v6, v5}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->inverse(I)I

    move-result v6

    .line 143
    .local v6, "inverse":I
    invoke-virtual {v3, v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->multiply(I)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v7

    .line 144
    .local v7, "sigma":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    invoke-virtual {v1, v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->multiply(I)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v8

    .line 145
    .local v8, "omega":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    const/4 v9, 0x2

    new-array v9, v9, [Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    aput-object v7, v9, v4

    const/4 v4, 0x1

    aput-object v8, v9, v4

    return-object v9

    .line 139
    .end local v6    # "inverse":I
    .end local v7    # "sigma":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v8    # "omega":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :cond_41
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    .line 113
    .end local v5    # "sigmaTildeAtZero":I
    :cond_46
    move-object v4, v0

    .line 114
    .local v4, "rLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    move-object v5, v2

    .line 115
    .local v5, "tLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    move-object v0, v1

    .line 116
    move-object v2, v3

    .line 119
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->isZero()Z

    move-result v6

    if-nez v6, :cond_ae

    .line 123
    move-object v1, v4

    .line 124
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->getZero()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v6

    .line 125
    .local v6, "q":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v7

    invoke-virtual {v0, v7}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getCoefficient(I)I

    move-result v7

    .line 126
    .local v7, "denominatorLeadingTerm":I
    iget-object v8, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v8, v7}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->inverse(I)I

    move-result v8

    .line 127
    .local v8, "dltInverse":I
    :goto_65
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v10

    if-lt v9, v10, :cond_a0

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->isZero()Z

    move-result v9

    if-eqz v9, :cond_76

    goto :goto_a0

    .line 128
    :cond_76
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v10

    sub-int/2addr v9, v10

    .line 129
    .local v9, "degreeDiff":I
    iget-object v10, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getDegree()I

    move-result v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->getCoefficient(I)I

    move-result v11

    invoke-virtual {v10, v11, v8}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->multiply(II)I

    move-result v10

    .line 130
    .local v10, "scale":I
    iget-object v11, p0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v11, v9, v10}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->buildMonomial(II)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v11

    invoke-virtual {v6, v11}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->add(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v6

    .line 131
    invoke-virtual {v0, v9, v10}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->multiplyByMonomial(II)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->subtract(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v1

    .end local v9    # "degreeDiff":I
    .end local v10    # "scale":I
    goto :goto_65

    .line 134
    :cond_a0
    :goto_a0
    invoke-virtual {v6, v2}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->multiply(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->subtract(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->negative()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v3

    .end local v4    # "rLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v5    # "tLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v6    # "q":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v7    # "denominatorLeadingTerm":I
    .end local v8    # "dltInverse":I
    goto/16 :goto_1b

    .line 121
    .restart local v4    # "rLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .restart local v5    # "tLastLast":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :cond_ae
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v6

    throw v6
.end method


# virtual methods
.method public decode([II[I)I
    .registers 22
    .param p1, "received"    # [I
    .param p2, "numECCodewords"    # I
    .param p3, "erasures"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 49
    move-object/from16 v3, p3

    new-instance v4, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    iget-object v5, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-direct {v4, v5, v1}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    .line 50
    .local v4, "poly":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    new-array v5, v2, [I

    .line 51
    .local v5, "S":[I
    const/4 v6, 0x0

    .line 52
    .local v6, "error":Z
    move v7, v2

    .local v7, "i":I
    :goto_13
    if-gtz v7, :cond_a5

    .line 60
    .end local v7    # "i":I
    const/4 v7, 0x0

    if-nez v6, :cond_19

    .line 61
    return v7

    .line 64
    :cond_19
    iget-object v8, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v8}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->getOne()Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v8

    .line 65
    .local v8, "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    const/4 v9, 0x1

    if-eqz v3, :cond_53

    .line 66
    array-length v10, v3

    move-object v11, v8

    move v8, v7

    .end local v8    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .local v11, "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :goto_25
    if-lt v8, v10, :cond_28

    goto :goto_54

    :cond_28
    aget v12, v3, v8

    .line 67
    .local v12, "erasure":I
    iget-object v13, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    array-length v14, v1

    sub-int/2addr v14, v9

    sub-int/2addr v14, v12

    invoke-virtual {v13, v14}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->exp(I)I

    move-result v13

    .line 69
    .local v13, "b":I
    new-instance v14, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    iget-object v15, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    const/4 v9, 0x2

    new-array v9, v9, [I

    iget-object v3, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v3, v7, v13}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->subtract(II)I

    move-result v3

    aput v3, v9, v7

    const/4 v3, 0x1

    aput v3, v9, v3

    invoke-direct {v14, v15, v9}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    move-object v3, v14

    .line 70
    .local v3, "term":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    invoke-virtual {v11, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->multiply(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v11

    .line 66
    .end local v3    # "term":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v12    # "erasure":I
    .end local v13    # "b":I
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, p3

    const/4 v9, 0x1

    goto :goto_25

    .line 74
    .end local v11    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .restart local v8    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :cond_53
    move-object v11, v8

    .end local v8    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .restart local v11    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    :goto_54
    new-instance v3, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    iget-object v8, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-direct {v3, v8, v5}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;-><init>(Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;[I)V

    .line 78
    .local v3, "syndrome":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    iget-object v8, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    const/4 v9, 0x1

    invoke-virtual {v8, v2, v9}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->buildMonomial(II)Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v8

    invoke-direct {v0, v8, v3, v2}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->runEuclideanAlgorithm(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;I)[Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;

    move-result-object v8

    .line 77
    nop

    .line 79
    .local v8, "sigmaOmega":[Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    aget-object v7, v8, v7

    .line 80
    .local v7, "sigma":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    aget-object v10, v8, v9

    .line 84
    .local v10, "omega":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    invoke-direct {v0, v7}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->findErrorLocations(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;)[I

    move-result-object v9

    .line 85
    .local v9, "errorLocations":[I
    invoke-direct {v0, v10, v7, v9}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->findErrorMagnitudes(Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;[I)[I

    move-result-object v12

    .line 87
    .local v12, "errorMagnitudes":[I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_74
    array-length v14, v9

    if-lt v13, v14, :cond_79

    .line 94
    .end local v13    # "i":I
    array-length v13, v9

    return v13

    .line 88
    .restart local v13    # "i":I
    :cond_79
    array-length v14, v1

    const/4 v15, 0x1

    sub-int/2addr v14, v15

    iget-object v15, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    move-object/from16 v16, v3

    aget v3, v9, v13

    .end local v3    # "syndrome":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .local v16, "syndrome":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    invoke-virtual {v15, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->log(I)I

    move-result v3

    sub-int/2addr v14, v3

    .line 89
    .local v14, "position":I
    if-ltz v14, :cond_9e

    .line 92
    iget-object v3, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    aget v15, v1, v14

    move/from16 v17, v6

    aget v6, v12, v13

    .end local v6    # "error":Z
    .local v17, "error":Z
    invoke-virtual {v3, v15, v6}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->subtract(II)I

    move-result v3

    aput v3, v1, v14

    .line 87
    .end local v14    # "position":I
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v3, v16

    move/from16 v6, v17

    goto :goto_74

    .line 90
    .end local v17    # "error":Z
    .restart local v6    # "error":Z
    .restart local v14    # "position":I
    :cond_9e
    move/from16 v17, v6

    .end local v6    # "error":Z
    .restart local v17    # "error":Z
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v3

    throw v3

    .line 53
    .end local v8    # "sigmaOmega":[Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v9    # "errorLocations":[I
    .end local v10    # "omega":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v11    # "knownErrors":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v12    # "errorMagnitudes":[I
    .end local v13    # "i":I
    .end local v14    # "position":I
    .end local v16    # "syndrome":Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;
    .end local v17    # "error":Z
    .restart local v6    # "error":Z
    .local v7, "i":I
    :cond_a5
    move/from16 v17, v6

    .end local v6    # "error":Z
    .restart local v17    # "error":Z
    iget-object v3, v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->field:Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    invoke-virtual {v3, v7}, Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;->exp(I)I

    move-result v3

    invoke-virtual {v4, v3}, Lcom/google/zxing/pdf417/decoder/ec/ModulusPoly;->evaluateAt(I)I

    move-result v3

    .line 54
    .local v3, "eval":I
    sub-int v6, v2, v7

    aput v3, v5, v6

    .line 55
    if-eqz v3, :cond_ba

    .line 56
    const/4 v3, 0x1

    .line 52
    .end local v17    # "error":Z
    .local v3, "error":Z
    move v6, v3

    goto :goto_bc

    .end local v3    # "error":Z
    .restart local v17    # "error":Z
    :cond_ba
    move/from16 v6, v17

    .end local v17    # "error":Z
    .restart local v6    # "error":Z
    :goto_bc
    add-int/lit8 v7, v7, -0x1

    move-object/from16 v3, p3

    goto/16 :goto_13
.end method
