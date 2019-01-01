.class public abstract Lcom/google/zxing/common/GridSampler;
.super Ljava/lang/Object;
.source "GridSampler.java"


# static fields
.field private static gridSampler:Lcom/google/zxing/common/GridSampler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/google/zxing/common/DefaultGridSampler;

    invoke-direct {v0}, Lcom/google/zxing/common/DefaultGridSampler;-><init>()V

    sput-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static checkAndNudgePoints(Lcom/google/zxing/common/BitMatrix;[F)V
    .locals 10
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
    :goto_0
    array-length v4, p1

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-ge v3, v4, :cond_6

    if-nez v2, :cond_0

    .end local v3    # "offset":I
    goto :goto_3

    .line 126
    .restart local v3    # "offset":I
    :cond_0
    aget v4, p1, v3

    float-to-int v4, v4

    .line 127
    .local v4, "x":I
    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    .line 128
    .local v7, "y":I
    if-lt v4, v6, :cond_5

    if-gt v4, v0, :cond_5

    if-lt v7, v6, :cond_5

    if-gt v7, v1, :cond_5

    .line 131
    const/4 v2, 0x0

    .line 132
    if-ne v4, v6, :cond_1

    .line 133
    aput v5, p1, v3

    .line 134
    const/4 v2, 0x1

    .line 135
    goto :goto_1

    :cond_1
    if-ne v4, v0, :cond_2

    .line 136
    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    .line 137
    const/4 v2, 0x1

    .line 139
    :cond_2
    :goto_1
    if-ne v7, v6, :cond_3

    .line 140
    add-int/lit8 v6, v3, 0x1

    aput v5, p1, v6

    .line 141
    const/4 v2, 0x1

    .line 142
    goto :goto_2

    :cond_3
    if-ne v7, v1, :cond_4

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
    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    .line 129
    .restart local v4    # "x":I
    .restart local v7    # "y":I
    :cond_5
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 148
    .end local v3    # "offset":I
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_6
    :goto_3
    const/4 v2, 0x1

    .line 149
    array-length v3, p1

    add-int/lit8 v3, v3, -0x2

    .restart local v3    # "offset":I
    :goto_4
    if-ltz v3, :cond_d

    if-nez v2, :cond_7

    .end local v3    # "offset":I
    goto :goto_7

    .line 150
    .restart local v3    # "offset":I
    :cond_7
    aget v4, p1, v3

    float-to-int v4, v4

    .line 151
    .restart local v4    # "x":I
    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    .line 152
    .restart local v7    # "y":I
    if-lt v4, v6, :cond_c

    if-gt v4, v0, :cond_c

    if-lt v7, v6, :cond_c

    if-gt v7, v1, :cond_c

    .line 155
    const/4 v2, 0x0

    .line 156
    if-ne v4, v6, :cond_8

    .line 157
    aput v5, p1, v3

    .line 158
    const/4 v2, 0x1

    .line 159
    goto :goto_5

    :cond_8
    if-ne v4, v0, :cond_9

    .line 160
    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    .line 161
    const/4 v2, 0x1

    .line 163
    :cond_9
    :goto_5
    if-ne v7, v6, :cond_a

    .line 164
    add-int/lit8 v8, v3, 0x1

    aput v5, p1, v8

    .line 165
    const/4 v2, 0x1

    .line 166
    goto :goto_6

    :cond_a
    if-ne v7, v1, :cond_b

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
    :cond_b
    :goto_6
    add-int/lit8 v3, v3, -0x2

    goto :goto_4

    .line 153
    .restart local v4    # "x":I
    .restart local v7    # "y":I
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 171
    .end local v3    # "offset":I
    .end local v4    # "x":I
    .end local v7    # "y":I
    :cond_d
    :goto_7
    return-void
.end method

.method public static getInstance()Lcom/google/zxing/common/GridSampler;
    .locals 1

    .line 55
    sget-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-object v0
.end method

.method public static setGridSampler(Lcom/google/zxing/common/GridSampler;)V
    .locals 0
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
