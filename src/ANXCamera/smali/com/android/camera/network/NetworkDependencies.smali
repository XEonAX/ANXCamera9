.class public Lcom/android/camera/network/NetworkDependencies;
.super Ljava/lang/Object;
.source "NetworkDependencies.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static depend(Landroid/app/Application;)V
    .locals 1

    .line 15
    invoke-static {}, Lcom/android/camera/network/net/HttpManager;->getInstance()Lcom/android/camera/network/net/HttpManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/network/net/HttpManager;->initRequestQueue(Landroid/content/Context;)V

    .line 16
    invoke-static {p0}, Lcom/android/camera/network/util/NetworkUtils;->bind(Landroid/app/Application;)V

    .line 17
    return-void
.end method

.method public static getRequestCache(Landroid/content/Context;)Ljava/io/File;
    .locals 0

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static isConnected(Landroid/content/Context;)Z
    .locals 5

    .line 25
    const-string v0, "connectivity"

    .line 26
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 28
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 30
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    array-length v1, p0

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    .line 33
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v3, v4, :cond_0

    .line 34
    const/4 p0, 0x1

    return p0

    .line 32
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 39
    :cond_1
    return v0
.end method
