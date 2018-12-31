.class public Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "SoundMediaHeaderBox.java"


# instance fields
.field private balance:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 27
    return-void
.end method

.method public static createSoundMediaHeaderBox()Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;
    .locals 3

    .line 22
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 18
    const-string v0, "smhd"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 36
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 37
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;->balance:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 43
    const/16 v0, 0x10

    return v0
.end method

.method public getBalance()S
    .locals 1

    .line 47
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;->balance:S

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 30
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 31
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/SoundMediaHeaderBox;->balance:S

    .line 32
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 33
    return-void
.end method
