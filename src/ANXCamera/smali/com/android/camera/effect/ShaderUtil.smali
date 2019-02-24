.class public Lcom/android/camera/effect/ShaderUtil;
.super Ljava/lang/Object;
.source "ShaderUtil.java"


# static fields
.field public static final DIR:Ljava/lang/String; = "shading_script"

.field public static final NO_TEXTURE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "Camera_ShaderUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkGlError(Ljava/lang/String;)V
    .locals 3

    .line 74
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-nez v0, :cond_0

    .line 78
    return-void

    .line 75
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ES20_ERROR: op "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": glError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Camera_ShaderUtil"

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": glError "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5

    .line 36
    const v0, 0x8b31

    invoke-static {v0, p0}, Lcom/android/camera/effect/ShaderUtil;->loadShader(ILjava/lang/String;)I

    move-result v0

    .line 38
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 39
    const-string p1, "Camera_ShaderUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fail to init vertex shader "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    return v1

    .line 42
    :cond_0
    const p0, 0x8b30

    invoke-static {p0, p1}, Lcom/android/camera/effect/ShaderUtil;->loadShader(ILjava/lang/String;)I

    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    const-string p0, "Camera_ShaderUtil"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fail to init fragment shader "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    return v1

    .line 48
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 51
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 52
    const-string v2, "glAttachShader"

    invoke-static {v2}, Lcom/android/camera/effect/ShaderUtil;->checkGlError(Ljava/lang/String;)V

    .line 53
    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 54
    const-string v2, "glAttachShader"

    invoke-static {v2}, Lcom/android/camera/effect/ShaderUtil;->checkGlError(Ljava/lang/String;)V

    .line 55
    invoke-static {p1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 56
    const/4 v2, 0x1

    new-array v3, v2, [I

    .line 57
    const v4, 0x8b82

    invoke-static {p1, v4, v3, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 58
    aget v3, v3, v1

    if-eq v3, v2, :cond_2

    .line 59
    const-string v2, "Camera_ShaderUtil"

    const-string v3, "Could not link program: "

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    const-string v2, "Camera_ShaderUtil"

    invoke-static {p1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 62
    nop

    .line 66
    move p1, v1

    :cond_2
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 67
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 69
    return p1
.end method

.method public static loadFromAssetsFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 81
    nop

    .line 84
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shading_script/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 85
    nop

    .line 86
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 87
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 88
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 91
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 92
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 93
    new-instance p0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {p0, v2, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 94
    :try_start_1
    const-string v0, "\\r\\n"

    const-string v1, "\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 97
    goto :goto_2

    .line 95
    :catch_0
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    goto :goto_1

    :catch_1
    move-exception p0

    .line 96
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 98
    :goto_2
    return-object v0
.end method

.method public static loadShader(ILjava/lang/String;)I
    .locals 5

    .line 19
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    .line 20
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 21
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 23
    const/4 v2, 0x1

    new-array v2, v2, [I

    .line 24
    const v3, 0x8b81

    invoke-static {v0, v3, v2, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 25
    aget v2, v2, v1

    if-nez v2, :cond_0

    .line 26
    const-string v2, "Camera_ShaderUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not compile shader "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    const-string p0, "Camera_ShaderUtil"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Info: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 29
    nop

    .line 32
    move v0, v1

    :cond_0
    return v0
.end method

.method public static loadYuvToTextures(Ljava/nio/Buffer;Ljava/nio/Buffer;II[I)V
    .locals 17

    .line 103
    move-object/from16 v11, p4

    if-eqz p0, :cond_6

    if-nez p1, :cond_0

    goto/16 :goto_4

    .line 107
    :cond_0
    const/4 v0, 0x0

    if-eqz v11, :cond_4

    array-length v1, v11

    const/4 v12, 0x2

    if-ge v1, v12, :cond_1

    goto/16 :goto_2

    .line 113
    :cond_1
    aget v1, v11, v0

    const v2, 0x84c0

    const/4 v13, -0x1

    const/4 v14, 0x1

    const/16 v7, 0xde1

    if-ne v1, v13, :cond_2

    .line 114
    invoke-static {v14, v11, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 115
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 116
    aget v0, v11, v0

    invoke-static {v7, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 118
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1909

    const/4 v5, 0x0

    const/16 v6, 0x1909

    const/16 v15, 0x1401

    move/from16 v3, p2

    move/from16 v4, p3

    move v12, v7

    move v7, v15

    move-object/from16 v8, p0

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    .line 121
    :cond_2
    move v12, v7

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 122
    aget v0, v11, v0

    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 127
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1909

    const/4 v5, 0x0

    const/16 v6, 0x1909

    const/16 v7, 0x1401

    move/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v8, p0

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 132
    :goto_0
    const/16 v8, 0x2800

    const v7, 0x46180400    # 9729.0f

    invoke-static {v12, v8, v7}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 134
    const/16 v6, 0x2801

    invoke-static {v12, v6, v7}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 136
    const/16 v5, 0x2802

    const v4, 0x47012f00    # 33071.0f

    invoke-static {v12, v5, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 138
    const/16 v3, 0x2803

    invoke-static {v12, v3, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 141
    aget v0, v11, v14

    const v1, 0x84c1

    if-ne v0, v13, :cond_3

    .line 142
    invoke-static {v14, v11, v14}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 143
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 144
    aget v0, v11, v14

    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 146
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x190a

    const/4 v11, 0x2

    div-int/lit8 v9, p2, 0x2

    div-int/lit8 v10, p3, 0x2

    const/4 v11, 0x0

    const/16 v13, 0x190a

    const/16 v14, 0x1401

    move v3, v9

    move v9, v4

    move v4, v10

    move v10, v5

    move v5, v11

    move v11, v6

    move v6, v13

    move v13, v7

    move v7, v14

    move v14, v8

    move-object/from16 v8, p1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 166
    move/from16 v16, v14

    move v14, v9

    move v9, v10

    move v10, v11

    move/from16 v11, v16

    goto :goto_1

    .line 150
    :cond_3
    move v13, v7

    move v7, v8

    move v8, v4

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 151
    aget v0, v11, v14

    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 160
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x190a

    const/4 v3, 0x2

    div-int/lit8 v4, p2, 0x2

    div-int/lit8 v9, p3, 0x2

    const/4 v10, 0x0

    const/16 v11, 0x190a

    const/16 v14, 0x1401

    move v3, v4

    move v4, v9

    move v9, v5

    move v5, v10

    move v10, v6

    move v6, v11

    move v11, v7

    move v7, v14

    move v14, v8

    move-object/from16 v8, p1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 166
    :goto_1
    invoke-static {v12, v11, v13}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 168
    invoke-static {v12, v10, v13}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 170
    invoke-static {v12, v9, v14}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 172
    const/16 v0, 0x2803

    invoke-static {v12, v0, v14}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 174
    return-void

    .line 108
    :cond_4
    :goto_2
    const-string v1, "Camera_ShaderUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid output texture size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    if-nez v11, :cond_5

    goto :goto_3

    :cond_5
    array-length v0, v11

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    return-void

    .line 104
    :cond_6
    :goto_4
    const-string v0, "Camera_ShaderUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid channel "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p0, :cond_7

    const-string v2, "Y"

    goto :goto_5

    :cond_7
    const-string v2, "UV"

    :goto_5
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return-void
.end method
