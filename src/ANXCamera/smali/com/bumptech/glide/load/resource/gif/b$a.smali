.class final Lcom/bumptech/glide/load/resource/gif/b$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "GifDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/gif/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field final frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V
    .locals 0

    .line 397
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 398
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 399
    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 1

    .line 415
    const/4 v0, 0x0

    return v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 410
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/resource/gif/b;-><init>(Lcom/bumptech/glide/load/resource/gif/b$a;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 404
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b$a;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method
