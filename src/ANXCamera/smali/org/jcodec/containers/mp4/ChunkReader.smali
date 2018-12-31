.class public Lorg/jcodec/containers/mp4/ChunkReader;
.super Ljava/lang/Object;
.source "ChunkReader.java"


# instance fields
.field private chunkOffsets:[J

.field private chunkTv:J

.field private curChunk:I

.field private s2cIndex:I

.field private sampleNo:I

.field private sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

.field private stsd:Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

.field private stsz:Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

.field private tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

.field private ttsInd:I

.field private ttsSubInd:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/TrakBox;)V
    .locals 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    .line 27
    iput v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    .line 28
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkTv:J

    .line 36
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStts()Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;

    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;->getEntries()[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    .line 38
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStco()Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;

    move-result-object v0

    .line 39
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getCo64()Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    move-result-object v1

    .line 40
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStsz()Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    move-result-object v2

    iput-object v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsz:Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    .line 41
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStsc()Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;

    move-result-object v2

    .line 43
    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;->getChunkOffsets()[J

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;->getChunkOffsets()[J

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    .line 47
    :goto_0
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;->getSampleToChunk()[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    .line 48
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStsd()Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsd:Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    .line 49
    return-void
.end method

.method private getFrameSize()I
    .locals 4

    .line 98
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsz:Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getDefaultSize()I

    move-result v0

    .line 99
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsd:Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    iget v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getEntry()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/Box;

    .line 100
    instance-of v2, v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    if-eqz v2, :cond_0

    .line 101
    check-cast v1, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/AudioSampleEntry;->calcFrameSize()I

    move-result v0

    return v0

    .line 103
    :cond_0
    return v0
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 52
    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lorg/jcodec/containers/mp4/Chunk;
    .locals 14

    .line 56
    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    array-length v1, v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 57
    return-object v2

    .line 59
    :cond_0
    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    add-int/lit8 v0, v0, 0x1

    int-to-long v0, v0

    iget-object v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    iget v4, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    add-int/lit8 v4, v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getFirst()J

    move-result-wide v3

    cmp-long v0, v0, v3

    if-nez v0, :cond_1

    .line 60
    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    .line 61
    :cond_1
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    iget v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getCount()I

    move-result v0

    .line 63
    nop

    .line 64
    nop

    .line 65
    iget v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    add-int/2addr v1, v0

    iget-object v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    iget v4, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->getSampleCount()I

    move-result v3

    const/4 v4, 0x0

    if-gt v1, v3, :cond_2

    .line 66
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    iget v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->getSampleDuration()I

    move-result v1

    .line 67
    iget v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    .line 80
    move v11, v1

    move-object v12, v2

    goto :goto_1

    .line 69
    :cond_2
    new-array v1, v0, [I

    .line 70
    move v3, v4

    :goto_0
    if-ge v3, v0, :cond_4

    .line 71
    iget v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    iget-object v6, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    iget v7, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->getSampleCount()I

    move-result v6

    if-lt v5, v6, :cond_3

    iget v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    iget-object v6, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_3

    .line 72
    iput v4, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    .line 73
    iget v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    .line 75
    :cond_3
    iget-object v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->tts:[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    iget v6, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsInd:I

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->getSampleDuration()I

    move-result v5

    aput v5, v1, v3

    .line 76
    iget v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/jcodec/containers/mp4/ChunkReader;->ttsSubInd:I

    .line 70
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 80
    :cond_4
    move-object v12, v1

    move v11, v4

    .line 81
    :goto_1
    nop

    .line 82
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsz:Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getDefaultSize()I

    move-result v1

    if-lez v1, :cond_5

    .line 83
    invoke-direct {p0}, Lorg/jcodec/containers/mp4/ChunkReader;->getFrameSize()I

    move-result v1

    .line 88
    move v9, v1

    move-object v10, v2

    goto :goto_2

    .line 85
    :cond_5
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->stsz:Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getSizes()[I

    move-result-object v1

    iget v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleNo:I

    iget v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleNo:I

    add-int/2addr v3, v0

    invoke-static {v1, v2, v3}, Lorg/jcodec/platform/Platform;->copyOfRangeI([III)[I

    move-result-object v2

    .line 88
    move-object v10, v2

    move v9, v4

    :goto_2
    iget-object v1, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleToChunk:[Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;

    iget v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->s2cIndex:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox$SampleToChunkEntry;->getEntry()I

    move-result v13

    .line 89
    new-instance v1, Lorg/jcodec/containers/mp4/Chunk;

    iget-object v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    iget v3, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    aget-wide v4, v2, v3

    iget-wide v6, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkTv:J

    move-object v3, v1

    move v8, v0

    invoke-direct/range {v3 .. v13}, Lorg/jcodec/containers/mp4/Chunk;-><init>(JJII[II[II)V

    .line 91
    iget-wide v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkTv:J

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/Chunk;->getDuration()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkTv:J

    .line 92
    iget v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleNo:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/jcodec/containers/mp4/ChunkReader;->sampleNo:I

    .line 93
    iget v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->curChunk:I

    .line 94
    return-object v1
.end method

.method public size()I
    .locals 1

    .line 107
    iget-object v0, p0, Lorg/jcodec/containers/mp4/ChunkReader;->chunkOffsets:[J

    array-length v0, v0

    return v0
.end method
