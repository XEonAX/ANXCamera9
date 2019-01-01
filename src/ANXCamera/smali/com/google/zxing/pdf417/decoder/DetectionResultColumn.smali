.class Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
.super Ljava/lang/Object;
.source "DetectionResultColumn.java"


# static fields
.field private static final MAX_NEARBY_DISTANCE:I = 0x5


# instance fields
.field private final boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

.field private final codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;


# direct methods
.method constructor <init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .locals 2
    .param p1, "boundingBox"    # Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/google/zxing/pdf417/decoder/BoundingBox;

    invoke-direct {v0, p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    .line 33
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Lcom/google/zxing/pdf417/decoder/Codeword;

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 34
    return-void
.end method


# virtual methods
.method final getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    return-object v0
.end method

.method final getCodeword(I)Lcom/google/zxing/pdf417/decoder/Codeword;
    .locals 2
    .param p1, "imageRow"    # I

    .line 69
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->imageRowToCodewordIndex(I)I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method final getCodewordNearby(I)Lcom/google/zxing/pdf417/decoder/Codeword;
    .locals 4
    .param p1, "imageRow"    # I

    .line 37
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodeword(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    .line 38
    .local v0, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    if-eqz v0, :cond_0

    .line 39
    return-object v0

    .line 41
    :cond_0
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x5

    if-lt v1, v2, :cond_1

    .line 57
    .end local v1    # "i":I
    const/4 v1, 0x0

    return-object v1

    .line 42
    .restart local v1    # "i":I
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->imageRowToCodewordIndex(I)I

    move-result v2

    sub-int/2addr v2, v1

    .line 43
    .local v2, "nearImageRow":I
    if-ltz v2, :cond_2

    .line 44
    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    aget-object v0, v3, v2

    .line 45
    if-eqz v0, :cond_2

    .line 46
    return-object v0

    .line 49
    :cond_2
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->imageRowToCodewordIndex(I)I

    move-result v3

    add-int/2addr v3, v1

    .line 50
    .end local v2    # "nearImageRow":I
    .local v3, "nearImageRow":I
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    array-length v2, v2

    if-ge v3, v2, :cond_3

    .line 51
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    aget-object v0, v2, v3

    .line 52
    if-eqz v0, :cond_3

    .line 53
    return-object v0

    .line 41
    .end local v3    # "nearImageRow":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method final getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    return-object v0
.end method

.method final imageRowToCodewordIndex(I)I
    .locals 1
    .param p1, "imageRow"    # I

    .line 61
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v0

    sub-int v0, p1, v0

    return v0
.end method

.method final setCodeword(ILcom/google/zxing/pdf417/decoder/Codeword;)V
    .locals 2
    .param p1, "imageRow"    # I
    .param p2, "codeword"    # Lcom/google/zxing/pdf417/decoder/Codeword;

    .line 65
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->imageRowToCodewordIndex(I)I

    move-result v1

    aput-object p2, v0, v1

    .line 66
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 82
    new-instance v0, Ljava/util/Formatter;

    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    .line 83
    .local v0, "formatter":Ljava/util/Formatter;
    const/4 v1, 0x0

    .line 84
    .local v1, "row":I
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->codewords:[Lcom/google/zxing/pdf417/decoder/Codeword;

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v1

    move v1, v4

    .end local v1    # "row":I
    .local v5, "row":I
    :goto_0
    if-lt v1, v3, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V

    .line 93
    return-object v1

    .line 84
    .end local v1    # "result":Ljava/lang/String;
    :cond_0
    aget-object v6, v2, v1

    .line 85
    .local v6, "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    const/4 v7, 0x1

    if-nez v6, :cond_1

    .line 86
    const-string v8, "%3d:    |   %n"

    new-array v7, v7, [Ljava/lang/Object;

    add-int/lit8 v9, v5, 0x1

    .local v9, "row":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .end local v5    # "row":I
    aput-object v5, v7, v4

    invoke-virtual {v0, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 87
    nop

    .line 84
    move v5, v9

    goto :goto_1

    .line 89
    .end local v9    # "row":I
    .restart local v5    # "row":I
    :cond_1
    const-string v8, "%3d: %3d|%3d%n"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    add-int/lit8 v10, v5, 0x1

    .local v10, "row":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .end local v5    # "row":I
    aput-object v5, v9, v4

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v7

    const/4 v5, 0x2

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v9, v5

    invoke-virtual {v0, v8, v9}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 84
    .end local v6    # "codeword":Lcom/google/zxing/pdf417/decoder/Codeword;
    move v5, v10

    .end local v10    # "row":I
    .restart local v5    # "row":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
