.class final Lcom/bumptech/glide/load/engine/o;
.super Ljava/lang/Object;
.source "LockedResource.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/p;
.implements Lcom/bumptech/glide/util/a/a$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/p<",
        "TZ;>;",
        "Lcom/bumptech/glide/util/a/a$c;"
    }
.end annotation


# static fields
.field private static final gh:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/o<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final eu:Lcom/bumptech/glide/util/a/c;

.field private fZ:Z

.field private gi:Lcom/bumptech/glide/load/engine/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;"
        }
    .end annotation
.end field

.field private isLocked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 19
    new-instance v0, Lcom/bumptech/glide/load/engine/o$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/o$1;-><init>()V

    const/16 v1, 0x14

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/a/a;->b(ILcom/bumptech/glide/util/a/a$a;)Landroid/support/v4/util/Pools$Pool;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/engine/o;->gh:Landroid/support/v4/util/Pools$Pool;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-static {}, Lcom/bumptech/glide/util/a/c;->eM()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/o;->eu:Lcom/bumptech/glide/util/a/c;

    .line 41
    return-void
.end method

.method static f(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/o;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/engine/o<",
            "TZ;>;"
        }
    .end annotation

    .line 34
    sget-object v0, Lcom/bumptech/glide/load/engine/o;->gh:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/o;

    invoke-static {v0}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/o;

    .line 35
    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/o;->g(Lcom/bumptech/glide/load/engine/p;)V

    .line 36
    return-object v0
.end method

.method private g(Lcom/bumptech/glide/load/engine/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)V"
        }
    .end annotation

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->fZ:Z

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    .line 46
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    .line 47
    return-void
.end method

.method private release()V
    .locals 1

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    .line 51
    sget-object v0, Lcom/bumptech/glide/load/engine/o;->gh:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p0}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 52
    return-void
.end method


# virtual methods
.method public aK()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->eu:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

.method public aZ()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TZ;>;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->aZ()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TZ;"
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->getSize()I

    move-result v0

    return v0
.end method

.method public declared-synchronized recycle()V
    .locals 1

    monitor-enter p0

    .line 85
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->eu:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eN()V

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->fZ:Z

    .line 88
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    if-nez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gi:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    .line 90
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/o;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :cond_0
    monitor-exit p0

    return-void

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized unlock()V
    .locals 2

    monitor-enter p0

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->eu:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eN()V

    .line 57
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    if-eqz v0, :cond_1

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    .line 61
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->fZ:Z

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/o;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_0
    monitor-exit p0

    return-void

    .line 58
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already unlocked"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
