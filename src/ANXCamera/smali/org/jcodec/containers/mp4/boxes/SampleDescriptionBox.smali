.class public Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "SampleDescriptionBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    return-void
.end method

.method public static createSampleDescriptionBox([Lorg/jcodec/containers/mp4/boxes/SampleEntry;)Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;
    .locals 4

    .line 19
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 20
    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 21
    aget-object v2, p0, v1

    .line 22
    iget-object v3, v0, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;->boxes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 24
    :cond_0
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 15
    const-string v0, "stsd"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 40
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 42
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;->boxes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 43
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 44
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 48
    invoke-super {p0}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->estimateSize()I

    move-result v0

    const/16 v1, 0x8

    add-int/2addr v1, v0

    return v1
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 33
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 35
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 36
    return-void
.end method
