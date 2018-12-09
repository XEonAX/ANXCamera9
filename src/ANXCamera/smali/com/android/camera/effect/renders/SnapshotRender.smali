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
.field private mDualCameraWaterMark:Landroid/graphics/Bitmap;

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
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-class v0, Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    .line 57
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

.method public constructor <init>(Lcom/android/camera/effect/renders/DualWatermarkParam;II)V
    .locals 3

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    .line 41
    new-instance v1, Landroid/os/ConditionVariable;

    invoke-direct {v1}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    .line 64
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    .line 67
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "SnapshotRender"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    .line 68
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 69
    new-instance v1, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;-><init>(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    .line 71
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v1, v0, p2, p3}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p2

    .line 72
    iget-object p3, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {p3, p2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendMessageSync(Landroid/os/Message;)V

    .line 73
    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    .line 75
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 76
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 77
    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 78
    const/4 p3, 0x1

    iput-boolean p3, p2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 82
    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 83
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 84
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/DualWatermarkParam;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMark:Landroid/graphics/Bitmap;

    .line 86
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/effect/renders/SnapshotRender;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p1
.end method

.method static synthetic access$102(Lcom/android/camera/effect/renders/SnapshotRender;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMark:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkParam:Lcom/android/camera/effect/renders/DualWatermarkParam;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/android/camera/effect/renders/SnapshotRender;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/HandlerThread;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/Object;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$310(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 2

    .line 34
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object p1
.end method

.method static synthetic access$600()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object p0
.end method

.method static synthetic access$702(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object p1
.end method

.method static synthetic access$800(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0

    .line 34
    invoke-static {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p0
.end method

.method static synthetic access$902(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p1
.end method

.method private static chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 9

    .line 123
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 124
    sget-object v3, Lcom/android/camera/effect/renders/SnapshotRender;->CONFIG_SPEC:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 128
    const/4 v7, 0x0

    aget v5, v0, v7

    .line 129
    if-lez v5, :cond_1

    .line 133
    new-array v8, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 134
    sget-object v3, Lcom/android/camera/effect/renders/SnapshotRender;->CONFIG_SPEC:[I

    move-object v1, p0

    move-object v2, p1

    move-object v4, v8

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 139
    aget-object p0, v8, v7

    return-object p0

    .line 136
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "eglChooseConfig#2 failed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 130
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "No configs match configSpec"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 125
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "eglChooseConfig failed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public isRelease()Z
    .locals 1

    .line 110
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

.method public prepareEffectRender(I)V
    .locals 3

    .line 143
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 144
    return-void
.end method

.method public processImageAsync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z
    .locals 3

    .line 90
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

    .line 91
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 92
    sget-object p1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v0, "queueSize is full"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    const/4 p1, 0x0

    return p1

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 97
    :try_start_0
    iget v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    .line 98
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v0, v2, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 100
    return v2

    .line 98
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

    .line 104
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 105
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 106
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    .line 107
    return-void
.end method

.method public release()V
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    iput-boolean v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendEmptyMessage(I)Z

    .line 120
    :goto_0
    return-void
.end method
