.class Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;
.super Ljava/lang/Object;
.source "GifFrameLoader.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# static fields
.field static final lU:I = 0x1

.field static final lV:I = 0x2


# instance fields
.field final synthetic lW:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V
    .locals 0

    .line 292
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;->lW:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 296
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 297
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    .line 298
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;->lW:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->onFrameReady(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;)V

    .line 299
    return v1

    .line 300
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 301
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    .line 302
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;->lW:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->X:Lcom/bumptech/glide/i;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 304
    :cond_1
    const/4 p1, 0x0

    return p1
.end method
