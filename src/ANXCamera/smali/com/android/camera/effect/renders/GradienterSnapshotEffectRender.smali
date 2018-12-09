.class public Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;
.super Lcom/android/camera/effect/renders/PixelEffectRender;
.source "GradienterSnapshotEffectRender.java"


# static fields
.field private static final FRAG:Ljava/lang/String; = "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D sTexture; \nuniform float sAngle; \nuniform vec2 vTexSize; \nuniform vec2 vTargetSize; \nuniform vec2 vTargetCenter; \nvoid main() \n{ \n  float pf = min(vTargetSize.s,vTargetSize.t) / max(vTargetSize.s,vTargetSize.t);\n  float mOrigin = atan(pf); \n  float rorate_angle = sAngle; \n  float fangle = radians(abs(rorate_angle)) + mOrigin;\n  float s = sin(mOrigin) / sin(fangle);\n  float center_x = vTargetCenter.x; \n  float center_y = vTargetCenter.y; \n  float tx = center_x - center_x * s; \n  float ty = center_y - center_y * s; \n  float cosangle = cos(radians(rorate_angle)); \n  float sinangle = sin(radians(rorate_angle)); \n  float x = s * (vTexCoord.s * vTexSize.s) + tx; \n  float y = s * (vTexCoord.t * vTexSize.t) + ty; \n  float  x1 = x - center_x; \n  float  y1 = y - center_y; \n  x = cosangle * x1 + sinangle * y1 + center_x; \n  y = -1.0 * sinangle * x1 + cosangle * y1 + center_y; \n  x = x / vTexSize.s; \n  y = y / vTexSize.t; \n  x = clamp(x,0.0,1.0); \n  y = clamp(y,0.0,1.0); \n  gl_FragColor = texture2D(sTexture, vec2(x,y)); \n} \n"


# instance fields
.field private mSquareModeExtraMargin:I

.field private mUniformAngle:I

.field private mUniformTargetCenter:I

.field private mUniformTargetSize:I

.field private mUniformTexSize:I


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 24
    return-void
.end method

.method private getRotation()F
    .locals 2

    .line 69
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mShootRotation:F

    iget v1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mOrientation:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    .line 70
    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    .line 71
    const/high16 v1, 0x43b40000    # 360.0f

    sub-float/2addr v0, v1

    .line 73
    :cond_0
    return v0
.end method


# virtual methods
.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .line 63
    const-string v0, "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D sTexture; \nuniform float sAngle; \nuniform vec2 vTexSize; \nuniform vec2 vTargetSize; \nuniform vec2 vTargetCenter; \nvoid main() \n{ \n  float pf = min(vTargetSize.s,vTargetSize.t) / max(vTargetSize.s,vTargetSize.t);\n  float mOrigin = atan(pf); \n  float rorate_angle = sAngle; \n  float fangle = radians(abs(rorate_angle)) + mOrigin;\n  float s = sin(mOrigin) / sin(fangle);\n  float center_x = vTargetCenter.x; \n  float center_y = vTargetCenter.y; \n  float tx = center_x - center_x * s; \n  float ty = center_y - center_y * s; \n  float cosangle = cos(radians(rorate_angle)); \n  float sinangle = sin(radians(rorate_angle)); \n  float x = s * (vTexCoord.s * vTexSize.s) + tx; \n  float y = s * (vTexCoord.t * vTexSize.t) + ty; \n  float  x1 = x - center_x; \n  float  y1 = y - center_y; \n  x = cosangle * x1 + sinangle * y1 + center_x; \n  y = -1.0 * sinangle * x1 + cosangle * y1 + center_y; \n  x = x / vTexSize.s; \n  y = y / vTexSize.t; \n  x = clamp(x,0.0,1.0); \n  y = clamp(y,0.0,1.0); \n  gl_FragColor = texture2D(sTexture, vec2(x,y)); \n} \n"

    return-object v0
.end method

.method protected initShader()V
    .locals 2

    .line 28
    invoke-super {p0}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShader()V

    .line 29
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mProgram:I

    const-string v1, "sAngle"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformAngle:I

    .line 30
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mProgram:I

    const-string v1, "vTexSize"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTexSize:I

    .line 31
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mProgram:I

    const-string v1, "vTargetSize"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTargetSize:I

    .line 32
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mProgram:I

    const-string v1, "vTargetCenter"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTargetCenter:I

    .line 33
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900bf

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSquareModeExtraMargin:I

    .line 35
    return-void
.end method

.method protected initShaderValue(Z)V
    .locals 4

    .line 39
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/PixelEffectRender;->initShaderValue(Z)V

    .line 40
    iget p1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    if-eqz p1, :cond_2

    .line 41
    iget p1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTexSize:I

    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    int-to-float v1, v1

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 42
    iget p1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    int-to-float p1, p1

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr p1, v0

    .line 43
    iget v1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    .line 44
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 45
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 46
    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTargetSize:I

    int-to-float v0, v0

    invoke-static {v2, v0, v0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 48
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    if-le v0, v2, :cond_0

    .line 49
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSquareModeExtraMargin:I

    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    mul-int/2addr v0, v2

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v0, v2

    int-to-float v0, v0

    sub-float/2addr p1, v0

    goto :goto_0

    .line 51
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSquareModeExtraMargin:I

    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    mul-int/2addr v0, v2

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v0, v2

    int-to-float v0, v0

    sub-float/2addr v1, v0

    .line 53
    :goto_0
    goto :goto_1

    .line 54
    :cond_1
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTargetSize:I

    iget v2, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginWidth:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mSnapshotOriginHeight:I

    int-to-float v3, v3

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 56
    :goto_1
    iget v0, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformTargetCenter:I

    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 57
    iget p1, p0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->mUniformAngle:I

    invoke-direct {p0}, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;->getRotation()F

    move-result v0

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 59
    :cond_2
    return-void
.end method
