.class public final Lcom/xiaomi/camera/base/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/base/Constants$AlgoType;,
        Lcom/xiaomi/camera/base/Constants$ResultImage;,
        Lcom/xiaomi/camera/base/Constants$ShotType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isIntentType(I)Z
    .locals 0

    .line 103
    packed-switch p0, :pswitch_data_0

    .line 108
    const/4 p0, 0x0

    return p0

    .line 106
    :pswitch_0
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static isParallelEnabled(I)Z
    .locals 0

    .line 89
    packed-switch p0, :pswitch_data_0

    .line 97
    const/4 p0, 0x0

    return p0

    .line 95
    :pswitch_0
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
