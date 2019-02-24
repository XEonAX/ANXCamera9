.class public Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;
.super Lorg/jcodec/containers/mp4/boxes/FullBox;
.source "ClearApertureBox.java"


# static fields
.field public static final CLEF:Ljava/lang/String; = "clef"


# instance fields
.field protected height:F

.field protected width:F


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 26
    return-void
.end method

.method public static createClearApertureBox(II)Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;
    .locals 3

    .line 18
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    const-string v2, "clef"

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 19
    int-to-float p0, p0

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->width:F

    .line 20
    int-to-float p0, p1

    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->height:F

    .line 21
    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 35
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->doWrite(Ljava/nio/ByteBuffer;)V

    .line 36
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->width:F

    const/high16 v1, 0x47800000    # 65536.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 37
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->height:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 38
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 42
    const/16 v0, 0x14

    return v0
.end method

.method public getHeight()F
    .locals 1

    .line 50
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->height:F

    return v0
.end method

.method public getWidth()F
    .locals 1

    .line 46
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->width:F

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 29
    invoke-super {p0, p1}, Lorg/jcodec/containers/mp4/boxes/FullBox;->parse(Ljava/nio/ByteBuffer;)V

    .line 30
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x47800000    # 65536.0f

    div-float/2addr v0, v1

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->width:F

    .line 31
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/ClearApertureBox;->height:F

    .line 32
    return-void
.end method
