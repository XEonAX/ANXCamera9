.class public Lcom/android/camera/effect/renders/SnapshotRender;
.super Ljava/lang/Object;
.source "SnapshotRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;
    }
.end annotation


# static fields
.field private static final CONFIG_SPEC:[I

.field private static final DUMP_TEXTURE:Z = false

.field private static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098

.field private static final EGL_OPENGL_ES2_BIT:I = 0x4

.field private static final QUEUE_LIMIT:I = 0x7

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private mCurrentCustomWaterMarkText:Ljava/lang/String;

.field private mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private mDualCameraWaterMarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

.field private mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field private mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field private mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

.field private mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mEglThread:Landroid/os/HandlerThread;

.field private mEglThreadBlockVar:Landroid/os/ConditionVariable;

.field private volatile mImageQueueSize:I

.field private final mLock:Ljava/lang/Object;

.field private mRelease:Z

.field private mReleasePending:Z


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    .line 122
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    .line 73
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->CONFIG_SPEC:[I

    return-void

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3038
    .end array-data
.end method

.method public constructor <init>(Landroid/util/Size;)V
    .locals 4
    .param p1    # Landroid/util/Size;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    .line 55
    new-instance v1, Landroid/os/ConditionVariable;

    invoke-direct {v1}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    .line 80
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    .line 83
    sget-object v1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SnapshotRender created "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; with size : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "SnapshotRender"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    .line 85
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 86
    new-instance v1, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;-><init>(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    .line 88
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v1, v0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 89
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendMessageSync(Landroid/os/Message;)V

    .line 90
    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/effect/renders/SnapshotRender;)Z
    .locals 0

    .line 48
    iget-boolean p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/android/camera/effect/renders/SnapshotRender;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->load48MWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/camera/effect/renders/SnapshotRender;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender;->destroy()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/Object;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$310(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 2

    .line 48
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object p1
.end method

.method static synthetic access$600()Ljava/lang/String;
    .locals 1

    .line 48
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object p0
.end method

.method static synthetic access$702(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object p1
.end method

.method static synthetic access$800(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 48
    invoke-static {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p0
.end method

.method static synthetic access$902(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p1
.end method

.method private static chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 9

    .line 188
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 189
    sget-object v3, Lcom/android/camera/effect/renders/SnapshotRender;->CONFIG_SPEC:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 193
    const/4 v7, 0x0

    aget v5, v0, v7

    .line 194
    if-lez v5, :cond_1

    .line 198
    new-array v8, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 199
    sget-object v3, Lcom/android/camera/effect/renders/SnapshotRender;->CONFIG_SPEC:[I

    move-object v1, p0

    move-object v2, p1

    move-object v4, v8

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 204
    aget-object p0, v8, v7

    return-object p0

    .line 201
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "eglChooseConfig#2 failed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 195
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "No configs match configSpec"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 190
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "eglChooseConfig failed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private destroy()V
    .locals 5

    .line 606
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    .line 607
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    .line 608
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 609
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 610
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 611
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 612
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 613
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 614
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 615
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 616
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 617
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 618
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    .line 620
    :cond_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 621
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SnapshotRender released "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 622
    return-void
.end method

.method private load48MWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 5

    .line 133
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 134
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 135
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 136
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 137
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fe()Z

    move-result v1

    .line 138
    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 139
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    sget-object v3, Lcom/android/camera/Util;->WATERMARK_48M_FILE_NAME:Ljava/lang/String;

    invoke-direct {v1, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 140
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    .line 141
    invoke-static {}, Lcom/android/camera/Util;->generate48MWatermark2File()Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    .line 143
    :cond_0
    :try_start_0
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 144
    :try_start_1
    invoke-static {p1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 145
    :try_start_2
    invoke-static {v2, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 144
    return-object v0

    .line 145
    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_0

    .line 143
    :catch_0
    move-exception v0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 145
    :catchall_1
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_0
    :try_start_4
    invoke-static {v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception p1

    .line 146
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v1, "Failed to load app camera watermark "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 149
    :cond_1
    return-object v2
.end method

.method private loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 4

    .line 99
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 100
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 101
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 104
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 106
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fe()Z

    move-result v1

    .line 107
    if-eqz v1, :cond_1

    .line 109
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    sget-object v2, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 110
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    .line 111
    invoke-static {}, Lcom/android/camera/Util;->generateWatermark2File()Landroid/graphics/Bitmap;

    .line 120
    :cond_0
    const/4 p1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 121
    :try_start_1
    invoke-static {v2, p1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 122
    :try_start_2
    invoke-static {p1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 121
    return-object v0

    .line 122
    :catchall_0
    move-exception v0

    move-object v1, p1

    goto :goto_0

    .line 120
    :catch_0
    move-exception v0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 122
    :catchall_1
    move-exception v1

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_0
    :try_start_4
    invoke-static {v1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception v0

    .line 123
    sget-object v1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v2, "Failed to load app camera watermark "

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 125
    nop

    .line 129
    return-object p1

    .line 127
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public isRelease()Z
    .locals 1

    .line 174
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public prepareEffectRender(Lcom/android/camera/effect/renders/DualWatermarkParam;I)V
    .locals 2

    .line 208
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 209
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/DualWatermarkParam;->isDualWatermarkEnable()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    .line 210
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 211
    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 212
    const/4 v1, 0x1

    iput-boolean v1, p1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 215
    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 216
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    .line 217
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    .line 219
    :cond_0
    sget p1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p2, p1, :cond_1

    .line 220
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x6

    invoke-virtual {p1, v1, p2, v0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 222
    :cond_1
    return-void
.end method

.method public processImageAsync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z
    .locals 3

    .line 154
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queueSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 156
    sget-object p1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v0, "queueSize is full"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    const/4 p1, 0x0

    return p1

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 161
    :try_start_0
    iget v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    .line 162
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v0, v2, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 164
    return v2

    .line 162
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public processImageSync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 169
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 170
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    .line 171
    return-void
.end method

.method public release()V
    .locals 3

    .line 179
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v2, "release: try to release but message is not null, so pending it"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    iput-boolean v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    goto :goto_0

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendEmptyMessage(I)Z

    .line 185
    :goto_0
    return-void
.end method
