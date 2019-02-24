.class public Lorg/jcodec/containers/mp4/boxes/ColorExtension;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "ColorExtension.java"


# static fields
.field static final AVCOL_RANGE_JPEG:B = 0x2t

.field static final AVCOL_RANGE_MPEG:B = 0x1t

.field static final RANGE_UNSPECIFIED:B


# instance fields
.field private colorRange:Ljava/lang/Byte;

.field private matrixIndex:S

.field private primariesIndex:S

.field private transferFunctionIndex:S

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 23
    const-string p1, "nclc"

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->type:Ljava/lang/String;

    .line 28
    const/4 p1, 0x0

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->colorRange:Ljava/lang/Byte;

    .line 32
    return-void
.end method

.method public static createColorExtension(SSS)Lorg/jcodec/containers/mp4/boxes/ColorExtension;
    .locals 3

    .line 73
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ColorExtension;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 74
    iput-short p0, v0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->primariesIndex:S

    .line 75
    iput-short p1, v0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->transferFunctionIndex:S

    .line 76
    iput-short p2, v0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->matrixIndex:S

    .line 77
    return-object v0
.end method

.method public static createColr()Lorg/jcodec/containers/mp4/boxes/ColorExtension;
    .locals 3

    .line 81
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/ColorExtension;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 68
    const-string v0, "colr"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->type:Ljava/lang/String;

    invoke-static {v0}, Lorg/jcodec/common/JCodecUtil2;->asciiString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 54
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->primariesIndex:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 55
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->transferFunctionIndex:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 56
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->matrixIndex:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 57
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->colorRange:Ljava/lang/Byte;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->colorRange:Ljava/lang/Byte;

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 60
    :cond_0
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 64
    const/16 v0, 0x10

    return v0
.end method

.method public getMatrixIndex()S
    .locals 1

    .line 93
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->matrixIndex:S

    return v0
.end method

.method public getPrimariesIndex()S
    .locals 1

    .line 85
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->primariesIndex:S

    return v0
.end method

.method public getTransferFunctionIndex()S
    .locals 1

    .line 89
    iget-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->transferFunctionIndex:S

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 40
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 41
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 42
    invoke-static {v0}, Lorg/jcodec/platform/Platform;->stringFromBytes([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->type:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->primariesIndex:S

    .line 44
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->transferFunctionIndex:S

    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->matrixIndex:S

    .line 46
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result p1

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->colorRange:Ljava/lang/Byte;

    .line 49
    :cond_0
    return-void
.end method

.method public setColorRange(Ljava/lang/Byte;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lorg/jcodec/containers/mp4/boxes/ColorExtension;->colorRange:Ljava/lang/Byte;

    .line 36
    return-void
.end method
