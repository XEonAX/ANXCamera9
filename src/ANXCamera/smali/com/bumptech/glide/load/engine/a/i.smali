.class public Lcom/bumptech/glide/load/engine/a/i;
.super Lcom/bumptech/glide/util/f;
.source "LruResourceCache.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/util/f<",
        "Lcom/bumptech/glide/load/c;",
        "Lcom/bumptech/glide/load/engine/p<",
        "*>;>;",
        "Lcom/bumptech/glide/load/engine/a/j;"
    }
.end annotation


# instance fields
.field private hw:Lcom/bumptech/glide/load/engine/a/j$a;


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/util/f;-><init>(J)V

    .line 23
    return-void
.end method


# virtual methods
.method protected a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/p;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)V"
        }
    .end annotation

    .line 32
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/i;->hw:Lcom/bumptech/glide/load/engine/a/j$a;

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 33
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/i;->hw:Lcom/bumptech/glide/load/engine/a/j$a;

    invoke-interface {p1, p2}, Lcom/bumptech/glide/load/engine/a/j$a;->e(Lcom/bumptech/glide/load/engine/p;)V

    .line 35
    :cond_0
    return-void
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/j$a;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/j$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 27
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/i;->hw:Lcom/bumptech/glide/load/engine/a/j$a;

    .line 28
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    check-cast p1, Lcom/bumptech/glide/load/c;

    check-cast p2, Lcom/bumptech/glide/load/engine/p;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/load/engine/a/i;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/p;)V

    return-void
.end method

.method public synthetic b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 13
    invoke-super {p0, p1, p2}, Lcom/bumptech/glide/util/f;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    return-object p1
.end method

.method public synthetic g(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 13
    invoke-super {p0, p1}, Lcom/bumptech/glide/util/f;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    return-object p1
.end method

.method protected i(Lcom/bumptech/glide/load/engine/p;)I
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)I"
        }
    .end annotation

    .line 39
    if-nez p1, :cond_0

    .line 40
    const/4 p1, 0x0

    invoke-super {p0, p1}, Lcom/bumptech/glide/util/f;->n(Ljava/lang/Object;)I

    move-result p1

    return p1

    .line 42
    :cond_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->getSize()I

    move-result p1

    return p1
.end method

.method protected synthetic n(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/engine/a/i;->i(Lcom/bumptech/glide/load/engine/p;)I

    move-result p1

    return p1
.end method

.method public trimMemory(I)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .line 49
    const/16 v0, 0x28

    if-lt p1, v0, :cond_0

    .line 52
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/a/i;->i()V

    goto :goto_0

    .line 53
    :cond_0
    const/16 v0, 0x14

    if-ge p1, v0, :cond_1

    const/16 v0, 0xf

    if-ne p1, v0, :cond_2

    .line 58
    :cond_1
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/a/i;->getMaxSize()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    div-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/load/engine/a/i;->a(J)V

    .line 60
    :cond_2
    :goto_0
    return-void
.end method
