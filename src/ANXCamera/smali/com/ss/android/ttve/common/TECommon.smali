.class public Lcom/ss/android/ttve/common/TECommon;
.super Ljava/lang/Object;
.source "TECommon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/common/TECommon$IGetTimestampCallback;,
        Lcom/ss/android/ttve/common/TECommon$IShotScreenCallback;,
        Lcom/ss/android/ttve/common/TECommon$IOnOpenGLCallback;
    }
.end annotation


# static fields
.field public static final DEBUG:Z = true

.field public static final FULLSCREEN_VERTICES:[F

.field public static final TAG:Ljava/lang/String; = "WIX"

.field public static final USE_TEXTURE_ENCODE_INPUT:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _texParamHelper(III)V
    .locals 1

    .line 53
    const/16 v0, 0x2801

    invoke-static {p0, v0, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 54
    const/16 v0, 0x2800

    invoke-static {p0, v0, p1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 55
    const/16 p1, 0x2802

    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 56
    const/16 p1, 0x2803

    invoke-static {p0, p1, p2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 57
    return-void
.end method

.method public static checkGLError(Ljava/lang/String;)V
    .locals 8

    .line 26
    nop

    .line 27
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    const/4 v1, 0x0

    move v2, v0

    move v0, v1

    :goto_0
    const/16 v3, 0x20

    if-ge v0, v3, :cond_0

    if-eqz v2, :cond_0

    .line 29
    packed-switch v2, :pswitch_data_0

    .line 46
    :pswitch_0
    const-string v3, "unknown error"

    goto :goto_1

    .line 34
    :pswitch_1
    const-string v3, "invalid framebuffer operation"

    .line 35
    goto :goto_1

    .line 43
    :pswitch_2
    const-string v3, "out of memory"

    .line 44
    goto :goto_1

    .line 37
    :pswitch_3
    const-string v3, "invalid operation"

    .line 38
    goto :goto_1

    .line 40
    :pswitch_4
    const-string v3, "invalid value"

    .line 41
    goto :goto_1

    .line 31
    :pswitch_5
    const-string v3, "invalid enum"

    .line 32
    nop

    .line 48
    :goto_1
    const-string v4, "WIX"

    const-string v5, "After tag \"%s\" glGetError %s(0x%x) "

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v1

    const/4 v7, 0x1

    aput-object v3, v6, v7

    const/4 v3, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x500
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 2

    .line 122
    const/4 v0, 0x0

    if-lez p0, :cond_1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 128
    :catch_0
    move-exception p0

    .line 129
    const-string p1, "WIX"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createBitmap: Error"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Error;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return-object v0

    .line 123
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static deleteTextureID(I)V
    .locals 3

    .line 102
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput p0, v1, v2

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 103
    return-void
.end method

.method public static genBlankTextureID(II)I
    .locals 2

    .line 60
    const/16 v0, 0x2601

    const v1, 0x812f

    invoke-static {p0, p1, v0, v1}, Lcom/ss/android/ttve/common/TECommon;->genBlankTextureID(IIII)I

    move-result p0

    return p0
.end method

.method public static genBlankTextureID(IIII)I
    .locals 13

    .line 64
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 65
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 66
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 67
    const/16 v4, 0xde1

    const/4 v5, 0x0

    const/16 v6, 0x1908

    const/4 v9, 0x0

    const/16 v10, 0x1908

    const/16 v11, 0x1401

    const/4 v12, 0x0

    move v7, p0

    move v8, p1

    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 68
    move v0, p2

    move/from16 v4, p3

    invoke-static {v3, v0, v4}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    .line 69
    aget v0, v1, v2

    return v0
.end method

.method public static genFullscreenVertexArrayBuffer()I
    .locals 6

    .line 106
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 107
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    .line 109
    aget v0, v1, v2

    if-nez v0, :cond_0

    .line 110
    const-string v0, "WIX"

    const-string v1, "Invalid VertexBuffer! You must call this within an OpenGL thread!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    return v2

    .line 114
    :cond_0
    aget v0, v1, v2

    const v3, 0x8892

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 115
    sget-object v0, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 116
    sget-object v4, Lcom/ss/android/ttve/common/TECommon;->FULLSCREEN_VERTICES:[F

    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 117
    const/16 v4, 0x20

    const v5, 0x88e4

    invoke-static {v3, v4, v0, v5}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 118
    aget v0, v1, v2

    return v0
.end method

.method public static genNormalTextureID(Landroid/graphics/Bitmap;)I
    .locals 2

    .line 73
    const/16 v0, 0x2601

    const v1, 0x812f

    invoke-static {p0, v0, v1}, Lcom/ss/android/ttve/common/TECommon;->genNormalTextureID(Landroid/graphics/Bitmap;II)I

    move-result p0

    return p0
.end method

.method public static genNormalTextureID(Landroid/graphics/Bitmap;II)I
    .locals 4

    .line 78
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 79
    return v0

    .line 81
    :cond_0
    const/4 v1, 0x1

    new-array v2, v1, [I

    .line 82
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 83
    aget v1, v2, v0

    const/16 v3, 0xde1

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 84
    invoke-static {v3, v0, p0, v0}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 85
    invoke-static {v3, p1, p2}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    .line 86
    aget p0, v2, v0

    return p0
.end method

.method public static genSurfaceTextureID()I
    .locals 5

    .line 90
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 91
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 92
    aget v0, v1, v2

    const v3, 0x8d65

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 93
    const/16 v0, 0x2601

    const v4, 0x812f

    invoke-static {v3, v0, v4}, Lcom/ss/android/ttve/common/TECommon;->_texParamHelper(III)V

    .line 94
    aget v0, v1, v2

    return v0
.end method

.method public static isTextureID(I)Z
    .locals 0

    .line 98
    invoke-static {p0}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result p0

    return p0
.end method
