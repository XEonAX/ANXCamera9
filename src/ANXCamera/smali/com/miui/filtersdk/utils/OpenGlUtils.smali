.class public Lcom/miui/filtersdk/utils/OpenGlUtils;
.super Ljava/lang/Object;
.source "OpenGlUtils.java"


# static fields
.field public static final NOT_INIT:I = -0x1

.field public static final NO_TEXTURE:I = -0x1

.field public static final ON_DRAWN:I = 0x1

.field private static final TAG:Ljava/lang/String; = "OpenGlUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkGlError(Ljava/lang/String;)V
    .locals 2

    .line 265
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .line 266
    if-nez v0, :cond_0

    .line 271
    return-void

    .line 267
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": glError 0x"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 268
    const-string v0, "OpenGlUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getImageFromAssetsFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    .line 196
    nop

    .line 197
    nop

    .line 198
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    .line 200
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 201
    :try_start_1
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 206
    if-eqz p0, :cond_0

    .line 208
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 211
    :goto_0
    goto :goto_2

    .line 209
    :catch_0
    move-exception p0

    .line 210
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 203
    :catch_1
    move-exception v0

    move-object v1, v0

    move-object v0, p0

    move-object p0, v1

    goto :goto_1

    .line 206
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 203
    :catch_2
    move-exception p1

    move-object v1, v0

    move-object v0, p0

    move-object p0, p1

    move-object p1, v1

    goto :goto_1

    .line 206
    :catchall_1
    move-exception p1

    move-object p0, v0

    goto :goto_3

    .line 203
    :catch_3
    move-exception p0

    move-object p1, v0

    .line 204
    :goto_1
    :try_start_4
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 206
    if-eqz v0, :cond_0

    .line 208
    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    .line 215
    :cond_0
    :goto_2
    return-object p1

    .line 206
    :goto_3
    if-eqz p0, :cond_1

    .line 208
    :try_start_6
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 211
    goto :goto_4

    .line 209
    :catch_4
    move-exception p0

    .line 210
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 211
    :cond_1
    :goto_4
    throw p1
.end method

.method public static getImageFromPath(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    .line 331
    nop

    .line 332
    nop

    .line 334
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 335
    :try_start_1
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 339
    nop

    .line 341
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 344
    :goto_0
    goto :goto_4

    .line 342
    :catch_0
    move-exception v0

    .line 343
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 336
    :catch_1
    move-exception p0

    goto :goto_1

    .line 339
    :catchall_0
    move-exception p0

    goto :goto_5

    .line 336
    :catch_2
    move-exception p0

    move-object v1, v0

    .line 337
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 339
    if-eqz v1, :cond_0

    .line 341
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 344
    :goto_2
    goto :goto_3

    .line 342
    :catch_3
    move-exception p0

    .line 343
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 348
    :cond_0
    :goto_3
    move-object p0, v0

    :goto_4
    return-object p0

    .line 339
    :catchall_1
    move-exception p0

    move-object v0, v1

    :goto_5
    if-eqz v0, :cond_1

    .line 341
    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 344
    goto :goto_6

    .line 342
    :catch_4
    move-exception v0

    .line 343
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 344
    :cond_1
    :goto_6
    throw p0
.end method

.method public static initEffectTexture(II[II)I
    .locals 12

    .line 274
    const/4 v0, -0x1

    if-eqz p2, :cond_2

    array-length v1, p2

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 278
    :cond_0
    const/4 v1, 0x0

    aget v3, p2, v1

    if-ne v3, v0, :cond_1

    .line 279
    invoke-static {v2, p2, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 280
    aget v0, p2, v1

    invoke-static {p3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 281
    const/16 v0, 0x2800

    const v2, 0x46180400    # 9729.0f

    invoke-static {p3, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 283
    const/16 v0, 0x2801

    invoke-static {p3, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 285
    const/16 v0, 0x2802

    const v2, 0x47012f00    # 33071.0f

    invoke-static {p3, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 287
    const/16 v0, 0x2803

    invoke-static {p3, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 289
    const/4 v4, 0x0

    const/16 v5, 0x1908

    const/4 v8, 0x0

    const/16 v9, 0x1908

    const/16 v10, 0x1401

    const/4 v11, 0x0

    move v3, p3

    move v6, p0

    move v7, p1

    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    .line 292
    :cond_1
    aget v0, p2, v1

    invoke-static {p3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 293
    const/4 v3, 0x0

    const/16 v4, 0x1908

    const/4 v7, 0x0

    const/16 v8, 0x1908

    const/16 v9, 0x1401

    const/4 v10, 0x0

    move v2, p3

    move v5, p0

    move v6, p1

    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 296
    :goto_0
    aget p0, p2, v1

    return p0

    .line 275
    :cond_2
    :goto_1
    return v0
.end method

.method public static loadProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 222
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 223
    const v1, 0x8b31

    invoke-static {p0, v1}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadShader(Ljava/lang/String;I)I

    move-result p0

    .line 224
    const/4 v1, 0x0

    if-nez p0, :cond_0

    .line 225
    const-string p0, "Load Program"

    const-string p1, "Vertex Shader Failed"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return v1

    .line 228
    :cond_0
    const v2, 0x8b30

    invoke-static {p1, v2}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadShader(Ljava/lang/String;I)I

    move-result p1

    .line 229
    if-nez p1, :cond_1

    .line 230
    const-string p0, "Load Program"

    const-string p1, "Fragment Shader Failed"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    return v1

    .line 234
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v2

    .line 235
    invoke-static {v2, p0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 236
    invoke-static {v2, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 237
    invoke-static {v2}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 238
    const v3, 0x8b82

    invoke-static {v2, v3, v0, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 239
    aget v0, v0, v1

    if-gtz v0, :cond_2

    .line 240
    const-string p0, "Load Program"

    const-string p1, "Linking Failed"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    return v1

    .line 243
    :cond_2
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 244
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 245
    return v2
.end method

.method private static loadShader(Ljava/lang/String;I)I
    .locals 3

    .line 249
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 250
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p1

    .line 251
    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 252
    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 253
    const/4 p0, 0x0

    const v1, 0x8b81

    invoke-static {p1, v1, v0, p0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 254
    aget v0, v0, p0

    if-nez v0, :cond_0

    .line 255
    const-string v0, "Load Shader Failed"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Compilation\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    return p0

    .line 258
    :cond_0
    return p1
.end method

.method public static loadTexture(Landroid/content/Context;Ljava/lang/String;)I
    .locals 6

    .line 108
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 110
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 112
    aget v3, v1, v2

    if-eqz v3, :cond_0

    .line 115
    invoke-static {p0, p1}, Lcom/miui/filtersdk/utils/OpenGlUtils;->getImageFromAssetsFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 118
    aget v3, v1, v2

    const/16 v4, 0xde1

    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 121
    const/16 v3, 0x2800

    const/16 v5, 0x2601

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 122
    const/16 v3, 0x2801

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 123
    const/16 v3, 0x2802

    const v5, 0x812f

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 124
    const/16 v3, 0x2803

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 126
    invoke-static {v4, v2, p0, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 129
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 132
    :cond_0
    aget p0, v1, v2

    if-nez p0, :cond_1

    .line 133
    const-string p0, "OpenGlUtils"

    const-string v1, "loadTexture failed,path:%s"

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v2

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const/4 p0, -0x1

    return p0

    .line 137
    :cond_1
    aget p0, v1, v2

    return p0
.end method

.method public static loadTexture(Landroid/graphics/Bitmap;I)I
    .locals 1

    .line 23
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadTexture(Landroid/graphics/Bitmap;IZ)I

    move-result p0

    return p0
.end method

.method public static loadTexture(Landroid/graphics/Bitmap;IZ)I
    .locals 5

    .line 27
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 28
    return v0

    .line 29
    :cond_0
    const/4 v1, 0x1

    new-array v2, v1, [I

    .line 30
    const/16 v3, 0xde1

    const/4 v4, 0x0

    if-ne p1, v0, :cond_1

    .line 31
    invoke-static {v1, v2, v4}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 32
    aget p1, v2, v4

    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 33
    const/16 p1, 0x2800

    const v0, 0x46180400    # 9729.0f

    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 35
    const/16 p1, 0x2801

    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 37
    const/16 p1, 0x2802

    const v0, 0x47012f00    # 33071.0f

    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    const/16 p1, 0x2803

    invoke-static {v3, p1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 42
    invoke-static {v3, v4, p0, v4}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    goto :goto_0

    .line 44
    :cond_1
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 46
    invoke-static {v3, v4, p0, v4}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 47
    aput p1, v2, v4

    .line 49
    :goto_0
    if-eqz p2, :cond_2

    .line 50
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 51
    :cond_2
    aget p0, v2, v4

    return p0
.end method

.method public static loadTexture(Ljava/nio/Buffer;III)I
    .locals 13

    .line 55
    move/from16 v0, p3

    const/4 v1, -0x1

    if-nez p0, :cond_0

    .line 56
    return v1

    .line 58
    :cond_0
    const/4 v2, 0x1

    new-array v11, v2, [I

    .line 59
    const/4 v12, 0x0

    const/16 v3, 0xde1

    if-ne v0, v1, :cond_1

    .line 60
    invoke-static {v2, v11, v12}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 61
    aget v0, v11, v12

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 62
    const/16 v0, 0x2800

    const v1, 0x46180400    # 9729.0f

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 64
    const/16 v0, 0x2801

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 66
    const/16 v0, 0x2802

    const v1, 0x47012f00    # 33071.0f

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 68
    const/16 v0, 0x2803

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 70
    const/16 v2, 0xde1

    const/4 v3, 0x0

    const/16 v4, 0x1908

    const/4 v7, 0x0

    const/16 v8, 0x1908

    const/16 v9, 0x1401

    move v5, p1

    move v6, p2

    move-object v10, p0

    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    .line 73
    :cond_1
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 74
    const/16 v2, 0xde1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v8, 0x1908

    const/16 v9, 0x1401

    move v6, p1

    move v7, p2

    move-object v10, p0

    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 76
    aput v0, v11, v12

    .line 78
    :goto_0
    aget v0, v11, v12

    return v0
.end method

.method public static loadTexture(Ljava/nio/Buffer;IIII)I
    .locals 13

    move/from16 v0, p3

    .line 82
    const/4 v1, -0x1

    if-nez p0, :cond_0

    .line 83
    return v1

    .line 84
    :cond_0
    const/4 v2, 0x1

    new-array v11, v2, [I

    .line 85
    const/4 v12, 0x0

    const/16 v3, 0xde1

    if-ne v0, v1, :cond_1

    .line 86
    invoke-static {v2, v11, v12}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 87
    aget v0, v11, v12

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 88
    const/16 v0, 0x2800

    const v1, 0x46180400    # 9729.0f

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 90
    const/16 v0, 0x2801

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 92
    const/16 v0, 0x2802

    const v1, 0x47012f00    # 33071.0f

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 94
    const/16 v0, 0x2803

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 96
    const/16 v2, 0xde1

    const/4 v3, 0x0

    const/16 v4, 0x1908

    const/4 v7, 0x0

    const/16 v8, 0x1908

    move v5, p1

    move v6, p2

    move/from16 v9, p4

    move-object v10, p0

    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    .line 99
    :cond_1
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 100
    const/16 v2, 0xde1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v8, 0x1908

    move v6, p1

    move v7, p2

    move/from16 v9, p4

    move-object v10, p0

    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexSubImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 102
    aput v0, v11, v12

    .line 104
    :goto_0
    aget v0, v11, v12

    return v0
.end method

.method public static loadTextureFromPath(Ljava/lang/String;)I
    .locals 5

    .line 300
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 301
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 303
    aget v0, v1, v2

    if-eqz v0, :cond_0

    .line 306
    invoke-static {p0}, Lcom/miui/filtersdk/utils/OpenGlUtils;->getImageFromPath(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 309
    aget v0, v1, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 312
    const/16 v0, 0x2800

    const/16 v4, 0x2601

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 313
    const/16 v0, 0x2801

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 314
    const/16 v0, 0x2802

    const v4, 0x812f

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 315
    const/16 v0, 0x2803

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 317
    invoke-static {v3, v2, p0, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 320
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 323
    :cond_0
    aget p0, v1, v2

    if-eqz p0, :cond_1

    .line 327
    aget p0, v1, v2

    return p0

    .line 324
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Error loading texture."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static loadYuvToTextures(Ljava/nio/Buffer;Ljava/nio/Buffer;II[I)V
    .locals 17

    .line 141
    move-object/from16 v9, p4

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_3

    .line 144
    :cond_0
    if-eqz v9, :cond_4

    array-length v0, v9

    const/4 v10, 0x2

    if-ge v0, v10, :cond_1

    goto/16 :goto_2

    .line 148
    :cond_1
    const/4 v0, 0x0

    aget v1, v9, v0

    const/16 v7, 0x2801

    const/16 v6, 0x2800

    const v2, 0x84c0

    const/4 v5, -0x1

    const v4, 0x47012f00    # 33071.0f

    const v3, 0x46180400    # 9729.0f

    const/4 v10, 0x1

    const/16 v11, 0xde1

    if-ne v1, v5, :cond_2

    .line 149
    invoke-static {v10, v9, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 150
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 151
    aget v0, v9, v0

    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 153
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1909

    const/4 v13, 0x0

    const/16 v14, 0x1909

    const/16 v15, 0x1401

    move v10, v3

    move/from16 v3, p2

    move v12, v4

    move/from16 v4, p3

    move v5, v13

    move v12, v6

    move v6, v14

    move v7, v15

    move-object/from16 v8, p0

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 155
    invoke-static {v11, v12, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 157
    const/16 v7, 0x2801

    invoke-static {v11, v7, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 159
    const v0, 0x47012f00    # 33071.0f

    const/16 v1, 0x2802

    invoke-static {v11, v1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 161
    const/16 v1, 0x2803

    invoke-static {v11, v1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    goto :goto_0

    .line 164
    :cond_2
    move v10, v3

    move v12, v6

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 165
    aget v0, v9, v0

    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 166
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1909

    const/4 v5, 0x0

    const/16 v6, 0x1909

    const/16 v13, 0x1401

    move/from16 v3, p2

    move/from16 v4, p3

    move v7, v13

    move-object/from16 v8, p0

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 170
    :goto_0
    const/4 v0, 0x1

    aget v1, v9, v0

    const v2, 0x84c1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_3

    .line 171
    invoke-static {v0, v9, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 172
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 173
    aget v0, v9, v0

    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 175
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x190a

    const/4 v3, 0x2

    div-int/lit8 v4, p2, 0x2

    div-int/lit8 v5, p3, 0x2

    const/4 v6, 0x0

    const/16 v7, 0x190a

    const/16 v8, 0x1401

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move-object/from16 v8, p1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 178
    invoke-static {v11, v12, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 180
    const/16 v0, 0x2801

    invoke-static {v11, v0, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 182
    const v0, 0x47012f00    # 33071.0f

    const/16 v1, 0x2802

    invoke-static {v11, v1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 184
    const/16 v1, 0x2803

    invoke-static {v11, v1, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    goto :goto_1

    .line 187
    :cond_3
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 188
    const/4 v0, 0x1

    aget v0, v9, v0

    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 189
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x190a

    const/4 v3, 0x2

    div-int/lit8 v4, p2, 0x2

    div-int/lit8 v5, p3, 0x2

    const/4 v6, 0x0

    const/16 v7, 0x190a

    const/16 v8, 0x1401

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move-object/from16 v8, p1

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 193
    :goto_1
    return-void

    .line 145
    :cond_4
    :goto_2
    return-void

    .line 142
    :cond_5
    :goto_3
    return-void
.end method
