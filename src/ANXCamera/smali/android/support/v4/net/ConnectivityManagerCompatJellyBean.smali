.class Landroid/support/v4/net/ConnectivityManagerCompatJellyBean;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompatJellyBean.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .registers 2
    .param p0, "cm"    # Landroid/net/ConnectivityManager;

    .line 26
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    return v0
.end method
