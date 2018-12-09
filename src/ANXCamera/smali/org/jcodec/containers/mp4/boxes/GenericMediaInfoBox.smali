.class public Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "GenericMediaInfoBox.java"


# instance fields
.field private bOpColor:S

.field private balance:S

.field private gOpColor:S

.field private graphicsMode:S

.field private rOpColor:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    return-void
.end method

.method public static createGenericMediaInfoBox()Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;
    .locals 3

    .line 24
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 20
    const-string v0, "gmin"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 42
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 43
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->graphicsMode:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 44
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->rOpColor:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 45
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->gOpColor:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 46
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->bOpColor:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 47
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->balance:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 48
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 49
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 53
    const/16 v0, 0x18

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 32
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 33
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->graphicsMode:S

    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->rOpColor:S

    .line 35
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->gOpColor:S

    .line 36
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->bOpColor:S

    .line 37
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/GenericMediaInfoBox;->balance:S

    .line 38
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 39
    return-void
.end method
