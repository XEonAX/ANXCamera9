.class final Lcom/bumptech/glide/manager/e;
.super Ljava/lang/Object;
.source "DefaultConnectivityMonitor.java"

# interfaces
.implements Lcom/bumptech/glide/manager/c;


# static fields
.field private static final TAG:Ljava/lang/String; = "ConnectivityMonitor"


# instance fields
.field private final context:Landroid/content/Context;

.field isConnected:Z

.field final mj:Lcom/bumptech/glide/manager/c$a;

.field private mk:Z

.field private final ml:Landroid/content/BroadcastReceiver;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/manager/c$a;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/manager/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/bumptech/glide/manager/e$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/manager/e$1;-><init>(Lcom/bumptech/glide/manager/e;)V

    iput-object v0, p0, Lcom/bumptech/glide/manager/e;->ml:Landroid/content/BroadcastReceiver;

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/manager/e;->context:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lcom/bumptech/glide/manager/e;->mj:Lcom/bumptech/glide/manager/c$a;

    .line 44
    return-void
.end method

.method private register()V
    .locals 4

    .line 47
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/e;->mk:Z

    if-eqz v0, :cond_0

    .line 48
    return-void

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/manager/e;->context:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/manager/e;->h(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/e;->isConnected:Z

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/manager/e;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/bumptech/glide/manager/e;->ml:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/e;->mk:Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 60
    const-string v1, "ConnectivityMonitor"

    const/4 v2, 0x5

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    const-string v1, "ConnectivityMonitor"

    const-string v2, "Failed to register"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    :cond_1
    :goto_0
    return-void
.end method

.method private unregister()V
    .locals 2

    .line 67
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/e;->mk:Z

    if-nez v0, :cond_0

    .line 68
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/manager/e;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/bumptech/glide/manager/e;->ml:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/manager/e;->mk:Z

    .line 73
    return-void
.end method


# virtual methods
.method h(Landroid/content/Context;)Z
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 80
    const-string v0, "connectivity"

    .line 82
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 81
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 85
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    nop

    .line 96
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 86
    :catch_0
    move-exception p1

    .line 90
    const-string v1, "ConnectivityMonitor"

    const/4 v2, 0x5

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    const-string v1, "ConnectivityMonitor"

    const-string v2, "Failed to determine connectivity status when connectivity changed"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    :cond_1
    return v0
.end method

.method public onDestroy()V
    .locals 0

    .line 112
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 101
    invoke-direct {p0}, Lcom/bumptech/glide/manager/e;->register()V

    .line 102
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 106
    invoke-direct {p0}, Lcom/bumptech/glide/manager/e;->unregister()V

    .line 107
    return-void
.end method
