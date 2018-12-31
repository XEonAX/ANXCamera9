.class public Lcom/ss/android/ttve/common/TESharedContext;
.super Ljava/lang/Object;
.source "TESharedContext.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation


# static fields
.field public static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field private static final LOG_TAG:Ljava/lang/String;

.field private static mBitsA:I

.field private static mBitsB:I

.field private static mBitsG:I

.field private static mBitsR:I


# instance fields
.field private mConfig:Landroid/opengl/EGLConfig;

.field private mContext:Landroid/opengl/EGLContext;

.field private mDisplay:Landroid/opengl/EGLDisplay;

.field private mSurface:Landroid/opengl/EGLSurface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const-class v0, Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    .line 23
    const/16 v0, 0x8

    sput v0, Lcom/ss/android/ttve/common/TESharedContext;->mBitsR:I

    sput v0, Lcom/ss/android/ttve/common/TESharedContext;->mBitsG:I

    sput v0, Lcom/ss/android/ttve/common/TESharedContext;->mBitsB:I

    sput v0, Lcom/ss/android/ttve/common/TESharedContext;->mBitsA:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 3

    .line 266
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 267
    sget-object v1, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": EGL error: 0x"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    const/16 p1, 0x3006

    if-ne v0, p1, :cond_0

    .line 270
    sget-object p1, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    const-string v0, "gl error EGL_BAD_CONTEXT"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    :cond_0
    return-void
.end method

.method public static create()Lcom/ss/android/ttve/common/TESharedContext;
    .locals 4

    .line 41
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    const/16 v1, 0x40

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, v1, v2, v3}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object v0

    return-object v0
.end method

.method public static create(II)Lcom/ss/android/ttve/common/TESharedContext;
    .locals 3

    .line 45
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p0, p1, v1, v2}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/opengl/EGLContext;II)Lcom/ss/android/ttve/common/TESharedContext;
    .locals 2

    .line 49
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;
    .locals 7

    .line 63
    new-instance v6, Lcom/ss/android/ttve/common/TESharedContext;

    invoke-direct {v6}, Lcom/ss/android/ttve/common/TESharedContext;-><init>()V

    .line 64
    move-object v0, v6

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/common/TESharedContext;->initEGL(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 65
    invoke-virtual {v6}, Lcom/ss/android/ttve/common/TESharedContext;->release()V

    .line 66
    const/4 v6, 0x0

    .line 68
    :cond_0
    return-object v6
.end method

.method public static create(Landroid/opengl/EGLContext;ILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;
    .locals 1

    .line 53
    const/16 v0, 0x40

    invoke-static {p0, v0, v0, p1, p2}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object p0

    return-object p0
.end method

.method private initEGL(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Z
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p4

    .line 161
    if-nez p1, :cond_0

    .line 162
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    goto :goto_0

    .line 165
    :cond_0
    move-object/from16 v2, p1

    :goto_0
    const/4 v3, 0x3

    new-array v4, v3, [I

    fill-array-data v4, :array_0

    .line 170
    const/16 v5, 0xd

    new-array v7, v5, [I

    const/16 v5, 0x3040

    const/4 v14, 0x0

    aput v5, v7, v14

    const/4 v5, 0x4

    const/4 v15, 0x1

    aput v5, v7, v15

    const/16 v6, 0x3024

    const/4 v13, 0x2

    aput v6, v7, v13

    sget v6, Lcom/ss/android/ttve/common/TESharedContext;->mBitsR:I

    aput v6, v7, v3

    const/16 v6, 0x3023

    aput v6, v7, v5

    sget v6, Lcom/ss/android/ttve/common/TESharedContext;->mBitsG:I

    const/4 v8, 0x5

    aput v6, v7, v8

    const/4 v6, 0x6

    const/16 v9, 0x3022

    aput v9, v7, v6

    const/4 v6, 0x7

    sget v9, Lcom/ss/android/ttve/common/TESharedContext;->mBitsB:I

    aput v9, v7, v6

    const/16 v6, 0x8

    const/16 v9, 0x3021

    aput v9, v7, v6

    const/16 v6, 0x9

    sget v9, Lcom/ss/android/ttve/common/TESharedContext;->mBitsA:I

    aput v9, v7, v6

    const/16 v6, 0xa

    const/16 v9, 0x3033

    aput v9, v7, v6

    const/16 v6, 0xb

    aput v1, v7, v6

    const/16 v6, 0xc

    const/16 v16, 0x3038

    aput v16, v7, v6

    .line 178
    const/16 v12, 0x3142

    if-ne v1, v12, :cond_1

    .line 179
    array-length v6, v7

    sub-int/2addr v6, v3

    aput v12, v7, v6

    .line 180
    array-length v6, v7

    sub-int/2addr v6, v13

    aput v15, v7, v6

    .line 183
    :cond_1
    new-array v11, v15, [Landroid/opengl/EGLConfig;

    .line 184
    new-array v10, v15, [I

    .line 185
    new-array v6, v13, [I

    fill-array-data v6, :array_1

    .line 186
    nop

    .line 187
    nop

    .line 189
    new-array v9, v8, [I

    const/16 v8, 0x3057

    aput v8, v9, v14

    aput p2, v9, v15

    const/16 v8, 0x3056

    aput v8, v9, v13

    aput p3, v9, v3

    aput v16, v9, v5

    .line 195
    invoke-static {v14}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v3

    iput-object v3, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v3, v8, :cond_2

    .line 196
    const-string v1, "eglGetDisplay"

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 197
    return v14

    .line 200
    :cond_2
    new-array v3, v13, [I

    .line 201
    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-virtual {v2, v8}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/16 v5, 0x3098

    if-nez v8, :cond_3

    .line 202
    iget-object v8, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v8, v2, v5, v3, v14}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 203
    aget v3, v3, v14

    aput v3, v4, v15

    .line 206
    :cond_3
    iget-object v3, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v3, v6, v14, v6, v15}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v3

    if-nez v3, :cond_4

    .line 207
    const-string v1, "eglInitialize"

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 208
    return v14

    .line 211
    :cond_4
    sget-object v3, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    const-string v8, "eglInitialize - major: %d, minor: %d"

    new-array v12, v13, [Ljava/lang/Object;

    aget v13, v6, v14

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v14

    aget v6, v6, v15

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v12, v15

    invoke-static {v8, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    iget-object v6, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    const/4 v8, 0x0

    const/4 v3, 0x0

    array-length v12, v11

    const/4 v13, 0x0

    move-object v5, v9

    move-object v9, v11

    move-object/from16 v17, v10

    move v10, v3

    move-object v3, v11

    move v11, v12

    move-object/from16 v12, v17

    const/4 v15, 0x2

    invoke-static/range {v6 .. v13}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v6

    if-nez v6, :cond_5

    .line 214
    const-string v1, "eglChooseConfig"

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 215
    return v14

    .line 218
    :cond_5
    sget-object v6, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Config num: %d, has sharedContext: %s"

    new-array v8, v15, [Ljava/lang/Object;

    aget v9, v17, v14

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v14

    sget-object v9, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v2, v9, :cond_6

    const-string v9, "NO"

    goto :goto_1

    :cond_6
    const-string v9, "YES"

    :goto_1
    const/4 v10, 0x1

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    aget-object v3, v3, v14

    iput-object v3, v0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    .line 222
    iget-object v3, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v6, v0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {v3, v6, v2, v4, v14}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v2

    iput-object v2, v0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    .line 224
    iget-object v2, v0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v2, v3, :cond_7

    .line 225
    const-string v1, "eglCreateContext"

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 226
    return v14

    .line 229
    :cond_7
    if-eq v1, v15, :cond_a

    const/4 v2, 0x4

    if-eq v1, v2, :cond_9

    const/16 v2, 0x3142

    if-eq v1, v2, :cond_8

    .line 243
    iget-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, v0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1, v2, v5, v14}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v1

    iput-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    goto :goto_2

    .line 235
    :cond_8
    aput v16, v5, v14

    .line 236
    aput v16, v5, v15

    .line 238
    :cond_9
    iget-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, v0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    move-object/from16 v3, p5

    invoke-static {v1, v2, v3, v5, v14}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v1

    iput-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    .line 239
    goto :goto_2

    .line 231
    :cond_a
    iget-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, v0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1, v2, v14, v5, v14}, Landroid/opengl/EGL14;->eglCreatePixmapSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;I[II)Landroid/opengl/EGLSurface;

    move-result-object v1

    iput-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    .line 232
    nop

    .line 248
    :goto_2
    iget-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-ne v1, v2, :cond_b

    .line 249
    const-string v1, "eglCreateSurface"

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 250
    return v14

    .line 253
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    move-result v1

    if-nez v1, :cond_c

    .line 254
    return v14

    .line 257
    :cond_c
    const/4 v1, 0x1

    new-array v2, v1, [I

    .line 258
    iget-object v1, v0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v0, v0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    const/16 v3, 0x3098

    invoke-static {v1, v0, v3, v2, v14}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 259
    sget-object v0, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EGLContext created, client version "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, v2, v14

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const/4 v0, 0x1

    return v0

    :array_0
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method public static setContextColorBits(IIII)V
    .locals 0

    .line 34
    sput p0, Lcom/ss/android/ttve/common/TESharedContext;->mBitsR:I

    .line 35
    sput p1, Lcom/ss/android/ttve/common/TESharedContext;->mBitsG:I

    .line 36
    sput p2, Lcom/ss/android/ttve/common/TESharedContext;->mBitsB:I

    .line 37
    sput p3, Lcom/ss/android/ttve/common/TESharedContext;->mBitsA:I

    .line 38
    return-void
.end method


# virtual methods
.method public getContext()Landroid/opengl/EGLContext;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    return-object v0
.end method

.method public getDisplay()Landroid/opengl/EGLDisplay;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    return-object v0
.end method

.method public getSurface()Landroid/opengl/EGLSurface;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    return-object v0
.end method

.method public makeCurrent()Z
    .locals 4

    .line 98
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    iget-object v2, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    iget-object v3, p0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    const-string v0, "eglMakeCurrent"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 100
    const/4 v0, 0x0

    return v0

    .line 102
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public makeNoCurrent()V
    .locals 4

    .line 152
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 153
    const-string v0, "makeNoCurrent"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 154
    return-void
.end method

.method public release()V
    .locals 4

    .line 84
    sget-object v0, Lcom/ss/android/ttve/common/TESharedContext;->LOG_TAG:Ljava/lang/String;

    const-string v1, "#### CGESharedGLContext Destroying context... ####"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 86
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 87
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 88
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 89
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 92
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    .line 93
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    .line 94
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mContext:Landroid/opengl/EGLContext;

    .line 95
    return-void
.end method

.method public setPresentationTime(J)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 147
    const-string p1, "eglPresentationTimeANDROID"

    invoke-direct {p0, p1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public swapBuffers()Z
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v0

    return v0
.end method

.method public updateSurface(IIILjava/lang/Object;)Z
    .locals 3

    .line 107
    iget-object v0, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 109
    const/4 v0, 0x5

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3057

    aput v2, v0, v1

    const/4 v2, 0x1

    aput p1, v0, v2

    const/4 p1, 0x2

    const/16 v2, 0x3056

    aput v2, v0, p1

    const/4 v2, 0x3

    aput p2, v0, v2

    const/4 p2, 0x4

    const/16 v2, 0x3038

    aput v2, v0, p2

    .line 114
    if-eq p3, p1, :cond_2

    if-eq p3, p2, :cond_1

    const/16 p2, 0x3142

    if-eq p3, p2, :cond_0

    .line 128
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object p2, p0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {p1, p2, v0, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    goto :goto_0

    .line 120
    :cond_0
    aput v2, v0, v1

    .line 121
    aput v2, v0, p1

    .line 123
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object p2, p0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {p1, p2, p4, v0, v1}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    .line 124
    goto :goto_0

    .line 116
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mDisplay:Landroid/opengl/EGLDisplay;

    iget-object p2, p0, Lcom/ss/android/ttve/common/TESharedContext;->mConfig:Landroid/opengl/EGLConfig;

    invoke-static {p1, p2, v1, v0, v1}, Landroid/opengl/EGL14;->eglCreatePixmapSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;I[II)Landroid/opengl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    .line 117
    nop

    .line 133
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESharedContext;->mSurface:Landroid/opengl/EGLSurface;

    sget-object p2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-ne p1, p2, :cond_3

    .line 134
    const-string p1, "eglCreateSurface"

    invoke-direct {p0, p1}, Lcom/ss/android/ttve/common/TESharedContext;->checkEglError(Ljava/lang/String;)V

    .line 135
    return v1

    .line 138
    :cond_3
    invoke-virtual {p0}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    move-result p1

    return p1
.end method
