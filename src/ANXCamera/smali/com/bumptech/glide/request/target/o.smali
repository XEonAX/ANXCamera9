.class public abstract Lcom/bumptech/glide/request/target/o;
.super Lcom/bumptech/glide/request/target/h;
.source "ThumbnailImageViewTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/h<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/target/h;-><init>(Landroid/widget/ImageView;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/request/target/h;-><init>(Landroid/widget/ImageView;Z)V

    .line 38
    return-void
.end method


# virtual methods
.method protected s(Ljava/lang/Object;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/bumptech/glide/request/target/o;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 43
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/target/o;->t(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 44
    if-eqz v0, :cond_0

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-lez v1, :cond_0

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v1, :cond_0

    .line 45
    new-instance v1, Lcom/bumptech/glide/request/target/g;

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {v1, p1, v2, v0}, Lcom/bumptech/glide/request/target/g;-><init>(Landroid/graphics/drawable/Drawable;II)V

    .line 48
    move-object p1, v1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/target/o;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 49
    return-void
.end method

.method protected abstract t(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation
.end method
