.class public Lorg/jcodec/common/model/Size;
.super Ljava/lang/Object;
.source "Size.java"


# instance fields
.field private height:I

.field private width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lorg/jcodec/common/model/Size;->width:I

    .line 16
    iput p2, p0, Lorg/jcodec/common/model/Size;->height:I

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 38
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 39
    return v0

    .line 40
    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 41
    return v1

    .line 42
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    .line 43
    return v1

    .line 44
    :cond_2
    check-cast p1, Lorg/jcodec/common/model/Size;

    .line 45
    iget v2, p0, Lorg/jcodec/common/model/Size;->height:I

    iget v3, p1, Lorg/jcodec/common/model/Size;->height:I

    if-eq v2, v3, :cond_3

    .line 46
    return v1

    .line 47
    :cond_3
    iget v2, p0, Lorg/jcodec/common/model/Size;->width:I

    iget p1, p1, Lorg/jcodec/common/model/Size;->width:I

    if-eq v2, p1, :cond_4

    .line 48
    return v1

    .line 49
    :cond_4
    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 24
    iget v0, p0, Lorg/jcodec/common/model/Size;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 20
    iget v0, p0, Lorg/jcodec/common/model/Size;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 29
    nop

    .line 30
    nop

    .line 31
    iget v0, p0, Lorg/jcodec/common/model/Size;->height:I

    const/16 v1, 0x1f

    add-int/2addr v0, v1

    .line 32
    mul-int/2addr v1, v0

    iget v0, p0, Lorg/jcodec/common/model/Size;->width:I

    add-int/2addr v1, v0

    .line 33
    return v1
.end method
