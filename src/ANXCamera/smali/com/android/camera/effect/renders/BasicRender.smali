.class public Lcom/android/camera/effect/renders/BasicRender;
.super Lcom/android/camera/effect/renders/ShaderRender;
.source "BasicRender.java"


# static fields
.field private static final BYTE_COLOR_TO_FLOAT:F = 0.003921569f

.field private static final OFFSET_DRAW_LINE:I = 0x4

.field private static final OFFSET_DRAW_RECT:I = 0x6

.field private static final OFFSET_FILL_RECT:I

.field private static final TEXTURES:[F

.field private static final VERTICES:[F


# instance fields
.field private mUniformBlendFactorH:I

.field private mUniformPaintColorH:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 30
    const/16 v0, 0x14

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/effect/renders/BasicRender;->VERTICES:[F

    .line 35
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/effect/renders/BasicRender;->TEXTURES:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/ShaderRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 42
    return-void
.end method

.method private convertCoordinate(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/gallery3d/ui/BasicTexture;)V
    .locals 5

    .line 354
    invoke-virtual {p3}, Lcom/android/gallery3d/ui/BasicTexture;->getWidth()I

    move-result v0

    .line 355
    invoke-virtual {p3}, Lcom/android/gallery3d/ui/BasicTexture;->getHeight()I

    move-result v1

    .line 356
    invoke-virtual {p3}, Lcom/android/gallery3d/ui/BasicTexture;->getTextureWidth()I

    move-result v2

    .line 357
    invoke-virtual {p3}, Lcom/android/gallery3d/ui/BasicTexture;->getTextureHeight()I

    move-result p3

    .line 359
    iget v3, p1, Landroid/graphics/RectF;->left:F

    int-to-float v2, v2

    div-float/2addr v3, v2

    iput v3, p1, Landroid/graphics/RectF;->left:F

    .line 360
    iget v3, p1, Landroid/graphics/RectF;->right:F

    div-float/2addr v3, v2

    iput v3, p1, Landroid/graphics/RectF;->right:F

    .line 361
    iget v3, p1, Landroid/graphics/RectF;->top:F

    int-to-float p3, p3

    div-float/2addr v3, p3

    iput v3, p1, Landroid/graphics/RectF;->top:F

    .line 362
    iget v3, p1, Landroid/graphics/RectF;->bottom:F

    div-float/2addr v3, p3

    iput v3, p1, Landroid/graphics/RectF;->bottom:F

    .line 365
    int-to-float v0, v0

    div-float/2addr v0, v2

    .line 366
    iget v2, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v0

    if-lez v2, :cond_0

    .line 367
    iget v2, p2, Landroid/graphics/RectF;->left:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p1, Landroid/graphics/RectF;->left:F

    sub-float v4, v0, v4

    mul-float/2addr v3, v4

    .line 368
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iput v2, p2, Landroid/graphics/RectF;->right:F

    .line 369
    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 371
    :cond_0
    int-to-float v0, v1

    div-float/2addr v0, p3

    .line 372
    iget p3, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float p3, p3, v0

    if-lez p3, :cond_1

    .line 373
    iget p3, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget v2, p1, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v2

    mul-float/2addr v1, v2

    .line 374
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    add-float/2addr p3, v1

    iput p3, p2, Landroid/graphics/RectF;->bottom:F

    .line 375
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 377
    :cond_1
    return-void
.end method

.method private drawLine(FFFFLcom/android/gallery3d/ui/GLPaint;)V
    .locals 1

    .line 209
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 211
    invoke-direct {p0}, Lcom/android/camera/effect/renders/BasicRender;->initAttribPointer()V

    .line 212
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->updateViewport()V

    .line 213
    invoke-direct {p0, p5}, Lcom/android/camera/effect/renders/BasicRender;->initGLPaint(Lcom/android/gallery3d/ui/GLPaint;)V

    .line 215
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 216
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    const/4 v0, 0x0

    invoke-virtual {p5, p1, p2, v0}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 217
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    sub-float/2addr p3, p1

    sub-float/2addr p4, p2

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p5, p3, p4, p1}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 218
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p3

    const/4 p4, 0x1

    const/4 p5, 0x0

    invoke-static {p2, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 219
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p3

    invoke-static {p2, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 220
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p3

    invoke-static {p2, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 221
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result p3

    invoke-static {p2, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 222
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    invoke-static {p2, v0, v0, v0, p1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 223
    const/4 p1, 0x3

    const/4 p2, 0x4

    const/4 p3, 0x2

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 224
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 225
    return-void
.end method

.method private drawMesh(Lcom/android/gallery3d/ui/BasicTexture;FFIIII)V
    .locals 8

    .line 299
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 300
    const v0, 0x84c0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/effect/renders/BasicRender;->bindTexture(Lcom/android/gallery3d/ui/BasicTexture;I)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 301
    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mBlendEnabled:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p1

    const v2, 0x3f733333    # 0.95f

    cmpg-float p1, p1, v2

    if-gez p1, :cond_1

    move p1, v0

    goto :goto_0

    :cond_1
    move p1, v1

    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/BasicRender;->setBlendEnabled(Z)V

    .line 303
    const p1, 0x8892

    invoke-static {p1, p4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 304
    iget v2, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributePositionH:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 305
    iget p4, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributePositionH:I

    invoke-static {p4}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 307
    invoke-static {p1, p5}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 308
    iget v2, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributeTexCoorH:I

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 309
    iget p4, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributeTexCoorH:I

    invoke-static {p4}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 311
    iget-object p4, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p4}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 312
    iget-object p4, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p4}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p4

    const/4 p5, 0x0

    invoke-virtual {p4, p2, p3, p5}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 313
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p3

    invoke-static {p2, v0, v1, p3, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 314
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p3

    invoke-static {p2, v0, v1, p3, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 315
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p3

    invoke-static {p2, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 316
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result p3

    invoke-static {p2, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 317
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-static {p2, p3, p5, p5, p5}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 318
    iget p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformTextureH:I

    invoke-static {p2, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 320
    const p2, 0x8893

    invoke-static {p2, p6}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 321
    const/4 p3, 0x5

    const/16 p4, 0x1401

    invoke-static {p3, p7, p4, v1}, Landroid/opengl/GLES20;->glDrawElements(IIII)V

    .line 323
    invoke-static {p2, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 324
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 325
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 326
    return-void
.end method

.method private drawMixed(Lcom/android/gallery3d/ui/BasicTexture;IFFFFF)V
    .locals 2

    .line 275
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 276
    const v0, 0x84c0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/effect/renders/BasicRender;->bindTexture(Lcom/android/gallery3d/ui/BasicTexture;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 278
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/effect/renders/BasicRender;->initAttribPointer()V

    .line 279
    invoke-direct {p0, p2}, Lcom/android/camera/effect/renders/BasicRender;->initGLPaint(I)V

    .line 280
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->updateViewport()V

    .line 282
    iget-boolean p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mBlendEnabled:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->isOpaque()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p1

    const p2, 0x3f733333    # 0.95f

    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    :cond_1
    move p1, v0

    goto :goto_0

    :cond_2
    move p1, v1

    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/BasicRender;->setBlendEnabled(Z)V

    .line 283
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 284
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p4, p5, p2}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 285
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    const/high16 p4, 0x3f800000    # 1.0f

    invoke-virtual {p1, p6, p7, p4}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 286
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p5

    invoke-static {p1, v0, v1, p5, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 287
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p5

    invoke-static {p1, v0, v1, p5, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 288
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p5

    invoke-static {p1, p5}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 289
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    sub-float/2addr p4, p3

    invoke-static {p1, p4, p2, p2, p3}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 290
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformTextureH:I

    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 291
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    iget-object p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p2}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result p2

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 293
    const/4 p1, 0x5

    const/4 p2, 0x4

    invoke-static {p1, v1, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 294
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 295
    return-void
.end method

.method private drawRect(FFFFLcom/android/gallery3d/ui/GLPaint;)V
    .locals 1

    .line 171
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 173
    invoke-direct {p0}, Lcom/android/camera/effect/renders/BasicRender;->initAttribPointer()V

    .line 174
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->updateViewport()V

    .line 175
    invoke-direct {p0, p5}, Lcom/android/camera/effect/renders/BasicRender;->initGLPaint(Lcom/android/gallery3d/ui/GLPaint;)V

    .line 177
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 178
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    const/4 v0, 0x0

    invoke-virtual {p5, p1, p2, v0}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 179
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p3, p4, p2}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 180
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p3

    const/4 p4, 0x1

    const/4 p5, 0x0

    invoke-static {p1, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 181
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p3

    invoke-static {p1, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 182
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p3

    invoke-static {p1, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 183
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result p3

    invoke-static {p1, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 184
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    invoke-static {p1, v0, v0, v0, p2}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 185
    const/4 p1, 0x2

    const/4 p2, 0x6

    const/4 p3, 0x4

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 186
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 187
    return-void
.end method

.method private drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 229
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->identityTexM()V

    .line 230
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/renders/BasicRender;->drawTextureInternal(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V

    .line 231
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 232
    return-void
.end method

.method private drawTexture(Lcom/android/gallery3d/ui/BasicTexture;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 10

    .line 235
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-lez v0, :cond_2

    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    goto :goto_0

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-virtual {p1, v0}, Lcom/android/gallery3d/ui/BasicTexture;->onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 237
    :cond_1
    invoke-direct {p0, p2, p3, p1}, Lcom/android/camera/effect/renders/BasicRender;->convertCoordinate(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/gallery3d/ui/BasicTexture;)V

    .line 238
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 239
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, p2, Landroid/graphics/RectF;->top:F

    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v1, v2, v3, p2}, Lcom/android/camera/effect/GLCanvasState;->setTexMatrix(FFFF)V

    .line 240
    iget v6, p3, Landroid/graphics/RectF;->left:F

    iget v7, p3, Landroid/graphics/RectF;->top:F

    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v8

    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v9

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lcom/android/camera/effect/renders/BasicRender;->drawTextureInternal(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V

    .line 241
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 242
    return-void

    .line 235
    :cond_2
    :goto_0
    return-void
.end method

.method private drawTextureInternal(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V
    .locals 8

    .line 245
    const/4 v0, 0x0

    cmpg-float v1, p4, v0

    if-lez v1, :cond_5

    cmpg-float v1, p5, v0

    if-gtz v1, :cond_0

    goto/16 :goto_2

    .line 246
    :cond_0
    iget v1, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 247
    const v1, 0x84c0

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/effect/renders/BasicRender;->bindTexture(Lcom/android/gallery3d/ui/BasicTexture;I)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 249
    :cond_1
    iget v1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v0, v0, v0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 250
    iget v1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformTextureH:I

    const/4 v3, 0x0

    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 252
    invoke-direct {p0}, Lcom/android/camera/effect/renders/BasicRender;->initAttribPointer()V

    .line 253
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->updateViewport()V

    .line 255
    iget-object v1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result v1

    .line 256
    iget-object v4, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v4}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result v4

    .line 257
    nop

    .line 258
    instance-of v5, p1, Lcom/android/gallery3d/ui/UploadedTexture;

    if-eqz v5, :cond_2

    .line 259
    move-object v5, p1

    check-cast v5, Lcom/android/gallery3d/ui/UploadedTexture;

    invoke-virtual {v5}, Lcom/android/gallery3d/ui/UploadedTexture;->isPremultiplied()Z

    move-result v5

    goto :goto_0

    .line 261
    :cond_2
    move v5, v3

    :goto_0
    iget-boolean v6, p0, Lcom/android/camera/effect/renders/BasicRender;->mBlendEnabled:Z

    const/4 v7, 0x1

    if-eqz v6, :cond_4

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->isOpaque()Z

    move-result p1

    if-eqz p1, :cond_3

    const p1, 0x3f733333    # 0.95f

    cmpg-float p1, v1, p1

    if-ltz p1, :cond_3

    cmpl-float p1, v4, v0

    if-ltz p1, :cond_4

    :cond_3
    move p1, v7

    goto :goto_1

    :cond_4
    move p1, v3

    :goto_1
    invoke-virtual {p0, p1, v5}, Lcom/android/camera/effect/renders/BasicRender;->setBlendEnabled(ZZ)V

    .line 263
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1, p2, p3, v0}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 264
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1, p4, p5, v2}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 265
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p2}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p2

    invoke-static {p1, v7, v3, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 266
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p2, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p2}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p2

    invoke-static {p1, v7, v3, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 267
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 268
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    invoke-static {p1, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 270
    const/4 p1, 0x5

    const/4 p2, 0x4

    invoke-static {p1, v3, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 271
    return-void

    .line 245
    :cond_5
    :goto_2
    return-void
.end method

.method private fillRect(FFFFI)V
    .locals 1

    .line 190
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 192
    invoke-direct {p0}, Lcom/android/camera/effect/renders/BasicRender;->initAttribPointer()V

    .line 193
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->updateViewport()V

    .line 194
    invoke-direct {p0, p5}, Lcom/android/camera/effect/renders/BasicRender;->initGLPaint(I)V

    .line 196
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 197
    iget-object p5, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p5}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p5

    const/4 v0, 0x0

    invoke-virtual {p5, p1, p2, v0}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 198
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p3, p4, p2}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 199
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object p3

    const/4 p4, 0x1

    const/4 p5, 0x0

    invoke-static {p1, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 200
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object p3

    invoke-static {p1, p4, p5, p3, p5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 201
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p3

    invoke-static {p1, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 202
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    iget-object p3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->getBlendAlpha()F

    move-result p3

    invoke-static {p1, p3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 203
    iget p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    invoke-static {p1, v0, v0, v0, p2}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 204
    const/4 p1, 0x5

    const/4 p2, 0x4

    invoke-static {p1, p5, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 205
    iget-object p1, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 206
    return-void
.end method

.method private initAttribPointer()V
    .locals 12

    .line 345
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributePositionH:I

    iget-object v5, p0, Lcom/android/camera/effect/renders/BasicRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x2

    const/16 v2, 0x1406

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 346
    iget v6, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributeTexCoorH:I

    iget-object v11, p0, Lcom/android/camera/effect/renders/BasicRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    const/4 v7, 0x2

    const/16 v8, 0x1406

    const/4 v9, 0x0

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 348
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributePositionH:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 349
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributeTexCoorH:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 350
    return-void
.end method

.method private initGLPaint(I)V
    .locals 5

    .line 334
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3b808081

    mul-float/2addr v0, v1

    .line 335
    iget-boolean v2, p0, Lcom/android/camera/effect/renders/BasicRender;->mBlendEnabled:Z

    if-eqz v2, :cond_1

    const v2, 0x3f733333    # 0.95f

    cmpg-float v3, v0, v2

    if-ltz v3, :cond_0

    iget-object v3, p0, Lcom/android/camera/effect/renders/BasicRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    .line 336
    invoke-interface {v3}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result v3

    cmpg-float v2, v3, v2

    if-gez v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 335
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/camera/effect/renders/BasicRender;->setBlendEnabled(Z)V

    .line 337
    iget v2, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformPaintColorH:I

    .line 338
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    .line 339
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v1

    .line 340
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, v1

    .line 337
    invoke-static {v2, v3, v4, p1, v0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 342
    return-void
.end method

.method private initGLPaint(Lcom/android/gallery3d/ui/GLPaint;)V
    .locals 1

    .line 329
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/GLPaint;->getColor()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/effect/renders/BasicRender;->initGLPaint(I)V

    .line 330
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/GLPaint;->getLineWidth()F

    move-result p1

    invoke-static {p1}, Landroid/opengl/GLES20;->glLineWidth(F)V

    .line 331
    return-void
.end method


# virtual methods
.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 8

    .line 92
    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/BasicRender;->isAttriSupported(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 93
    const/4 p1, 0x0

    return p1

    .line 96
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v0

    const/4 v1, 0x7

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 152
    :pswitch_0
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 153
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    int-to-float v2, v0

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    int-to-float v3, v0

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    int-to-float v4, v0

    iget p1, p1, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    int-to-float v5, p1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BasicRender;->drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V

    .line 158
    goto/16 :goto_0

    .line 142
    :pswitch_1
    check-cast p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;

    .line 143
    iget v1, p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mX:F

    iget v2, p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mY:F

    iget v3, p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mWidth:F

    iget v4, p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mHeight:F

    iget v5, p1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;->mColor:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BasicRender;->fillRect(FFFFI)V

    .line 148
    goto :goto_0

    .line 130
    :pswitch_2
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;

    .line 131
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mToColor:I

    iget v3, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mRatio:F

    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mX:F

    iget v5, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mY:F

    iget v6, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mWidth:F

    iget v7, p1, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mHeight:F

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/BasicRender;->drawMixed(Lcom/android/gallery3d/ui/BasicTexture;IFFFFF)V

    .line 138
    goto :goto_0

    .line 118
    :pswitch_3
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;

    .line 119
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mX:F

    iget v3, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mY:F

    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mXYBuffer:I

    iget v5, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mUVBuffer:I

    iget v6, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexBuffer:I

    iget v7, p1, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexCount:I

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/BasicRender;->drawMesh(Lcom/android/gallery3d/ui/BasicTexture;FFIIII)V

    .line 126
    goto :goto_0

    .line 108
    :pswitch_4
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;

    .line 109
    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mX:F

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mY:F

    iget v3, p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mWidth:F

    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mHeight:F

    iget-object v5, p1, Lcom/android/camera/effect/draw_mode/DrawRectAttribute;->mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BasicRender;->drawRect(FFFFLcom/android/gallery3d/ui/GLPaint;)V

    .line 114
    goto :goto_0

    .line 98
    :pswitch_5
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;

    .line 99
    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mX1:F

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mY1:F

    iget v3, p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mX2:F

    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mY2:F

    iget-object v5, p1, Lcom/android/camera/effect/draw_mode/DrawLineAttribute;->mGLPaint:Lcom/android/gallery3d/ui/GLPaint;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BasicRender;->drawLine(FFFFLcom/android/gallery3d/ui/GLPaint;)V

    .line 104
    goto :goto_0

    .line 162
    :cond_1
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;

    .line 163
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;->mSourceRectF:Landroid/graphics/RectF;

    iget-object p1, p1, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;->mTargetRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/effect/renders/BasicRender;->drawTexture(Lcom/android/gallery3d/ui/BasicTexture;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 164
    nop

    .line 167
    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .line 65
    const-string v0, "frag_normal.txt"

    invoke-static {v0}, Lcom/android/camera/effect/ShaderUtil;->loadFromAssetsFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected initShader()V
    .locals 3

    .line 46
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->getVertexShaderString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/BasicRender;->getFragShaderString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/ShaderUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    .line 47
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    if-eqz v0, :cond_0

    .line 48
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 49
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformMVPMatrixH:I

    .line 50
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uSTMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformSTMatrixH:I

    .line 51
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "sTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformTextureH:I

    .line 52
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uAlpha"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformAlphaH:I

    .line 53
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uMixAlpha"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendAlphaH:I

    .line 54
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uBlendFactor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformBlendFactorH:I

    .line 55
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "uPaintColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mUniformPaintColorH:I

    .line 56
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributePositionH:I

    .line 57
    iget v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mProgram:I

    const-string v1, "aTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttributeTexCoorH:I

    .line 61
    return-void

    .line 59
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ": mProgram = 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected initSupportAttriList()V
    .locals 2

    .line 81
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    return-void
.end method

.method protected initVertexData()V
    .locals 3

    .line 70
    sget-object v0, Lcom/android/camera/effect/renders/BasicRender;->VERTICES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    div-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Lcom/android/camera/effect/renders/BasicRender;->allocateByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 71
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    sget-object v1, Lcom/android/camera/effect/renders/BasicRender;->VERTICES:[F

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 72
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 74
    sget-object v0, Lcom/android/camera/effect/renders/BasicRender;->TEXTURES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    div-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Lcom/android/camera/effect/renders/BasicRender;->allocateByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    .line 75
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    sget-object v2, Lcom/android/camera/effect/renders/BasicRender;->TEXTURES:[F

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 76
    iget-object v0, p0, Lcom/android/camera/effect/renders/BasicRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 77
    return-void
.end method
