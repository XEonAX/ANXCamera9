.class public final Lcom/bumptech/glide/load/resource/b/c;
.super Lcom/bumptech/glide/j;
.source "DrawableTransitionOptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/j<",
        "Lcom/bumptech/glide/load/resource/b/c;",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/bumptech/glide/j;-><init>()V

    return-void
.end method

.method public static C(I)Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 34
    new-instance v0, Lcom/bumptech/glide/load/resource/b/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/b/c;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/b/c;->D(I)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p0

    return-object p0
.end method

.method public static c(Lcom/bumptech/glide/request/a/c$a;)Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .param p0    # Lcom/bumptech/glide/request/a/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 56
    new-instance v0, Lcom/bumptech/glide/load/resource/b/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/b/c;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/b/c;->d(Lcom/bumptech/glide/request/a/c$a;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p0

    return-object p0
.end method

.method public static c(Lcom/bumptech/glide/request/a/c;)Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .param p0    # Lcom/bumptech/glide/request/a/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 45
    new-instance v0, Lcom/bumptech/glide/load/resource/b/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/b/c;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/b/c;->d(Lcom/bumptech/glide/request/a/c;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p0

    return-object p0
.end method

.method public static cy()Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 24
    new-instance v0, Lcom/bumptech/glide/load/resource/b/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/b/c;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/b/c;->cz()Lcom/bumptech/glide/load/resource/b/c;

    move-result-object v0

    return-object v0
.end method

.method public static f(Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .param p0    # Lcom/bumptech/glide/request/a/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/a/g<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)",
            "Lcom/bumptech/glide/load/resource/b/c;"
        }
    .end annotation

    .line 67
    new-instance v0, Lcom/bumptech/glide/load/resource/b/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/b/c;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/b/c;->b(Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/j;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/resource/b/c;

    return-object p0
.end method


# virtual methods
.method public D(I)Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 89
    new-instance v0, Lcom/bumptech/glide/request/a/c$a;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/request/a/c$a;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/b/c;->d(Lcom/bumptech/glide/request/a/c$a;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p1

    return-object p1
.end method

.method public cz()Lcom/bumptech/glide/load/resource/b/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 76
    new-instance v0, Lcom/bumptech/glide/request/a/c$a;

    invoke-direct {v0}, Lcom/bumptech/glide/request/a/c$a;-><init>()V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/b/c;->d(Lcom/bumptech/glide/request/a/c$a;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object v0

    return-object v0
.end method

.method public d(Lcom/bumptech/glide/request/a/c$a;)Lcom/bumptech/glide/load/resource/b/c;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/a/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 108
    invoke-virtual {p1}, Lcom/bumptech/glide/request/a/c$a;->ey()Lcom/bumptech/glide/request/a/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/resource/b/c;->d(Lcom/bumptech/glide/request/a/c;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p1

    return-object p1
.end method

.method public d(Lcom/bumptech/glide/request/a/c;)Lcom/bumptech/glide/load/resource/b/c;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/a/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 99
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/resource/b/c;->b(Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/j;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/resource/b/c;

    return-object p1
.end method
