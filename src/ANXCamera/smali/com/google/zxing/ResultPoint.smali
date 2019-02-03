.class public Lcom/google/zxing/ResultPoint;
.super Ljava/lang/Object;
.source "ResultPoint.java"


# instance fields
.field private final x:F

.field private final y:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lcom/google/zxing/ResultPoint;->x:F

    .line 34
    iput p2, p0, Lcom/google/zxing/ResultPoint;->y:F

    .line 35
    return-void
.end method

.method private static crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 8
    .param p0, "pointA"    # Lcom/google/zxing/ResultPoint;
    .param p1, "pointB"    # Lcom/google/zxing/ResultPoint;
    .param p2, "pointC"    # Lcom/google/zxing/ResultPoint;

    .line 132
    iget v0, p1, Lcom/google/zxing/ResultPoint;->x:F

    .line 133
    .local v0, "bX":F
    iget v1, p1, Lcom/google/zxing/ResultPoint;->y:F

    .line 134
    .local v1, "bY":F
    iget v2, p2, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v2, v0

    iget v3, p0, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    mul-float/2addr v2, v3

    iget v3, p2, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    iget v4, p0, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v4, v0

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    return v2
.end method

.method public static distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 6
    .param p0, "pattern1"    # Lcom/google/zxing/ResultPoint;
    .param p1, "pattern2"    # Lcom/google/zxing/ResultPoint;

    .line 123
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v2, p1, Lcom/google/zxing/ResultPoint;->x:F

    iget v3, p1, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    return v0
.end method

.method public static orderBestPatterns([Lcom/google/zxing/ResultPoint;)V
    .registers 12
    .param p0, "patterns"    # [Lcom/google/zxing/ResultPoint;

    .line 79
    const/4 v0, 0x0

    aget-object v1, p0, v0

    const/4 v2, 0x1

    aget-object v3, p0, v2

    invoke-static {v1, v3}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    .line 80
    .local v1, "zeroOneDistance":F
    aget-object v3, p0, v2

    const/4 v4, 0x2

    aget-object v5, p0, v4

    invoke-static {v3, v5}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    .line 81
    .local v3, "oneTwoDistance":F
    aget-object v5, p0, v0

    aget-object v6, p0, v4

    invoke-static {v5, v6}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    .line 87
    .local v5, "zeroTwoDistance":F
    cmpl-float v6, v3, v1

    if-ltz v6, :cond_2a

    cmpl-float v6, v3, v5

    if-ltz v6, :cond_2a

    .line 88
    aget-object v6, p0, v0

    .line 89
    .local v6, "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v7, p0, v2

    .line 90
    .local v7, "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v8, p0, v4

    .line 91
    .local v8, "pointC":Lcom/google/zxing/ResultPoint;
    goto :goto_3f

    .end local v6    # "pointB":Lcom/google/zxing/ResultPoint;
    .end local v7    # "pointA":Lcom/google/zxing/ResultPoint;
    .end local v8    # "pointC":Lcom/google/zxing/ResultPoint;
    :cond_2a
    cmpl-float v6, v5, v3

    if-ltz v6, :cond_39

    cmpl-float v6, v5, v1

    if-ltz v6, :cond_39

    .line 92
    aget-object v6, p0, v2

    .line 93
    .restart local v6    # "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v7, p0, v0

    .line 94
    .restart local v7    # "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v8, p0, v4

    .line 95
    .restart local v8    # "pointC":Lcom/google/zxing/ResultPoint;
    goto :goto_3f

    .line 96
    .end local v6    # "pointB":Lcom/google/zxing/ResultPoint;
    .end local v7    # "pointA":Lcom/google/zxing/ResultPoint;
    .end local v8    # "pointC":Lcom/google/zxing/ResultPoint;
    :cond_39
    aget-object v6, p0, v4

    .line 97
    .restart local v6    # "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v7, p0, v0

    .line 98
    .restart local v7    # "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v8, p0, v2

    .line 105
    .restart local v8    # "pointC":Lcom/google/zxing/ResultPoint;
    :goto_3f
    invoke-static {v7, v6, v8}, Lcom/google/zxing/ResultPoint;->crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v9

    const/4 v10, 0x0

    cmpg-float v9, v9, v10

    if-gez v9, :cond_4b

    .line 106
    move-object v9, v7

    .line 107
    .local v9, "temp":Lcom/google/zxing/ResultPoint;
    move-object v7, v8

    .line 108
    move-object v8, v9

    .line 111
    .end local v9    # "temp":Lcom/google/zxing/ResultPoint;
    :cond_4b
    aput-object v7, p0, v0

    .line 112
    aput-object v6, p0, v2

    .line 113
    aput-object v8, p0, v4

    .line 114
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .line 47
    instance-of v0, p1, Lcom/google/zxing/ResultPoint;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    .line 48
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/ResultPoint;

    .line 49
    .local v0, "otherPoint":Lcom/google/zxing/ResultPoint;
    iget v2, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v3, v0, Lcom/google/zxing/ResultPoint;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_19

    iget v2, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v3, v0, Lcom/google/zxing/ResultPoint;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1

    .line 51
    .end local v0    # "otherPoint":Lcom/google/zxing/ResultPoint;
    :cond_1a
    return v1
.end method

.method public final getX()F
    .registers 2

    .line 38
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    return v0
.end method

.method public final getY()F
    .registers 2

    .line 42
    iget v0, p0, Lcom/google/zxing/ResultPoint;->y:F

    return v0
.end method

.method public final hashCode()I
    .registers 3

    .line 56
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget v0, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 62
    .local v0, "result":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    iget v1, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 66
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
