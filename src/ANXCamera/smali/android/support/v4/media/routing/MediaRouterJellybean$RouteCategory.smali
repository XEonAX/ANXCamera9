.class public final Landroid/support/v4/media/routing/MediaRouterJellybean$RouteCategory;
.super Ljava/lang/Object;
.source "MediaRouterJellybean.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/routing/MediaRouterJellybean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RouteCategory"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getName(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3
    .param p0, "categoryObj"    # Ljava/lang/Object;
    .param p1, "context"    # Landroid/content/Context;

    .line 240
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter$RouteCategory;

    invoke-virtual {v0, p1}, Landroid/media/MediaRouter$RouteCategory;->getName(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getRoutes(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p0, "categoryObj"    # Ljava/lang/Object;

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .local v0, "out":Ljava/util/ArrayList;
    move-object v1, p0

    check-cast v1, Landroid/media/MediaRouter$RouteCategory;

    invoke-virtual {v1, v0}, Landroid/media/MediaRouter$RouteCategory;->getRoutes(Ljava/util/List;)Ljava/util/List;

    .line 247
    return-object v0
.end method

.method public static getSupportedTypes(Ljava/lang/Object;)I
    .registers 2
    .param p0, "categoryObj"    # Ljava/lang/Object;

    .line 251
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter$RouteCategory;

    invoke-virtual {v0}, Landroid/media/MediaRouter$RouteCategory;->getSupportedTypes()I

    move-result v0

    return v0
.end method

.method public static isGroupable(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "categoryObj"    # Ljava/lang/Object;

    .line 255
    move-object v0, p0

    check-cast v0, Landroid/media/MediaRouter$RouteCategory;

    invoke-virtual {v0}, Landroid/media/MediaRouter$RouteCategory;->isGroupable()Z

    move-result v0

    return v0
.end method
