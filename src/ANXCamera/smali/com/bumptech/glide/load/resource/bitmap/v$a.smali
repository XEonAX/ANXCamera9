.class Lcom/bumptech/glide/load/resource/bitmap/v$a;
.super Ljava/lang/Object;
.source "StreamBitmapDecoder.java"

# interfaces
.implements Lcom/bumptech/glide/load/resource/bitmap/n$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/bitmap/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final du:Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

.field private final lb:Lcom/bumptech/glide/util/c;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Lcom/bumptech/glide/util/c;)V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/v$a;->du:Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    .line 82
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/v$a;->lb:Lcom/bumptech/glide/util/c;

    .line 83
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/v$a;->lb:Lcom/bumptech/glide/util/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/c;->eD()Ljava/io/IOException;

    move-result-object v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    if-eqz p2, :cond_0

    .line 102
    invoke-interface {p1, p2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->d(Landroid/graphics/Bitmap;)V

    .line 104
    :cond_0
    throw v0

    .line 106
    :cond_1
    return-void
.end method

.method public cn()V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/v$a;->du:Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;->ct()V

    .line 91
    return-void
.end method
