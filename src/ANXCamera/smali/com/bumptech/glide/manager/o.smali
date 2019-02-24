.class public final Lcom/bumptech/glide/manager/o;
.super Ljava/lang/Object;
.source "TargetTracker.java"

# interfaces
.implements Lcom/bumptech/glide/manager/i;


# instance fields
.field private final mJ:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 17
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    .line 16
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 55
    return-void
.end method

.method public g(Lcom/bumptech/glide/request/target/n;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 21
    return-void
.end method

.method public getAll()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;>;"
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public h(Lcom/bumptech/glide/request/target/n;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 25
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 43
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/n;

    .line 44
    invoke-interface {v1}, Lcom/bumptech/glide/request/target/n;->onDestroy()V

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/n;

    .line 30
    invoke-interface {v1}, Lcom/bumptech/glide/request/target/n;->onStart()V

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 36
    iget-object v0, p0, Lcom/bumptech/glide/manager/o;->mJ:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->c(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/n;

    .line 37
    invoke-interface {v1}, Lcom/bumptech/glide/request/target/n;->onStop()V

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method
