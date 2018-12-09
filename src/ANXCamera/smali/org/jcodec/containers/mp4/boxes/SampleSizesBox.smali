.class public Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "SampleSizesBox.java"


# instance fields
.field private count:I

.field private defaultSize:I

.field private sizes:[I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 15
    return-void
.end method

.method public static createSampleSizesBox(II)Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
    .locals 3

    .line 26
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 27
    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    .line 28
    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    .line 29
    return-object v0
.end method

.method public static createSampleSizesBox2([I)Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
    .locals 3

    .line 33
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 34
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    .line 35
    array-length p0, p0

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    .line 36
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 22
    const-string v0, "stsz"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 70
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 71
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 73
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    .line 74
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 75
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 76
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    aget v1, v1, v0

    int-to-long v1, v1

    .line 77
    long-to-int v1, v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_0
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 82
    :cond_1
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 86
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public getCount()I
    .locals 1

    .line 61
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    return v0
.end method

.method public getDefaultSize()I
    .locals 1

    .line 53
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    return v0
.end method

.method public getSizes()[I
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 40
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 41
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    .line 44
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->defaultSize:I

    if-nez v0, :cond_0

    .line 45
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    .line 46
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    if-ge v0, v1, :cond_0

    .line 47
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    aput v2, v1, v0

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public setCount(I)V
    .locals 0

    .line 65
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    .line 66
    return-void
.end method

.method public setSizes([I)V
    .locals 0

    .line 90
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->sizes:[I

    .line 91
    array-length p1, p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->count:I

    .line 92
    return-void
.end method
