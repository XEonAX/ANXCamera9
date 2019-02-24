.class public Lcom/android/camera/panorama/UpDirectionFunction;
.super Lcom/android/camera/panorama/DirectionFunction;
.source "UpDirectionFunction.java"


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    .line 8
    invoke-direct/range {p0 .. p6}, Lcom/android/camera/panorama/DirectionFunction;-><init>(IIIIII)V

    .line 9
    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/panorama/UpDirectionFunction;->mDirection:I

    .line 10
    return-void
.end method


# virtual methods
.method public enabled()Z
    .locals 1

    .line 19
    const/4 v0, 0x1

    return v0
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/android/camera/panorama/UpDirectionFunction;->getVerticalPreviewSize()Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method
