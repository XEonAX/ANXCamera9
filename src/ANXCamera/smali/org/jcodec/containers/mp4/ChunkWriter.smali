.class public Lorg/jcodec/containers/mp4/ChunkWriter;
.super Ljava/lang/Object;
.source "ChunkWriter.java"


# instance fields
.field buf:[B

.field private curChunk:I

.field private entries:[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

.field private inputs:[Lorg/jcodec/common/io/SeekableByteChannel;

.field private offsets:[J

.field private out:Lorg/jcodec/common/io/SeekableByteChannel;

.field private trak:Lorg/jcodec/containers/mp4/boxes/TrakBox;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/TrakBox;[Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/common/io/SeekableByteChannel;)V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/16 v0, 0x1f9c

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->buf:[B

    .line 35
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getSampleEntries()[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->entries:[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    .line 36
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStco()Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;

    move-result-object v0

    .line 37
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getCo64()Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    move-result-object v1

    .line 39
    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;->getChunkOffsets()[J

    move-result-object v0

    array-length v0, v0

    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->getChunkOffsets()[J

    move-result-object v0

    array-length v0, v0

    .line 43
    :goto_0
    iput-object p2, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->inputs:[Lorg/jcodec/common/io/SeekableByteChannel;

    .line 45
    new-array p2, v0, [J

    iput-object p2, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->offsets:[J

    .line 46
    iput-object p3, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->out:Lorg/jcodec/common/io/SeekableByteChannel;

    .line 47
    iput-object p1, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->trak:Lorg/jcodec/containers/mp4/boxes/TrakBox;

    .line 48
    return-void
.end method

.method private cleanDrefs(Lorg/jcodec/containers/mp4/boxes/TrakBox;)V
    .locals 3

    .line 59
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaBox;->getMinf()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    move-result-object v0

    .line 60
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/MediaBox;->getMinf()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->getDinf()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v1

    .line 61
    if-nez v1, :cond_0

    .line 62
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->createDataInfoBox()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 66
    :cond_0
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->getDref()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->createDataRefBox()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 69
    invoke-virtual {v1, v0}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 72
    :cond_1
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 73
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/AliasBox;->createSelfRef()Lorg/jcodec/containers/mp4/boxes/AliasBox;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 75
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getSampleEntries()[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    move-result-object p1

    .line 76
    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_2

    .line 77
    aget-object v1, p1, v0

    .line 78
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->setDrefInd(S)V

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_2
    return-void
.end method

.method private getInput(Lorg/jcodec/containers/mp4/Chunk;)Lorg/jcodec/common/io/SeekableByteChannel;
    .locals 1

    .line 83
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->entries:[Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/Chunk;->getEntry()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    aget-object p1, v0, p1

    .line 84
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->inputs:[Lorg/jcodec/common/io/SeekableByteChannel;

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/SampleEntry;->getDrefInd()S

    move-result p1

    add-int/lit8 p1, p1, -0x1

    aget-object p1, v0, p1

    return-object p1
.end method


# virtual methods
.method public apply()V
    .locals 3

    .line 51
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->trak:Lorg/jcodec/containers/mp4/boxes/TrakBox;

    const-class v1, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    const-string v2, "mdia.minf.stbl"

    invoke-static {v2}, Lorg/jcodec/containers/mp4/boxes/Box;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    .line 52
    const-string v1, "stco"

    const-string v2, "co64"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->removeChildren([Ljava/lang/String;)V

    .line 54
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->offsets:[J

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->createChunkOffsets64Box([J)Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 55
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->trak:Lorg/jcodec/containers/mp4/boxes/TrakBox;

    invoke-direct {p0, v0}, Lorg/jcodec/containers/mp4/ChunkWriter;->cleanDrefs(Lorg/jcodec/containers/mp4/boxes/TrakBox;)V

    .line 56
    return-void
.end method

.method public write(Lorg/jcodec/containers/mp4/Chunk;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/ChunkWriter;->getInput(Lorg/jcodec/containers/mp4/Chunk;)Lorg/jcodec/common/io/SeekableByteChannel;

    move-result-object v0

    .line 89
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/Chunk;->getOffset()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 90
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->out:Lorg/jcodec/common/io/SeekableByteChannel;

    invoke-interface {v1}, Lorg/jcodec/common/io/SeekableByteChannel;->position()J

    move-result-wide v1

    .line 92
    iget-object v3, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->out:Lorg/jcodec/common/io/SeekableByteChannel;

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/Chunk;->getSize()J

    move-result-wide v4

    long-to-int p1, v4

    invoke-static {v0, p1}, Lorg/jcodec/common/io/NIOUtils;->fetchFromChannel(Ljava/nio/channels/ReadableByteChannel;I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-interface {v3, p1}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 93
    iget-object p1, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->offsets:[J

    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->curChunk:I

    add-int/lit8 v3, v0, 0x1

    iput v3, p0, Lorg/jcodec/containers/mp4/ChunkWriter;->curChunk:I

    aput-wide v1, p1, v0

    .line 94
    return-void
.end method
