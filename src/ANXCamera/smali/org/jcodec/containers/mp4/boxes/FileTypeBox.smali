.class public Lorg/jcodec/containers/mp4/boxes/FileTypeBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "FileTypeBox.java"


# instance fields
.field private compBrands:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private majorBrand:Ljava/lang/String;

.field private minorVersion:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 23
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    .line 24
    return-void
.end method

.method public static createFileTypeBox(Ljava/lang/String;ILjava/util/Collection;)Lorg/jcodec/containers/mp4/boxes/FileTypeBox;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/jcodec/containers/mp4/boxes/FileTypeBox;"
        }
    .end annotation

    .line 35
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 36
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->majorBrand:Ljava/lang/String;

    .line 37
    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->minorVersion:I

    .line 38
    iput-object p2, v0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    .line 39
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 31
    const-string v0, "ftyp"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 61
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->majorBrand:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 62
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->minorVersion:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 64
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 65
    invoke-static {v1}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 3

    .line 71
    nop

    .line 73
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/16 v1, 0xd

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 74
    invoke-static {v2}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v1, v2

    .line 75
    goto :goto_0

    .line 77
    :cond_0
    return v1
.end method

.method public getCompBrands()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    return-object v0
.end method

.method public getMajorBrand()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->majorBrand:Ljava/lang/String;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 43
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->majorBrand:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->minorVersion:I

    .line 47
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 48
    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/FileTypeBox;->compBrands:Ljava/util/Collection;

    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method
