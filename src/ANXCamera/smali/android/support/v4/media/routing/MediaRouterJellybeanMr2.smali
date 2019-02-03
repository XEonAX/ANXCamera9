.class Landroid/support/v4/media/routing/MediaRouterJellybeanMr2;
.super Landroid/support/v4/media/routing/MediaRouterJellybeanMr1;
.source "MediaRouterJellybeanMr2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/routing/MediaRouterJellybeanMr2$UserRouteInfo;,
        Landroid/support/v4/media/routing/MediaRouterJellybeanMr2$RouteInfo;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1;-><init>()V

    .line 39
    return-void
.end method

.method public static addCallback(Ljava/lang/Object;ILjava/lang/Object;I)V
    .registers 6
    .param p0, "routerObj"    # Ljava/lang/Object;
    .param p1, "types"    # I
    .param p2, "callbackObj"    # Ljava/lang/Object;
    .param p3, "flags"    # I

    .line 25
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter;

    move-object v1, p2

    check-cast v1, Landroid/media/MediaRouter$Callback;

    invoke-virtual {v0, p1, v1, p3}, Landroid/media/MediaRouter;->addCallback(ILandroid/media/MediaRouter$Callback;I)V

    .line 27
    return-void
.end method

.method public static getDefaultRoute(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "routerObj"    # Ljava/lang/Object;

    .line 21
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter;

    invoke-virtual {v0}, Landroid/media/MediaRouter;->getDefaultRoute()Landroid/media/MediaRouter$RouteInfo;

    move-result-object v0

    return-object v0
.end method
