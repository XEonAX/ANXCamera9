.class Lcom/bumptech/glide/manager/SupportRequestManagerFragment$a;
.super Ljava/lang/Object;
.source "SupportRequestManagerFragment.java"

# interfaces
.implements Lcom/bumptech/glide/manager/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic mH:Lcom/bumptech/glide/manager/SupportRequestManagerFragment;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/manager/SupportRequestManagerFragment;)V
    .locals 0

    .line 206
    iput-object p1, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment$a;->mH:Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cQ()Ljava/util/Set;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/i;",
            ">;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment$a;->mH:Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    .line 212
    invoke-virtual {v0}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->cU()Ljava/util/Set;

    move-result-object v0

    .line 213
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 214
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    .line 215
    invoke-virtual {v2}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->cS()Lcom/bumptech/glide/i;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 216
    invoke-virtual {v2}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->cS()Lcom/bumptech/glide/i;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 218
    :cond_0
    goto :goto_0

    .line 219
    :cond_1
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{fragment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment$a;->mH:Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
