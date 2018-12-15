.class public final Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;
.super Ljava/lang/Object;
.source "ReedSolomonEncoder.java"


# instance fields
.field private final cachedGenerators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/common/reedsolomon/GenericGFPoly;",
            ">;"
        }
    .end annotation
.end field

.field private final field:Lcom/google/zxing/common/reedsolomon/GenericGF;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V
    .registers 7
    .param p1, "field"    # Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    .line 36
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    new-instance v1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    invoke-direct {v1, p1, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    return-void
.end method

.method private buildGenerator(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 11
    .param p1, "degree"    # I

    .line 40
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_4d

    .line 41
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    .line 42
    .local v0, "lastGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "d":I
    :goto_1e
    if-le v1, p1, :cond_21

    .end local v0    # "lastGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v1    # "d":I
    goto :goto_4d

    .line 43
    .restart local v0    # "lastGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .restart local v1    # "d":I
    :cond_21
    nop

    .line 44
    new-instance v3, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput v2, v5, v6

    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    add-int/lit8 v7, v1, -0x1

    iget-object v8, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getGeneratorBase()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v6, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->exp(I)I

    move-result v6

    aput v6, v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    .line 43
    invoke-virtual {v0, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v3

    .line 45
    .local v3, "nextGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    move-object v0, v3

    .line 42
    .end local v3    # "nextGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 49
    .end local v0    # "lastGenerator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v1    # "d":I
    :cond_4d
    :goto_4d
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->cachedGenerators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    return-object v0
.end method


# virtual methods
.method public encode([II)V
    .registers 13
    .param p1, "toEncode"    # [I
    .param p2, "ecBytes"    # I

    .line 53
    if-eqz p2, :cond_42

    .line 56
    array-length v0, p1

    sub-int/2addr v0, p2

    .line 57
    .local v0, "dataBytes":I
    if-lez v0, :cond_3a

    .line 60
    invoke-direct {p0, p2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->buildGenerator(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v1

    .line 61
    .local v1, "generator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    new-array v2, v0, [I

    .line 62
    .local v2, "infoCoefficients":[I
    const/4 v3, 0x0

    invoke-static {p1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    new-instance v4, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v4, v5, v2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    .line 64
    .local v4, "info":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    const/4 v5, 0x1

    invoke-virtual {v4, p2, v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiplyByMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v4

    .line 65
    invoke-virtual {v4, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->divide(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    aget-object v5, v6, v5

    .line 66
    .local v5, "remainder":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    invoke-virtual {v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficients()[I

    move-result-object v6

    .line 67
    .local v6, "coefficients":[I
    array-length v7, v6

    sub-int v7, p2, v7

    .line 68
    .local v7, "numZeroCoefficients":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2a
    if-lt v8, v7, :cond_33

    .line 71
    .end local v8    # "i":I
    add-int v8, v0, v7

    array-length v9, v6

    invoke-static {v6, v3, p1, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    return-void

    .line 69
    .restart local v8    # "i":I
    :cond_33
    add-int v9, v0, v8

    aput v3, p1, v9

    .line 68
    add-int/lit8 v8, v8, 0x1

    goto :goto_2a

    .line 58
    .end local v1    # "generator":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v2    # "infoCoefficients":[I
    .end local v4    # "info":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v5    # "remainder":Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .end local v6    # "coefficients":[I
    .end local v7    # "numZeroCoefficients":I
    .end local v8    # "i":I
    :cond_3a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No data bytes provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    .end local v0    # "dataBytes":I
    :cond_42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No error correction bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
