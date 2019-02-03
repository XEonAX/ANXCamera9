.class Landroid/support/v4/net/ConnectivityManagerCompat$BaseConnectivityManagerCompatImpl;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompat.java"

# interfaces
.implements Landroid/support/v4/net/ConnectivityManagerCompat$ConnectivityManagerCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/net/ConnectivityManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseConnectivityManagerCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .registers 5
    .param p1, "cm"    # Landroid/net/ConnectivityManager;

    .line 40
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 41
    .local v0, "info":Landroid/net/NetworkInfo;
    const/4 v1, 0x1

    if-nez v0, :cond_8

    .line 43
    return v1

    .line 46
    :cond_8
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    .line 47
    .local v2, "type":I
    packed-switch v2, :pswitch_data_14

    .line 54
    return v1

    .line 51
    :pswitch_10
    const/4 v1, 0x0

    return v1

    .line 49
    :pswitch_12
    return v1

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_12
        :pswitch_10
    .end packed-switch
.end method
