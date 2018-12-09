.class public Lorg/jcodec/containers/mp4/boxes/ChannelBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "ChannelBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;
    }
.end annotation


# instance fields
.field private channelBitmap:I

.field private channelLayout:I

.field private descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 50
    return-void
.end method

.method public static createChannelBox()Lorg/jcodec/containers/mp4/boxes/ChannelBox;
    .locals 3

    .line 57
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ChannelBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 53
    const-string v0, "chan"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 5

    .line 76
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 77
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelLayout:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 78
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelBitmap:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 79
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 81
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 82
    iget-object v2, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    aget-object v2, v2, v1

    .line 83
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getChannelLabel()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 84
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getChannelFlags()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 86
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getCoordinates()[F

    move-result-object v3

    aget v3, v3, v0

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 87
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getCoordinates()[F

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 88
    invoke-virtual {v2}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;->getCoordinates()[F

    move-result-object v2

    const/4 v3, 0x2

    aget v2, v2, v3

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 90
    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 2

    .line 94
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x14

    const/16 v1, 0x18

    add-int/2addr v1, v0

    return v1
.end method

.method public getChannelBitmap()I
    .locals 1

    .line 102
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelBitmap:I

    return v0
.end method

.method public getChannelLayout()I
    .locals 1

    .line 98
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelLayout:I

    return v0
.end method

.method public getDescriptions()[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    return-object v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 10

    .line 61
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 63
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelLayout:I

    .line 64
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelBitmap:I

    .line 65
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 67
    new-array v1, v0, [Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    iput-object v1, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    .line 68
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 69
    iget-object v3, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    new-instance v4, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    const/4 v7, 0x3

    new-array v7, v7, [F

    .line 70
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    aput v8, v7, v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    const/4 v9, 0x1

    aput v8, v7, v9

    const/4 v8, 0x2

    .line 71
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v9

    aput v9, v7, v8

    invoke-direct {v4, v5, v6, v7}, Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;-><init>(II[F)V

    aput-object v4, v3, v2

    .line 68
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 73
    :cond_0
    return-void
.end method

.method public setChannelLayout(I)V
    .locals 0

    .line 110
    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->channelLayout:I

    .line 111
    return-void
.end method

.method public setDescriptions([Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ChannelBox;->descriptions:[Lorg/jcodec/containers/mp4/boxes/ChannelBox$ChannelDescription;

    .line 115
    return-void
.end method
