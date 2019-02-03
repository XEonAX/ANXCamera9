.class public final Landroid/support/v4/media/routing/MediaRouterJellybean$GetDefaultRouteWorkaround;
.super Ljava/lang/Object;
.source "MediaRouterJellybean.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/routing/MediaRouterJellybean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GetDefaultRouteWorkaround"
.end annotation


# instance fields
.field private mGetSystemAudioRouteMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-gt v0, v1, :cond_1f

    .line 340
    :try_start_f
    const-class v0, Landroid/media/MediaRouter;

    const-string v1, "getSystemAudioRoute"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$GetDefaultRouteWorkaround;->mGetSystemAudioRouteMethod:Ljava/lang/reflect/Method;
    :try_end_1c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f .. :try_end_1c} :catch_1d

    .line 343
    goto :goto_1e

    .line 342
    :catch_1d
    move-exception v0

    .line 344
    :goto_1e
    return-void

    .line 337
    :cond_1f
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public getDefaultRoute(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "routerObj"    # Ljava/lang/Object;

    .line 347
    move-object v0, p1

    check-cast v0, Landroid/media/MediaRouter;

    .line 349
    .local v0, "router":Landroid/media/MediaRouter;
    iget-object v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$GetDefaultRouteWorkaround;->mGetSystemAudioRouteMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    .line 351
    :try_start_8
    iget-object v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$GetDefaultRouteWorkaround;->mGetSystemAudioRouteMethod:Ljava/lang/reflect/Method;

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_10
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_10} :catch_13
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_10} :catch_11

    return-object v1

    .line 353
    :catch_11
    move-exception v1

    goto :goto_15

    .line 352
    :catch_13
    move-exception v1

    .line 354
    nop

    .line 359
    :cond_15
    :goto_15
    invoke-virtual {v0, v2}, Landroid/media/MediaRouter;->getRouteAt(I)Landroid/media/MediaRouter$RouteInfo;

    move-result-object v1

    return-object v1
.end method
