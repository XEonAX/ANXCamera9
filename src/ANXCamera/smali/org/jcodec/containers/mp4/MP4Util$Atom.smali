.class public Lorg/jcodec/containers/mp4/MP4Util$Atom;
.super Ljava/lang/Object;
.source "MP4Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/MP4Util;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Atom"
.end annotation


# instance fields
.field private header:Lorg/jcodec/containers/mp4/boxes/Header;

.field private offset:J


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;J)V
    .locals 0

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    .line 148
    iput-wide p2, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->offset:J

    .line 149
    return-void
.end method


# virtual methods
.method public copy(Lorg/jcodec/common/io/SeekableByteChannel;Ljava/nio/channels/WritableByteChannel;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    iget-wide v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->offset:J

    invoke-interface {p1, v0, v1}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 166
    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/Header;->getSize()J

    move-result-wide v0

    invoke-static {p1, p2, v0, v1}, Lorg/jcodec/common/io/NIOUtils;->copy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;J)V

    .line 167
    return-void
.end method

.method public getHeader()Lorg/jcodec/containers/mp4/boxes/Header;
    .locals 1

    .line 156
    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    return-object v0
.end method

.method public getOffset()J
    .locals 2

    .line 152
    iget-wide v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->offset:J

    return-wide v0
.end method

.method public parseBox(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/boxes/Box;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    iget-wide v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->offset:J

    iget-object v2, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/Header;->headerSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-interface {p1, v0, v1}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 161
    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/Header;->getBodySize()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-static {p1, v0}, Lorg/jcodec/common/io/NIOUtils;->fetchFromChannel(Ljava/nio/channels/ReadableByteChannel;I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Atom;->header:Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/BoxFactory;->getDefault()Lorg/jcodec/containers/mp4/IBoxFactory;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lorg/jcodec/containers/mp4/BoxUtil;->parseBox(Ljava/nio/ByteBuffer;Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/containers/mp4/IBoxFactory;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object p1

    return-object p1
.end method
