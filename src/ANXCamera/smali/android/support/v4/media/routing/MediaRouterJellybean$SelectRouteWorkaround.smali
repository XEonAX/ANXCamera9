.class public final Landroid/support/v4/media/routing/MediaRouterJellybean$SelectRouteWorkaround;
.super Ljava/lang/Object;
.source "MediaRouterJellybean.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/routing/MediaRouterJellybean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SelectRouteWorkaround"
.end annotation


# instance fields
.field private mSelectRouteIntMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 6

    .line 282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 283
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_29

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-gt v0, v1, :cond_29

    .line 287
    :try_start_f
    const-class v0, Landroid/media/MediaRouter;

    const-string v1, "selectRouteInt"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Landroid/media/MediaRouter$RouteInfo;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$SelectRouteWorkaround;->mSelectRouteIntMethod:Ljava/lang/reflect/Method;
    :try_end_26
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f .. :try_end_26} :catch_27

    .line 290
    goto :goto_28

    .line 289
    :catch_27
    move-exception v0

    .line 291
    :goto_28
    return-void

    .line 284
    :cond_29
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public selectRoute(Ljava/lang/Object;ILjava/lang/Object;)V
    .registers 11
    .param p1, "routerObj"    # Ljava/lang/Object;
    .param p2, "types"    # I
    .param p3, "routeObj"    # Ljava/lang/Object;

    .line 294
    move-object v0, p1

    check-cast v0, Landroid/media/MediaRouter;

    .line 295
    .local v0, "router":Landroid/media/MediaRouter;
    move-object v1, p3

    check-cast v1, Landroid/media/MediaRouter$RouteInfo;

    .line 298
    .local v1, "route":Landroid/media/MediaRouter$RouteInfo;
    invoke-virtual {v1}, Landroid/media/MediaRouter$RouteInfo;->getSupportedTypes()I

    move-result v2

    .line 299
    .local v2, "routeTypes":I
    const/high16 v3, 0x800000

    and-int/2addr v3, v2

    if-nez v3, :cond_3f

    .line 305
    iget-object v3, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$SelectRouteWorkaround;->mSelectRouteIntMethod:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_38

    .line 307
    :try_start_13
    iget-object v3, p0, Landroid/support/v4/media/routing/MediaRouterJellybean$SelectRouteWorkaround;->mSelectRouteIntMethod:Ljava/lang/reflect/Method;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_13 .. :try_end_25} :catch_2f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_13 .. :try_end_25} :catch_26

    .line 308
    return-void

    .line 312
    :catch_26
    move-exception v3

    .line 313
    .local v3, "ex":Ljava/lang/reflect/InvocationTargetException;
    const-string v4, "MediaRouterJellybean"

    const-string v5, "Cannot programmatically select non-user route.  Media routing may not work."

    invoke-static {v4, v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v3    # "ex":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_37

    .line 309
    :catch_2f
    move-exception v3

    .line 310
    .local v3, "ex":Ljava/lang/IllegalAccessException;
    const-string v4, "MediaRouterJellybean"

    const-string v5, "Cannot programmatically select non-user route.  Media routing may not work."

    invoke-static {v4, v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 315
    .end local v3    # "ex":Ljava/lang/IllegalAccessException;
    :goto_37
    goto :goto_3f

    .line 317
    :cond_38
    const-string v3, "MediaRouterJellybean"

    const-string v4, "Cannot programmatically select non-user route because the platform is missing the selectRouteInt() method.  Media routing may not work."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    :cond_3f
    :goto_3f
    invoke-virtual {v0, p2, v1}, Landroid/media/MediaRouter;->selectRoute(ILandroid/media/MediaRouter$RouteInfo;)V

    .line 325
    return-void
.end method
