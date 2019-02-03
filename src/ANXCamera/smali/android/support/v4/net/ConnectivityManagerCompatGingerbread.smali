.class Landroid/support/v4/net/ConnectivityManagerCompatGingerbread;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompatGingerbread.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .registers 4
    .param p0, "cm"    # Landroid/net/ConnectivityManager;

    .line 35
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 36
    .local v0, "info":Landroid/net/NetworkInfo;
    const/4 v1, 0x1

    if-nez v0, :cond_8

    .line 38
    return v1

    .line 41
    :cond_8
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    .line 42
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
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_12
    .end packed-switch
.end method
