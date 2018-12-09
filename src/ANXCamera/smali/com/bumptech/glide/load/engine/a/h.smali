.class public final Lcom/bumptech/glide/load/engine/a/h;
.super Lcom/bumptech/glide/load/engine/a/d;
.source "InternalCacheDiskCacheFactory.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 15
    const-string v0, "image_manager_disk_cache"

    const-wide/32 v1, 0xfa00000

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/bumptech/glide/load/engine/a/h;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 1

    .line 20
    const-string v0, "image_manager_disk_cache"

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/bumptech/glide/load/engine/a/h;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 1

    .line 25
    new-instance v0, Lcom/bumptech/glide/load/engine/a/h$1;

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/load/engine/a/h$1;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {p0, v0, p3, p4}, Lcom/bumptech/glide/load/engine/a/d;-><init>(Lcom/bumptech/glide/load/engine/a/d$a;J)V

    .line 38
    return-void
.end method
