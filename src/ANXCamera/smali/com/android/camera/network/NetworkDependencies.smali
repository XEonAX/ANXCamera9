.class public Lcom/android/camera/network/NetworkDependencies;
.super Ljava/lang/Object;
.source "NetworkDependencies.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static depend(Landroid/app/Application;)V
    .locals 1

    .line 13
    invoke-static {}, Lcom/android/camera/network/net/HttpManager;->getInstance()Lcom/android/camera/network/net/HttpManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/network/net/HttpManager;->initRequestQueue(Landroid/content/Context;)V

    .line 14
    invoke-static {p0}, Lcom/android/camera/network/util/NetworkUtils;->bind(Landroid/app/Application;)V

    .line 15
    return-void
.end method

.method public static getRequestCache(Landroid/content/Context;)Ljava/io/File;
    .locals 0

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
