.class public Lorg/jcodec/containers/mp4/boxes/EndianBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "EndianBox.java"


# instance fields
.field private endian:Ljava/nio/ByteOrder;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    return-void
.end method

.method public static createEndianBox(Ljava/nio/ByteOrder;)Lorg/jcodec/containers/mp4/boxes/EndianBox;
    .locals 3

    .line 22
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/EndianBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/EndianBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/EndianBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 23
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/EndianBox;->endian:Ljava/nio/ByteOrder;

    .line 24
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 18
    const-string v0, "enda"

    return-object v0
.end method


# virtual methods
.method protected calcSize()I
    .locals 1

    .line 54
    const/4 v0, 0x2

    return v0
.end method

.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 41
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/EndianBox;->endian:Ljava/nio/ByteOrder;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 42
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 46
    const/16 v0, 0xa

    return v0
.end method

.method public getEndian()Ljava/nio/ByteOrder;
    .locals 1

    .line 50
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/EndianBox;->endian:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 32
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    int-to-long v0, p1

    .line 33
    const-wide/16 v2, 0x1

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    .line 34
    sget-object p1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/EndianBox;->endian:Ljava/nio/ByteOrder;

    goto :goto_0

    .line 36
    :cond_0
    sget-object p1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/EndianBox;->endian:Ljava/nio/ByteOrder;

    .line 38
    :goto_0
    return-void
.end method
