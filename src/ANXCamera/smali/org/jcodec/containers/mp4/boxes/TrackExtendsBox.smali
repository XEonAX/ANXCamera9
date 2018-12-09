.class public Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "TrackExtendsBox.java"


# instance fields
.field private defaultSampleBytes:I

.field private defaultSampleDescriptionIndex:I

.field private defaultSampleDuration:I

.field private defaultSampleFlags:I

.field private trackId:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 19
    return-void
.end method

.method public static createTrackExtendsBox()Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;
    .locals 3

    .line 97
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 28
    const-string v0, "trex"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 43
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 44
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->trackId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 45
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDescriptionIndex:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 46
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 47
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleBytes:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 48
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 49
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 53
    const/16 v0, 0x20

    return v0
.end method

.method public getDefaultSampleBytes()I
    .locals 1

    .line 81
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleBytes:I

    return v0
.end method

.method public getDefaultSampleDescriptionIndex()I
    .locals 1

    .line 65
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDescriptionIndex:I

    return v0
.end method

.method public getDefaultSampleDuration()I
    .locals 1

    .line 73
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDuration:I

    return v0
.end method

.method public getDefaultSampleFlags()I
    .locals 1

    .line 89
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleFlags:I

    return v0
.end method

.method public getTrackId()I
    .locals 1

    .line 57
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->trackId:I

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 33
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->trackId:I

    .line 35
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDescriptionIndex:I

    .line 36
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDuration:I

    .line 37
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleBytes:I

    .line 38
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleFlags:I

    .line 39
    return-void
.end method

.method public setDefaultSampleBytes(I)V
    .locals 0

    .line 85
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleBytes:I

    .line 86
    return-void
.end method

.method public setDefaultSampleDescriptionIndex(I)V
    .locals 0

    .line 69
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDescriptionIndex:I

    .line 70
    return-void
.end method

.method public setDefaultSampleDuration(I)V
    .locals 0

    .line 77
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleDuration:I

    .line 78
    return-void
.end method

.method public setDefaultSampleFlags(I)V
    .locals 0

    .line 93
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->defaultSampleFlags:I

    .line 94
    return-void
.end method

.method public setTrackId(I)V
    .locals 0

    .line 61
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/TrackExtendsBox;->trackId:I

    .line 62
    return-void
.end method
