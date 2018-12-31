.class public abstract Lcom/android/camera/ui/FrameView;
.super Landroid/view/View;
.source "FrameView.java"

# interfaces
.implements Lcom/android/camera/ui/FocusIndicator;
.implements Lcom/android/camera/ui/Rotatable;


# static fields
.field private static final TAG:Ljava/lang/String; = "FrameView"


# instance fields
.field protected mCameraDisplayOrientation:I

.field protected mIsBigEnoughRect:Z

.field protected mMatrix:Landroid/graphics/Matrix;

.field protected mMirror:Z

.field protected mOrientation:I

.field protected mPause:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/FrameView;->mMatrix:Landroid/graphics/Matrix;

    .line 27
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 81
    return-void
.end method

.method public faceExists()Z
    .locals 1

    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public abstract getFocusRect()Landroid/graphics/RectF;
.end method

.method public isFaceStable()Z
    .locals 1

    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public isNeedExposure()Z
    .locals 1

    .line 34
    iget-boolean v0, p0, Lcom/android/camera/ui/FrameView;->mIsBigEnoughRect:Z

    return v0
.end method

.method public pause()V
    .locals 1

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/FrameView;->mPause:Z

    .line 85
    return-void
.end method

.method public resume()V
    .locals 1

    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/FrameView;->mPause:Z

    .line 89
    return-void
.end method

.method public setCameraDisplayOrientation(I)V
    .locals 3

    .line 44
    iput p1, p0, Lcom/android/camera/ui/FrameView;->mCameraDisplayOrientation:I

    .line 45
    const-string v0, "FrameView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCameraDisplayOrientation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    return-void
.end method

.method public setFaces([Lcom/android/camera2/CameraHardwareFace;)Z
    .locals 0

    .line 30
    const/4 p1, 0x1

    return p1
.end method

.method public setMirror(Z)V
    .locals 3

    .line 55
    iput-boolean p1, p0, Lcom/android/camera/ui/FrameView;->mMirror:Z

    .line 56
    const-string v0, "FrameView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mMirror="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/android/camera/ui/FrameView;->mOrientation:I

    .line 51
    invoke-virtual {p0}, Lcom/android/camera/ui/FrameView;->invalidate()V

    .line 52
    return-void
.end method

.method public setShowGenderAndAge(Z)V
    .locals 0

    .line 93
    return-void
.end method

.method public showFail()V
    .locals 0

    .line 76
    return-void
.end method

.method public showStart()V
    .locals 0

    .line 66
    return-void
.end method

.method public showSuccess()V
    .locals 0

    .line 71
    return-void
.end method
