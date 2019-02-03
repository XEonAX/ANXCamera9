.class public Lcom/bumptech/glide/load/resource/bitmap/v;
.super Ljava/lang/Object;
.source "StreamBitmapDecoder.java"

# interfaces
.implements Lcom/bumptech/glide/load/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/bitmap/v$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/g<",
        "Ljava/io/InputStream;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final dv:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

.field private final jV:Lcom/bumptech/glide/load/resource/bitmap/n;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/resource/bitmap/n;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/v;->jV:Lcom/bumptech/glide/load/resource/bitmap/n;

    .line 25
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/v;->dv:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 26
    return-void
.end method


# virtual methods
.method public a(Ljava/io/InputStream;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/engine/p;
    .locals 9
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    instance-of v0, p1, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    if-eqz v0, :cond_0

    .line 42
    check-cast p1, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    .line 43
    const/4 v0, 0x0

    goto :goto_0

    .line 45
    :cond_0
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/bitmap/v;->dv:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-direct {v0, p1, v1}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;-><init>(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 46
    const/4 p1, 0x1

    .line 52
    move-object v8, v0

    move v0, p1

    move-object p1, v8

    .line 53
    :goto_0
    invoke-static {p1}, Lcom/bumptech/glide/util/c;->h(Ljava/io/InputStream;)Lcom/bumptech/glide/util/c;

    move-result-object v1

    .line 59
    new-instance v3, Lcom/bumptech/glide/util/g;

    invoke-direct {v3, v1}, Lcom/bumptech/glide/util/g;-><init>(Ljava/io/InputStream;)V

    .line 60
    new-instance v7, Lcom/bumptech/glide/load/resource/bitmap/v$a;

    invoke-direct {v7, p1, v1}, Lcom/bumptech/glide/load/resource/bitmap/v$a;-><init>(Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Lcom/bumptech/glide/util/c;)V

    .line 62
    :try_start_0
    iget-object v2, p0, Lcom/bumptech/glide/load/resource/bitmap/v;->jV:Lcom/bumptech/glide/load/resource/bitmap/n;

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-virtual/range {v2 .. v7}, Lcom/bumptech/glide/load/resource/bitmap/n;->a(Ljava/io/InputStream;IILcom/bumptech/glide/load/f;Lcom/bumptech/glide/load/resource/bitmap/n$a;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    invoke-virtual {v1}, Lcom/bumptech/glide/util/c;->release()V

    .line 65
    if-eqz v0, :cond_1

    .line 66
    invoke-virtual {p1}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;->release()V

    .line 62
    :cond_1
    return-object p2

    .line 64
    :catchall_0
    move-exception p2

    invoke-virtual {v1}, Lcom/bumptech/glide/util/c;->release()V

    .line 65
    if-eqz v0, :cond_2

    .line 66
    invoke-virtual {p1}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;->release()V

    :cond_2
    throw p2
.end method

.method public bridge synthetic a(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    check-cast p1, Ljava/io/InputStream;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/resource/bitmap/v;->a(Ljava/io/InputStream;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/io/InputStream;Lcom/bumptech/glide/load/f;)Z
    .locals 0
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 30
    iget-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/v;->jV:Lcom/bumptech/glide/load/resource/bitmap/n;

    invoke-virtual {p2, p1}, Lcom/bumptech/glide/load/resource/bitmap/n;->e(Ljava/io/InputStream;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/bumptech/glide/load/f;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    check-cast p1, Ljava/io/InputStream;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/load/resource/bitmap/v;->a(Ljava/io/InputStream;Lcom/bumptech/glide/load/f;)Z

    move-result p1

    return p1
.end method
