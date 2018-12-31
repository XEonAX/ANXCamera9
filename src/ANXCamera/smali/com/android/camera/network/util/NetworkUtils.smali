.class public Lcom/android/camera/network/util/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# static fields
.field private static DBG:Z = false

.field private static final TAG:Ljava/lang/String; = "NetworkUtils"

.field private static sApp:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/network/util/NetworkUtils;->DBG:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static bind(Landroid/app/Application;)V
    .locals 0

    .line 18
    sput-object p0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    .line 19
    return-void
.end method

.method public static getActiveNetworkInfo()Landroid/net/NetworkInfo;
    .locals 2

    .line 48
    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 49
    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static isActiveNetworkMetered()Z
    .locals 2

    .line 40
    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 41
    if-nez v0, :cond_0

    .line 42
    const/4 v0, 0x0

    return v0

    .line 44
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    return v0
.end method

.method public static isNetworkConnected()Z
    .locals 2

    .line 22
    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 24
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 25
    return v1

    .line 30
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 31
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, 0x1

    return v0

    .line 32
    :cond_2
    :goto_0
    return v1
.end method
