.class Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;
.super Lcom/bumptech/glide/request/target/l;
.source "GifFrameLoader.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DelayTarget"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/l<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field final index:I

.field private final lS:J

.field private lT:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Landroid/os/Handler;IJ)V
    .locals 0

    .line 315
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/l;-><init>()V

    .line 316
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->handler:Landroid/os/Handler;

    .line 317
    iput p2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->index:I

    .line 318
    iput-wide p3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->lS:J

    .line 319
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/a/f;)V
    .locals 2
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/bumptech/glide/request/a/f<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 328
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->lT:Landroid/graphics/Bitmap;

    .line 329
    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->handler:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 330
    iget-object p2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->handler:Landroid/os/Handler;

    iget-wide v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->lS:J

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    .line 331
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 308
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/a/f;)V

    return-void
.end method

.method cO()Landroid/graphics/Bitmap;
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->lT:Landroid/graphics/Bitmap;

    return-object v0
.end method
