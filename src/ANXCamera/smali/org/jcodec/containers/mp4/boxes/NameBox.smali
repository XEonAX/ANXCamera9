.class public Lorg/jcodec/containers/mp4/boxes/NameBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "NameBox.java"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 30
    return-void
.end method

.method public static createNameBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/NameBox;
    .locals 3

    .line 23
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/NameBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/NameBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NameBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 24
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/NameBox;->name:Ljava/lang/String;

    .line 25
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 19
    const-string v0, "name"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 37
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/NameBox;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 43
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/NameBox;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0xc

    add-int/2addr v1, v0

    return v1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/NameBox;->name:Ljava/lang/String;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 33
    invoke-static {p1}, Lorg/jcodec/common/io/NIOUtils;->readNullTermString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/NameBox;->name:Ljava/lang/String;

    .line 34
    return-void
.end method
