.class public Lorg/jcodec/containers/mp4/demuxer/MP4Demuxer;
.super Ljava/lang/Object;
.source "MP4Demuxer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static probe(Ljava/nio/ByteBuffer;)I
    .locals 9

    .line 27
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 28
    nop

    .line 29
    nop

    .line 30
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    const/16 v4, 0x8

    if-lt v3, v4, :cond_7

    .line 31
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    invoke-static {v3}, Lorg/jcodec/platform/Platform;->unsignedInt(I)J

    move-result-wide v5

    .line 32
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 33
    nop

    .line 34
    const-wide/16 v7, 0x1

    cmp-long v7, v5, v7

    if-nez v7, :cond_0

    .line 35
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    .line 36
    const/16 v4, 0x10

    goto :goto_1

    .line 37
    :cond_0
    const-wide/16 v7, 0x8

    cmp-long v7, v5, v7

    if-gez v7, :cond_1

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    :goto_1
    sget v7, Lorg/jcodec/common/Fourcc;->ftyp:I

    if-ne v3, v7, :cond_2

    const-wide/16 v7, 0x40

    cmp-long v7, v5, v7

    if-ltz v7, :cond_4

    :cond_2
    sget v7, Lorg/jcodec/common/Fourcc;->moov:I

    if-ne v3, v7, :cond_3

    const-wide/32 v7, 0x6400000

    cmp-long v7, v5, v7

    if-ltz v7, :cond_4

    :cond_3
    sget v7, Lorg/jcodec/common/Fourcc;->free:I

    if-eq v3, v7, :cond_4

    sget v7, Lorg/jcodec/common/Fourcc;->mdat:I

    if-eq v3, v7, :cond_4

    sget v7, Lorg/jcodec/common/Fourcc;->wide:I

    if-ne v3, v7, :cond_5

    .line 41
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 42
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 43
    const-wide/32 v7, 0x7fffffff

    cmp-long v3, v5, v7

    if-ltz v3, :cond_6

    .line 44
    goto :goto_2

    .line 45
    :cond_6
    int-to-long v3, v4

    sub-long/2addr v5, v3

    long-to-int v3, v5

    invoke-static {p0, v3}, Lorg/jcodec/common/io/NIOUtils;->skip(Ljava/nio/ByteBuffer;I)I

    .line 46
    goto :goto_0

    .line 48
    :cond_7
    :goto_2
    if-nez v2, :cond_8

    goto :goto_3

    :cond_8
    mul-int/lit8 v1, v1, 0x64

    div-int v0, v1, v2

    :goto_3
    return v0
.end method
