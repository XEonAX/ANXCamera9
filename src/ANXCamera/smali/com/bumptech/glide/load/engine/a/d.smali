.class public Lcom/bumptech/glide/load/engine/a/d;
.super Ljava/lang/Object;
.source "DiskLruCacheFactory.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/a$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/a/d$a;
    }
.end annotation


# instance fields
.field private final hm:J

.field private final hn:Lcom/bumptech/glide/load/engine/a/d$a;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/a/d$a;J)V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-wide p2, p0, Lcom/bumptech/glide/load/engine/a/d;->hm:J

    .line 55
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/d;->hn:Lcom/bumptech/glide/load/engine/a/d$a;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .locals 1

    .line 26
    new-instance v0, Lcom/bumptech/glide/load/engine/a/d$1;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/engine/a/d$1;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/bumptech/glide/load/engine/a/d;-><init>(Lcom/bumptech/glide/load/engine/a/d$a;J)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 36
    new-instance v0, Lcom/bumptech/glide/load/engine/a/d$2;

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/load/engine/a/d$2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0, p3, p4}, Lcom/bumptech/glide/load/engine/a/d;-><init>(Lcom/bumptech/glide/load/engine/a/d$a;J)V

    .line 42
    return-void
.end method


# virtual methods
.method public bt()Lcom/bumptech/glide/load/engine/a/a;
    .locals 3

    .line 60
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/d;->hn:Lcom/bumptech/glide/load/engine/a/d$a;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/d$a;->bv()Ljava/io/File;

    move-result-object v0

    .line 62
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 63
    return-object v1

    .line 66
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_2

    .line 67
    :cond_1
    return-object v1

    .line 70
    :cond_2
    iget-wide v1, p0, Lcom/bumptech/glide/load/engine/a/d;->hm:J

    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/load/engine/a/e;->b(Ljava/io/File;J)Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v0

    return-object v0
.end method
