.class public Lcom/android/camera/panorama/DirectionFunction;
.super Ljava/lang/Object;
.source "DirectionFunction.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# static fields
.field public static final DIRECTION_DOWN:I = 0x3

.field public static final DIRECTION_LEFT:I = 0x0

.field public static final DIRECTION_NONE:I = -0x1

.field public static final DIRECTION_RIGHT:I = 0x1

.field public static final DIRECTION_UP:I = 0x2

.field public static final ERROR_NO_EFFECTIVE_PIXEL:I = -0x1

.field public static final SUCCEEDED:I


# instance fields
.field private final mAngle:I

.field protected mDirection:I

.field private final mInputHeight:I

.field private final mInputWidth:I

.field private final mMaxHeight:I

.field private final mMaxWidth:I

.field private final mScale:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mDirection:I

    .line 27
    iput p1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputWidth:I

    .line 28
    iput p2, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputHeight:I

    .line 29
    iput p5, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    .line 30
    iput p6, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    .line 31
    iput p3, p0, Lcom/android/camera/panorama/DirectionFunction;->mMaxWidth:I

    .line 32
    iput p4, p0, Lcom/android/camera/panorama/DirectionFunction;->mMaxHeight:I

    .line 33
    return-void
.end method


# virtual methods
.method public enabled()Z
    .locals 1

    .line 48
    const/4 v0, 0x0

    return v0
.end method

.method public getAngle()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    return v0
.end method

.method public getDirection()I
    .locals 1

    .line 36
    iget v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mDirection:I

    return v0
.end method

.method protected getHorizontalPreviewSize()Landroid/util/Size;
    .locals 3

    .line 71
    iget v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mMaxWidth:I

    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v0, v1

    .line 73
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    const/16 v2, 0x5a

    if-eq v2, v1, :cond_1

    const/16 v1, 0x10e

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputHeight:I

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v1, v2

    goto :goto_1

    .line 74
    :cond_1
    :goto_0
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputWidth:I

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v1, v2

    .line 79
    :goto_1
    and-int/lit8 v0, v0, -0x2

    .line 80
    and-int/lit8 v1, v1, -0x2

    .line 81
    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object v2
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 3

    .line 53
    new-instance v0, Landroid/util/Size;

    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputWidth:I

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputHeight:I

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0
.end method

.method public getScale()I
    .locals 1

    .line 40
    iget v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    return v0
.end method

.method protected getVerticalPreviewSize()Landroid/util/Size;
    .locals 3

    .line 58
    iget v0, p0, Lcom/android/camera/panorama/DirectionFunction;->mMaxHeight:I

    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v0, v1

    .line 59
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    const/16 v2, 0x5a

    if-eq v2, v1, :cond_1

    const/16 v1, 0x10e

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mAngle:I

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 62
    :cond_0
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputWidth:I

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v1, v2

    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    iget v1, p0, Lcom/android/camera/panorama/DirectionFunction;->mInputHeight:I

    iget v2, p0, Lcom/android/camera/panorama/DirectionFunction;->mScale:I

    div-int/2addr v1, v2

    .line 65
    :goto_1
    and-int/lit8 v1, v1, -0x2

    .line 66
    and-int/lit8 v0, v0, -0x2

    .line 67
    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v1, v0}, Landroid/util/Size;-><init>(II)V

    return-object v2
.end method
