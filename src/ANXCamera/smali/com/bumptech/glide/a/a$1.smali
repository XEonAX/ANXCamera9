.class Lcom/bumptech/glide/a/a$1;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bk:Lcom/bumptech/glide/a/a;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/a/a;)V
    .locals 0

    .line 162
    iput-object p1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 162
    invoke-virtual {p0}, Lcom/bumptech/glide/a/a$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    monitor-enter v0

    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    invoke-static {v1}, Lcom/bumptech/glide/a/a;->a(Lcom/bumptech/glide/a/a;)Ljava/io/Writer;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 166
    monitor-exit v0

    return-object v2

    .line 168
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    invoke-static {v1}, Lcom/bumptech/glide/a/a;->b(Lcom/bumptech/glide/a/a;)V

    .line 169
    iget-object v1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    invoke-static {v1}, Lcom/bumptech/glide/a/a;->c(Lcom/bumptech/glide/a/a;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 170
    iget-object v1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    invoke-static {v1}, Lcom/bumptech/glide/a/a;->d(Lcom/bumptech/glide/a/a;)V

    .line 171
    iget-object v1, p0, Lcom/bumptech/glide/a/a$1;->bk:Lcom/bumptech/glide/a/a;

    const/4 v3, 0x0

    invoke-static {v1, v3}, Lcom/bumptech/glide/a/a;->a(Lcom/bumptech/glide/a/a;I)I

    .line 173
    :cond_1
    monitor-exit v0

    .line 174
    return-object v2

    .line 173
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
