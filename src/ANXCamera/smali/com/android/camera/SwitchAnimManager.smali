.class public Lcom/android/camera/SwitchAnimManager;
.super Ljava/lang/Object;
.source "SwitchAnimManager.java"


# static fields
.field private static final ROTATE_DURATION:F = 300.0f

.field private static final TAG:Ljava/lang/String; = "SwitchAnimManager"

.field private static final ZOOM_DELTA_PREVIEW:F = 0.2f


# instance fields
.field private mAlphaAnimation:Z

.field private mAnimStartTime:J

.field private mExtScale:F

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mMoveBack:Z

.field private mNewPreview:Z

.field private mPreviewFrameLayoutWidth:I

.field private mRecurBlur:Z

.field private mReviewDrawingHeight:I

.field private mReviewDrawingWidth:I

.field private mReviewDrawingX:I

.field private mReviewDrawingY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/SwitchAnimManager;->mExtScale:F

    .line 50
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/SwitchAnimManager;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 65
    return-void
.end method

.method private drawAnimationBlend(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z
    .locals 9

    move-object v0, p0

    .line 114
    iget-boolean v1, v0, Lcom/android/camera/SwitchAnimManager;->mNewPreview:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 115
    return v2

    .line 117
    :cond_0
    const/4 v1, 0x1

    .line 118
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, v0, Lcom/android/camera/SwitchAnimManager;->mAnimStartTime:J

    sub-long/2addr v3, v5

    .line 119
    long-to-float v5, v3

    const/high16 v6, 0x43960000    # 300.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1

    .line 120
    nop

    .line 121
    const-wide/16 v3, 0x12c

    .line 124
    move v8, v2

    goto :goto_0

    :cond_1
    move v8, v1

    :goto_0
    if-nez v8, :cond_2

    iget-boolean v1, v0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    if-eqz v1, :cond_2

    .line 125
    iput-boolean v2, v0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    .line 128
    :cond_2
    iget-object v1, v0, Lcom/android/camera/SwitchAnimManager;->mInterpolator:Landroid/view/animation/Interpolator;

    long-to-float v2, v3

    div-float/2addr v2, v6

    invoke-interface {v1, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v7

    .line 132
    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/SwitchAnimManager;->drawBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;F)V

    .line 134
    return v8
.end method

.method private drawBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;F)V
    .locals 6

    .line 150
    iget-boolean p2, p0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    if-eqz p2, :cond_0

    .line 151
    invoke-virtual {p6, p1}, Lcom/android/camera/CameraScreenNail;->renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 153
    :cond_0
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 157
    iget-boolean p2, p0, Lcom/android/camera/SwitchAnimManager;->mAlphaAnimation:Z

    if-eqz p2, :cond_1

    .line 158
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    const/high16 p3, 0x3f800000    # 1.0f

    const p4, 0x3f333333    # 0.7f

    mul-float/2addr p7, p4

    sub-float/2addr p3, p7

    invoke-virtual {p2, p3}, Lcom/android/camera/effect/GLCanvasState;->setBlendAlpha(F)V

    .line 160
    :cond_1
    iget v2, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingX:I

    iget v3, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingY:I

    iget v4, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    iget v5, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    move-object v0, p6

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/CameraScreenNail;->drawBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 162
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 163
    return-void
.end method

.method private drawCopiedTexture(Lcom/android/gallery3d/ui/GLCanvas;IILcom/android/gallery3d/ui/RawTexture;F)V
    .locals 19

    move-object/from16 v0, p0

    .line 167
    iget-boolean v2, v0, Lcom/android/camera/SwitchAnimManager;->mMoveBack:Z

    const v3, 0x3e4ccccd    # 0.2f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x40000000    # 2.0f

    if-eqz v2, :cond_0

    .line 169
    iget v2, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingX:I

    int-to-float v2, v2

    iget v6, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    int-to-float v6, v6

    div-float/2addr v6, v5

    add-float/2addr v2, v6

    .line 170
    iget v6, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingY:I

    int-to-float v6, v6

    iget v7, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    int-to-float v7, v7

    div-float/2addr v7, v5

    add-float/2addr v6, v7

    .line 172
    mul-float v3, v3, p5

    sub-float/2addr v4, v3

    .line 173
    iget v1, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, v4

    .line 174
    iget v0, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    int-to-float v0, v0

    mul-float/2addr v0, v4

    .line 176
    div-float v3, v1, v5

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 177
    div-float v2, v0, v5

    sub-float/2addr v6, v2

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v10

    .line 178
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v11

    .line 179
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 178
    move-object/from16 v7, p4

    move-object/from16 v8, p1

    invoke-virtual/range {v7 .. v12}, Lcom/android/gallery3d/ui/RawTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 180
    goto :goto_0

    .line 181
    :cond_0
    invoke-virtual/range {p4 .. p4}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v2

    .line 182
    invoke-virtual/range {p4 .. p4}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v6

    .line 184
    int-to-float v2, v2

    div-float v7, v2, v5

    .line 185
    int-to-float v6, v6

    div-float v8, v6, v5

    .line 186
    mul-float v3, v3, p5

    sub-float/2addr v4, v3

    .line 187
    mul-float/2addr v2, v4

    .line 188
    mul-float/2addr v6, v4

    .line 189
    div-float v1, v2, v5

    sub-float/2addr v7, v1

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v11

    .line 190
    div-float v1, v6, v5

    sub-float/2addr v8, v1

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 192
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v13

    .line 193
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v14

    iget v15, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingX:I

    iget v1, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingY:I

    iget v2, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    iget v0, v0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    .line 192
    move-object/from16 v9, p4

    move-object/from16 v10, p1

    move/from16 v16, v1

    move/from16 v17, v2

    move/from16 v18, v0

    invoke-virtual/range {v9 .. v18}, Lcom/android/gallery3d/ui/RawTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIIIIIII)V

    .line 196
    :goto_0
    return-void
.end method

.method private drawRealTimeTexture(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;F)V
    .locals 6

    .line 139
    iget-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mNewPreview:Z

    if-nez v0, :cond_0

    .line 140
    return-void

    .line 142
    :cond_0
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 143
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0, p7}, Lcom/android/camera/effect/GLCanvasState;->setAlpha(F)V

    .line 144
    move-object v0, p6

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/CameraScreenNail;->directDraw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 145
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 146
    return-void
.end method


# virtual methods
.method public clearAnimation()V
    .locals 2

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/SwitchAnimManager;->mAnimStartTime:J

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    .line 99
    iput-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mAlphaAnimation:Z

    .line 100
    return-void
.end method

.method public drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z
    .locals 0

    .line 223
    invoke-direct/range {p0 .. p7}, Lcom/android/camera/SwitchAnimManager;->drawAnimationBlend(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result p1

    return p1
.end method

.method public drawPreview(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)Z
    .locals 8

    .line 201
    int-to-float p2, p2

    int-to-float p4, p4

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p4, v0

    add-float/2addr p2, v1

    .line 202
    int-to-float p3, p3

    int-to-float p5, p5

    div-float/2addr p5, v0

    add-float/2addr p3, p5

    .line 203
    nop

    .line 204
    iget p5, p0, Lcom/android/camera/SwitchAnimManager;->mPreviewFrameLayoutWidth:I

    if-eqz p5, :cond_0

    .line 205
    iget p5, p0, Lcom/android/camera/SwitchAnimManager;->mPreviewFrameLayoutWidth:I

    int-to-float p5, p5

    div-float/2addr p4, p5

    goto :goto_0

    .line 207
    :cond_0
    const-string p4, "SwitchAnimManager"

    const-string p5, "previewFrameLayoutWidth=0"

    invoke-static {p4, p5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    const/high16 p4, 0x3f800000    # 1.0f

    :goto_0
    iget p5, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    int-to-float p5, p5

    mul-float/2addr p5, p4

    .line 210
    iget v1, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, p4

    .line 211
    div-float p4, p5, v0

    sub-float/2addr p2, p4

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 212
    div-float p2, v1, v0

    sub-float/2addr p3, p2

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 215
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->getAlpha()F

    move-result p2

    .line 216
    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v7

    move-object v2, p6

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/android/gallery3d/ui/RawTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 217
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/GLCanvasState;->setAlpha(F)V

    .line 218
    const/4 p1, 0x1

    return p1
.end method

.method public getExtScaleX()F
    .locals 1

    .line 227
    iget v0, p0, Lcom/android/camera/SwitchAnimManager;->mExtScale:F

    return v0
.end method

.method public getExtScaleY()F
    .locals 1

    .line 231
    iget v0, p0, Lcom/android/camera/SwitchAnimManager;->mExtScale:F

    return v0
.end method

.method public setPreviewFrameLayoutSize(II)V
    .locals 1

    .line 79
    iput p1, p0, Lcom/android/camera/SwitchAnimManager;->mPreviewFrameLayoutWidth:I

    .line 80
    if-nez p1, :cond_0

    .line 81
    const-string p1, "SwitchAnimManager"

    const-string p2, "invalid preview frame width"

    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {p1, p2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    :cond_0
    return-void
.end method

.method public setReviewDrawingSize(IIII)V
    .locals 0

    .line 68
    iput p1, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingX:I

    .line 69
    iput p2, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingY:I

    .line 70
    iput p3, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingWidth:I

    .line 71
    iput p4, p0, Lcom/android/camera/SwitchAnimManager;->mReviewDrawingHeight:I

    .line 72
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/SwitchAnimManager;->mMoveBack:Z

    .line 73
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/SwitchAnimManager;->mNewPreview:Z

    .line 74
    return-void
.end method

.method public startAnimation(Z)V
    .locals 2

    .line 86
    if-eqz p1, :cond_0

    .line 87
    const-string v0, "SwitchAnimManager"

    const-string v1, "startAnimation with alpha animation"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 89
    :cond_0
    const-string v0, "SwitchAnimManager"

    const-string v1, "startAnimation"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/SwitchAnimManager;->mAnimStartTime:J

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    .line 93
    iput-boolean p1, p0, Lcom/android/camera/SwitchAnimManager;->mAlphaAnimation:Z

    .line 94
    return-void
.end method

.method public startResume()V
    .locals 2

    .line 103
    const-string v0, "SwitchAnimManager"

    const-string v1, "startResume"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mNewPreview:Z

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SwitchAnimManager;->mRecurBlur:Z

    .line 107
    return-void
.end method
