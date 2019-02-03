.class final Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;
.super Ljava/lang/ref/WeakReference;
.source "ActiveResources.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/ActiveResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ResourceWeakReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference<",
        "Lcom/bumptech/glide/load/engine/k<",
        "*>;>;"
    }
.end annotation


# instance fields
.field final dU:Z

.field dV:Lcom/bumptech/glide/load/engine/p;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;"
        }
    .end annotation
.end field

.field final key:Lcom/bumptech/glide/load/c;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;Ljava/lang/ref/ReferenceQueue;Z)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/ref/ReferenceQueue;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;",
            "Ljava/lang/ref/ReferenceQueue<",
            "-",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;>;Z)V"
        }
    .end annotation

    .line 188
    invoke-direct {p0, p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 189
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/c;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->key:Lcom/bumptech/glide/load/c;

    .line 190
    nop

    .line 191
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/k;->aY()Z

    move-result p1

    if-eqz p1, :cond_0

    if-eqz p4, :cond_0

    .line 192
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/k;->aX()Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->dV:Lcom/bumptech/glide/load/engine/p;

    .line 193
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/k;->aY()Z

    move-result p1

    iput-boolean p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->dU:Z

    .line 194
    return-void
.end method


# virtual methods
.method reset()V
    .locals 1

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->dV:Lcom/bumptech/glide/load/engine/p;

    .line 198
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->clear()V

    .line 199
    return-void
.end method
