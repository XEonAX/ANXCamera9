.class public Lcom/android/camera/storage/MemoryManager;
.super Ljava/lang/Object;
.source "MemoryManager.java"

# interfaces
.implements Lcom/android/camera/storage/Storage$StorageListener;


# static fields
.field private static final DELAY_SECTION:I = 0x64

.field private static final MAX_MEMORY_LIMIT_RATIO:F = 0.95f

.field public static final MTK_SPEED_DOWN_RATIO:F = 0.66f

.field private static final ONE_MB:J = 0x100000L

.field private static final PHONE_SAVE_TASK_MEMORY_LIMIT_RATIO:F = 0.6f

.field private static final SAVE_QUEUE_MEMORY_RATIO:F = 1.3f

.field private static final SDCARD_SAVE_TASK_MEMORY_LIMIT:I = 0x3c00000

.field private static final SDCARD_SAVE_TASK_MEMORY_LIMIT_RATIO:F = 0.5f

.field private static final TAG:Ljava/lang/String; = "CameraMemoryManager"


# instance fields
.field private mMaxMemory:J

.field private mMaxTotalMemory:I

.field private mRuntime:Ljava/lang/Runtime;

.field private mSaveTaskMemoryLimit:I

.field private mSavedQueueMemoryLimit:I

.field private mSaverMemoryUse:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    return-void
.end method

.method private getBaseMemory()J
    .locals 4

    .line 55
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    const/16 v1, 0x2d0

    if-eq v0, v1, :cond_2

    const/16 v1, 0x438

    if-eq v0, v1, :cond_1

    const/16 v1, 0x5a0

    if-eq v0, v1, :cond_0

    .line 64
    iget-object v0, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    invoke-virtual {v2}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0

    .line 61
    :cond_0
    const-wide/32 v0, 0x3c00000

    return-wide v0

    .line 59
    :cond_1
    const-wide/32 v0, 0x2800000

    return-wide v0

    .line 57
    :cond_2
    const-wide/32 v0, 0x1400000

    return-wide v0
.end method

.method private getTotalUsedMemory()I
    .locals 9

    .line 97
    iget-object v0, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v0

    .line 98
    iget-object v2, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    invoke-virtual {v2}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    .line 99
    sub-long v4, v0, v2

    .line 100
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getLeftMemory: maxMemory="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, p0, Lcom/android/camera/storage/MemoryManager;->mMaxMemory:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, ", total="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", free="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", totalUsed="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/storage/MemoryManager;->log(Ljava/lang/String;)V

    .line 102
    long-to-int v0, v4

    return v0
.end method

.method private initLimit()V
    .locals 4

    .line 41
    iget-wide v0, p0, Lcom/android/camera/storage/MemoryManager;->mMaxMemory:J

    invoke-direct {p0}, Lcom/android/camera/storage/MemoryManager;->getBaseMemory()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 42
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUsePhoneStorage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 43
    long-to-float v0, v0

    const v1, 0x3f19999a    # 0.6f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    goto :goto_0

    .line 45
    :cond_0
    long-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    .line 46
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    const/high16 v1, 0x3c00000

    if-ge v1, v0, :cond_1

    .line 47
    iput v1, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    .line 50
    :cond_1
    :goto_0
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    int-to-float v0, v0

    const v1, 0x3fa66666    # 1.3f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSavedQueueMemoryLimit:I

    .line 51
    const-string v0, "CameraMemoryManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initLimit: mSavedQueueMemoryLimit = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSavedQueueMemoryLimit:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    return-void
.end method

.method private isReachedMemoryLimit()Z
    .locals 2

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isReachedMemoryLimit: usedMemory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/storage/MemoryManager;->log(Ljava/lang/String;)V

    .line 114
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v1, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1

    .line 142
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    .line 143
    const-string v0, "CameraMemoryManager"

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_0
    return-void
.end method


# virtual methods
.method public addUsedMemory(I)V
    .locals 1

    .line 69
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    .line 70
    return-void
.end method

.method public getBurstDelay()I
    .locals 6

    .line 77
    nop

    .line 79
    invoke-virtual {p0}, Lcom/android/camera/storage/MemoryManager;->isNeedSlowDown()Z

    move-result v0

    const/4 v1, 0x3

    const/16 v2, 0x8

    const/4 v3, 0x4

    const/4 v4, 0x5

    if-eqz v0, :cond_4

    .line 80
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v5, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    mul-int/lit8 v5, v5, 0x7

    div-int/2addr v5, v2

    if-lt v0, v5, :cond_0

    .line 81
    nop

    .line 92
    move v1, v2

    goto :goto_0

    .line 82
    :cond_0
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    mul-int/2addr v2, v4

    div-int/lit8 v2, v2, 0x6

    if-lt v0, v2, :cond_1

    .line 83
    nop

    .line 92
    move v1, v4

    goto :goto_0

    .line 84
    :cond_1
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    mul-int/2addr v2, v3

    div-int/2addr v2, v4

    if-lt v0, v2, :cond_2

    .line 85
    nop

    .line 92
    move v1, v3

    goto :goto_0

    .line 86
    :cond_2
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    mul-int/2addr v2, v1

    div-int/2addr v2, v3

    if-lt v0, v2, :cond_3

    .line 87
    goto :goto_0

    .line 89
    :cond_3
    const/4 v1, 0x1

    goto :goto_0

    .line 92
    :cond_4
    const/4 v1, 0x0

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getBurstDelay: delayMultiple="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/storage/MemoryManager;->log(Ljava/lang/String;)V

    .line 93
    mul-int/lit8 v1, v1, 0x64

    return v1
.end method

.method public initMemory()V
    .locals 4

    .line 32
    iget-object v0, p0, Lcom/android/camera/storage/MemoryManager;->mRuntime:Ljava/lang/Runtime;

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/storage/MemoryManager;->mMaxMemory:J

    .line 33
    iget-wide v0, p0, Lcom/android/camera/storage/MemoryManager;->mMaxMemory:J

    long-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mMaxTotalMemory:I

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    .line 35
    invoke-direct {p0}, Lcom/android/camera/storage/MemoryManager;->initLimit()V

    .line 36
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->setStorageListener(Lcom/android/camera/storage/Storage$StorageListener;)V

    .line 37
    const-string v0, "CameraMemoryManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initMemory: maxMemory="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/android/camera/storage/MemoryManager;->mMaxMemory:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void
.end method

.method public isNeedSlowDown()Z
    .locals 4

    .line 130
    nop

    .line 131
    invoke-static {}, Lcom/mi/config/b;->gd()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 132
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v3, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x4

    if-lt v0, v3, :cond_0

    .line 136
    :goto_0
    move v1, v2

    goto :goto_1

    .line 132
    :cond_0
    goto :goto_1

    .line 134
    :cond_1
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v3, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    div-int/lit8 v3, v3, 0x2

    if-lt v0, v3, :cond_2

    goto :goto_0

    .line 136
    :cond_2
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isNeedSlowDown: return "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " mSaverMemoryUse="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mSaveTaskMemoryLimit="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaveTaskMemoryLimit:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/storage/MemoryManager;->log(Ljava/lang/String;)V

    .line 138
    return v1
.end method

.method public isNeedStopCapture()Z
    .locals 4

    .line 119
    nop

    .line 120
    invoke-direct {p0}, Lcom/android/camera/storage/MemoryManager;->isReachedMemoryLimit()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mMaxTotalMemory:I

    .line 121
    invoke-direct {p0}, Lcom/android/camera/storage/MemoryManager;->getTotalUsedMemory()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 122
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v0

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    goto :goto_0

    .line 126
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 123
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 124
    const-string v1, "CameraMemoryManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isNeedStopCapture: needStop="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :goto_1
    return v0
.end method

.method public declared-synchronized isSaveQueueFull()Z
    .locals 3

    monitor-enter p0

    .line 106
    :try_start_0
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    iget v1, p0, Lcom/android/camera/storage/MemoryManager;->mSavedQueueMemoryLimit:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 107
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isSaveQueueFull = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", usedMemory="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", limit = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/storage/MemoryManager;->mSavedQueueMemoryLimit:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/storage/MemoryManager;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    monitor-exit p0

    return v0

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onStoragePathChanged()V
    .locals 0

    .line 149
    invoke-virtual {p0}, Lcom/android/camera/storage/MemoryManager;->initMemory()V

    .line 150
    return-void
.end method

.method public reduceUsedMemory(I)V
    .locals 1

    .line 73
    iget v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/storage/MemoryManager;->mSaverMemoryUse:I

    .line 74
    return-void
.end method
