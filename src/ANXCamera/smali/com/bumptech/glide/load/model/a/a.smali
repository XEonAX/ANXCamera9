.class public abstract Lcom/bumptech/glide/load/model/a/a;
.super Ljava/lang/Object;
.source "BaseGlideUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/m<",
        "TModel;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final jM:Lcom/bumptech/glide/load/model/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m<",
            "Lcom/bumptech/glide/load/model/g;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation
.end field

.field private final jN:Lcom/bumptech/glide/load/model/ModelCache;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/ModelCache<",
            "TModel;",
            "Lcom/bumptech/glide/load/model/g;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/bumptech/glide/load/model/m;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/m<",
            "Lcom/bumptech/glide/load/model/g;",
            "Ljava/io/InputStream;",
            ">;)V"
        }
    .end annotation

    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/load/model/a/a;-><init>(Lcom/bumptech/glide/load/model/m;Lcom/bumptech/glide/load/model/ModelCache;)V

    .line 30
    return-void
.end method

.method protected constructor <init>(Lcom/bumptech/glide/load/model/m;Lcom/bumptech/glide/load/model/ModelCache;)V
    .locals 0
    .param p2    # Lcom/bumptech/glide/load/model/ModelCache;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/m<",
            "Lcom/bumptech/glide/load/model/g;",
            "Ljava/io/InputStream;",
            ">;",
            "Lcom/bumptech/glide/load/model/ModelCache<",
            "TModel;",
            "Lcom/bumptech/glide/load/model/g;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/bumptech/glide/load/model/a/a;->jM:Lcom/bumptech/glide/load/model/m;

    .line 35
    iput-object p2, p0, Lcom/bumptech/glide/load/model/a/a;->jN:Lcom/bumptech/glide/load/model/ModelCache;

    .line 36
    return-void
.end method

.method private static a(Ljava/util/Collection;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/c;",
            ">;"
        }
    .end annotation

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 77
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 78
    new-instance v2, Lcom/bumptech/glide/load/model/g;

    invoke-direct {v2, v1}, Lcom/bumptech/glide/load/model/g;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    return-object v0
.end method


# virtual methods
.method public b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/model/m$a<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 42
    nop

    .line 43
    iget-object v0, p0, Lcom/bumptech/glide/load/model/a/a;->jN:Lcom/bumptech/glide/load/model/ModelCache;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/bumptech/glide/load/model/a/a;->jN:Lcom/bumptech/glide/load/model/ModelCache;

    invoke-virtual {v0, p1, p2, p3}, Lcom/bumptech/glide/load/model/ModelCache;->c(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/model/g;

    goto :goto_0

    .line 47
    :cond_0
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_3

    .line 48
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/a/a;->c(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Ljava/lang/String;

    move-result-object v0

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 50
    return-object v1

    .line 53
    :cond_1
    new-instance v1, Lcom/bumptech/glide/load/model/g;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/a/a;->e(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/h;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/bumptech/glide/load/model/g;-><init>(Ljava/lang/String;Lcom/bumptech/glide/load/model/h;)V

    .line 55
    iget-object v0, p0, Lcom/bumptech/glide/load/model/a/a;->jN:Lcom/bumptech/glide/load/model/ModelCache;

    if-eqz v0, :cond_2

    .line 56
    iget-object v0, p0, Lcom/bumptech/glide/load/model/a/a;->jN:Lcom/bumptech/glide/load/model/ModelCache;

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/bumptech/glide/load/model/ModelCache;->a(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 62
    :cond_2
    move-object v0, v1

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/a/a;->d(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Ljava/util/List;

    move-result-object p1

    .line 63
    iget-object v1, p0, Lcom/bumptech/glide/load/model/a/a;->jM:Lcom/bumptech/glide/load/model/m;

    invoke-interface {v1, v0, p2, p3, p4}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object p2

    .line 65
    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_4

    goto :goto_1

    .line 68
    :cond_4
    new-instance p3, Lcom/bumptech/glide/load/model/m$a;

    iget-object p4, p2, Lcom/bumptech/glide/load/model/m$a;->dZ:Lcom/bumptech/glide/load/c;

    invoke-static {p1}, Lcom/bumptech/glide/load/model/a/a;->a(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p2, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    invoke-direct {p3, p4, p1, p2}, Lcom/bumptech/glide/load/model/m$a;-><init>(Lcom/bumptech/glide/load/c;Ljava/util/List;Lcom/bumptech/glide/load/a/d;)V

    return-object p3

    .line 66
    :cond_5
    :goto_1
    return-object p2
.end method

.method protected abstract c(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method protected d(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 105
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected e(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/h;
    .locals 0
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/model/h;"
        }
    .end annotation

    .line 120
    sget-object p1, Lcom/bumptech/glide/load/model/h;->je:Lcom/bumptech/glide/load/model/h;

    return-object p1
.end method
