.class public Lorg/jcodec/containers/mp4/boxes/SampleEntry;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "SampleEntry.java"


# instance fields
.field protected drefInd:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 20
    return-void
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 34
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 35
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->drefInd:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 36
    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public estimateSize()I
    .locals 2

    .line 56
    invoke-super {p0}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->estimateSize()I

    move-result v0

    const/16 v1, 0x8

    add-int/2addr v1, v0

    return v1
.end method

.method public getDrefInd()S
    .locals 1

    .line 43
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->drefInd:S

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 23
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 24
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 26
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    iput-short p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->drefInd:S

    .line 27
    return-void
.end method

.method protected parseExtensions(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 31
    return-void
.end method

.method public setDrefInd(S)V
    .locals 0

    .line 47
    iput-short p1, p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->drefInd:S

    .line 48
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .locals 1

    .line 51
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-direct {v0, p1}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    .line 52
    return-void
.end method

.method protected writeExtensions(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 39
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 40
    return-void
.end method
