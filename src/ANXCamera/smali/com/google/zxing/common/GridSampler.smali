.class public abstract Lcom/google/zxing/common/GridSampler;
.super Ljava/lang/Object;
.source "GridSampler.java"


# static fields
.field private static gridSampler:Lcom/google/zxing/common/GridSampler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 36
    new-instance v0, Lcom/google/zxing/common/DefaultGridSampler;

    invoke-direct {v0}, Lcom/google/zxing/common/DefaultGridSampler;-><init>()V

    sput-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static checkAndNudgePoints(Lcom/google/zxing/common/BitMatrix;[F)V
    .registers 12
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "points"    # [F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 121
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    .line 122
    .local v0, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    .line 124
    .local v1, "height":I
    const/4 v2, 0x1

    .line 125
    .local v2, "nudged":Z
    const/4 v3, 0x0

    .local v3, "offset":I
    :goto_a
    array-length v4, p1

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-ge v3, v4, :cond_4b

    if-nez v2, :cond_12

    .end local v3    # "offset":I
    goto :goto_4b

    .line 126
    .restart local v3    # "offset":I
    :cond_12
    aget v4, p1, v3

    float-to-int v4, v4

    .line 127
    .local v4, "x":I
    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    .line 128
    .local v7, "y":I
    if-lt v4, v6, :cond_46

    if-gt v4, v0, :cond_46

    if-lt v7, v6, :cond_46

    if-gt v7, v1, :cond_46

    .line 131
    const/4 v2, 0x0

    .line 132
    if-ne v4, v6, :cond_29

    .line 133
    aput v5, p1, v3

    .line 134
    const/4 v2, 0x1

    .line 135
    goto :goto_31

    :cond_29
    if-ne v4, v0, :cond_31

    .line 136
    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    .line 137
    const/4 v2, 0x1

    .line 139
    :cond_31
    :goto_31
    if-ne v7, v6, :cond_39

    .line 140
    add-int/lit8 v6, v3, 0x1

    aput v5, p1, v6

    .line 141
    const/4 v2, 0x1

    .line 142
    goto :goto_43

    :cond_39
    if-ne v7, v1, :cond_43

    .line 143
    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v6, v1, -0x1

    int-to-float v6, v6

    aput v6, p1, v5

    .line 144
    const/4 v2, 0x1

    .line 125
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_43
    :goto_43
    add-int/lit8 v3, v3, 0x2

    goto :goto_a

    .line 129
    .restart local v4    # "x":I
    .restart local v7    # "y":I
    :cond_46
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 148
    .end local v3    # "offset":I
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_4b
    :goto_4b
    const/4 v2, 0x1

    .line 149
    array-length v3, p1

    add-int/lit8 v3, v3, -0x2

    .restart local v3    # "offset":I
    :goto_4f
    if-ltz v3, :cond_8d

    if-nez v2, :cond_54

    .end local v3    # "offset":I
    goto :goto_8d

    .line 150
    .restart local v3    # "offset":I
    :cond_54
    aget v4, p1, v3

    float-to-int v4, v4

    .line 151
    .restart local v4    # "x":I
    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    .line 152
    .restart local v7    # "y":I
    if-lt v4, v6, :cond_88

    if-gt v4, v0, :cond_88

    if-lt v7, v6, :cond_88

    if-gt v7, v1, :cond_88

    .line 155
    const/4 v2, 0x0

    .line 156
    if-ne v4, v6, :cond_6b

    .line 157
    aput v5, p1, v3

    .line 158
    const/4 v2, 0x1

    .line 159
    goto :goto_73

    :cond_6b
    if-ne v4, v0, :cond_73

    .line 160
    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    .line 161
    const/4 v2, 0x1

    .line 163
    :cond_73
    :goto_73
    if-ne v7, v6, :cond_7b

    .line 164
    add-int/lit8 v8, v3, 0x1

    aput v5, p1, v8

    .line 165
    const/4 v2, 0x1

    .line 166
    goto :goto_85

    :cond_7b
    if-ne v7, v1, :cond_85

    .line 167
    add-int/lit8 v8, v3, 0x1

    add-int/lit8 v9, v1, -0x1

    int-to-float v9, v9

    aput v9, p1, v8

    .line 168
    const/4 v2, 0x1

    .line 149
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_85
    :goto_85
    add-int/lit8 v3, v3, -0x2

    goto :goto_4f

    .line 153
    .restart local v4    # "x":I
    .restart local v7    # "y":I
    :cond_88
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 171
    .end local v3    # "offset":I
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_8d
    :goto_8d
    return-void
.end method

.method public static getInstance()Lcom/google/zxing/common/GridSampler;
    .registers 1

    .line 55
    sget-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-object v0
.end method

.method public static setGridSampler(Lcom/google/zxing/common/GridSampler;)V
    .registers 1
    .param p0, "newGridSampler"    # Lcom/google/zxing/common/GridSampler;

    .line 48
    sput-object p0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    .line 49
    return-void
.end method


# virtual methods
.method public abstract sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public abstract sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method
