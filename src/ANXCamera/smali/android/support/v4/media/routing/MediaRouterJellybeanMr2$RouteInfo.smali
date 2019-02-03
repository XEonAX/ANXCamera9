.class public final Landroid/support/v4/media/routing/MediaRouterJellybeanMr2$RouteInfo;
.super Ljava/lang/Object;
.source "MediaRouterJellybeanMr2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/routing/MediaRouterJellybeanMr2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RouteInfo"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDescription(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "routeObj"    # Ljava/lang/Object;

    .line 31
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter$RouteInfo;

    invoke-virtual {v0}, Landroid/media/MediaRouter$RouteInfo;->getDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static isConnecting(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "routeObj"    # Ljava/lang/Object;

    .line 35
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter$RouteInfo;

    invoke-virtual {v0}, Landroid/media/MediaRouter$RouteInfo;->isConnecting()Z

    move-result v0

    return v0
.end method
