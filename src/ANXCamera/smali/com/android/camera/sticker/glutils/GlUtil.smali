.class public Lcom/android/camera/sticker/glutils/GlUtil;
.super Ljava/lang/Object;
.source "GlUtil.java"


# static fields
.field public static final NO_TEXTURE:I = -0x1

.field private static final SIZEOF_FLOAT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "GlDemoUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static checkGlError(Ljava/lang/String;)V
    .locals 2

    .line 140
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .line 141
    if-nez v0, :cond_0

    .line 146
    return-void

    .line 142
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

    .line 143
    const-string v0, "GlDemoUtil"

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createFloatBuffer([F)Ljava/nio/FloatBuffer;
    .locals 2

    .line 153
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 154
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 155
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 156
    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 157
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 158
    return-object v0
.end method

.method public static createProgram(Landroid/content/Context;II)I
    .locals 0
    .param p1    # I
        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param

    .line 36
    invoke-static {p0, p1}, Lcom/android/camera/sticker/glutils/GlUtil;->readTextFromRawResource(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    .line 37
    invoke-static {p0, p2}, Lcom/android/camera/sticker/glutils/GlUtil;->readTextFromRawResource(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    .line 39
    invoke-static {p1, p0}, Lcom/android/camera/sticker/glutils/GlUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 43
    const v0, 0x8b31

    invoke-static {v0, p0}, Lcom/android/camera/sticker/glutils/GlUtil;->loadShader(ILjava/lang/String;)I

    move-result p0

    .line 44
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 45
    return v0

    .line 47
    :cond_0
    const v1, 0x8b30

    invoke-static {v1, p1}, Lcom/android/camera/sticker/glutils/GlUtil;->loadShader(ILjava/lang/String;)I

    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    return v0

    .line 51
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v1

    .line 52
    const-string v2, "glCreateProgram"

    invoke-static {v2}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 53
    if-nez v1, :cond_2

    .line 54
    const-string v2, "GlDemoUtil"

    const-string v3, "Could not create program"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_2
    invoke-static {v1, p0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 57
    const-string p0, "glAttachShader"

    invoke-static {p0}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 58
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 59
    const-string p0, "glAttachShader"

    invoke-static {p0}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 60
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 61
    const/4 p0, 0x1

    new-array p1, p0, [I

    .line 62
    const v2, 0x8b82

    invoke-static {v1, v2, p1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 63
    aget v2, p1, v0

    if-eq v2, p0, :cond_3

    .line 64
    const-string p0, "GlDemoUtil"

    const-string v2, "Could not link program: "

    invoke-static {p0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-string p0, "GlDemoUtil"

    invoke-static {v1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 67
    nop

    .line 69
    move v1, v0

    :cond_3
    const-string p0, "GlDemoUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "linkStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget p1, p1, v0

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return v1
.end method

.method public static createTexture(I)I
    .locals 6

    .line 111
    const/4 v1, 0x0

    const/16 v2, 0x2601

    const/16 v3, 0x2601

    const v4, 0x812f

    const v5, 0x812f

    move v0, p0

    invoke-static/range {v0 .. v5}, Lcom/android/camera/sticker/glutils/GlUtil;->createTexture(ILandroid/graphics/Bitmap;IIII)I

    move-result p0

    return p0
.end method

.method public static createTexture(ILandroid/graphics/Bitmap;)I
    .locals 6

    .line 116
    const/16 v2, 0x2601

    const/16 v3, 0x2601

    const v4, 0x812f

    const v5, 0x812f

    move v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lcom/android/camera/sticker/glutils/GlUtil;->createTexture(ILandroid/graphics/Bitmap;IIII)I

    move-result p0

    return p0
.end method

.method public static createTexture(ILandroid/graphics/Bitmap;IIII)I
    .locals 4
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 91
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 93
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 94
    const-string v0, "glGenTextures"

    invoke-static {v0}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 95
    aget v0, v1, v2

    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "glBindTexture "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v3, v1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 97
    int-to-float p2, p2

    const/16 v0, 0x2801

    invoke-static {p0, v0, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 98
    int-to-float p2, p3

    const/16 p3, 0x2800

    invoke-static {p0, p3, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 99
    const/16 p2, 0x2802

    invoke-static {p0, p2, p4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 100
    const/16 p2, 0x2803

    invoke-static {p0, p2, p5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 102
    if-eqz p1, :cond_0

    .line 103
    const/16 p0, 0xde1

    invoke-static {p0, v2, p1, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 106
    :cond_0
    const-string p0, "glTexParameter"

    invoke-static {p0}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 107
    aget p0, v1, v2

    return p0
.end method

.method public static initEffectTexture(II[II)I
    .locals 12

    .line 121
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p2, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 122
    aget v1, p2, v0

    invoke-static {p3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 123
    const v1, 0x46180400    # 9729.0f

    const/16 v2, 0x2800

    invoke-static {p3, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 125
    const/16 v2, 0x2801

    invoke-static {p3, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 127
    const v1, 0x47012f00    # 33071.0f

    const/16 v2, 0x2802

    invoke-static {p3, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 129
    const/16 v2, 0x2803

    invoke-static {p3, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 131
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

    .line 133
    aget p0, p2, v0

    return p0
.end method

.method public static loadShader(ILjava/lang/String;)I
    .locals 4

    .line 74
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "glCreateShader type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 76
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 77
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 78
    const/4 p1, 0x1

    new-array p1, p1, [I

    .line 79
    const/4 v1, 0x0

    const v2, 0x8b81

    invoke-static {v0, v2, p1, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 80
    aget p1, p1, v1

    if-nez p1, :cond_0

    .line 81
    const-string p1, "GlDemoUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not compile shader "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const-string p0, "GlDemoUtil"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 84
    nop

    .line 86
    move v0, v1

    :cond_0
    return v0
.end method

.method public static readTextFromRawResource(Landroid/content/Context;I)Ljava/lang/String;
    .locals 3
    .param p1    # I
        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param

    .line 163
    nop

    .line 164
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    .line 165
    new-instance p1, Ljava/io/InputStreamReader;

    invoke-direct {p1, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 166
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 178
    :cond_0
    if-eqz p0, :cond_1

    .line 179
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    goto :goto_1

    .line 187
    :catch_0
    move-exception p0

    goto :goto_2

    .line 181
    :cond_1
    :goto_1
    nop

    .line 182
    invoke-virtual {p1}, Ljava/io/InputStreamReader;->close()V

    .line 184
    nop

    .line 185
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 187
    :goto_2
    nop

    .line 189
    goto :goto_4

    .line 188
    :goto_3
    nop

    .line 191
    :goto_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 177
    :catchall_0
    move-exception v1

    .line 178
    if-eqz p0, :cond_2

    .line 179
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    goto :goto_5

    .line 187
    :catch_1
    move-exception p0

    goto :goto_6

    .line 181
    :cond_2
    :goto_5
    nop

    .line 182
    invoke-virtual {p1}, Ljava/io/InputStreamReader;->close()V

    .line 184
    nop

    .line 185
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_7

    .line 187
    :goto_6
    nop

    .line 188
    :goto_7
    throw v1

    .line 174
    :catch_2
    move-exception v1

    .line 175
    const/4 v1, 0x0

    .line 178
    if-eqz p0, :cond_3

    .line 179
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    goto :goto_8

    .line 187
    :catch_3
    move-exception p0

    goto :goto_9

    .line 181
    :cond_3
    :goto_8
    nop

    .line 182
    invoke-virtual {p1}, Ljava/io/InputStreamReader;->close()V

    .line 184
    nop

    .line 185
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_a

    .line 187
    :goto_9
    goto :goto_b

    .line 188
    :goto_a
    nop

    .line 175
    :goto_b
    return-object v1
.end method
