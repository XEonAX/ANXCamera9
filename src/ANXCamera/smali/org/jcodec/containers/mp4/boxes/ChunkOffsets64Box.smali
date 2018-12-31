.class public Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "ChunkOffsets64Box.java"


# instance fields
.field private chunkOffsets:[J


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    return-void
.end method

.method public static createChunkOffsets64Box([J)Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;
    .locals 4

    .line 22
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->fourcc()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 23
    iput-object p0, v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    .line 24
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 18
    const-string v0, "co64"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 41
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 42
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 43
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 44
    iget-object v1, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    aget-wide v1, v1, v0

    .line 45
    invoke-virtual {p1, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 51
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    const/16 v1, 0x10

    add-int/2addr v1, v0

    return v1
.end method

.method public getChunkOffsets()[J
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 5

    .line 32
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 33
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 34
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    .line 35
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 36
    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v3

    aput-wide v3, v2, v1

    .line 35
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public setChunkOffsets([J)V
    .locals 0

    .line 59
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->chunkOffsets:[J

    .line 60
    return-void
.end method
