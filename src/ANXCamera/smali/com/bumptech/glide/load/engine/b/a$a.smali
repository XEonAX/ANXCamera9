.class final Lcom/bumptech/glide/load/engine/b/a$a;
.super Ljava/lang/Object;
.source "GlideExecutor.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/b/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field private static final hZ:I = 0x9


# instance fields
.field final ia:Lcom/bumptech/glide/load/engine/b/a$b;

.field final ib:Z

.field private ic:I

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/bumptech/glide/load/engine/b/a$b;Z)V
    .locals 0

    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/b/a$a;->name:Ljava/lang/String;

    .line 427
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/b/a$a;->ia:Lcom/bumptech/glide/load/engine/b/a$b;

    .line 428
    iput-boolean p3, p0, Lcom/bumptech/glide/load/engine/b/a$a;->ib:Z

    .line 429
    return-void
.end method


# virtual methods
.method public declared-synchronized newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 3
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 433
    :try_start_0
    new-instance v0, Lcom/bumptech/glide/load/engine/b/a$a$1;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "glide-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/b/a$a;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-thread-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/bumptech/glide/load/engine/b/a$a;->ic:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/bumptech/glide/load/engine/b/a$a$1;-><init>(Lcom/bumptech/glide/load/engine/b/a$a;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 452
    iget p1, p0, Lcom/bumptech/glide/load/engine/b/a$a;->ic:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/bumptech/glide/load/engine/b/a$a;->ic:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    monitor-exit p0

    return-object v0

    .line 432
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
