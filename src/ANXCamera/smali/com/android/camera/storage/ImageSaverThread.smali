.class public Lcom/android/camera/storage/ImageSaverThread;
.super Ljava/lang/Thread;
.source "ImageSaverThread.java"


# instance fields
.field private final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/camera/storage/SaveRequest;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mQuit:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/concurrent/BlockingQueue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/camera/storage/SaveRequest;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 16
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    .line 17
    return-void
.end method


# virtual methods
.method public quit()V
    .locals 1

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    .line 21
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaverThread;->interrupt()V

    .line 25
    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    .line 31
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/storage/SaveRequest;

    .line 32
    invoke-interface {v0}, Lcom/android/camera/storage/SaveRequest;->save()V

    .line 33
    invoke-interface {v0}, Lcom/android/camera/storage/SaveRequest;->onFinish()V

    .line 34
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaverThread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 37
    :catch_0
    move-exception v0

    .line 38
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQuit:Z

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaverThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    .line 41
    :cond_0
    :goto_1
    goto :goto_0
.end method
