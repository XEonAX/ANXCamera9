.class public Lcom/bumptech/glide/load/resource/bitmap/e;
.super Ljava/lang/Object;
.source "BitmapEncoder.java"

# interfaces
.implements Lcom/bumptech/glide/load/h;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/h<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "BitmapEncoder"

.field public static final jT:Lcom/bumptech/glide/load/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/e<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final jU:Lcom/bumptech/glide/load/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/e<",
            "Landroid/graphics/Bitmap$CompressFormat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 41
    const-string v0, "com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality"

    .line 42
    const/16 v1, 0x5a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Lcom/bumptech/glide/load/e;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/e;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jT:Lcom/bumptech/glide/load/e;

    .line 51
    const-string v0, "com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat"

    invoke-static {v0}, Lcom/bumptech/glide/load/e;->g(Ljava/lang/String;)Lcom/bumptech/glide/load/e;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jU:Lcom/bumptech/glide/load/e;

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/e;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 68
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/e;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 60
    return-void
.end method

.method private a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/f;)Landroid/graphics/Bitmap$CompressFormat;
    .locals 1

    .line 118
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jU:Lcom/bumptech/glide/load/e;

    invoke-virtual {p2, v0}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Bitmap$CompressFormat;

    .line 119
    if-eqz p2, :cond_0

    .line 120
    return-object p2

    .line 121
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 122
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    return-object p1

    .line 124
    :cond_1
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    return-object p1
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/p;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z
    .locals 7
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
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ljava/io/File;",
            "Lcom/bumptech/glide/load/f;",
            ")Z"
        }
    .end annotation

    .line 73
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    .line 74
    invoke-direct {p0, p1, p3}, Lcom/bumptech/glide/load/resource/bitmap/e;->a(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/f;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v0

    .line 75
    const-string v1, "encode: [%dx%d] %s"

    .line 76
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/bumptech/glide/util/a/b;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    :try_start_0
    invoke-static {}, Lcom/bumptech/glide/util/e;->eE()J

    move-result-wide v1

    .line 79
    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/e;->jT:Lcom/bumptech/glide/load/e;

    invoke-virtual {p3, v3}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 81
    const/4 v4, 0x0

    .line 82
    const/4 v5, 0x0

    .line 84
    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    :try_start_2
    iget-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/e;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-eqz p2, :cond_0

    .line 86
    new-instance p2, Lcom/bumptech/glide/load/a/c;

    iget-object v5, p0, Lcom/bumptech/glide/load/resource/bitmap/e;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-direct {p2, v6, v5}, Lcom/bumptech/glide/load/a/c;-><init>(Ljava/io/OutputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    move-object v5, p2

    goto :goto_0

    :cond_0
    move-object v5, v6

    :goto_0
    :try_start_3
    invoke-virtual {p1, v0, v3, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 89
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 90
    const/4 v4, 0x1

    .line 96
    nop

    .line 98
    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 101
    :goto_1
    goto :goto_3

    .line 99
    :catch_0
    move-exception p2

    goto :goto_1

    .line 96
    :catchall_0
    move-exception p1

    move-object v5, v6

    goto/16 :goto_4

    .line 91
    :catch_1
    move-exception p2

    move-object v5, v6

    goto :goto_2

    .line 96
    :catchall_1
    move-exception p1

    goto :goto_4

    .line 91
    :catch_2
    move-exception p2

    .line 92
    :goto_2
    :try_start_5
    const-string v3, "BitmapEncoder"

    const/4 v6, 0x3

    invoke-static {v3, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 93
    const-string v3, "BitmapEncoder"

    const-string v6, "Failed to encode Bitmap"

    invoke-static {v3, v6, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 96
    :cond_1
    if-eqz v5, :cond_2

    .line 98
    :try_start_6
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    .line 105
    :cond_2
    :goto_3
    :try_start_7
    const-string p2, "BitmapEncoder"

    const/4 v3, 0x2

    invoke-static {p2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 106
    const-string p2, "BitmapEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Compressed with type: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " of size "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/bumptech/glide/util/k;->p(Landroid/graphics/Bitmap;)I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " in "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    invoke-static {v1, v2}, Lcom/bumptech/glide/util/e;->e(J)D

    move-result-wide v0

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ", options format: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jU:Lcom/bumptech/glide/load/e;

    .line 108
    invoke-virtual {p3, v0}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, ", hasAlpha: "

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 106
    invoke-static {p2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 111
    :cond_3
    nop

    .line 113
    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    .line 111
    return v4

    .line 96
    :goto_4
    if-eqz v5, :cond_4

    .line 98
    :try_start_8
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 101
    goto :goto_5

    .line 99
    :catch_3
    move-exception p2

    .line 101
    :cond_4
    :goto_5
    :try_start_9
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 113
    :catchall_2
    move-exception p1

    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    throw p1
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

    .line 35
    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    invoke-virtual {p0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/e;->a(Lcom/bumptech/glide/load/engine/p;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z

    move-result p1

    return p1
.end method

.method public b(Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/EncodeStrategy;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 131
    sget-object p1, Lcom/bumptech/glide/load/EncodeStrategy;->cF:Lcom/bumptech/glide/load/EncodeStrategy;

    return-object p1
.end method
