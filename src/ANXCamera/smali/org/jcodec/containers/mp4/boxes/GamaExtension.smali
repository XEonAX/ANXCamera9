.class public Lorg/jcodec/containers/mp4/boxes/GamaExtension;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "GamaExtension.java"


# instance fields
.field private gamma:F


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 25
    return-void
.end method

.method public static createGamaExtension(F)Lorg/jcodec/containers/mp4/boxes/GamaExtension;
    .locals 3

    .line 18
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/GamaExtension;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/GamaExtension;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 19
    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->gamma:F

    .line 20
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 41
    const-string v0, "gama"

    return-object v0
.end method


# virtual methods
.method protected doWrite(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 33
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->gamma:F

    const/high16 v1, 0x47800000    # 65536.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 34
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 46
    const/16 v0, 0xc

    return v0
.end method

.method public getGamma()F
    .locals 1

    .line 37
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->gamma:F

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 28
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    int-to-float p1, p1

    .line 29
    const/high16 v0, 0x47800000    # 65536.0f

    div-float/2addr p1, v0

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/GamaExtension;->gamma:F

    .line 30
    return-void
.end method
