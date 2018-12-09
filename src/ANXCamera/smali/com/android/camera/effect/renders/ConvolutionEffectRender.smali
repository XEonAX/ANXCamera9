.class public abstract Lcom/android/camera/effect/renders/ConvolutionEffectRender;
.super Lcom/android/camera/effect/renders/PixelEffectRender;
.source "ConvolutionEffectRender.java"


# instance fields
.field protected mStepX:F

.field protected mStepY:F

.field protected mUniformStepH:I


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 17
    return-void
.end method


# virtual methods
.method protected initShader()V
    .locals 2

    .line 21
    invoke-super {p0}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShader()V

    .line 22
    iget v0, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mProgram:I

    const-string v1, "uStep"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mUniformStepH:I

    .line 23
    return-void
.end method

.method protected initShaderValue(Z)V
    .locals 2

    .line 38
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShaderValue(Z)V

    .line 39
    iget p1, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mUniformStepH:I

    iget v0, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mStepX:F

    iget v1, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mStepY:F

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 40
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 0

    .line 27
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;->setPreviewSize(II)V

    .line 28
    iget p1, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mPreviewWidth:I

    iget p2, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mPreviewHeight:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->setStep(II)V

    .line 29
    return-void
.end method

.method public setStep(II)V
    .locals 1

    .line 32
    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    div-float p1, v0, p1

    iput p1, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mStepX:F

    .line 33
    int-to-float p1, p2

    div-float/2addr v0, p1

    iput v0, p0, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->mStepY:F

    .line 34
    return-void
.end method
