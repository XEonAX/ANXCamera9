.class public final Lcom/google/zxing/InvertedLuminanceSource;
.super Lcom/google/zxing/LuminanceSource;
.source "InvertedLuminanceSource.java"


# instance fields
.field private final delegate:Lcom/google/zxing/LuminanceSource;


# direct methods
.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .locals 2
    .param p1, "delegate"    # Lcom/google/zxing/LuminanceSource;

    .line 30
    invoke-virtual {p1}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    .line 31
    iput-object p1, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    .line 32
    return-void
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .locals 2
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 62
    new-instance v0, Lcom/google/zxing/InvertedLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/google/zxing/LuminanceSource;->crop(IIII)Lcom/google/zxing/LuminanceSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/InvertedLuminanceSource;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getMatrix()[B
    .locals 5

    .line 46
    iget-object v0, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v0

    .line 47
    .local v0, "matrix":[B
    invoke-virtual {p0}, Lcom/google/zxing/InvertedLuminanceSource;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/zxing/InvertedLuminanceSource;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    .line 48
    .local v1, "length":I
    new-array v2, v1, [B

    .line 49
    .local v2, "invertedMatrix":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v1, :cond_0

    .line 52
    .end local v3    # "i":I
    return-object v2

    .line 50
    .restart local v3    # "i":I
    :cond_0
    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xff

    rsub-int v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 49
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public getRow(I[B)[B
    .locals 3
    .param p1, "y"    # I
    .param p2, "row"    # [B

    .line 36
    iget-object v0, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v0, p1, p2}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object p2

    .line 37
    invoke-virtual {p0}, Lcom/google/zxing/InvertedLuminanceSource;->getWidth()I

    move-result v0

    .line 38
    .local v0, "width":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 41
    .end local v1    # "i":I
    return-object p2

    .line 39
    .restart local v1    # "i":I
    :cond_0
    aget-byte v2, p2, v1

    and-int/lit16 v2, v2, 0xff

    rsub-int v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    .line 38
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public invert()Lcom/google/zxing/LuminanceSource;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    return-object v0
.end method

.method public isCropSupported()Z
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->isCropSupported()Z

    move-result v0

    return v0
.end method

.method public isRotateSupported()Z
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->isRotateSupported()Z

    move-result v0

    return v0
.end method

.method public rotateCounterClockwise()Lcom/google/zxing/LuminanceSource;
    .locals 2

    .line 80
    new-instance v0, Lcom/google/zxing/InvertedLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v1}, Lcom/google/zxing/LuminanceSource;->rotateCounterClockwise()Lcom/google/zxing/LuminanceSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/InvertedLuminanceSource;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public rotateCounterClockwise45()Lcom/google/zxing/LuminanceSource;
    .locals 2

    .line 85
    new-instance v0, Lcom/google/zxing/InvertedLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/InvertedLuminanceSource;->delegate:Lcom/google/zxing/LuminanceSource;

    invoke-virtual {v1}, Lcom/google/zxing/LuminanceSource;->rotateCounterClockwise45()Lcom/google/zxing/LuminanceSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/InvertedLuminanceSource;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method
