.class public final Lcom/bumptech/glide/load/engine/prefill/a;
.super Ljava/lang/Object;
.source "BitmapPreFiller.java"


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private final iA:Lcom/bumptech/glide/load/DecodeFormat;

.field private iB:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

.field private final k:Lcom/bumptech/glide/load/engine/a/j;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/DecodeFormat;)V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->handler:Landroid/os/Handler;

    .line 29
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/prefill/a;->k:Lcom/bumptech/glide/load/engine/a/j;

    .line 30
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/prefill/a;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    .line 31
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iA:Lcom/bumptech/glide/load/DecodeFormat;

    .line 32
    return-void
.end method

.method private static a(Lcom/bumptech/glide/load/engine/prefill/c;)I
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/prefill/c;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/prefill/c;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/prefill/c;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lcom/bumptech/glide/util/k;->i(IILandroid/graphics/Bitmap$Config;)I

    move-result p0

    return p0
.end method


# virtual methods
.method public varargs b([Lcom/bumptech/glide/load/engine/prefill/c$a;)V
    .locals 5

    .line 36
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iB:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iB:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;->cancel()V

    .line 40
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lcom/bumptech/glide/load/engine/prefill/c;

    .line 41
    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_4

    .line 42
    aget-object v2, p1, v1

    .line 43
    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/prefill/c$a;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    if-nez v3, :cond_3

    .line 44
    nop

    .line 46
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iA:Lcom/bumptech/glide/load/DecodeFormat;

    sget-object v4, Lcom/bumptech/glide/load/DecodeFormat;->cy:Lcom/bumptech/glide/load/DecodeFormat;

    if-eq v3, v4, :cond_2

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iA:Lcom/bumptech/glide/load/DecodeFormat;

    sget-object v4, Lcom/bumptech/glide/load/DecodeFormat;->cz:Lcom/bumptech/glide/load/DecodeFormat;

    if-ne v3, v4, :cond_1

    goto :goto_1

    .line 47
    :cond_1
    sget-object v3, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    goto :goto_2

    :cond_2
    :goto_1
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 44
    :goto_2
    invoke-virtual {v2, v3}, Lcom/bumptech/glide/load/engine/prefill/c$a;->e(Landroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/prefill/c$a;

    .line 49
    :cond_3
    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/prefill/c$a;->bQ()Lcom/bumptech/glide/load/engine/prefill/c;

    move-result-object v2

    aput-object v2, v0, v1

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 52
    :cond_4
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/engine/prefill/a;->generateAllocationOrder([Lcom/bumptech/glide/load/engine/prefill/c;)Lcom/bumptech/glide/load/engine/prefill/b;

    move-result-object p1

    .line 53
    new-instance v0, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/prefill/a;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/prefill/a;->k:Lcom/bumptech/glide/load/engine/a/j;

    invoke-direct {v0, v1, v2, p1}, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/prefill/b;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iB:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

    .line 54
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/prefill/a;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->iB:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFillRunner;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 55
    return-void
.end method

.method varargs generateAllocationOrder([Lcom/bumptech/glide/load/engine/prefill/c;)Lcom/bumptech/glide/load/engine/prefill/b;
    .locals 7
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/a;->k:Lcom/bumptech/glide/load/engine/a/j;

    .line 60
    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/j;->getMaxSize()J

    move-result-wide v0

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/prefill/a;->k:Lcom/bumptech/glide/load/engine/a/j;

    invoke-interface {v2}, Lcom/bumptech/glide/load/engine/a/j;->bz()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/prefill/a;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-interface {v2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->getMaxSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 62
    nop

    .line 63
    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_0

    aget-object v6, p1, v4

    .line 64
    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/prefill/c;->getWeight()I

    move-result v6

    add-int/2addr v5, v6

    .line 63
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 67
    :cond_0
    long-to-float v0, v0

    int-to-float v1, v5

    div-float/2addr v0, v1

    .line 69
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 70
    array-length v2, p1

    :goto_1
    if-ge v3, v2, :cond_1

    aget-object v4, p1, v3

    .line 71
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/prefill/c;->getWeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 72
    invoke-static {v4}, Lcom/bumptech/glide/load/engine/prefill/a;->a(Lcom/bumptech/glide/load/engine/prefill/c;)I

    move-result v6

    .line 73
    div-int/2addr v5, v6

    .line 74
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 77
    :cond_1
    new-instance p1, Lcom/bumptech/glide/load/engine/prefill/b;

    invoke-direct {p1, v1}, Lcom/bumptech/glide/load/engine/prefill/b;-><init>(Ljava/util/Map;)V

    return-object p1
.end method
