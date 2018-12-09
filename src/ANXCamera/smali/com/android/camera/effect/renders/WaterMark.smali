.class abstract Lcom/android/camera/effect/renders/WaterMark;
.super Ljava/lang/Object;
.source "WaterMark.java"


# instance fields
.field protected mOrientation:I

.field protected mPictureHeight:I

.field protected mPictureWidth:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lcom/android/camera/effect/renders/WaterMark;->mPictureWidth:I

    .line 13
    iput p2, p0, Lcom/android/camera/effect/renders/WaterMark;->mPictureHeight:I

    .line 14
    iput p3, p0, Lcom/android/camera/effect/renders/WaterMark;->mOrientation:I

    .line 15
    return-void
.end method


# virtual methods
.method public abstract getCenterX()I
.end method

.method public abstract getCenterY()I
.end method

.method public abstract getHeight()I
.end method

.method public getLeft()I
    .locals 2

    .line 18
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/WaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    return v0
.end method

.method public abstract getTexture()Lcom/android/gallery3d/ui/BasicTexture;
.end method

.method public getTop()I
    .locals 2

    .line 22
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/WaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    return v0
.end method

.method public abstract getWidth()I
.end method
