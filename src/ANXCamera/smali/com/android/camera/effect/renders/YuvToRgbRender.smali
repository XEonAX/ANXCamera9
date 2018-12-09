.class public Lcom/android/camera/effect/renders/YuvToRgbRender;
.super Lcom/android/camera/effect/renders/ShaderRender;
.source "YuvToRgbRender.java"


# static fields
.field private static final FRAG:Ljava/lang/String; = "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D uYTexture; \nuniform sampler2D uUVTexture; \nvoid main (void){ \n   float r, g, b, y, u, v; \n   y = texture2D(uYTexture, vTexCoord).r; \n   u = texture2D(uUVTexture, vTexCoord).a - 0.5; \n   v = texture2D(uUVTexture, vTexCoord).r - 0.5; \n   r = y + 1.402 * v;\n   g = y - 0.34414 * u - 0.71414 * v;\n   b = y + 1.772 * u;\n   gl_FragColor = vec4(r, g, b, 1); \n} \n"

.field private static final TAG:Ljava/lang/String;

.field private static final TEXTURES:[F

.field private static final VERTICES:[F


# instance fields
.field private mUniformUVTexture:I

.field private mUniformYTexture:I

.field private mYuvTextureIds:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    const-class v0, Lcom/android/camera/effect/renders/YuvToRgbRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TAG:Ljava/lang/String;

    .line 18
    const/16 v0, 0x8

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/effect/renders/YuvToRgbRender;->VERTICES:[F

    .line 19
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TEXTURES:[F

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
    .end array-data
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/ShaderRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 28
    return-void
.end method

.method private drawTexture([IFFFF)V
    .locals 3

    .line 102
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 104
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->updateViewport()V

    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->setBlendEnabled(Z)V

    .line 108
    iget-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 109
    iget-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p2, p3, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FFF)V

    .line 110
    iget-object p2, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p2}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p2, p4, p5, p3}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    .line 112
    aget p2, p1, v0

    const/16 p3, 0xde1

    const/4 p4, -0x1

    if-eq p2, p4, :cond_0

    .line 113
    const p2, 0x84c0

    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 114
    aget p2, p1, v0

    invoke-static {p3, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 115
    iget p2, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformYTexture:I

    invoke-static {p2, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 118
    :cond_0
    const/4 p2, 0x1

    aget p5, p1, p2

    if-eq p5, p4, :cond_1

    .line 119
    const p4, 0x84c1

    invoke-static {p4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 120
    aget p1, p1, p2

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 121
    iget p1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformUVTexture:I

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 123
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->initShaderValue()V

    .line 125
    const/4 p1, 0x5

    const/4 p2, 0x4

    invoke-static {p1, v0, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 126
    iget-object p1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 127
    return-void
.end method


# virtual methods
.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 14

    .line 80
    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->isAttriSupported(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 81
    sget-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unsupported target "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return v1

    .line 85
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v0

    const/16 v2, 0xb

    const/4 v3, 0x1

    if-eq v0, v2, :cond_1

    .line 96
    sget-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unsupported target "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 87
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 88
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    .line 89
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mYBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mUVBuffer:Ljava/nio/ByteBuffer;

    iget v6, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWidth:I

    iget v7, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mHeight:I

    invoke-virtual {p0, v0, v2, v6, v7}, Lcom/android/camera/effect/renders/YuvToRgbRender;->genYUVTextures(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)V

    .line 90
    iget-object v9, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWidth:I

    int-to-float v12, v0

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mHeight:I

    int-to-float v13, v0

    move-object v8, p0

    invoke-direct/range {v8 .. v13}, Lcom/android/camera/effect/renders/YuvToRgbRender;->drawTexture([IFFFF)V

    .line 92
    sget-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "draw: size=%dx%d time=%d"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    iget v8, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWidth:I

    .line 93
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    iget p1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mHeight:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v3

    const/4 p1, 0x2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v7, p1

    .line 92
    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    nop

    .line 98
    :goto_0
    return v3
.end method

.method public genYUVTextures(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    invoke-static {p1, p2, p3, p4, v0}, Lcom/android/camera/effect/ShaderUtil;->loadYuvToTextures(Ljava/nio/Buffer;Ljava/nio/Buffer;II[I)V

    .line 132
    return-void
.end method

.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .line 136
    const-string v0, "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D uYTexture; \nuniform sampler2D uUVTexture; \nvoid main (void){ \n   float r, g, b, y, u, v; \n   y = texture2D(uYTexture, vTexCoord).r; \n   u = texture2D(uUVTexture, vTexCoord).a - 0.5; \n   v = texture2D(uUVTexture, vTexCoord).r - 0.5; \n   r = y + 1.402 * v;\n   g = y - 0.34414 * u - 0.71414 * v;\n   b = y + 1.772 * u;\n   gl_FragColor = vec4(r, g, b, 1); \n} \n"

    return-object v0
.end method

.method protected initShader()V
    .locals 6

    .line 32
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->getVertexShaderString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->getFragShaderString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/ShaderUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    .line 33
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    if-eqz v0, :cond_0

    .line 34
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 35
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformMVPMatrixH:I

    .line 36
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "uSTMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformSTMatrixH:I

    .line 37
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributePositionH:I

    .line 38
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "aTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributeTexCoorH:I

    .line 39
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "uYTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformYTexture:I

    .line 40
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mProgram:I

    const-string v1, "uUVTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformUVTexture:I

    .line 42
    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    .line 43
    iget-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 44
    sget-object v1, Lcom/android/camera/effect/renders/YuvToRgbRender;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "genTexture: %d %d"

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    aget v5, v5, v2

    .line 45
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v0, v2

    iget-object v2, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mYuvTextureIds:[I

    const/4 v5, 0x1

    aget v2, v2, v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v5

    .line 44
    invoke-static {v3, v4, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-void

    .line 47
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

.method protected initShaderValue()V
    .locals 12

    .line 68
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributePositionH:I

    iget-object v5, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x2

    const/16 v2, 0x1406

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 69
    iget v6, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributeTexCoorH:I

    iget-object v11, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    const/4 v7, 0x2

    const/16 v8, 0x1406

    const/4 v9, 0x0

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 71
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributePositionH:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 72
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttributeTexCoorH:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 74
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformMVPMatrixH:I

    iget-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/GLCanvasState;->getFinalMatrix()[F

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 75
    iget v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mUniformSTMatrixH:I

    iget-object v1, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/GLCanvasState;->getTexMatrix()[F

    move-result-object v1

    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 76
    return-void
.end method

.method protected initSupportAttriList()V
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mAttriSupportedList:Ljava/util/ArrayList;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    return-void
.end method

.method protected initVertexData()V
    .locals 3

    .line 53
    sget-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->VERTICES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    div-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->allocateByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 54
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    sget-object v1, Lcom/android/camera/effect/renders/YuvToRgbRender;->VERTICES:[F

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 55
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 57
    sget-object v0, Lcom/android/camera/effect/renders/YuvToRgbRender;->TEXTURES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    div-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Lcom/android/camera/effect/renders/YuvToRgbRender;->allocateByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    .line 58
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    sget-object v2, Lcom/android/camera/effect/renders/YuvToRgbRender;->TEXTURES:[F

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 59
    iget-object v0, p0, Lcom/android/camera/effect/renders/YuvToRgbRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 60
    return-void
.end method
