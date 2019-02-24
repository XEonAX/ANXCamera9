.class public final Lcom/xiaomi/camera/liveshot/gles/EglCore;
.super Ljava/lang/Object;
.source "EglCore.java"


# static fields
.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field public static final FLAG_RECORDABLE:I = 0x1

.field public static final FLAG_TRY_GLES3:I = 0x2

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mEGLConfig:Landroid/opengl/EGLConfig;

.field private mEGLContext:Landroid/opengl/EGLContext;

.field private mEGLDisplay:Landroid/opengl/EGLDisplay;

.field private mGlVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-class v0, Lcom/xiaomi/camera/liveshot/gles/EglCore;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;I)V
    .locals 8

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 35
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 37
    const/4 v1, -0x1

    iput v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mGlVersion:I

    .line 46
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v1, v2, :cond_6

    .line 50
    if-nez p1, :cond_0

    .line 51
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 54
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v2

    iput-object v2, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 55
    iget-object v2, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v2, v3, :cond_5

    .line 58
    const/4 v2, 0x2

    new-array v3, v2, [I

    .line 59
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    const/4 v5, 0x1

    invoke-static {v4, v3, v1, v3, v5}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 65
    and-int/lit8 v0, p2, 0x2

    const/4 v3, 0x3

    if-eqz v0, :cond_1

    .line 67
    invoke-direct {p0, p2, v3}, Lcom/xiaomi/camera/liveshot/gles/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    new-array v4, v3, [I

    fill-array-data v4, :array_0

    .line 73
    iget-object v6, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v6, v0, p1, v4, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v4

    .line 76
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v6

    const/16 v7, 0x3000

    if-ne v6, v7, :cond_1

    .line 78
    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 79
    iput-object v4, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 80
    iput v3, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mGlVersion:I

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v0, v4, :cond_3

    .line 86
    invoke-direct {p0, p2, v2}, Lcom/xiaomi/camera/liveshot/gles/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object p2

    .line 87
    if-eqz p2, :cond_2

    .line 90
    new-array v0, v3, [I

    fill-array-data v0, :array_1

    .line 94
    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v3, p2, p1, v0, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object p1

    .line 96
    const-string v0, "eglCreateContext"

    invoke-direct {p0, v0}, Lcom/xiaomi/camera/liveshot/gles/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 97
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 98
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 99
    iput v2, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mGlVersion:I

    goto :goto_0

    .line 88
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Unable to find a suitable EGLConfig"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 103
    :cond_3
    :goto_0
    new-array p1, v5, [I

    .line 104
    iget-object p2, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    const/16 v2, 0x3098

    invoke-static {p2, v0, v2, p1, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 106
    sget-object p2, Lcom/xiaomi/camera/liveshot/gles/EglCore;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EGLContext created, client version "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget p1, p1, v1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    return-void

    .line 60
    :cond_4
    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 61
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "unable to initialize EGL14"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_5
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "unable to get EGL14 display"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 47
    :cond_6
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "EGL already set up"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :array_0
    .array-data 4
        0x3098
        0x3
        0x3038
    .end array-data

    :array_1
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 3

    .line 261
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-ne v0, v1, :cond_0

    .line 264
    return-void

    .line 262
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

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

    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getConfig(II)Landroid/opengl/EGLConfig;
    .locals 13

    .line 116
    nop

    .line 117
    const/4 v0, 0x4

    const/4 v1, 0x3

    if-lt p2, v1, :cond_0

    .line 118
    const/16 v2, 0x44

    goto :goto_0

    .line 124
    :cond_0
    move v2, v0

    :goto_0
    const/16 v3, 0xd

    new-array v5, v3, [I

    const/16 v3, 0x3024

    const/4 v12, 0x0

    aput v3, v5, v12

    const/16 v3, 0x8

    const/4 v4, 0x1

    aput v3, v5, v4

    const/16 v6, 0x3023

    const/4 v7, 0x2

    aput v6, v5, v7

    aput v3, v5, v1

    const/16 v6, 0x3022

    aput v6, v5, v0

    const/4 v0, 0x5

    aput v3, v5, v0

    const/4 v0, 0x6

    const/16 v6, 0x3021

    aput v6, v5, v0

    const/4 v0, 0x7

    aput v3, v5, v0

    const/16 v0, 0x3040

    aput v0, v5, v3

    const/16 v0, 0x9

    aput v2, v5, v0

    const/16 v0, 0xa

    const/16 v2, 0x3038

    aput v2, v5, v0

    const/16 v0, 0xb

    aput v12, v5, v0

    const/16 v0, 0xc

    aput v2, v5, v0

    .line 135
    and-int/2addr p1, v4

    if-eqz p1, :cond_1

    .line 136
    array-length p1, v5

    sub-int/2addr p1, v1

    const/16 v0, 0x3142

    aput v0, v5, p1

    .line 137
    array-length p1, v5

    sub-int/2addr p1, v7

    aput v4, v5, p1

    .line 139
    :cond_1
    new-array p1, v4, [Landroid/opengl/EGLConfig;

    .line 140
    new-array v10, v4, [I

    .line 141
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    const/4 v6, 0x0

    const/4 v8, 0x0

    array-length v9, p1

    const/4 v11, 0x0

    move-object v7, p1

    invoke-static/range {v4 .. v11}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v0

    if-nez v0, :cond_2

    .line 143
    sget-object p1, Lcom/xiaomi/camera/liveshot/gles/EglCore;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unable to find RGB8888 / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " EGLConfig"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    const/4 p1, 0x0

    return-object p1

    .line 146
    :cond_2
    aget-object p1, p1, v12

    return-object p1
.end method


# virtual methods
.method public createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    .locals 4

    .line 201
    instance-of v0, p1, Landroid/view/Surface;

    if-nez v0, :cond_1

    instance-of v0, p1, Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 202
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid surface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_1
    :goto_0
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/16 v1, 0x3038

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 209
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1, v3, p1, v0, v2}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object p1

    .line 211
    const-string v0, "eglCreateWindowSurface"

    invoke-direct {p0, v0}, Lcom/xiaomi/camera/liveshot/gles/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 212
    if-eqz p1, :cond_2

    .line 215
    return-object p1

    .line 213
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "surface was null"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 174
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 179
    sget-object v0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->TAG:Ljava/lang/String;

    const-string v1, "WARNING: EglCore was not explicitly released -- state may be leaked"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    invoke-virtual {p0}, Lcom/xiaomi/camera/liveshot/gles/EglCore;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 184
    nop

    .line 185
    return-void

    .line 183
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getGlVersion()I
    .locals 1

    .line 253
    iget v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mGlVersion:I

    return v0
.end method

.method public makeCurrent(Landroid/opengl/EGLSurface;)V
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 224
    sget-object v0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->TAG:Ljava/lang/String;

    const-string v1, "NOTE: makeCurrent w/o display"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p1, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 229
    return-void

    .line 227
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "eglMakeCurrent failed"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public querySurface(Landroid/opengl/EGLSurface;I)I
    .locals 3

    .line 244
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 245
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    const/4 v2, 0x0

    invoke-static {v1, p1, p2, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 246
    aget p1, v0, v2

    return p1
.end method

.method public release()V
    .locals 4

    .line 156
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 159
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 161
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 162
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 163
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 166
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 167
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 168
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 169
    return-void
.end method

.method public releaseSurface(Landroid/opengl/EGLSurface;)V
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 193
    return-void
.end method

.method public swapBuffers(Landroid/opengl/EGLSurface;)Z
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result p1

    return p1
.end method
