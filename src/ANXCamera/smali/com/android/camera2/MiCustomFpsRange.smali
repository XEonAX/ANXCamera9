.class public Lcom/android/camera2/MiCustomFpsRange;
.super Ljava/lang/Object;
.source "MiCustomFpsRange.java"


# static fields
.field private static final FIELD_COUNT:I = 0x3

.field private static final MAX_MINIMAL_FPS:I = 0x3c


# instance fields
.field private final mFpsMax:I

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method private constructor <init>(III)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p3, p0, Lcom/android/camera2/MiCustomFpsRange;->mFpsMax:I

    .line 37
    const-string p3, "width must be positive"

    invoke-static {p1, p3}, Lcom/android/camera2/MiCustomFpsRange;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiCustomFpsRange;->mWidth:I

    .line 38
    const-string p1, "height must be positive"

    invoke-static {p2, p1}, Lcom/android/camera2/MiCustomFpsRange;->checkArgumentPositive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiCustomFpsRange;->mHeight:I

    .line 39
    return-void
.end method

.method private static checkArgumentPositive(ILjava/lang/String;)I
    .locals 0

    .line 71
    if-lez p0, :cond_0

    .line 75
    return p0

    .line 72
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unmarshal([I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiCustomFpsRange;",
            ">;"
        }
    .end annotation

    .line 11
    if-eqz p0, :cond_2

    array-length v0, p0

    if-eqz v0, :cond_2

    .line 15
    array-length v0, p0

    rem-int/lit8 v0, v0, 0x3

    .line 16
    if-gtz v0, :cond_1

    .line 19
    array-length v0, p0

    div-int/lit8 v0, v0, 0x3

    .line 21
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 22
    nop

    .line 23
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v2, v0, :cond_0

    .line 24
    add-int/lit8 v4, v3, 0x1

    aget v3, p0, v3

    .line 25
    add-int/lit8 v5, v4, 0x1

    aget v4, p0, v4

    .line 26
    add-int/lit8 v6, v5, 0x1

    aget v5, p0, v5

    .line 27
    new-instance v7, Lcom/android/camera2/MiCustomFpsRange;

    invoke-direct {v7, v3, v4, v5}, Lcom/android/camera2/MiCustomFpsRange;-><init>(III)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    add-int/lit8 v2, v2, 0x1

    move v3, v6

    goto :goto_0

    .line 31
    :cond_0
    return-object v1

    .line 17
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid buffer length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p0, p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "empty buffer"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public getFpsMax()I
    .locals 1

    .line 66
    iget v0, p0, Lcom/android/camera2/MiCustomFpsRange;->mFpsMax:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 56
    iget v0, p0, Lcom/android/camera2/MiCustomFpsRange;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/android/camera2/MiCustomFpsRange;->mWidth:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MiCustomFpsRange{mWidth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera2/MiCustomFpsRange;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera2/MiCustomFpsRange;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mFpsMax="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera2/MiCustomFpsRange;->mFpsMax:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
