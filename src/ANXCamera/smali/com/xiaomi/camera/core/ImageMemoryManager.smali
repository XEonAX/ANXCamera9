.class public Lcom/xiaomi/camera/core/ImageMemoryManager;
.super Ljava/lang/Object;
.source "ImageMemoryManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final TOTAL_MAX_MEMORY_USAGE:I = 0x40000000

.field private static mUsedMemory:I


# instance fields
.field private mImagesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/media/Image;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxHoldImageNumber:I

.field private final mObjLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    sput v0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    .line 23
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    .line 26
    iput p1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mMaxHoldImageNumber:I

    .line 27
    return-void
.end method

.method private getImageUsedMemory(Landroid/media/Image;)I
    .locals 4

    .line 81
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    .line 82
    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 84
    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result p1

    const/16 v2, 0x23

    if-eq p1, v2, :cond_1

    const/16 v2, 0x100

    if-eq p1, v2, :cond_0

    .line 90
    return v1

    .line 88
    :cond_0
    return v0

    .line 86
    :cond_1
    int-to-double v0, v0

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v0, v2

    double-to-int p1, v0

    return p1
.end method

.method public static isMemoryFull()Z
    .locals 2

    .line 53
    sget v0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    const/high16 v1, 0x40000000    # 2.0f

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public holdAnImage(Landroid/media/Image;)V
    .locals 4

    .line 30
    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 31
    :try_start_0
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ImageMemoryManager;->getImageUsedMemory(Landroid/media/Image;)I

    move-result v1

    .line 32
    iget-object v2, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ImageMemoryManager;->getImageUsedMemory(Landroid/media/Image;)I

    move-result v2

    add-int/2addr v1, v2

    sput v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    .line 34
    sget-object v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "holdAnImage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", needCloseImageNum="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    monitor-exit v0

    .line 36
    return-void

    .line 35
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public needWaitImageClose()Z
    .locals 4

    .line 57
    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 58
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    iget v2, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mMaxHoldImageNumber:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-lt v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    monitor-exit v0

    return v3

    .line 59
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public releaseAnImage(Landroid/media/Image;)V
    .locals 4

    .line 39
    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 40
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 42
    sget v2, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    sub-int/2addr v2, v1

    sput v2, Lcom/xiaomi/camera/core/ImageMemoryManager;->mUsedMemory:I

    .line 43
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 45
    sget-object v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releaseAnImage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", needCloseImageNum="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releaseAnImage: not hold image "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :goto_0
    monitor-exit v0

    .line 50
    return-void

    .line 49
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public waitImageCloseIfNeeded()V
    .locals 4

    .line 63
    sget-object v0, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "waitImageCloseIfNeeded: needCloseImageNum="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 66
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mImagesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    iget v2, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mMaxHoldImageNumber:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_0

    .line 68
    :try_start_1
    sget-object v1, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    const-string v2, "waitImageCloseIfNeeded: wait"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageMemoryManager;->mObjLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 70
    :catch_0
    move-exception v1

    .line 71
    :try_start_2
    sget-object v2, Lcom/xiaomi/camera/core/ImageMemoryManager;->TAG:Ljava/lang/String;

    const-string v3, "waitImageCloseIfNeeded: failed!"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    :goto_1
    goto :goto_0

    .line 74
    :cond_0
    monitor-exit v0

    .line 75
    return-void

    .line 74
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
