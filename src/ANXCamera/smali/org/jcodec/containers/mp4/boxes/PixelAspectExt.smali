.class public Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "PixelAspectExt.java"


# instance fields
.field private hSpacing:I

.field private vSpacing:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 20
    return-void
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 38
    const-string v0, "pasp"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 28
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;->hSpacing:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 29
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;->vSpacing:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 30
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 34
    const/16 v0, 0x10

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 23
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;->hSpacing:I

    .line 24
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/PixelAspectExt;->vSpacing:I

    .line 25
    return-void
.end method
