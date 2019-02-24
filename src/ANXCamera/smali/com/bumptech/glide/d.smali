.class public final Lcom/bumptech/glide/d;
.super Ljava/lang/Object;
.source "GlideBuilder.java"


# instance fields
.field private C:Lcom/bumptech/glide/manager/d;

.field private final F:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/j<",
            "**>;>;"
        }
    .end annotation
.end field

.field private H:Lcom/bumptech/glide/load/engine/b/a;

.field private I:Lcom/bumptech/glide/load/engine/b/a;

.field private J:Lcom/bumptech/glide/load/engine/a/a$a;

.field private K:Lcom/bumptech/glide/load/engine/a/l;

.field private L:Lcom/bumptech/glide/request/f;

.field private Q:Lcom/bumptech/glide/manager/l$a;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private S:Lcom/bumptech/glide/load/engine/b/a;

.field private T:Z

.field private h:Lcom/bumptech/glide/load/engine/Engine;

.field private i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private k:Lcom/bumptech/glide/load/engine/a/j;

.field private logLevel:I

.field private v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/d;->F:Ljava/util/Map;

    .line 43
    const/4 v0, 0x4

    iput v0, p0, Lcom/bumptech/glide/d;->logLevel:I

    .line 44
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/d;->L:Lcom/bumptech/glide/request/f;

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/engine/Engine;)Lcom/bumptech/glide/d;
    .locals 0

    .line 381
    iput-object p1, p0, Lcom/bumptech/glide/d;->h:Lcom/bumptech/glide/load/engine/Engine;

    .line 382
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/a$a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/a$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 103
    iput-object p1, p0, Lcom/bumptech/glide/d;->J:Lcom/bumptech/glide/load/engine/a/a$a;

    .line 104
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/j;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/j;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/bumptech/glide/d;->k:Lcom/bumptech/glide/load/engine/a/j;

    .line 88
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/l$a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/l$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 249
    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/a/l$a;->bD()Lcom/bumptech/glide/load/engine/a/l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/d;->a(Lcom/bumptech/glide/load/engine/a/l;)Lcom/bumptech/glide/d;

    move-result-object p1

    return-object p1
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/l;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/l;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 266
    iput-object p1, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    .line 267
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 126
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/d;->b(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;

    move-result-object p1

    return-object p1
.end method

.method public a(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 72
    iput-object p1, p0, Lcom/bumptech/glide/d;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 73
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/bitmap_recycle/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 59
    iput-object p1, p0, Lcom/bumptech/glide/d;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    .line 60
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/manager/d;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 282
    iput-object p1, p0, Lcom/bumptech/glide/d;->C:Lcom/bumptech/glide/manager/d;

    .line 283
    return-object p0
.end method

.method public a(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 207
    iput-object p1, p0, Lcom/bumptech/glide/d;->L:Lcom/bumptech/glide/request/f;

    .line 208
    return-object p0
.end method

.method public a(Ljava/lang/Class;Lcom/bumptech/glide/j;)Lcom/bumptech/glide/d;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/j;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/j<",
            "*TT;>;)",
            "Lcom/bumptech/glide/d;"
        }
    .end annotation

    .line 232
    iget-object v0, p0, Lcom/bumptech/glide/d;->F:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    return-object p0
.end method

.method public a(Z)Lcom/bumptech/glide/d;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 371
    iput-boolean p1, p0, Lcom/bumptech/glide/d;->T:Z

    .line 372
    return-object p0
.end method

.method a(Lcom/bumptech/glide/manager/l$a;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/l$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 376
    iput-object p1, p0, Lcom/bumptech/glide/d;->Q:Lcom/bumptech/glide/manager/l$a;

    .line 377
    return-void
.end method

.method public b(I)Lcom/bumptech/glide/d;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 315
    const/4 v0, 0x2

    if-lt p1, v0, :cond_0

    const/4 v0, 0x6

    if-gt p1, v0, :cond_0

    .line 319
    iput p1, p0, Lcom/bumptech/glide/d;->logLevel:I

    .line 320
    return-object p0

    .line 316
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Log level must be one of Log.VERBOSE, Log.DEBUG, Log.INFO, Log.WARN, or Log.ERROR"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 148
    iput-object p1, p0, Lcom/bumptech/glide/d;->H:Lcom/bumptech/glide/load/engine/b/a;

    .line 149
    return-object p0
.end method

.method public c(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 171
    iput-object p1, p0, Lcom/bumptech/glide/d;->I:Lcom/bumptech/glide/load/engine/b/a;

    .line 172
    return-object p0
.end method

.method public d(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 191
    iput-object p1, p0, Lcom/bumptech/glide/d;->S:Lcom/bumptech/glide/load/engine/b/a;

    .line 192
    return-object p0
.end method

.method g(Landroid/content/Context;)Lcom/bumptech/glide/c;
    .locals 12
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 387
    iget-object v2, p0, Lcom/bumptech/glide/d;->H:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_0

    .line 388
    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bI()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->H:Lcom/bumptech/glide/load/engine/b/a;

    .line 391
    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/d;->I:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_1

    .line 392
    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bH()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->I:Lcom/bumptech/glide/load/engine/b/a;

    .line 395
    :cond_1
    iget-object v2, p0, Lcom/bumptech/glide/d;->S:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_2

    .line 396
    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bK()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->S:Lcom/bumptech/glide/load/engine/b/a;

    .line 399
    :cond_2
    iget-object v2, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    if-nez v2, :cond_3

    .line 400
    new-instance v2, Lcom/bumptech/glide/load/engine/a/l$a;

    invoke-direct {v2, p1}, Lcom/bumptech/glide/load/engine/a/l$a;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/a/l$a;->bD()Lcom/bumptech/glide/load/engine/a/l;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    .line 403
    :cond_3
    iget-object v2, p0, Lcom/bumptech/glide/d;->C:Lcom/bumptech/glide/manager/d;

    if-nez v2, :cond_4

    .line 404
    new-instance v2, Lcom/bumptech/glide/manager/f;

    invoke-direct {v2}, Lcom/bumptech/glide/manager/f;-><init>()V

    iput-object v2, p0, Lcom/bumptech/glide/d;->C:Lcom/bumptech/glide/manager/d;

    .line 407
    :cond_4
    iget-object v2, p0, Lcom/bumptech/glide/d;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    if-nez v2, :cond_6

    .line 408
    iget-object v2, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/a/l;->bB()I

    move-result v2

    .line 409
    if-lez v2, :cond_5

    .line 410
    new-instance v3, Lcom/bumptech/glide/load/engine/bitmap_recycle/j;

    int-to-long v4, v2

    invoke-direct {v3, v4, v5}, Lcom/bumptech/glide/load/engine/bitmap_recycle/j;-><init>(J)V

    iput-object v3, p0, Lcom/bumptech/glide/d;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    goto :goto_0

    .line 412
    :cond_5
    new-instance v2, Lcom/bumptech/glide/load/engine/bitmap_recycle/e;

    invoke-direct {v2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/e;-><init>()V

    iput-object v2, p0, Lcom/bumptech/glide/d;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    .line 416
    :cond_6
    :goto_0
    iget-object v2, p0, Lcom/bumptech/glide/d;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v2, :cond_7

    .line 417
    new-instance v2, Lcom/bumptech/glide/load/engine/bitmap_recycle/i;

    iget-object v3, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/a/l;->bC()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i;-><init>(I)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 420
    :cond_7
    iget-object v2, p0, Lcom/bumptech/glide/d;->k:Lcom/bumptech/glide/load/engine/a/j;

    if-nez v2, :cond_8

    .line 421
    new-instance v2, Lcom/bumptech/glide/load/engine/a/i;

    iget-object v3, p0, Lcom/bumptech/glide/d;->K:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/a/l;->bA()I

    move-result v3

    int-to-long v3, v3

    invoke-direct {v2, v3, v4}, Lcom/bumptech/glide/load/engine/a/i;-><init>(J)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->k:Lcom/bumptech/glide/load/engine/a/j;

    .line 424
    :cond_8
    iget-object v2, p0, Lcom/bumptech/glide/d;->J:Lcom/bumptech/glide/load/engine/a/a$a;

    if-nez v2, :cond_9

    .line 425
    new-instance v2, Lcom/bumptech/glide/load/engine/a/h;

    invoke-direct {v2, p1}, Lcom/bumptech/glide/load/engine/a/h;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->J:Lcom/bumptech/glide/load/engine/a/a$a;

    .line 428
    :cond_9
    iget-object v2, p0, Lcom/bumptech/glide/d;->h:Lcom/bumptech/glide/load/engine/Engine;

    if-nez v2, :cond_a

    .line 429
    new-instance v2, Lcom/bumptech/glide/load/engine/Engine;

    iget-object v4, p0, Lcom/bumptech/glide/d;->k:Lcom/bumptech/glide/load/engine/a/j;

    iget-object v5, p0, Lcom/bumptech/glide/d;->J:Lcom/bumptech/glide/load/engine/a/a$a;

    iget-object v6, p0, Lcom/bumptech/glide/d;->I:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v7, p0, Lcom/bumptech/glide/d;->H:Lcom/bumptech/glide/load/engine/b/a;

    .line 435
    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bJ()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v8

    .line 436
    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bK()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v9

    iget-boolean v10, p0, Lcom/bumptech/glide/d;->T:Z

    move-object v3, v2

    invoke-direct/range {v3 .. v10}, Lcom/bumptech/glide/load/engine/Engine;-><init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/a/a$a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Z)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->h:Lcom/bumptech/glide/load/engine/Engine;

    .line 440
    :cond_a
    new-instance v6, Lcom/bumptech/glide/manager/l;

    iget-object v2, p0, Lcom/bumptech/glide/d;->Q:Lcom/bumptech/glide/manager/l$a;

    invoke-direct {v6, v2}, Lcom/bumptech/glide/manager/l;-><init>(Lcom/bumptech/glide/manager/l$a;)V

    .line 443
    new-instance v11, Lcom/bumptech/glide/c;

    iget-object v2, p0, Lcom/bumptech/glide/d;->h:Lcom/bumptech/glide/load/engine/Engine;

    iget-object v3, p0, Lcom/bumptech/glide/d;->k:Lcom/bumptech/glide/load/engine/a/j;

    iget-object v4, p0, Lcom/bumptech/glide/d;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iget-object v5, p0, Lcom/bumptech/glide/d;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    iget-object v7, p0, Lcom/bumptech/glide/d;->C:Lcom/bumptech/glide/manager/d;

    iget v8, p0, Lcom/bumptech/glide/d;->logLevel:I

    iget-object v9, p0, Lcom/bumptech/glide/d;->L:Lcom/bumptech/glide/request/f;

    .line 452
    invoke-virtual {v9}, Lcom/bumptech/glide/request/f;->dF()Lcom/bumptech/glide/request/f;

    move-result-object v9

    iget-object v10, p0, Lcom/bumptech/glide/d;->F:Ljava/util/Map;

    move-object v0, v11

    move-object v1, p1

    invoke-direct/range {v0 .. v10}, Lcom/bumptech/glide/c;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/manager/l;Lcom/bumptech/glide/manager/d;ILcom/bumptech/glide/request/f;Ljava/util/Map;)V

    .line 443
    return-object v11
.end method
