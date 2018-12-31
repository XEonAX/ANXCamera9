.class public Lcom/bumptech/glide/load/a/f;
.super Ljava/lang/Object;
.source "DataRewinderRegistry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/a/f$a;
    }
.end annotation


# static fields
.field private static final dd:Lcom/bumptech/glide/load/a/e$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/a/e$a<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field private final dc:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/a/e$a<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    new-instance v0, Lcom/bumptech/glide/load/a/f$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/a/f$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/a/f;->dd:Lcom/bumptech/glide/load/a/e$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/a/f;->dc:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized b(Lcom/bumptech/glide/load/a/e$a;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/a/e$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/a/e$a<",
            "*>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/a/f;->dc:Ljava/util/Map;

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/e$a;->ad()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    .line 29
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized j(Ljava/lang/Object;)Lcom/bumptech/glide/load/a/e;
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/bumptech/glide/load/a/e<",
            "TT;>;"
        }
    .end annotation

    monitor-enter p0

    .line 36
    :try_start_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    iget-object v0, p0, Lcom/bumptech/glide/load/a/f;->dc:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/a/e$a;

    .line 38
    if-nez v0, :cond_1

    .line 39
    iget-object v1, p0, Lcom/bumptech/glide/load/a/f;->dc:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/a/e$a;

    .line 40
    invoke-interface {v2}, Lcom/bumptech/glide/load/a/e$a;->ad()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 41
    nop

    .line 42
    nop

    .line 47
    move-object v0, v2

    goto :goto_1

    .line 44
    :cond_0
    goto :goto_0

    .line 47
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    .line 48
    sget-object v0, Lcom/bumptech/glide/load/a/f;->dd:Lcom/bumptech/glide/load/a/e$a;

    .line 50
    :cond_2
    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/a/e$a;->j(Ljava/lang/Object;)Lcom/bumptech/glide/load/a/e;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 35
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
