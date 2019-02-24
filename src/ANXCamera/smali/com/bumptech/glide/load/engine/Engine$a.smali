.class Lcom/bumptech/glide/load/engine/Engine$a;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/DecodeJob$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final fE:Lcom/bumptech/glide/load/engine/a/a$a;

.field private volatile fF:Lcom/bumptech/glide/load/engine/a/a;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/a/a$a;)V
    .locals 0

    .line 366
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 367
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fE:Lcom/bumptech/glide/load/engine/a/a$a;

    .line 368
    return-void
.end method


# virtual methods
.method public aq()Lcom/bumptech/glide/load/engine/a/a;
    .locals 1

    .line 380
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    if-nez v0, :cond_2

    .line 381
    monitor-enter p0

    .line 382
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    if-nez v0, :cond_0

    .line 383
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fE:Lcom/bumptech/glide/load/engine/a/a$a;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/a$a;->bt()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    .line 385
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    if-nez v0, :cond_1

    .line 386
    new-instance v0, Lcom/bumptech/glide/load/engine/a/b;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/a/b;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    .line 388
    :cond_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 390
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    return-object v0
.end method

.method declared-synchronized clearDiskCacheIfCreated()V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    monitor-enter p0

    .line 372
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 373
    monitor-exit p0

    return-void

    .line 375
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$a;->fF:Lcom/bumptech/glide/load/engine/a/a;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/a;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 376
    monitor-exit p0

    return-void

    .line 371
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
