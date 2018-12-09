.class public Lcom/android/camera/CameraSize;
.super Ljava/lang/Object;
.source "CameraSize.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/android/camera/CameraSize;",
        ">;"
    }
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput p1, p0, Lcom/android/camera/CameraSize;->width:I

    .line 44
    iput p2, p0, Lcom/android/camera/CameraSize;->height:I

    .line 45
    return-void
.end method


# virtual methods
.method public area()I
    .locals 2

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v0, v1

    :goto_0
    return v0
.end method

.method public compareTo(Lcom/android/camera/CameraSize;)I
    .locals 2
    .param p1    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 89
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v0, v1

    iget v1, p1, Lcom/android/camera/CameraSize;->width:I

    iget p1, p1, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v1, p1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 24
    check-cast p1, Lcom/android/camera/CameraSize;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraSize;->compareTo(Lcom/android/camera/CameraSize;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 63
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 64
    return v0

    .line 66
    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    .line 67
    return v1

    .line 69
    :cond_1
    instance-of v2, p1, Lcom/android/camera/CameraSize;

    if-eqz v2, :cond_3

    .line 70
    check-cast p1, Lcom/android/camera/CameraSize;

    .line 71
    iget v2, p0, Lcom/android/camera/CameraSize;->width:I

    iget v3, p1, Lcom/android/camera/CameraSize;->width:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/CameraSize;->height:I

    iget p1, p1, Lcom/android/camera/CameraSize;->height:I

    if-ne v2, p1, :cond_2

    move v0, v1

    nop

    :cond_2
    return v0

    .line 73
    :cond_3
    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/android/camera/CameraSize;->height:I

    return v0
.end method

.method public getRatio()F
    .locals 2

    .line 33
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 84
    iget v0, p0, Lcom/android/camera/CameraSize;->height:I

    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    shl-int/lit8 v1, v1, 0x10

    iget v2, p0, Lcom/android/camera/CameraSize;->width:I

    ushr-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    xor-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .locals 2

    .line 93
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v0, v1

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;
    .locals 1

    .line 48
    iget v0, p1, Lcom/android/camera/CameraSize;->width:I

    iput v0, p0, Lcom/android/camera/CameraSize;->width:I

    .line 49
    iget p1, p1, Lcom/android/camera/CameraSize;->height:I

    iput p1, p0, Lcom/android/camera/CameraSize;->height:I

    .line 50
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
