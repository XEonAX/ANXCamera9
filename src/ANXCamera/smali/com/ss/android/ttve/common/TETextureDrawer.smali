.class public Lcom/ss/android/ttve/common/TETextureDrawer;
.super Ljava/lang/Object;
.source "TETextureDrawer.java"


# static fields
.field public static final DRAW_FUNCTION:I = 0x5

.field protected static final m_fsh:Ljava/lang/String; = "precision mediump float;\nvarying vec2 texCoord;\nuniform sampler2D inputImageTexture;\nuniform int debug;\nvoid main()\n{\n   gl_FragColor = texture2D(inputImageTexture, texCoord);\n   if (debug != 0) gl_FragColor.rg = texCoord;\n}"

.field protected static final m_vsh:Ljava/lang/String; = "attribute vec2 vPosition;\nvarying vec2 texCoord;\nuniform mat2 rotation;\nuniform vec2 flipScale;\nvoid main()\n{\n   gl_Position = vec4(vPosition, 0.0, 1.0);\n   texCoord = flipScale * (vPosition / 2.0 * rotation) + 0.5;\n}"

.field public static final vertices:[F


# instance fields
.field private mDebugLog:I

.field private mFlipScaleLoc:I

.field protected mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

.field private mRotLoc:I

.field private mVertBuffer:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ss/android/ttve/common/TETextureDrawer;->vertices:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static create()Lcom/ss/android/ttve/common/TETextureDrawer;
    .locals 3

    .line 83
    new-instance v0, Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;-><init>()V

    .line 84
    const-string v1, "attribute vec2 vPosition;\nvarying vec2 texCoord;\nuniform mat2 rotation;\nuniform vec2 flipScale;\nvoid main()\n{\n   gl_Position = vec4(vPosition, 0.0, 1.0);\n   texCoord = flipScale * (vPosition / 2.0 * rotation) + 0.5;\n}"

    const-string v2, "precision mediump float;\nvarying vec2 texCoord;\nuniform sampler2D inputImageTexture;\nuniform int debug;\nvoid main()\n{\n   gl_FragColor = texture2D(inputImageTexture, texCoord);\n   if (debug != 0) gl_FragColor.rg = texCoord;\n}"

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttve/common/TETextureDrawer;->init(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 85
    const-string v1, "TETextureDrawer"

    const-string v2, "TETextureDrawer create failed!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 87
    const/4 v0, 0x0

    .line 89
    :cond_0
    return-object v0
.end method


# virtual methods
.method public bindVertexBuffer()V
    .locals 2

    .line 115
    iget v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    const v1, 0x8892

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 116
    return-void
.end method

.method public drawTexture(I)V
    .locals 1

    .line 100
    const/16 v0, 0xde1

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(II)V

    .line 101
    return-void
.end method

.method public drawTexture(II)V
    .locals 6

    .line 104
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 105
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 107
    iget p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    const p2, 0x8892

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 108
    const/4 p1, 0x0

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 109
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/16 v2, 0x1406

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 110
    iget-object p2, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {p2}, Lcom/ss/android/ttve/common/TEProgramObject;->bind()V

    .line 111
    const/4 p2, 0x5

    const/4 v0, 0x4

    invoke-static {p2, p1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 112
    return-void
.end method

.method protected init(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 51
    new-instance v0, Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEProgramObject;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    .line 52
    iget-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/common/TEProgramObject;->init(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    const/4 p2, 0x0

    if-nez p1, :cond_0

    .line 53
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEProgramObject;->release()V

    .line 54
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    .line 55
    return p2

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEProgramObject;->bind()V

    .line 60
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    const-string v0, "rotation"

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mRotLoc:I

    .line 61
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    const-string v0, "flipScale"

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mFlipScaleLoc:I

    .line 62
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    const-string v0, "debug"

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mDebugLog:I

    .line 63
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    const-string v0, "vPosition"

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TEProgramObject;->bindAttribLocation(Ljava/lang/String;I)V

    .line 65
    const/4 p1, 0x1

    new-array v0, p1, [I

    .line 66
    invoke-static {p1, v0, p2}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    .line 67
    aget v0, v0, p2

    iput v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    .line 69
    iget v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    const v1, 0x8892

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 70
    sget-object v0, Lcom/ss/android/ttve/common/TETextureDrawer;->vertices:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 71
    sget-object v2, Lcom/ss/android/ttve/common/TETextureDrawer;->vertices:[F

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 73
    const/16 v2, 0x20

    const v3, 0x88e4

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 74
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->setRotation(F)V

    .line 75
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->setFlipScale(FF)V

    .line 76
    invoke-virtual {p0, p2}, Lcom/ss/android/ttve/common/TETextureDrawer;->setDebug(Z)V

    .line 77
    const-string p2, "TETextureDrawer"

    const-string v0, "init: success."

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    return p1
.end method

.method public release()V
    .locals 4

    .line 93
    iget-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject;->release()V

    .line 94
    const/4 v0, 0x1

    new-array v1, v0, [I

    iget v2, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    const/4 v3, 0x0

    aput v2, v1, v3

    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDeleteBuffers(I[II)V

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    .line 96
    iput v3, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mVertBuffer:I

    .line 97
    return-void
.end method

.method public setDebug(Z)V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject;->bind()V

    .line 138
    iget v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mDebugLog:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 139
    return-void
.end method

.method public setFlipScale(FF)V
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject;->bind()V

    .line 133
    iget v0, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mFlipScaleLoc:I

    const/high16 v1, 0x3f800000    # 1.0f

    div-float p1, v1, p1

    div-float/2addr v1, p2

    invoke-static {v0, p1, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 134
    return-void
.end method

.method public setRotation(F)V
    .locals 5

    .line 119
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p1, v2

    .line 120
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 122
    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v3, 0x1

    aput v0, v1, v3

    neg-float v0, v0

    const/4 v4, 0x2

    aput v0, v1, v4

    const/4 v0, 0x3

    aput p1, v1, v0

    .line 127
    iget-object p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mProgram:Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEProgramObject;->bind()V

    .line 128
    iget p1, p0, Lcom/ss/android/ttve/common/TETextureDrawer;->mRotLoc:I

    invoke-static {p1, v3, v2, v1, v2}, Landroid/opengl/GLES20;->glUniformMatrix2fv(IIZ[FI)V

    .line 129
    return-void
.end method
