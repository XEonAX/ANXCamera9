.class public Lorg/jcodec/containers/mp4/boxes/FormatBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "FormatBox.java"


# instance fields
.field private fmt:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 21
    return-void
.end method

.method public static createFormatBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/FormatBox;
    .locals 3

    .line 28
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/FormatBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/FormatBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/FormatBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/FormatBox;->fmt:Ljava/lang/String;

    .line 30
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 24
    const-string v0, "frma"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 38
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FormatBox;->fmt:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 43
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FormatBox;->fmt:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 34
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/FormatBox;->fmt:Ljava/lang/String;

    .line 35
    return-void
.end method
