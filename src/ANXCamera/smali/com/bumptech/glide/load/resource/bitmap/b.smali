.class public Lcom/bumptech/glide/load/resource/bitmap/b;
.super Ljava/lang/Object;
.source "BitmapDrawableEncoder.java"

# interfaces
.implements Lcom/bumptech/glide/load/h;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/h<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final eQ:Lcom/bumptech/glide/load/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/h<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/h;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/d;",
            "Lcom/bumptech/glide/load/h<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/b;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    .line 23
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/b;->eQ:Lcom/bumptech/glide/load/h;

    .line 24
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/p;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z
    .locals 3
    .param p1    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;",
            "Ljava/io/File;",
            "Lcom/bumptech/glide/load/f;",
            ")Z"
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/b;->eQ:Lcom/bumptech/glide/load/h;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/f;

    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v2, p0, Lcom/bumptech/glide/load/resource/bitmap/b;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-direct {v1, p1, v2}, Lcom/bumptech/glide/load/resource/bitmap/f;-><init>(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)V

    invoke-interface {v0, v1, p2, p3}, Lcom/bumptech/glide/load/h;->a(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 16
    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    invoke-virtual {p0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/b;->a(Lcom/bumptech/glide/load/engine/p;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z

    move-result p1

    return p1
.end method

.method public b(Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/EncodeStrategy;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/b;->eQ:Lcom/bumptech/glide/load/h;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/h;->b(Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/EncodeStrategy;

    move-result-object p1

    return-object p1
.end method
