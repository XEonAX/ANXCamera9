.class public Lcom/android/camera/panorama/LeftDirectionFunction;
.super Lcom/android/camera/panorama/DirectionFunction;
.source "LeftDirectionFunction.java"


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    .line 9
    invoke-direct/range {p0 .. p6}, Lcom/android/camera/panorama/DirectionFunction;-><init>(IIIIII)V

    .line 10
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/panorama/LeftDirectionFunction;->mDirection:I

    .line 11
    return-void
.end method


# virtual methods
.method public enabled()Z
    .locals 1

    .line 20
    const/4 v0, 0x1

    return v0
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/android/camera/panorama/LeftDirectionFunction;->getHorizontalPreviewSize()Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method
