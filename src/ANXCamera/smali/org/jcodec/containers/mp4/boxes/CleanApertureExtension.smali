.class public Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "CleanApertureExtension.java"


# instance fields
.field private apertureHeightDenominator:I

.field private apertureHeightNumerator:I

.field private apertureWidthDenominator:I

.field private apertureWidthNumerator:I

.field private horizOffsetDenominator:I

.field private horizOffsetNumerator:I

.field private vertOffsetDenominator:I

.field private vertOffsetNumerator:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 23
    return-void
.end method

.method public static createCleanApertureExtension(IIIIIIII)Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;
    .locals 3

    .line 27
    new-instance v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;

    new-instance v1, Lorg/jcodec/containers/mp4/boxes/Header;

    invoke-static {}, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->fourcc()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jcodec/containers/mp4/boxes/Header;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 28
    iput p0, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    .line 29
    iput p1, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    .line 30
    iput p2, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    .line 31
    iput p3, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    .line 32
    iput p4, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    .line 33
    iput p5, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    .line 34
    iput p6, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    .line 35
    iput p7, v0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    .line 36
    return-object v0
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 55
    const-string v0, "clap"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 61
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 62
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 64
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 65
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 67
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 68
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 70
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 71
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 72
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 76
    const/16 v0, 0x28

    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 41
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthNumerator:I

    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureWidthDenominator:I

    .line 44
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightNumerator:I

    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->apertureHeightDenominator:I

    .line 47
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetNumerator:I

    .line 48
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->horizOffsetDenominator:I

    .line 50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetNumerator:I

    .line 51
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/CleanApertureExtension;->vertOffsetDenominator:I

    .line 52
    return-void
.end method
