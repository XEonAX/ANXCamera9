.class public Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;
.super Lorg/jcodec/containers/mp4/boxes/MetaBox;
.source "UdtaMetaBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MetaBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 17
    return-void
.end method

.method public static createUdtaMetaBox()Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;
    .locals 4

    .line 20
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/UdtaMetaBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 31
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 32
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 33
    return-void
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 25
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 26
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/MetaBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 27
    return-void
.end method
