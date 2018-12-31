.class public Lcom/bumptech/glide/load/resource/gif/d;
.super Lcom/bumptech/glide/load/resource/b/b;
.source "GifDrawableResource.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/l;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/resource/b/b<",
        "Lcom/bumptech/glide/load/resource/gif/b;",
        ">;",
        "Lcom/bumptech/glide/load/engine/l;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/resource/gif/b;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/resource/b/b;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 16
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
            "Lcom/bumptech/glide/load/resource/gif/b;",
            ">;"
        }
    .end annotation

    .line 21
    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/d;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/b;->getSize()I

    move-result v0

    return v0
.end method

.method public initialize()V
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/d;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/b;->cA()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 38
    return-void
.end method

.method public recycle()V
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/d;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/b;->stop()V

    .line 32
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/d;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/b;->recycle()V

    .line 33
    return-void
.end method
