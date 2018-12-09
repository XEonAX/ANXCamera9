.class public Lcom/android/camera/effect/renders/BeautificationWrapperRender;
.super Lcom/android/camera/effect/renders/WrapperRender;
.source "BeautificationWrapperRender.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-class v0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;Z)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/effect/renders/WrapperRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    .line 23
    new-instance p2, Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-direct {p2, p1}, Lcom/android/camera/effect/renders/NoneEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object p2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    .line 24
    invoke-virtual {p0, p4}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->adjustSize(Z)V

    .line 25
    return-void
.end method

.method private drawToFrameBuffer(IFFFF)V
    .locals 8

    .line 70
    iget v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mParentFrameBufferId:I

    if-eqz v0, :cond_0

    .line 71
    const v0, 0x8d40

    iget v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mParentFrameBufferId:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 72
    const/4 v0, 0x0

    invoke-static {v0, v0, v0, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    const/4 v7, 0x0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v7}, Lcom/android/camera/effect/renders/NoneEffectRender;->drawTexture(IFFFFZ)V

    .line 75
    return-void
.end method

.method private dumpGLParams(Ljava/lang/String;)V
    .locals 13

    .line 91
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glIsEnabled(I)Z

    move-result v0

    .line 92
    const/4 v1, 0x1

    new-array v2, v1, [I

    .line 93
    const/4 v3, 0x0

    const/16 v4, 0xb45

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 94
    aget v4, v2, v3

    .line 95
    const/16 v5, 0xb46

    invoke-static {v5, v2, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 96
    aget v5, v2, v3

    .line 97
    const v6, 0x84e0

    invoke-static {v6, v2, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 98
    aget v6, v2, v3

    .line 99
    const v7, 0x8069

    invoke-static {v7, v2, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 100
    aget v7, v2, v3

    .line 101
    const v8, 0x8ca6

    invoke-static {v8, v2, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 102
    aget v2, v2, v3

    .line 104
    const/4 v8, 0x4

    new-array v9, v8, [I

    .line 105
    const/16 v10, 0xba2

    invoke-static {v10, v9, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 106
    sget-object v10, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->TAG:Ljava/lang/String;

    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "cullFace=%b faceMode=0x%x frontFace=0x%x activeTex=0x%x bindTex=%d bindBuf=%d viewport=[%d %d %d %d]"

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v12, 0xa

    new-array v12, v12, [Ljava/lang/Object;

    .line 107
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v12, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v12, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x2

    aput-object v0, v12, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x3

    aput-object v0, v12, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v12, v8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x5

    aput-object v0, v12, v2

    aget v0, v9, v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x6

    aput-object v0, v12, v2

    aget v0, v9, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x7

    aput-object v0, v12, v1

    aget v0, v9, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x8

    aput-object v0, v12, v1

    aget v0, v9, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x9

    aput-object v0, v12, v1

    .line 106
    invoke-static {v11, p1, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v10, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    return-void
.end method


# virtual methods
.method public adjustSize(Z)V
    .locals 4

    .line 28
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 29
    const/16 p1, 0x5a

    iget-object v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-static {p1, v0, v0, v1, v2}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->adjustSize(IZZLjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    goto :goto_0

    .line 31
    :cond_0
    const/16 p1, 0x10e

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v3, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->adjustSize(IZZLjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    .line 33
    :goto_0
    return-void
.end method

.method protected drawTexture(IFFFF)V
    .locals 8

    .line 58
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget-object v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v0

    .line 59
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 60
    nop

    .line 63
    move v3, p1

    goto :goto_0

    :cond_0
    move v3, v0

    :goto_0
    const/16 p1, 0xb44

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 66
    move-object v2, p0

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->drawToFrameBuffer(IFFFF)V

    .line 67
    return-void
.end method

.method protected drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V
    .locals 7

    .line 44
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v3, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v0

    .line 45
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 46
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v0

    .line 49
    :cond_0
    move v2, v0

    const/16 p1, 0xb44

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 52
    move-object v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->drawToFrameBuffer(IFFFF)V

    .line 53
    return-void
.end method

.method public setBuffer([BII)V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    instance-of v0, v0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    check-cast v0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->passPreviewFrameToTexture([BII)V

    .line 39
    :cond_0
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1

    .line 85
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/WrapperRender;->setPreviewSize(II)V

    .line 86
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/NoneEffectRender;->setPreviewSize(II)V

    .line 87
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDisplaySizeChanged(II)V

    .line 88
    return-void
.end method

.method public setViewportSize(II)V
    .locals 1

    .line 79
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/WrapperRender;->setViewportSize(II)V

    .line 80
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/NoneEffectRender;->setViewportSize(II)V

    .line 81
    return-void
.end method
