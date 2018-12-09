.class public Lcom/bumptech/glide/request/a/d;
.super Ljava/lang/Object;
.source "DrawableCrossFadeTransition.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/f<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final duration:I

.field private final oS:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/bumptech/glide/request/a/d;->duration:I

    .line 33
    iput-boolean p2, p0, Lcom/bumptech/glide/request/a/d;->oS:Z

    .line 34
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/a/f$a;)Z
    .locals 4

    .line 49
    invoke-interface {p2}, Lcom/bumptech/glide/request/a/f$a;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 50
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 53
    :cond_0
    new-instance v2, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v3, v1

    const/4 v0, 0x1

    aput-object p1, v3, v0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 55
    iget-boolean p1, p0, Lcom/bumptech/glide/request/a/d;->oS:Z

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 56
    iget p1, p0, Lcom/bumptech/glide/request/a/d;->duration:I

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 57
    invoke-interface {p2, v2}, Lcom/bumptech/glide/request/a/f$a;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 58
    return v0
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f$a;)Z
    .locals 0

    .line 15
    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/a/d;->a(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/a/f$a;)Z

    move-result p1

    return p1
.end method
