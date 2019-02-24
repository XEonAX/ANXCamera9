.class public Lcom/android/camera/network/download/GalleryDownloadManager;
.super Ljava/lang/Object;
.source "GalleryDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;,
        Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;,
        Lcom/android/camera/network/download/GalleryDownloadManager$OnProgressListener;
    }
.end annotation


# static fields
.field private static final CORE_POOL_SIZE:I = 0x2

.field public static final INSTANCE:Lcom/android/camera/network/download/GalleryDownloadManager;

.field private static final KEET_ALIVE_SECOND:J = 0x1eL

.field private static final MAX_DOWNLOAD_TASK:I = 0x4

.field private static final TAG:Ljava/lang/String; = "GalleryDownloader"


# instance fields
.field private mBlockingQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private mTasks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/camera/network/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mThreadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    new-instance v0, Lcom/android/camera/network/download/GalleryDownloadManager;

    invoke-direct {v0}, Lcom/android/camera/network/download/GalleryDownloadManager;-><init>()V

    sput-object v0, Lcom/android/camera/network/download/GalleryDownloadManager;->INSTANCE:Lcom/android/camera/network/download/GalleryDownloadManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 9

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    .line 22
    new-instance v0, Lcom/android/camera/network/download/GalleryDownloadManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/network/download/GalleryDownloadManager$1;-><init>(Lcom/android/camera/network/download/GalleryDownloadManager;)V

    iput-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 30
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    iget-object v8, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mThreadFactory:Ljava/util/concurrent/ThreadFactory;

    const/4 v2, 0x2

    const/4 v3, 0x4

    const-wide/16 v4, 0x1e

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/network/download/GalleryDownloadManager;)Ljava/util/Map;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public cancel(Ljava/lang/String;)V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/network/download/DownloadTask;

    .line 61
    if-eqz p1, :cond_0

    .line 62
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/network/download/DownloadTask;->cancel(Z)Z

    .line 64
    :cond_0
    return-void
.end method

.method public download(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/GalleryDownloadManager$OnProgressListener;)I
    .locals 2

    .line 48
    new-instance v0, Lcom/android/camera/network/download/DownloadTask;

    invoke-direct {v0, p1}, Lcom/android/camera/network/download/DownloadTask;-><init>(Lcom/android/camera/network/download/Request;)V

    .line 49
    invoke-virtual {v0, p2}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 50
    iget-object p2, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const/4 p2, 0x0

    :try_start_0
    invoke-virtual {v0}, Lcom/android/camera/network/download/DownloadTask;->execute()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    invoke-virtual {v0, p2}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 55
    iget-object p2, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    return v1

    .line 54
    :catchall_0
    move-exception v1

    invoke-virtual {v0, p2}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 55
    iget-object p2, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v1
.end method

.method public enqueue(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;)V
    .locals 2

    .line 39
    new-instance v0, Lcom/android/camera/network/download/DownloadTask;

    new-instance v1, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;

    invoke-direct {v1, p0, p2}, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;-><init>(Lcom/android/camera/network/download/GalleryDownloadManager;Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;)V

    invoke-direct {v0, p1, v1}, Lcom/android/camera/network/download/DownloadTask;-><init>(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;)V

    .line 40
    iget-object p2, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    iget-object p1, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Lcom/android/camera/network/download/DownloadTask;->execute(Ljava/util/concurrent/Executor;)V

    .line 42
    return-void
.end method

.method public registerOnProgressListener(Ljava/lang/String;Lcom/android/camera/network/download/GalleryDownloadManager$OnProgressListener;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/network/download/DownloadTask;

    .line 68
    if-eqz p1, :cond_0

    .line 69
    invoke-virtual {p1, p2}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 71
    :cond_0
    return-void
.end method

.method public unregisterOnProgressListener(Ljava/lang/String;)V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager;->mTasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/network/download/DownloadTask;

    .line 75
    if-eqz p1, :cond_0

    .line 76
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 78
    :cond_0
    return-void
.end method
