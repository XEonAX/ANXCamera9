.class public Lorg/jcodec/containers/mp4/boxes/TrakBox;
.super Lorg/jcodec/containers/mp4/boxes/NodeBox;
.source "TrakBox.java"


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 29
    return-void
.end method

.method public static createTrakBox()Lorg/jcodec/containers/mp4/boxes/TrakBox;
    .locals 3

    .line 24
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrakBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 20
    const-string v0, "trak"

    return-object v0
.end method

.method public static getEditedDuration(Lorg/jcodec/containers/mp4/boxes/TrakBox;)J
    .locals 5

    .line 254
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getEdits()Ljava/util/List;

    move-result-object v0

    .line 255
    if-nez v0, :cond_0

    .line 256
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getDuration()J

    move-result-wide v0

    return-wide v0

    .line 258
    :cond_0
    const-wide/16 v1, 0x0

    .line 259
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/Edit;

    .line 260
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/Edit;->getDuration()J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 261
    goto :goto_0

    .line 262
    :cond_1
    return-wide v1
.end method


# virtual methods
.method public fixMediaTimescale(I)V
    .locals 10

    .line 186
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    const-string v1, "mdia.mdhd"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    .line 187
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->getTimescale()I

    move-result v1

    .line 189
    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->setTimescale(I)V

    .line 190
    int-to-long v2, p1

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->getDuration()J

    move-result-wide v4

    mul-long/2addr v4, v2

    int-to-long v6, v1

    div-long/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->setDuration(J)V

    .line 191
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getEdits()Ljava/util/List;

    move-result-object v0

    .line 192
    if-eqz v0, :cond_0

    .line 193
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jcodec/containers/mp4/boxes/Edit;

    .line 194
    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/boxes/Edit;->getMediaTime()J

    move-result-wide v8

    mul-long/2addr v8, v2

    div-long/2addr v8, v6

    invoke-virtual {v4, v8, v9}, Lorg/jcodec/containers/mp4/boxes/Edit;->setMediaTime(J)V

    .line 195
    goto :goto_0

    .line 197
    :cond_0
    const-class v0, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;

    const-string v2, "mdia.minf.stbl.stts"

    invoke-static {v2}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;

    .line 198
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;->getEntries()[Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;

    move-result-object v0

    .line 199
    const/4 v2, 0x0

    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 200
    aget-object v3, v0, v2

    .line 201
    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->getSampleDuration()I

    move-result v4

    mul-int/2addr v4, p1

    div-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox$TimeToSampleEntry;->setSampleDuration(I)V

    .line 199
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 203
    :cond_1
    return-void
.end method

.method public getCo64()Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;
    .locals 2

    .line 224
    const-class v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    const-string v1, "mdia.minf.stbl.co64"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsets64Box;

    return-object v0
.end method

.method public getCtts()Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox;
    .locals 2

    .line 244
    const-class v0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox;

    const-string v1, "mdia.minf.stbl.ctts"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox;

    return-object v0
.end method

.method public getDuration()J
    .locals 2

    .line 131
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTrackHeader()Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getEdits()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/boxes/Edit;",
            ">;"
        }
    .end annotation

    .line 63
    const-class v0, Lorg/jcodec/containers/mp4/boxes/EditListBox;

    const-string v1, "edts.elst"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/EditListBox;

    .line 64
    if-nez v0, :cond_0

    .line 65
    const/4 v0, 0x0

    return-object v0

    .line 66
    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/EditListBox;->getEdits()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFrameCount()I
    .locals 2

    .line 176
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    const-string v1, "mdia.minf.stbl.stsz"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    .line 177
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getDefaultSize()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getCount()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;->getSizes()[I

    move-result-object v0

    array-length v0, v0

    :goto_0
    return v0
.end method

.method public getHandlerType()Ljava/lang/String;
    .locals 2

    .line 90
    const-class v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;

    const-string v1, "mdia.hdlr"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/HandlerBox;

    .line 91
    if-nez v0, :cond_0

    .line 92
    const/4 v0, 0x0

    return-object v0

    .line 93
    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/HandlerBox;->getComponentSubType()Ljava/lang/String;

    move-result-object v0

    .line 94
    return-object v0
.end method

.method public getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;
    .locals 2

    .line 55
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MediaBox;

    const-string v1, "mdia"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MediaBox;

    return-object v0
.end method

.method public getMediaDuration()J
    .locals 2

    .line 135
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    const-string v1, "mdia.mdhd"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 181
    const-class v0, Lorg/jcodec/containers/mp4/boxes/NameBox;

    const-string v1, "udta.name"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/NameBox;

    .line 182
    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/NameBox;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSampleEntries()[Lorg/jcodec/containers/mp4/boxes/SampleEntry;
    .locals 6

    .line 172
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    const-string v1, "mdia"

    const-string v2, "minf"

    const-string v3, "stbl"

    const-string v4, "stsd"

    const/4 v5, 0x0

    filled-new-array {v1, v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findAllPath(Lorg/jcodec/containers/mp4/boxes/Box;Ljava/lang/Class;[Ljava/lang/String;)[Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, [Lorg/jcodec/containers/mp4/boxes/SampleEntry;

    return-object v0
.end method

.method public getStco()Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;
    .locals 2

    .line 220
    const-class v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;

    const-string v1, "mdia.minf.stbl.stco"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;

    return-object v0
.end method

.method public getStsc()Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;
    .locals 2

    .line 232
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;

    const-string v1, "mdia.minf.stbl.stsc"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/SampleToChunkBox;

    return-object v0
.end method

.method public getStsd()Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;
    .locals 2

    .line 236
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    const-string v1, "mdia.minf.stbl.stsd"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getStss()Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;
    .locals 2

    .line 240
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;

    const-string v1, "mdia.minf.stbl.stss"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/SyncSamplesBox;

    return-object v0
.end method

.method public getStsz()Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;
    .locals 2

    .line 228
    const-class v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    const-string v1, "mdia.minf.stbl.stsz"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/SampleSizesBox;

    return-object v0
.end method

.method public getStts()Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;
    .locals 2

    .line 216
    const-class v0, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;

    const-string v1, "mdia.minf.stbl.stts"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/TimeToSampleBox;

    return-object v0
.end method

.method public getTimescale()I
    .locals 2

    .line 108
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    const-string v1, "mdia.mdhd"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->getTimescale()I

    move-result v0

    return v0
.end method

.method public getTrackHeader()Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;
    .locals 2

    .line 59
    const-class v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    const-string v1, "tkhd"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    return-object v0
.end method

.method public hasDataRef()Z
    .locals 5

    .line 156
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaBox;->getMinf()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->getDinf()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v0

    .line 157
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 158
    return v1

    .line 160
    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->getDref()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 161
    if-nez v0, :cond_1

    .line 162
    return v1

    .line 164
    :cond_1
    nop

    .line 165
    iget-object v0, v0, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->boxes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jcodec/containers/mp4/boxes/Box;

    .line 166
    check-cast v3, Lorg/jcodec/containers/mp4/boxes/FullBox;

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/FullBox;->getFlags()I

    move-result v3

    const/4 v4, 0x1

    and-int/2addr v3, v4

    if-eq v3, v4, :cond_2

    goto :goto_1

    :cond_2
    move v4, v1

    :goto_1
    or-int/2addr v2, v4

    .line 167
    goto :goto_0

    .line 168
    :cond_3
    return v2
.end method

.method public isAudio()Z
    .locals 2

    .line 98
    const-string v0, "soun"

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getHandlerType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isPureRef()Z
    .locals 4

    .line 139
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaBox;->getMinf()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    move-result-object v0

    .line 140
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->getDinf()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v0

    .line 141
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 142
    return v1

    .line 144
    :cond_0
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->getDref()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 145
    if-nez v0, :cond_1

    .line 146
    return v1

    .line 148
    :cond_1
    iget-object v0, v0, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->boxes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jcodec/containers/mp4/boxes/Box;

    .line 149
    check-cast v2, Lorg/jcodec/containers/mp4/boxes/FullBox;

    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/FullBox;->getFlags()I

    move-result v2

    and-int/2addr v2, v3

    if-eqz v2, :cond_2

    .line 150
    return v1

    .line 151
    :cond_2
    goto :goto_0

    .line 152
    :cond_3
    return v3
.end method

.method public isTimecode()Z
    .locals 2

    .line 86
    const-string v0, "tmcd"

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getHandlerType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isVideo()Z
    .locals 2

    .line 82
    const-string v0, "vide"

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getHandlerType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public rescale(JJ)J
    .locals 2

    .line 123
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTimescale()I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr p1, v0

    div-long/2addr p1, p3

    return-wide p1
.end method

.method public setDataRef(Ljava/lang/String;)V
    .locals 2

    .line 32
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getMdia()Lorg/jcodec/containers/mp4/boxes/MediaBox;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaBox;->getMinf()Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;

    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->getDinf()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->createDataInfoBox()Lorg/jcodec/containers/mp4/boxes/DataInfoBox;

    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/MediaInfoBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 38
    :cond_0
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->getDref()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 39
    invoke-static {p1}, Lorg/jcodec/containers/mp4/boxes/UrlBox;->createUrlBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/UrlBox;

    move-result-object p1

    .line 40
    if-nez v0, :cond_1

    .line 41
    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->createDataRefBox()Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    move-result-object v0

    .line 42
    invoke-virtual {v1, v0}, Lorg/jcodec/containers/mp4/boxes/DataInfoBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 43
    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    goto :goto_1

    .line 45
    :cond_1
    iget-object v0, v0, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->boxes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 46
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 47
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jcodec/containers/mp4/boxes/FullBox;

    .line 48
    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    .line 49
    invoke-interface {v0, p1}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 50
    :cond_2
    goto :goto_0

    .line 52
    :cond_3
    :goto_1
    return-void
.end method

.method public setDuration(J)V
    .locals 1

    .line 127
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTrackHeader()Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->setDuration(J)V

    .line 128
    return-void
.end method

.method public setEdits(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/jcodec/containers/mp4/boxes/Edit;",
            ">;)V"
        }
    .end annotation

    .line 70
    const-class v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    const-string v1, "edts"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    .line 71
    if-nez v0, :cond_0

    .line 72
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    const-string v2, "edts"

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 73
    invoke-virtual {p0, v0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 75
    :cond_0
    const-string v1, "elst"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->removeChildren([Ljava/lang/String;)V

    .line 77
    invoke-static {p1}, Lorg/jcodec/containers/mp4/boxes/EditListBox;->createEditListBox(Ljava/util/List;)Lorg/jcodec/containers/mp4/boxes/EditListBox;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 78
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTrackHeader()Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;

    move-result-object p1

    invoke-static {p0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getEditedDuration(Lorg/jcodec/containers/mp4/boxes/TrakBox;)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackHeaderBox;->setDuration(J)V

    .line 79
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3

    .line 206
    const-class v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    const-string v1, "udta"

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirst(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    .line 207
    if-nez v0, :cond_0

    .line 208
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/NodeBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    const-string v2, "udta"

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 209
    invoke-virtual {p0, v0}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 211
    :cond_0
    const-string v1, "name"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->removeChildren([Ljava/lang/String;)V

    .line 212
    invoke-static {p1}, Lorg/jcodec/containers/mp4/boxes/NameBox;->createNameBox(Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/NameBox;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->add(Lorg/jcodec/containers/mp4/boxes/Box;)V

    .line 213
    return-void
.end method

.method public setTimescale(I)V
    .locals 2

    .line 119
    const-class v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    const-string v1, "mdia.mdhd"

    invoke-static {v1}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v0

    check-cast v0, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;

    invoke-virtual {v0, p1}, Lorg/jcodec/containers/mp4/boxes/MediaHeaderBox;->setTimescale(I)V

    .line 120
    return-void
.end method
