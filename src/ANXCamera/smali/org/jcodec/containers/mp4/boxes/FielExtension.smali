.class public Lorg/jcodec/containers/mp4/boxes/FielExtension;
.super Lorg/jcodec/containers/mp4/boxes/Box;
.source "FielExtension.java"


# instance fields
.field private order:I

.field private type:I


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/Header;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/jcodec/containers/mp4/boxes/Box;-><init>(Lorg/jcodec/containers/mp4/boxes/Header;)V

    .line 15
    return-void
.end method

.method public static fourcc()Ljava/lang/String;
    .locals 1

    .line 21
    const-string v0, "fiel"

    return-object v0
.end method


# virtual methods
.method public doWrite(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 66
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->type:I

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 67
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->order:I

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 68
    return-void
.end method

.method public estimateSize()I
    .locals 1

    .line 72
    const/16 v0, 0xa

    return v0
.end method

.method public getOrderInterpretation()Ljava/lang/String;
    .locals 2

    .line 33
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/FielExtension;->isInterlaced()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 37
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->order:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x6

    if-eq v0, v1, :cond_2

    const/16 v1, 0x9

    if-eq v0, v1, :cond_1

    const/16 v1, 0xe

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 50
    :cond_0
    const-string v0, "topbottom"

    return-object v0

    .line 46
    :cond_1
    const-string v0, "bottomtop"

    return-object v0

    .line 43
    :cond_2
    const-string v0, "bottom"

    return-object v0

    .line 40
    :cond_3
    const-string v0, "top"

    return-object v0

    .line 53
    :cond_4
    :goto_0
    const-string v0, ""

    return-object v0
.end method

.method public isInterlaced()Z
    .locals 2

    .line 25
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public parse(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 58
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    iput v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->type:I

    .line 59
    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/FielExtension;->isInterlaced()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result p1

    and-int/lit16 p1, p1, 0xff

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->order:I

    .line 62
    :cond_0
    return-void
.end method

.method public topFieldFirst()Z
    .locals 3

    .line 29
    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->order:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/FielExtension;->order:I

    const/4 v2, 0x6

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    :cond_1
    :goto_0
    return v1
.end method
