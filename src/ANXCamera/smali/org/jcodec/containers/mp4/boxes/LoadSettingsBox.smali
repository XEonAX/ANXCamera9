.class public Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "LoadSettingsBox.java"


# instance fields
.field private defaultHints:I

.field private preloadDuration:I

.field private preloadFlags:I

.field private preloadStartTime:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 26
    return-void
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 21
    const-string v0, "load"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 36
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadStartTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 37
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 38
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 39
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->defaultHints:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 40
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 44
    const/16 v0, 0x18

    return v0
.end method

.method public getDefaultHints()I
    .locals 1

    .line 60
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->defaultHints:I

    return v0
.end method

.method public getPreloadDuration()I
    .locals 1

    .line 52
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadDuration:I

    return v0
.end method

.method public getPreloadFlags()I
    .locals 1

    .line 56
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadFlags:I

    return v0
.end method

.method public getPreloadStartTime()I
    .locals 1

    .line 48
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadStartTime:I

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 29
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadStartTime:I

    .line 30
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadDuration:I

    .line 31
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->preloadFlags:I

    .line 32
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/LoadSettingsBox;->defaultHints:I

    .line 33
    return-void
.end method
