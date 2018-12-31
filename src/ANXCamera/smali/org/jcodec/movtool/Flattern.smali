.class public Lorg/jcodec/movtool/Flattern;
.super Ljava/lang/Object;
.source "Flattern.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/movtool/Flattern$ProgressListener;
    }
.end annotation


# instance fields
.field public listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/jcodec/movtool/Flattern$ProgressListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jcodec/movtool/Flattern;->listeners:Ljava/util/List;

    .line 63
    return-void
.end method

.method private calcProgress(III)I
    .locals 1

    .line 156
    const/16 v0, 0x64

    mul-int/2addr v0, p2

    div-int p1, v0, p1

    .line 157
    if-ge p3, p1, :cond_0

    .line 158
    nop

    .line 159
    iget-object p2, p0, Lorg/jcodec/movtool/Flattern;->listeners:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/jcodec/movtool/Flattern$ProgressListener;

    .line 160
    invoke-interface {p3, p1}, Lorg/jcodec/movtool/Flattern$ProgressListener;->trigger(I)V

    goto :goto_0

    .line 162
    :cond_0
    move p1, p3

    :cond_1
    return p1
.end method

.method private calcSpaceReq(Lorg/jcodec/containers/mp4/boxes/MovieBox;)I
    .locals 3

    .line 185
    nop

    .line 186
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object p1

    .line 187
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 188
    aget-object v2, p1, v0

    .line 189
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getStco()Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;

    move-result-object v2

    .line 190
    if-eqz v2, :cond_0

    .line 191
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChunkOffsetsBox;->getChunkOffsets()[J

    move-result-object v2

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    .line 187
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    :cond_1
    return v1
.end method

.method public static main1([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    array-length v0, p0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 43
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Syntax: self <ref movie> <out movie>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 46
    :cond_0
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x1

    aget-object v1, p0, v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-static {v0}, Lorg/jcodec/platform/Platform;->deleteFile(Ljava/io/File;)Z

    .line 48
    const/4 v1, 0x0

    .line 50
    :try_start_0
    new-instance v2, Ljava/io/File;

    const/4 v3, 0x0

    aget-object p0, p0, v3

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 51
    :try_start_1
    invoke-static {p0}, Lorg/jcodec/containers/mp4/MP4Util;->parseFullMovieChannel(Lorg/jcodec/common/io/SeekableByteChannel;)Lorg/jcodec/containers/mp4/MP4Util$Movie;

    move-result-object v1

    .line 52
    new-instance v2, Lorg/jcodec/movtool/Flattern;

    invoke-direct {v2}, Lorg/jcodec/movtool/Flattern;-><init>()V

    invoke-virtual {v2, v1, v0}, Lorg/jcodec/movtool/Flattern;->flattern(Lorg/jcodec/containers/mp4/MP4Util$Movie;Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    if-eqz p0, :cond_1

    .line 55
    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    .line 57
    :cond_1
    return-void

    .line 54
    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p0, v1

    :goto_0
    if-eqz p0, :cond_2

    .line 55
    invoke-interface {p0}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_2
    throw v0
.end method

.method private writeHeader(Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/common/io/SeekableByteChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    const/16 v0, 0x10

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 150
    invoke-virtual {p1, v0}, Lorg/jcodec/containers/mp4/boxes/Header;->write(Ljava/nio/ByteBuffer;)V

    .line 151
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 152
    invoke-interface {p2, v0}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 153
    return-void
.end method


# virtual methods
.method public addProgressListener(Lorg/jcodec/movtool/Flattern$ProgressListener;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lorg/jcodec/movtool/Flattern;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    return-void
.end method

.method public flattern(Lorg/jcodec/containers/mp4/MP4Util$Movie;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 213
    invoke-static {p2}, Lorg/jcodec/platform/Platform;->deleteFile(Ljava/io/File;)Z

    .line 214
    nop

    .line 216
    :try_start_0
    invoke-static {p2}, Lorg/jcodec/common/io/NIOUtils;->writableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 217
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/jcodec/movtool/Flattern;->flatternChannel(Lorg/jcodec/containers/mp4/MP4Util$Movie;Lorg/jcodec/common/io/SeekableByteChannel;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    if-eqz p2, :cond_0

    .line 220
    invoke-interface {p2}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    .line 222
    :cond_0
    return-void

    .line 219
    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 220
    invoke-interface {p2}, Lorg/jcodec/common/io/SeekableByteChannel;->close()V

    :cond_1
    throw p1
.end method

.method public flatternChannel(Lorg/jcodec/containers/mp4/MP4Util$Movie;Lorg/jcodec/common/io/SeekableByteChannel;)V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 74
    move-object/from16 v2, p2

    invoke-virtual/range {p1 .. p1}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getFtyp()Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    .line 75
    invoke-virtual/range {p1 .. p1}, Lorg/jcodec/containers/mp4/MP4Util$Movie;->getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;

    move-result-object v3

    .line 77
    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->isPureRefMovie()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 79
    const-wide/16 v4, 0x0

    invoke-interface {v2, v4, v5}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 80
    invoke-static {v2, v1}, Lorg/jcodec/containers/mp4/MP4Util;->writeFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;)V

    .line 82
    invoke-direct {v0, v3}, Lorg/jcodec/movtool/Flattern;->calcSpaceReq(Lorg/jcodec/containers/mp4/boxes/MovieBox;)I

    move-result v6

    .line 83
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 84
    invoke-interface {v2, v6}, Lorg/jcodec/common/io/SeekableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 86
    invoke-interface/range {p2 .. p2}, Lorg/jcodec/common/io/SeekableByteChannel;->position()J

    move-result-wide v6

    .line 87
    const-string v8, "mdat"

    const-wide v9, 0x100000001L

    invoke-static {v8, v9, v10}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v8

    invoke-direct {v0, v8, v2}, Lorg/jcodec/movtool/Flattern;->writeHeader(Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/common/io/SeekableByteChannel;)V

    .line 89
    invoke-virtual {v0, v3}, Lorg/jcodec/movtool/Flattern;->getInputs(Lorg/jcodec/containers/mp4/boxes/MovieBox;)[[Lorg/jcodec/common/io/SeekableByteChannel;

    move-result-object v8

    .line 91
    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object v9

    .line 92
    array-length v10, v9

    new-array v10, v10, [Lorg/jcodec/containers/mp4/ChunkReader;

    .line 93
    array-length v11, v9

    new-array v11, v11, [Lorg/jcodec/containers/mp4/ChunkWriter;

    .line 94
    array-length v12, v9

    new-array v12, v12, [Lorg/jcodec/containers/mp4/Chunk;

    .line 95
    nop

    .line 96
    array-length v13, v9

    new-array v13, v13, [J

    .line 97
    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_0
    array-length v4, v9

    if-ge v15, v4, :cond_1

    .line 98
    new-instance v4, Lorg/jcodec/containers/mp4/ChunkReader;

    aget-object v5, v9, v15

    invoke-direct {v4, v5}, Lorg/jcodec/containers/mp4/ChunkReader;-><init>(Lorg/jcodec/containers/mp4/boxes/TrakBox;)V

    aput-object v4, v10, v15

    .line 99
    aget-object v4, v10, v15

    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/ChunkReader;->size()I

    move-result v4

    add-int/2addr v14, v4

    .line 101
    new-instance v4, Lorg/jcodec/containers/mp4/ChunkWriter;

    aget-object v5, v9, v15

    move/from16 v16, v14

    aget-object v14, v8, v15

    invoke-direct {v4, v5, v14, v2}, Lorg/jcodec/containers/mp4/ChunkWriter;-><init>(Lorg/jcodec/containers/mp4/boxes/TrakBox;[Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/common/io/SeekableByteChannel;)V

    aput-object v4, v11, v15

    .line 102
    aget-object v4, v10, v15

    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/ChunkReader;->next()Lorg/jcodec/containers/mp4/Chunk;

    move-result-object v4

    aput-object v4, v12, v15

    .line 103
    aget-object v4, v9, v15

    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->isVideo()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 104
    const/4 v4, 0x2

    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTimescale()I

    move-result v5

    mul-int/2addr v4, v5

    int-to-long v4, v4

    aput-wide v4, v13, v15

    .line 97
    :cond_0
    add-int/lit8 v15, v15, 0x1

    move/from16 v14, v16

    const-wide/16 v4, 0x0

    goto :goto_0

    .line 108
    :cond_1
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 109
    :goto_1
    const/4 v8, -0x1

    const/4 v15, 0x0

    :goto_2
    move/from16 v17, v5

    array-length v5, v10

    if-ge v15, v5, :cond_5

    .line 110
    aget-object v5, v12, v15

    if-nez v5, :cond_2

    .line 111
    nop

    .line 109
    move/from16 v18, v4

    move-wide/from16 v20, v6

    move/from16 v19, v14

    goto :goto_4

    .line 113
    :cond_2
    const/4 v5, -0x1

    if-ne v8, v5, :cond_3

    .line 114
    nop

    .line 109
    move/from16 v18, v4

    move-wide/from16 v20, v6

    move/from16 v19, v14

    goto :goto_3

    .line 116
    :cond_3
    aget-object v5, v12, v15

    move/from16 v18, v4

    invoke-virtual {v5}, Lorg/jcodec/containers/mp4/Chunk;->getStartTv()J

    move-result-wide v4

    move/from16 v19, v14

    aget-object v14, v9, v15

    invoke-virtual {v14}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTimescale()I

    move-result v14

    int-to-long v0, v14

    invoke-virtual {v3, v4, v5, v0, v1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->rescale(JJ)J

    move-result-wide v0

    aget-wide v4, v13, v15

    add-long/2addr v0, v4

    .line 117
    aget-object v4, v12, v8

    invoke-virtual {v4}, Lorg/jcodec/containers/mp4/Chunk;->getStartTv()J

    move-result-wide v4

    aget-object v14, v9, v8

    invoke-virtual {v14}, Lorg/jcodec/containers/mp4/boxes/TrakBox;->getTimescale()I

    move-result v14

    move-wide/from16 v20, v6

    int-to-long v6, v14

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->rescale(JJ)J

    move-result-wide v4

    aget-wide v6, v13, v8

    add-long/2addr v4, v6

    .line 118
    cmp-long v0, v0, v4

    if-gez v0, :cond_4

    .line 119
    nop

    .line 109
    :goto_3
    move v8, v15

    :cond_4
    :goto_4
    add-int/lit8 v15, v15, 0x1

    move/from16 v5, v17

    move/from16 v4, v18

    move/from16 v14, v19

    move-wide/from16 v6, v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto :goto_2

    .line 122
    :cond_5
    move/from16 v18, v4

    move-wide/from16 v20, v6

    move/from16 v19, v14

    const/4 v0, -0x1

    if-ne v8, v0, :cond_8

    .line 123
    nop

    .line 131
    const/4 v0, 0x0

    :goto_5
    array-length v1, v9

    if-ge v0, v1, :cond_6

    .line 132
    aget-object v1, v11, v0

    invoke-virtual {v1}, Lorg/jcodec/containers/mp4/ChunkWriter;->apply()V

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 134
    :cond_6
    invoke-interface/range {p2 .. p2}, Lorg/jcodec/common/io/SeekableByteChannel;->position()J

    move-result-wide v0

    sub-long v0, v0, v20

    .line 136
    const-wide/16 v4, 0x0

    invoke-interface {v2, v4, v5}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 137
    move-object/from16 v6, p1

    invoke-static {v2, v6}, Lorg/jcodec/containers/mp4/MP4Util;->writeFullMovie(Lorg/jcodec/common/io/SeekableByteChannel;Lorg/jcodec/containers/mp4/MP4Util$Movie;)V

    .line 139
    invoke-interface/range {p2 .. p2}, Lorg/jcodec/common/io/SeekableByteChannel;->position()J

    move-result-wide v6

    sub-long v6, v20, v6

    .line 140
    cmp-long v3, v6, v4

    if-ltz v3, :cond_7

    .line 142
    const-string v3, "free"

    invoke-static {v3, v6, v7}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v3

    move-object/from16 v7, p0

    invoke-direct {v7, v3, v2}, Lorg/jcodec/movtool/Flattern;->writeHeader(Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/common/io/SeekableByteChannel;)V

    .line 144
    move-wide/from16 v14, v20

    invoke-interface {v2, v14, v15}, Lorg/jcodec/common/io/SeekableByteChannel;->setPosition(J)Lorg/jcodec/common/io/SeekableByteChannel;

    .line 145
    const-string v3, "mdat"

    invoke-static {v3, v0, v1}, Lorg/jcodec/containers/mp4/boxes/Header;->createHeader(Ljava/lang/String;J)Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object v0

    invoke-direct {v7, v0, v2}, Lorg/jcodec/movtool/Flattern;->writeHeader(Lorg/jcodec/containers/mp4/boxes/Header;Lorg/jcodec/common/io/SeekableByteChannel;)V

    .line 146
    return-void

    .line 141
    :cond_7
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not enough space to write the header"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_8
    move-wide/from16 v14, v20

    const-wide/16 v4, 0x0

    move-object/from16 v6, p1

    move-object/from16 v7, p0

    aget-object v0, v11, v8

    aget-object v1, v12, v8

    invoke-virtual {v0, v1}, Lorg/jcodec/containers/mp4/ChunkWriter;->write(Lorg/jcodec/containers/mp4/Chunk;)V

    .line 125
    aget-object v0, v10, v8

    invoke-virtual {v0}, Lorg/jcodec/containers/mp4/ChunkReader;->next()Lorg/jcodec/containers/mp4/Chunk;

    move-result-object v0

    aput-object v0, v12, v8

    .line 126
    add-int/lit8 v0, v18, 0x1

    .line 128
    move/from16 v8, v17

    move/from16 v1, v19

    invoke-direct {v7, v1, v0, v8}, Lorg/jcodec/movtool/Flattern;->calcProgress(III)I

    move-result v8

    .line 129
    nop

    .line 108
    move v4, v0

    move-object v0, v7

    move v5, v8

    move-wide/from16 v22, v14

    move v14, v1

    move-object v1, v6

    move-wide/from16 v6, v22

    goto/16 :goto_1

    .line 78
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "movie should be reference"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getInputs(Lorg/jcodec/containers/mp4/boxes/MovieBox;)[[Lorg/jcodec/common/io/SeekableByteChannel;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/MovieBox;->getTracks()[Lorg/jcodec/containers/mp4/boxes/TrakBox;

    move-result-object p1

    .line 167
    array-length v0, p1

    new-array v0, v0, [[Lorg/jcodec/common/io/SeekableByteChannel;

    .line 168
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_2

    .line 169
    aget-object v3, p1, v2

    const-class v4, Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    const-string v5, "mdia.minf.dinf.dref"

    invoke-static {v5}, Lorg/jcodec/containers/mp4/boxes/Box;->path(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lorg/jcodec/containers/mp4/boxes/NodeBox;->findFirstPath(Lorg/jcodec/containers/mp4/boxes/NodeBox;Ljava/lang/Class;[Ljava/lang/String;)Lorg/jcodec/containers/mp4/boxes/Box;

    move-result-object v3

    check-cast v3, Lorg/jcodec/containers/mp4/boxes/DataRefBox;

    .line 170
    if-eqz v3, :cond_1

    .line 173
    invoke-virtual {v3}, Lorg/jcodec/containers/mp4/boxes/DataRefBox;->getBoxes()Ljava/util/List;

    move-result-object v3

    .line 174
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lorg/jcodec/common/io/SeekableByteChannel;

    .line 175
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lorg/jcodec/common/io/SeekableByteChannel;

    .line 176
    move v6, v1

    :goto_1
    array-length v7, v4

    if-ge v6, v7, :cond_0

    .line 177
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jcodec/containers/mp4/boxes/Box;

    invoke-virtual {p0, v7}, Lorg/jcodec/movtool/Flattern;->resolveDataRef(Lorg/jcodec/containers/mp4/boxes/Box;)Lorg/jcodec/common/io/SeekableByteChannel;

    move-result-object v7

    aput-object v7, v5, v6

    .line 176
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 179
    :cond_0
    aput-object v5, v0, v2

    .line 168
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "No data references"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 181
    :cond_2
    return-object v0
.end method

.method public resolveDataRef(Lorg/jcodec/containers/mp4/boxes/Box;)Lorg/jcodec/common/io/SeekableByteChannel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    instance-of v0, p1, Lorg/jcodec/containers/mp4/boxes/UrlBox;

    if-eqz v0, :cond_1

    .line 198
    check-cast p1, Lorg/jcodec/containers/mp4/boxes/UrlBox;

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/UrlBox;->getUrl()Ljava/lang/String;

    move-result-object p1

    .line 199
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p1

    return-object p1

    .line 200
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Only file:// urls are supported in data reference"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_1
    instance-of v0, p1, Lorg/jcodec/containers/mp4/boxes/AliasBox;

    if-eqz v0, :cond_3

    .line 203
    check-cast p1, Lorg/jcodec/containers/mp4/boxes/AliasBox;

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/AliasBox;->getUnixPath()Ljava/lang/String;

    move-result-object p1

    .line 204
    if-eqz p1, :cond_2

    .line 206
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/jcodec/common/io/NIOUtils;->readableChannel(Ljava/io/File;)Lorg/jcodec/common/io/FileChannelWrapper;

    move-result-object p1

    return-object p1

    .line 205
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Could not resolve alias"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 208
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/Box;->getHeader()Lorg/jcodec/containers/mp4/boxes/Header;

    move-result-object p1

    invoke-virtual {p1}, Lorg/jcodec/containers/mp4/boxes/Header;->getFourcc()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " dataref type is not supported"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
