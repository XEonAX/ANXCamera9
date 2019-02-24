.class public Lcom/android/camera/network/net/base/ResponseDispatcher;
.super Ljava/lang/Object;
.source "ResponseDispatcher.java"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/network/net/base/ResponseListener;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    .line 16
    iput-object p1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    .line 17
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    .line 18
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/network/net/base/ResponseDispatcher;)Lcom/android/camera/network/net/base/ResponseListener;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    return-object p0
.end method


# virtual methods
.method public getResponseListener()Lcom/android/camera/network/net/base/ResponseListener;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    return-object v0
.end method

.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 2

    .line 21
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    if-eqz v0, :cond_1

    .line 22
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    instance-of v0, v0, Lcom/android/camera/network/net/base/ResponseHandler;

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/network/net/base/ResponseDispatcher$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/network/net/base/ResponseDispatcher$1;-><init>(Lcom/android/camera/network/net/base/ResponseDispatcher;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 35
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-interface {v0, p1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_0

    .line 36
    :catch_0
    move-exception p1

    .line 37
    sget-object p1, Lcom/android/camera/network/net/base/ErrorCode;->DATA_BIND_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/android/camera/network/net/base/ResponseDispatcher;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    if-eqz v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    instance-of v0, v0, Lcom/android/camera/network/net/base/ResponseHandler;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/network/net/base/ResponseDispatcher$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/camera/network/net/base/ResponseDispatcher$2;-><init>(Lcom/android/camera/network/net/base/ResponseDispatcher;Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mOnResponseListener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/android/camera/network/net/base/ResponseDispatcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 62
    :cond_0
    return-void
.end method
