.class public Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "ClipRegionBox.java"


# instance fields
.field private height:S

.field private rgnSize:S

.field private width:S

.field private x:S

.field private y:S


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 36
    return-void
.end method

.method public static createClipRegionBox(SSSS)Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;
    .locals 3

    .line 25
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 26
    const/16 v1, 0xa

    iput-short v1, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    .line 27
    iput-short p0, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    .line 28
    iput-short p1, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    .line 29
    iput-short p2, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    .line 30
    iput-short p3, v0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    .line 31
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 21
    const-string v0, "crgn"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 47
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 48
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 49
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 50
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 51
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 52
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 56
    const/16 v0, 0x12

    return v0
.end method

.method public getHeight()S
    .locals 1

    .line 72
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    return v0
.end method

.method public getRgnSize()S
    .locals 1

    .line 60
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    return v0
.end method

.method public getWidth()S
    .locals 1

    .line 76
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    return v0
.end method

.method public getX()S
    .locals 1

    .line 68
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    return v0
.end method

.method public getY()S
    .locals 1

    .line 64
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 39
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->rgnSize:S

    .line 40
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->y:S

    .line 41
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->x:S

    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->height:S

    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p1

    iput-short p1, p0, Lorg/jcodec/containers/mp4/boxes/ClipRegionBox;->width:S

    .line 44
    return-void
.end method
