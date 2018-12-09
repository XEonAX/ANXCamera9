.class public Lcom/ss/android/ttve/nativePort/TECameraProxy;
.super Lcom/ss/android/ttve/utils/CameraInstance;
.source "TECameraProxy.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static mNativeAddr:J


# instance fields
.field private mCameraOpenCallback:Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;

.field private mCameraTextureID:I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mbSurfaceTextureReleased:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 17
    const-class v0, Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->TAG:Ljava/lang/String;

    .line 18
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mNativeAddr:J

    .line 25
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/ss/android/ttve/utils/CameraInstance;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mbSurfaceTextureReleased:Z

    .line 22
    iput v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mCameraTextureID:I

    .line 92
    new-instance v0, Lcom/ss/android/ttve/nativePort/TECameraProxy$2;

    invoke-direct {v0, p0}, Lcom/ss/android/ttve/nativePort/TECameraProxy$2;-><init>(Lcom/ss/android/ttve/nativePort/TECameraProxy;)V

    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mCameraOpenCallback:Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ttve/nativePort/TECameraProxy;)Z
    .locals 0

    .line 16
    iget-boolean p0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mbSurfaceTextureReleased:Z

    return p0
.end method

.method static synthetic access$100()J
    .locals 2

    .line 16
    sget-wide v0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mNativeAddr:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/ss/android/ttve/nativePort/TECameraProxy;JLandroid/graphics/SurfaceTexture;)I
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->nativeOnFrameAvailable(JLandroid/graphics/SurfaceTexture;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/ss/android/ttve/nativePort/TECameraProxy;JI)I
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->nativeOnCameraCreate(JI)I

    move-result p0

    return p0
.end method

.method public static create(J)Lcom/ss/android/ttve/nativePort/TECameraProxy;
    .locals 0

    .line 29
    sput-wide p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mNativeAddr:J

    .line 30
    new-instance p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-direct {p0}, Lcom/ss/android/ttve/nativePort/TECameraProxy;-><init>()V

    return-object p0
.end method

.method private native nativeOnCameraCreate(JI)I
.end method

.method private native nativeOnFrameAvailable(JLandroid/graphics/SurfaceTexture;)I
.end method


# virtual methods
.method public declared-synchronized getNextFrame()V
    .locals 1

    monitor-enter p0

    .line 79
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    monitor-exit p0

    return-void

    .line 78
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized open(I)Z
    .locals 1

    monitor-enter p0

    .line 63
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mCameraOpenCallback:Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->tryOpenCamera(Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;I)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setSurfaceTexture(Ljava/lang/Object;I)I
    .locals 2

    .line 38
    sget-object v0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->TAG:Ljava/lang/String;

    const-string v1, "setSurfaceTexture..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    const/16 v0, -0x64

    if-nez p2, :cond_0

    .line 40
    sget-object p1, Lcom/ss/android/ttve/nativePort/TECameraProxy;->TAG:Ljava/lang/String;

    const-string p2, "Invalid Texture ID!"

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return v0

    .line 44
    :cond_0
    instance-of p2, p1, Landroid/graphics/SurfaceTexture;

    if-eqz p2, :cond_1

    .line 45
    check-cast p1, Landroid/graphics/SurfaceTexture;

    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 51
    iget-object p1, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    new-instance p2, Lcom/ss/android/ttve/nativePort/TECameraProxy$1;

    invoke-direct {p2, p0}, Lcom/ss/android/ttve/nativePort/TECameraProxy$1;-><init>(Lcom/ss/android/ttve/nativePort/TECameraProxy;)V

    invoke-virtual {p1, p2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 59
    const/4 p1, 0x0

    return p1

    .line 47
    :cond_1
    sget-object p1, Lcom/ss/android/ttve/nativePort/TECameraProxy;->TAG:Ljava/lang/String;

    const-string p2, "Invalid SurfaceTexture!"

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return v0
.end method

.method public declared-synchronized startPreview()V
    .locals 1

    monitor-enter p0

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0, v0}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->startPreview(Landroid/graphics/SurfaceTexture;)V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mbSurfaceTextureReleased:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    monitor-exit p0

    return-void

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopCamera()V
    .locals 2

    monitor-enter p0

    .line 73
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mbSurfaceTextureReleased:Z

    .line 74
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 75
    invoke-super {p0}, Lcom/ss/android/ttve/utils/CameraInstance;->stopCamera()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    .line 72
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized switchCamera(I)Z
    .locals 1

    monitor-enter p0

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mCameraOpenCallback:Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->tryOpenCamera(Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 84
    iget-object p1, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->startPreview(Landroid/graphics/SurfaceTexture;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    const/4 p1, 0x1

    monitor-exit p0

    return p1

    .line 88
    :cond_0
    const/4 p1, 0x0

    monitor-exit p0

    return p1

    .line 82
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
