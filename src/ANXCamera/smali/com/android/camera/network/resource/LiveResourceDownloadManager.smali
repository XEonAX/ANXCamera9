.class public Lcom/android/camera/network/resource/LiveResourceDownloadManager;
.super Ljava/lang/Object;
.source "LiveResourceDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/resource/LiveResourceDownloadManager$Instance;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LiveResourceDownloadManager"


# instance fields
.field private mDownloadState:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/network/resource/OnLiveDownloadListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

.field private object:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mDownloadState:Ljava/util/Map;

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->object:Ljava/lang/Object;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mListeners:Ljava/util/List;

    .line 71
    new-instance v0, Lcom/android/camera/network/resource/LiveResourceDownloadManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/network/resource/LiveResourceDownloadManager$1;-><init>(Lcom/android/camera/network/resource/LiveResourceDownloadManager;)V

    iput-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

    .line 29
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/network/resource/LiveResourceDownloadManager$1;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/network/resource/LiveResourceDownloadManager;)Ljava/lang/Object;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->object:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/network/resource/LiveResourceDownloadManager;)Ljava/util/Map;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mDownloadState:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/network/resource/LiveResourceDownloadManager;Ljava/lang/String;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->dispatchListener(Ljava/lang/String;I)V

    return-void
.end method

.method private dispatchListener(Ljava/lang/String;I)V
    .locals 2

    .line 66
    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/network/resource/OnLiveDownloadListener;

    .line 67
    invoke-interface {v1, p1, p2}, Lcom/android/camera/network/resource/OnLiveDownloadListener;->onFinish(Ljava/lang/String;I)V

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;
    .locals 1

    .line 25
    sget-object v0, Lcom/android/camera/network/resource/LiveResourceDownloadManager$Instance;->mInstance:Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    return-object v0
.end method


# virtual methods
.method public addDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    return-void
.end method

.method public download(Lcom/android/camera/network/resource/LiveResource;Lcom/android/camera/network/resource/LiveDownloadHelper;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/camera/network/resource/LiveResource;",
            ">(TT;",
            "Lcom/android/camera/network/resource/LiveDownloadHelper<",
            "TT;>;)V"
        }
    .end annotation

    .line 38
    iget-object v0, p1, Lcom/android/camera/network/resource/LiveResource;->id:Ljava/lang/String;

    .line 39
    const-string v1, "LiveResourceDownloadManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "downloading "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-interface {p2, p1}, Lcom/android/camera/network/resource/LiveDownloadHelper;->isDownloaded(Lcom/android/camera/network/resource/LiveResource;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    const-string v1, "LiveResourceDownloadManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file downloaded "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->dispatchListener(Ljava/lang/String;I)V

    .line 44
    :cond_0
    invoke-interface {p2, p1}, Lcom/android/camera/network/resource/LiveDownloadHelper;->createDownloadRequest(Lcom/android/camera/network/resource/LiveResource;)Lcom/android/camera/network/download/Request;

    move-result-object p1

    .line 45
    sget-object p2, Lcom/android/camera/network/download/GalleryDownloadManager;->INSTANCE:Lcom/android/camera/network/download/GalleryDownloadManager;

    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

    invoke-virtual {p2, p1, v0}, Lcom/android/camera/network/download/GalleryDownloadManager;->enqueue(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;)V

    .line 46
    return-void
.end method

.method public getDownloadState(Ljava/lang/String;)I
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mDownloadState:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mDownloadState:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    .line 62
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 54
    return-void
.end method
