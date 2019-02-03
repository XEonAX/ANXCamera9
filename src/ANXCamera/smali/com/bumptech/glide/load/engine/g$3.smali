.class Lcom/bumptech/glide/load/engine/g$3;
.super Lcom/bumptech/glide/load/engine/g;
.source "DiskCacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/g;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z
    .locals 0

    .line 76
    const/4 p1, 0x0

    return p1
.end method

.method public aO()Z
    .locals 1

    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public aP()Z
    .locals 1

    .line 86
    const/4 v0, 0x1

    return v0
.end method

.method public b(Lcom/bumptech/glide/load/DataSource;)Z
    .locals 1

    .line 70
    sget-object v0, Lcom/bumptech/glide/load/DataSource;->cv:Lcom/bumptech/glide/load/DataSource;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->cx:Lcom/bumptech/glide/load/DataSource;

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
