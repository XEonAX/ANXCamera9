.class public Lcom/bumptech/glide/load/resource/a;
.super Ljava/lang/Object;
.source "SimpleResource.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/p;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/p<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/a;->data:Ljava/lang/Object;

    .line 20
    return-void
.end method


# virtual methods
.method public aZ()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/a;->data:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final get()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/a;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public final getSize()I
    .locals 1

    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public recycle()V
    .locals 0

    .line 43
    return-void
.end method
