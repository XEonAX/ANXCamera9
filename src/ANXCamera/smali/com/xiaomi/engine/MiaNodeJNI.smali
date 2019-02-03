.class public Lcom/xiaomi/engine/MiaNodeJNI;
.super Ljava/lang/Object;
.source "MiaNodeJNI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/engine/MiaNodeJNI$InstanceHolder;
    }
.end annotation


# static fields
.field private static final LIB_NAME:Ljava/lang/String; = "com.xiaomi.camera.mianodejni"

.field private static final TAG:Ljava/lang/String;

.field private static sInitialized:Z

.field private static sType:I


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private final mObjLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Lcom/xiaomi/engine/MiaNodeJNI;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    sput v0, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MiaNodeLifeCycle"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandlerThread:Landroid/os/HandlerThread;

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mObjLock:Ljava/lang/Object;

    .line 39
    :try_start_0
    sget-object v0, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    const-string v1, "start loading com.xiaomi.camera.mianodejni"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    const-string v0, "com.xiaomi.camera.mianodejni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    sget-object v0, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    const-string v1, "static initializer: loadLibrary com.xiaomi.camera.mianodejni"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    sget-object v1, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not load library:com.xiaomi.camera.mianodejni : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 46
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandler:Landroid/os/Handler;

    .line 47
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/engine/MiaNodeJNI$1;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/xiaomi/engine/MiaNodeJNI;-><init>()V

    return-void
.end method

.method static synthetic access$100()I
    .locals 1

    .line 19
    sget v0, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    return v0
.end method

.method static synthetic access$200(Lcom/xiaomi/engine/MiaNodeJNI;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/xiaomi/engine/MiaNodeJNI;->deInitialize(I)V

    return-void
.end method

.method private static native deInit(I)I
.end method

.method private deInitialize(I)V
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 79
    :try_start_0
    sget-boolean v1, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    if-eqz v1, :cond_0

    .line 80
    invoke-static {p1}, Lcom/xiaomi/engine/MiaNodeJNI;->deInit(I)I

    .line 81
    sget-object v1, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MiaNode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " has been deInitialized"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const/4 p1, 0x0

    sput-boolean p1, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    .line 84
    :cond_0
    monitor-exit v0

    .line 85
    return-void

    .line 84
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public static getInstance()Lcom/xiaomi/engine/MiaNodeJNI;
    .locals 1

    .line 34
    sget-object v0, Lcom/xiaomi/engine/MiaNodeJNI$InstanceHolder;->INSTANCE:Lcom/xiaomi/engine/MiaNodeJNI;

    return-object v0
.end method

.method private static native init(I)I
.end method

.method private initialize(I)V
    .locals 7

    .line 60
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 61
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 62
    sget-boolean v3, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    if-eqz v3, :cond_0

    sget v3, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    if-eq v3, p1, :cond_0

    sget v3, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    if-eqz v3, :cond_0

    .line 63
    sget v3, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    invoke-direct {p0, v3}, Lcom/xiaomi/engine/MiaNodeJNI;->deInitialize(I)V

    .line 66
    :cond_0
    sget-boolean v3, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    if-nez v3, :cond_1

    .line 67
    sput p1, Lcom/xiaomi/engine/MiaNodeJNI;->sType:I

    .line 68
    invoke-static {p1}, Lcom/xiaomi/engine/MiaNodeJNI;->init(I)I

    .line 70
    sget-object v3, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MiaNode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " has been initialized, cost :"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v1

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 70
    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    const/4 p1, 0x1

    sput-boolean p1, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    .line 74
    :cond_1
    monitor-exit v0

    .line 75
    return-void

    .line 74
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private static native processRequest(Ljava/util/List;Landroid/media/Image;IZ)I
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/media/Image;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/engine/FrameData;",
            ">;",
            "Landroid/media/Image;",
            "IZ)I"
        }
    .end annotation
.end method

.method private tryToCloseNode()V
    .locals 4

    .line 50
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 51
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/engine/MiaNodeJNI$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/engine/MiaNodeJNI$1;-><init>(Lcom/xiaomi/engine/MiaNodeJNI;)V

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 57
    return-void
.end method


# virtual methods
.method public process(Ljava/util/List;Landroid/media/Image;IZ)I
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/media/Image;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/engine/FrameData;",
            ">;",
            "Landroid/media/Image;",
            "IZ)I"
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/xiaomi/engine/MiaNodeJNI;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 101
    :try_start_0
    sget-boolean v1, Lcom/xiaomi/engine/MiaNodeJNI;->sInitialized:Z

    if-nez v1, :cond_0

    .line 102
    invoke-direct {p0, p3}, Lcom/xiaomi/engine/MiaNodeJNI;->initialize(I)V

    .line 104
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 105
    sget-object v3, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    const-string v4, "processRequest: start"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    invoke-static {p1, p2, p3, p4}, Lcom/xiaomi/engine/MiaNodeJNI;->processRequest(Ljava/util/List;Landroid/media/Image;IZ)I

    move-result p1

    .line 108
    sget-object p2, Lcom/xiaomi/engine/MiaNodeJNI;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "processRequest: end, cost: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p3, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-direct {p0}, Lcom/xiaomi/engine/MiaNodeJNI;->tryToCloseNode()V

    .line 111
    monitor-exit v0

    return p1

    .line 112
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
