.class public Lcom/bumptech/glide/c;
.super Ljava/lang/Object;
.source "Glide.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# static fields
.field private static final TAG:Ljava/lang/String; = "Glide"

.field private static final a:Ljava/lang/String; = "image_manager_disk_cache"

.field private static volatile c:Lcom/bumptech/glide/c;

.field private static volatile g:Z


# instance fields
.field private final A:Lcom/bumptech/glide/manager/l;

.field private final C:Lcom/bumptech/glide/manager/d;

.field private final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/i;",
            ">;"
        }
    .end annotation
.end field

.field private E:Lcom/bumptech/glide/MemoryCategory;

.field private final h:Lcom/bumptech/glide/load/engine/Engine;

.field private final i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private final k:Lcom/bumptech/glide/load/engine/a/j;

.field private final l:Lcom/bumptech/glide/load/engine/prefill/a;

.field private final q:Lcom/bumptech/glide/e;

.field private final r:Lcom/bumptech/glide/Registry;

.field private final v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/manager/l;Lcom/bumptech/glide/manager/d;ILcom/bumptech/glide/request/f;Ljava/util/Map;)V
    .locals 22
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/Engine;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/load/engine/a/j;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/engine/bitmap_recycle/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/bumptech/glide/manager/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Lcom/bumptech/glide/manager/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "Lcom/bumptech/glide/load/engine/a/j;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/d;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/b;",
            "Lcom/bumptech/glide/manager/l;",
            "Lcom/bumptech/glide/manager/d;",
            "I",
            "Lcom/bumptech/glide/request/f;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/j<",
            "**>;>;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v1, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    .line 320
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    .line 115
    sget-object v5, Lcom/bumptech/glide/MemoryCategory;->ak:Lcom/bumptech/glide/MemoryCategory;

    iput-object v5, v0, Lcom/bumptech/glide/c;->E:Lcom/bumptech/glide/MemoryCategory;

    .line 321
    move-object/from16 v8, p2

    iput-object v8, v0, Lcom/bumptech/glide/c;->h:Lcom/bumptech/glide/load/engine/Engine;

    .line 322
    iput-object v3, v0, Lcom/bumptech/glide/c;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    .line 323
    iput-object v4, v0, Lcom/bumptech/glide/c;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 324
    iput-object v1, v0, Lcom/bumptech/glide/c;->k:Lcom/bumptech/glide/load/engine/a/j;

    .line 325
    move-object/from16 v5, p6

    iput-object v5, v0, Lcom/bumptech/glide/c;->A:Lcom/bumptech/glide/manager/l;

    .line 326
    move-object/from16 v5, p7

    iput-object v5, v0, Lcom/bumptech/glide/c;->C:Lcom/bumptech/glide/manager/d;

    .line 328
    invoke-virtual/range {p9 .. p9}, Lcom/bumptech/glide/request/f;->at()Lcom/bumptech/glide/load/f;

    move-result-object v5

    sget-object v6, Lcom/bumptech/glide/load/resource/bitmap/n;->kE:Lcom/bumptech/glide/load/e;

    invoke-virtual {v5, v6}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/load/DecodeFormat;

    .line 329
    new-instance v6, Lcom/bumptech/glide/load/engine/prefill/a;

    invoke-direct {v6, v1, v3, v5}, Lcom/bumptech/glide/load/engine/prefill/a;-><init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/DecodeFormat;)V

    iput-object v6, v0, Lcom/bumptech/glide/c;->l:Lcom/bumptech/glide/load/engine/prefill/a;

    .line 331
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 333
    new-instance v5, Lcom/bumptech/glide/Registry;

    invoke-direct {v5}, Lcom/bumptech/glide/Registry;-><init>()V

    iput-object v5, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    .line 334
    iget-object v5, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    new-instance v6, Lcom/bumptech/glide/load/resource/bitmap/m;

    invoke-direct {v6}, Lcom/bumptech/glide/load/resource/bitmap/m;-><init>()V

    invoke-virtual {v5, v6}, Lcom/bumptech/glide/Registry;->a(Lcom/bumptech/glide/load/ImageHeaderParser;)Lcom/bumptech/glide/Registry;

    .line 336
    new-instance v5, Lcom/bumptech/glide/load/resource/bitmap/n;

    iget-object v6, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    invoke-virtual {v6}, Lcom/bumptech/glide/Registry;->q()Ljava/util/List;

    move-result-object v6

    .line 337
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-direct {v5, v6, v7, v3, v4}, Lcom/bumptech/glide/load/resource/bitmap/n;-><init>(Ljava/util/List;Landroid/util/DisplayMetrics;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 338
    new-instance v6, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;

    iget-object v7, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    .line 339
    invoke-virtual {v7}, Lcom/bumptech/glide/Registry;->q()Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v2, v7, v3, v4}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 340
    nop

    .line 341
    invoke-static/range {p4 .. p4}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->c(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)Lcom/bumptech/glide/load/g;

    move-result-object v7

    .line 342
    new-instance v9, Lcom/bumptech/glide/load/resource/bitmap/i;

    invoke-direct {v9, v5}, Lcom/bumptech/glide/load/resource/bitmap/i;-><init>(Lcom/bumptech/glide/load/resource/bitmap/n;)V

    .line 343
    new-instance v10, Lcom/bumptech/glide/load/resource/bitmap/v;

    invoke-direct {v10, v5, v4}, Lcom/bumptech/glide/load/resource/bitmap/v;-><init>(Lcom/bumptech/glide/load/resource/bitmap/n;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 344
    new-instance v5, Lcom/bumptech/glide/load/resource/b/e;

    invoke-direct {v5, v2}, Lcom/bumptech/glide/load/resource/b/e;-><init>(Landroid/content/Context;)V

    .line 346
    new-instance v11, Lcom/bumptech/glide/load/model/r$c;

    invoke-direct {v11, v1}, Lcom/bumptech/glide/load/model/r$c;-><init>(Landroid/content/res/Resources;)V

    .line 348
    new-instance v12, Lcom/bumptech/glide/load/model/r$d;

    invoke-direct {v12, v1}, Lcom/bumptech/glide/load/model/r$d;-><init>(Landroid/content/res/Resources;)V

    .line 350
    new-instance v13, Lcom/bumptech/glide/load/model/r$b;

    invoke-direct {v13, v1}, Lcom/bumptech/glide/load/model/r$b;-><init>(Landroid/content/res/Resources;)V

    .line 352
    new-instance v14, Lcom/bumptech/glide/load/model/r$a;

    invoke-direct {v14, v1}, Lcom/bumptech/glide/load/model/r$a;-><init>(Landroid/content/res/Resources;)V

    .line 354
    new-instance v15, Lcom/bumptech/glide/load/resource/bitmap/e;

    invoke-direct {v15, v4}, Lcom/bumptech/glide/load/resource/bitmap/e;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 356
    new-instance v8, Lcom/bumptech/glide/load/resource/d/a;

    invoke-direct {v8}, Lcom/bumptech/glide/load/resource/d/a;-><init>()V

    .line 357
    move-object/from16 v16, v8

    new-instance v8, Lcom/bumptech/glide/load/resource/d/d;

    invoke-direct {v8}, Lcom/bumptech/glide/load/resource/d/d;-><init>()V

    .line 359
    move-object/from16 v17, v8

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 361
    move-object/from16 v18, v8

    iget-object v8, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    const-class v2, Ljava/nio/ByteBuffer;

    move-object/from16 v19, v14

    new-instance v14, Lcom/bumptech/glide/load/model/c;

    invoke-direct {v14}, Lcom/bumptech/glide/load/model/c;-><init>()V

    .line 362
    invoke-virtual {v8, v2, v14}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Lcom/bumptech/glide/load/a;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v8, Ljava/io/InputStream;

    new-instance v14, Lcom/bumptech/glide/load/model/s;

    invoke-direct {v14, v4}, Lcom/bumptech/glide/load/model/s;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 363
    invoke-virtual {v2, v8, v14}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Lcom/bumptech/glide/load/a;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "Bitmap"

    const-class v14, Ljava/nio/ByteBuffer;

    move-object/from16 v20, v12

    const-class v12, Landroid/graphics/Bitmap;

    .line 365
    invoke-virtual {v2, v8, v14, v12, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "Bitmap"

    const-class v12, Ljava/io/InputStream;

    const-class v14, Landroid/graphics/Bitmap;

    .line 366
    invoke-virtual {v2, v8, v12, v14, v10}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "Bitmap"

    const-class v12, Landroid/os/ParcelFileDescriptor;

    const-class v14, Landroid/graphics/Bitmap;

    .line 367
    invoke-virtual {v2, v8, v12, v14, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "Bitmap"

    const-class v12, Landroid/content/res/AssetFileDescriptor;

    const-class v14, Landroid/graphics/Bitmap;

    .line 376
    move-object/from16 v21, v13

    invoke-static/range {p4 .. p4}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->b(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)Lcom/bumptech/glide/load/g;

    move-result-object v13

    .line 372
    invoke-virtual {v2, v8, v12, v14, v13}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v8, Landroid/graphics/Bitmap;

    const-class v12, Landroid/graphics/Bitmap;

    .line 377
    invoke-static {}, Lcom/bumptech/glide/load/model/u$a;->ce()Lcom/bumptech/glide/load/model/u$a;

    move-result-object v13

    invoke-virtual {v2, v8, v12, v13}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "Bitmap"

    const-class v12, Landroid/graphics/Bitmap;

    const-class v13, Landroid/graphics/Bitmap;

    new-instance v14, Lcom/bumptech/glide/load/resource/bitmap/x;

    invoke-direct {v14}, Lcom/bumptech/glide/load/resource/bitmap/x;-><init>()V

    .line 378
    invoke-virtual {v2, v8, v12, v13, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v8, Landroid/graphics/Bitmap;

    .line 380
    invoke-virtual {v2, v8, v15}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Lcom/bumptech/glide/load/h;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "BitmapDrawable"

    const-class v12, Ljava/nio/ByteBuffer;

    const-class v13, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v14, Lcom/bumptech/glide/load/resource/bitmap/a;

    invoke-direct {v14, v1, v9}, Lcom/bumptech/glide/load/resource/bitmap/a;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/g;)V

    .line 382
    invoke-virtual {v2, v8, v12, v13, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "BitmapDrawable"

    const-class v9, Ljava/io/InputStream;

    const-class v12, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v13, Lcom/bumptech/glide/load/resource/bitmap/a;

    invoke-direct {v13, v1, v10}, Lcom/bumptech/glide/load/resource/bitmap/a;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/g;)V

    .line 387
    invoke-virtual {v2, v8, v9, v12, v13}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v8, "BitmapDrawable"

    const-class v9, Landroid/os/ParcelFileDescriptor;

    const-class v10, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v12, Lcom/bumptech/glide/load/resource/bitmap/a;

    invoke-direct {v12, v1, v7}, Lcom/bumptech/glide/load/resource/bitmap/a;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/g;)V

    .line 392
    invoke-virtual {v2, v8, v9, v10, v12}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v7, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v8, Lcom/bumptech/glide/load/resource/bitmap/b;

    invoke-direct {v8, v3, v15}, Lcom/bumptech/glide/load/resource/bitmap/b;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/h;)V

    .line 397
    invoke-virtual {v2, v7, v8}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Lcom/bumptech/glide/load/h;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v7, "Gif"

    const-class v8, Ljava/io/InputStream;

    const-class v9, Lcom/bumptech/glide/load/resource/gif/b;

    new-instance v10, Lcom/bumptech/glide/load/resource/gif/h;

    iget-object v12, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    .line 403
    invoke-virtual {v12}, Lcom/bumptech/glide/Registry;->q()Ljava/util/List;

    move-result-object v12

    invoke-direct {v10, v12, v6, v4}, Lcom/bumptech/glide/load/resource/gif/h;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/g;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 399
    invoke-virtual {v2, v7, v8, v9, v10}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v7, "Gif"

    const-class v8, Ljava/nio/ByteBuffer;

    const-class v9, Lcom/bumptech/glide/load/resource/gif/b;

    .line 404
    invoke-virtual {v2, v7, v8, v9, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v6, Lcom/bumptech/glide/load/resource/gif/b;

    new-instance v7, Lcom/bumptech/glide/load/resource/gif/c;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/gif/c;-><init>()V

    .line 405
    invoke-virtual {v2, v6, v7}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Lcom/bumptech/glide/load/h;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v6, Lcom/bumptech/glide/b/a;

    const-class v7, Lcom/bumptech/glide/b/a;

    .line 409
    invoke-static {}, Lcom/bumptech/glide/load/model/u$a;->ce()Lcom/bumptech/glide/load/model/u$a;

    move-result-object v8

    .line 408
    invoke-virtual {v2, v6, v7, v8}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-string v6, "Bitmap"

    const-class v7, Lcom/bumptech/glide/b/a;

    const-class v8, Landroid/graphics/Bitmap;

    new-instance v9, Lcom/bumptech/glide/load/resource/gif/f;

    invoke-direct {v9, v3}, Lcom/bumptech/glide/load/resource/gif/f;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)V

    .line 410
    invoke-virtual {v2, v6, v7, v8, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v6, Landroid/net/Uri;

    const-class v7, Landroid/graphics/drawable/Drawable;

    .line 416
    invoke-virtual {v2, v6, v7, v5}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v6, Landroid/net/Uri;

    const-class v7, Landroid/graphics/Bitmap;

    new-instance v8, Lcom/bumptech/glide/load/resource/bitmap/t;

    invoke-direct {v8, v5, v3}, Lcom/bumptech/glide/load/resource/bitmap/t;-><init>(Lcom/bumptech/glide/load/resource/b/e;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)V

    .line 417
    invoke-virtual {v2, v6, v7, v8}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v5, Lcom/bumptech/glide/load/resource/a/a$a;

    invoke-direct {v5}, Lcom/bumptech/glide/load/resource/a/a$a;-><init>()V

    .line 420
    invoke-virtual {v2, v5}, Lcom/bumptech/glide/Registry;->a(Lcom/bumptech/glide/load/a/e$a;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/io/File;

    const-class v6, Ljava/nio/ByteBuffer;

    new-instance v7, Lcom/bumptech/glide/load/model/d$b;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/d$b;-><init>()V

    .line 421
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/io/File;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/f$e;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/f$e;-><init>()V

    .line 422
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/io/File;

    const-class v6, Ljava/io/File;

    new-instance v7, Lcom/bumptech/glide/load/resource/c/a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/c/a;-><init>()V

    .line 423
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/io/File;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/f$b;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/f$b;-><init>()V

    .line 424
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/io/File;

    const-class v6, Ljava/io/File;

    .line 426
    invoke-static {}, Lcom/bumptech/glide/load/model/u$a;->ce()Lcom/bumptech/glide/load/model/u$a;

    move-result-object v7

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v5, Lcom/bumptech/glide/load/a/k$a;

    invoke-direct {v5, v4}, Lcom/bumptech/glide/load/a/k$a;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    .line 428
    invoke-virtual {v2, v5}, Lcom/bumptech/glide/Registry;->a(Lcom/bumptech/glide/load/a/e$a;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v6, Ljava/io/InputStream;

    .line 429
    invoke-virtual {v2, v5, v6, v11}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    .line 430
    move-object/from16 v7, v21

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/Integer;

    const-class v6, Ljava/io/InputStream;

    .line 434
    invoke-virtual {v2, v5, v6, v11}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/Integer;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    .line 435
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/Integer;

    const-class v6, Landroid/net/Uri;

    .line 439
    move-object/from16 v7, v20

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v6, Landroid/content/res/AssetFileDescriptor;

    .line 440
    move-object/from16 v8, v19

    invoke-virtual {v2, v5, v6, v8}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/Integer;

    const-class v6, Landroid/content/res/AssetFileDescriptor;

    .line 444
    invoke-virtual {v2, v5, v6, v8}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v6, Landroid/net/Uri;

    .line 448
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/String;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/e$c;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/e$c;-><init>()V

    .line 449
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/e$c;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/e$c;-><init>()V

    .line 450
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/String;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/t$c;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/t$c;-><init>()V

    .line 451
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/String;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/t$b;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/t$b;-><init>()V

    .line 452
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/lang/String;

    const-class v6, Landroid/content/res/AssetFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/t$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/t$a;-><init>()V

    .line 453
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a/c$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/a/c$a;-><init>()V

    .line 455
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a$c;

    .line 456
    move-object/from16 v8, p1

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-direct {v7, v9}, Lcom/bumptech/glide/load/model/a$c;-><init>(Landroid/content/res/AssetManager;)V

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/a$b;

    .line 460
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-direct {v7, v9}, Lcom/bumptech/glide/load/model/a$b;-><init>(Landroid/content/res/AssetManager;)V

    .line 457
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a/d$a;

    invoke-direct {v7, v8}, Lcom/bumptech/glide/load/model/a/d$a;-><init>(Landroid/content/Context;)V

    .line 461
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a/e$a;

    invoke-direct {v7, v8}, Lcom/bumptech/glide/load/model/a/e$a;-><init>(Landroid/content/Context;)V

    .line 462
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/v$d;

    move-object/from16 v9, v18

    invoke-direct {v7, v9}, Lcom/bumptech/glide/load/model/v$d;-><init>(Landroid/content/ContentResolver;)V

    .line 463
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Landroid/os/ParcelFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/v$b;

    invoke-direct {v7, v9}, Lcom/bumptech/glide/load/model/v$b;-><init>(Landroid/content/ContentResolver;)V

    .line 467
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Landroid/content/res/AssetFileDescriptor;

    new-instance v7, Lcom/bumptech/glide/load/model/v$a;

    invoke-direct {v7, v9}, Lcom/bumptech/glide/load/model/v$a;-><init>(Landroid/content/ContentResolver;)V

    .line 471
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/w$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/w$a;-><init>()V

    .line 475
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Ljava/net/URL;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a/f$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/a/f$a;-><init>()V

    .line 476
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Ljava/io/File;

    new-instance v7, Lcom/bumptech/glide/load/model/k$a;

    invoke-direct {v7, v8}, Lcom/bumptech/glide/load/model/k$a;-><init>(Landroid/content/Context;)V

    .line 477
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Lcom/bumptech/glide/load/model/g;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/a/b$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/a/b$a;-><init>()V

    .line 478
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, [B

    const-class v6, Ljava/nio/ByteBuffer;

    new-instance v7, Lcom/bumptech/glide/load/model/b$a;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/b$a;-><init>()V

    .line 479
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, [B

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/b$d;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/b$d;-><init>()V

    .line 480
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/net/Uri;

    const-class v6, Landroid/net/Uri;

    .line 481
    invoke-static {}, Lcom/bumptech/glide/load/model/u$a;->ce()Lcom/bumptech/glide/load/model/u$a;

    move-result-object v7

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/graphics/drawable/Drawable;

    const-class v6, Landroid/graphics/drawable/Drawable;

    .line 482
    invoke-static {}, Lcom/bumptech/glide/load/model/u$a;->ce()Lcom/bumptech/glide/load/model/u$a;

    move-result-object v7

    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/n;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/graphics/drawable/Drawable;

    const-class v6, Landroid/graphics/drawable/Drawable;

    new-instance v7, Lcom/bumptech/glide/load/resource/b/f;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/b/f;-><init>()V

    .line 483
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/g;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    const-class v5, Landroid/graphics/Bitmap;

    const-class v6, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v7, Lcom/bumptech/glide/load/resource/d/b;

    invoke-direct {v7, v1}, Lcom/bumptech/glide/load/resource/d/b;-><init>(Landroid/content/res/Resources;)V

    .line 485
    invoke-virtual {v2, v5, v6, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/d/e;)Lcom/bumptech/glide/Registry;

    move-result-object v1

    const-class v2, Landroid/graphics/Bitmap;

    const-class v5, [B

    .line 489
    move-object/from16 v6, v16

    invoke-virtual {v1, v2, v5, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/d/e;)Lcom/bumptech/glide/Registry;

    move-result-object v1

    const-class v2, Landroid/graphics/drawable/Drawable;

    const-class v5, [B

    new-instance v7, Lcom/bumptech/glide/load/resource/d/c;

    move-object/from16 v9, v17

    invoke-direct {v7, v3, v6, v9}, Lcom/bumptech/glide/load/resource/d/c;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/resource/d/e;Lcom/bumptech/glide/load/resource/d/e;)V

    .line 490
    invoke-virtual {v1, v2, v5, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/d/e;)Lcom/bumptech/glide/Registry;

    move-result-object v1

    const-class v2, Lcom/bumptech/glide/load/resource/gif/b;

    const-class v3, [B

    .line 495
    invoke-virtual {v1, v2, v3, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/d/e;)Lcom/bumptech/glide/Registry;

    .line 497
    new-instance v5, Lcom/bumptech/glide/request/target/i;

    invoke-direct {v5}, Lcom/bumptech/glide/request/target/i;-><init>()V

    .line 498
    new-instance v10, Lcom/bumptech/glide/e;

    iget-object v6, v0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    move-object v1, v10

    move-object v2, v8

    move-object v3, v4

    move-object v4, v6

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p2

    move/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lcom/bumptech/glide/e;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/Registry;Lcom/bumptech/glide/request/target/i;Lcom/bumptech/glide/request/f;Ljava/util/Map;Lcom/bumptech/glide/load/engine/Engine;I)V

    iput-object v10, v0, Lcom/bumptech/glide/c;->q:Lcom/bumptech/glide/e;

    .line 508
    return-void
.end method

.method public static a(Landroid/app/Activity;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 710
    invoke-static {p0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->c(Landroid/app/Activity;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/app/Fragment;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 753
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->d(Landroid/app/Fragment;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/support/v4/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 736
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->b(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/support/v4/app/FragmentActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 723
    invoke-static {p0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->b(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/View;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 783
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->c(Landroid/view/View;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 126
    const-string v0, "image_manager_disk_cache"

    invoke-static {p0, v0}, Lcom/bumptech/glide/c;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    .line 140
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 141
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 142
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_1

    .line 144
    :cond_0
    return-object v0

    .line 146
    :cond_1
    return-object v1

    .line 148
    :cond_2
    const-string p0, "Glide"

    const/4 p1, 0x6

    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 149
    const-string p0, "Glide"

    const-string p1, "default disk cache dir is null"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    :cond_3
    return-object v0
.end method

.method private static a(Landroid/content/Context;Lcom/bumptech/glide/d;)V
    .locals 9
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/bumptech/glide/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 224
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 225
    invoke-static {}, Lcom/bumptech/glide/c;->d()Lcom/bumptech/glide/a;

    move-result-object v0

    .line 226
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 227
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/bumptech/glide/a;->da()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 228
    :cond_0
    new-instance v1, Lcom/bumptech/glide/c/e;

    invoke-direct {v1, p0}, Lcom/bumptech/glide/c/e;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/bumptech/glide/c/e;->db()Ljava/util/List;

    move-result-object v1

    .line 231
    :cond_1
    const/4 v2, 0x3

    if-eqz v0, :cond_4

    .line 232
    invoke-virtual {v0}, Lcom/bumptech/glide/a;->a()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    .line 233
    nop

    .line 234
    invoke-virtual {v0}, Lcom/bumptech/glide/a;->a()Ljava/util/Set;

    move-result-object v3

    .line 235
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 236
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 237
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/c/c;

    .line 238
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 239
    goto :goto_0

    .line 241
    :cond_2
    const-string v6, "Glide"

    invoke-static {v6, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 242
    const-string v6, "Glide"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AppGlideModule excludes manifest GlideModule: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 245
    goto :goto_0

    .line 248
    :cond_4
    const-string v3, "Glide"

    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 249
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/c/c;

    .line 250
    const-string v4, "Glide"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovered GlideModule from manifest: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    goto :goto_1

    .line 255
    :cond_5
    if-eqz v0, :cond_6

    .line 256
    invoke-virtual {v0}, Lcom/bumptech/glide/a;->b()Lcom/bumptech/glide/manager/l$a;

    move-result-object v2

    goto :goto_2

    :cond_6
    const/4 v2, 0x0

    .line 257
    :goto_2
    invoke-virtual {p1, v2}, Lcom/bumptech/glide/d;->a(Lcom/bumptech/glide/manager/l$a;)V

    .line 258
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/c/c;

    .line 259
    invoke-interface {v3, p0, p1}, Lcom/bumptech/glide/c/c;->b(Landroid/content/Context;Lcom/bumptech/glide/d;)V

    .line 260
    goto :goto_3

    .line 261
    :cond_7
    if-eqz v0, :cond_8

    .line 262
    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/a;->b(Landroid/content/Context;Lcom/bumptech/glide/d;)V

    .line 264
    :cond_8
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/d;->g(Landroid/content/Context;)Lcom/bumptech/glide/c;

    move-result-object p1

    .line 265
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/c/c;

    .line 266
    iget-object v3, p1, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    invoke-interface {v2, p0, p1, v3}, Lcom/bumptech/glide/c/c;->a(Landroid/content/Context;Lcom/bumptech/glide/c;Lcom/bumptech/glide/Registry;)V

    .line 267
    goto :goto_4

    .line 268
    :cond_9
    if-eqz v0, :cond_a

    .line 269
    iget-object v1, p1, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    invoke-virtual {v0, p0, p1, v1}, Lcom/bumptech/glide/a;->a(Landroid/content/Context;Lcom/bumptech/glide/c;Lcom/bumptech/glide/Registry;)V

    .line 271
    :cond_a
    invoke-virtual {p0, p1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 272
    sput-object p1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    .line 273
    return-void
.end method

.method private static a(Ljava/lang/Exception;)V
    .locals 2

    .line 305
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "GeneratedAppGlideModuleImpl is implemented incorrectly. If you\'ve manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation."

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static b(Landroid/content/Context;)Lcom/bumptech/glide/c;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 161
    sget-object v0, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    if-nez v0, :cond_1

    .line 162
    const-class v0, Lcom/bumptech/glide/c;

    monitor-enter v0

    .line 163
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    if-nez v1, :cond_0

    .line 164
    invoke-static {p0}, Lcom/bumptech/glide/c;->c(Landroid/content/Context;)V

    .line 166
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 169
    :cond_1
    :goto_0
    sget-object p0, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    return-object p0
.end method

.method private static c(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 175
    sget-boolean v0, Lcom/bumptech/glide/c;->g:Z

    if-nez v0, :cond_0

    .line 179
    const/4 v0, 0x1

    sput-boolean v0, Lcom/bumptech/glide/c;->g:Z

    .line 180
    invoke-static {p0}, Lcom/bumptech/glide/c;->d(Landroid/content/Context;)V

    .line 181
    const/4 p0, 0x0

    sput-boolean p0, Lcom/bumptech/glide/c;->g:Z

    .line 182
    return-void

    .line 176
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static d()Lcom/bumptech/glide/a;
    .locals 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 278
    nop

    .line 280
    :try_start_0
    const-string v0, "com.bumptech.glide.GeneratedAppGlideModuleImpl"

    .line 282
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 283
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/a;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 300
    goto :goto_2

    .line 298
    :catch_0
    move-exception v0

    .line 299
    invoke-static {v0}, Lcom/bumptech/glide/c;->a(Ljava/lang/Exception;)V

    goto :goto_1

    .line 296
    :catch_1
    move-exception v0

    .line 297
    invoke-static {v0}, Lcom/bumptech/glide/c;->a(Ljava/lang/Exception;)V

    goto :goto_0

    .line 294
    :catch_2
    move-exception v0

    .line 295
    invoke-static {v0}, Lcom/bumptech/glide/c;->a(Ljava/lang/Exception;)V

    goto :goto_0

    .line 292
    :catch_3
    move-exception v0

    .line 293
    invoke-static {v0}, Lcom/bumptech/glide/c;->a(Ljava/lang/Exception;)V

    .line 300
    :cond_0
    :goto_0
    goto :goto_1

    .line 284
    :catch_4
    move-exception v0

    .line 285
    const-string v0, "Glide"

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    const-string v0, "Glide"

    const-string v1, "Failed to find GeneratedAppGlideModule. You should include an annotationProcessor compile dependency on com.github.bumptech.glide:compiler in your application and a @GlideModule annotated AppGlideModule implementation or LibraryGlideModules will be silently ignored"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 301
    :goto_1
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method private static d(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 219
    new-instance v0, Lcom/bumptech/glide/d;

    invoke-direct {v0}, Lcom/bumptech/glide/d;-><init>()V

    invoke-static {p0, v0}, Lcom/bumptech/glide/c;->a(Landroid/content/Context;Lcom/bumptech/glide/d;)V

    .line 220
    return-void
.end method

.method private static e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 666
    const-string v0, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed)."

    invoke-static {p0, v0}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 671
    invoke-static {p0}, Lcom/bumptech/glide/c;->b(Landroid/content/Context;)Lcom/bumptech/glide/c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/bumptech/glide/c;->k()Lcom/bumptech/glide/manager/l;

    move-result-object p0

    return-object p0
.end method

.method public static f(Landroid/content/Context;)Lcom/bumptech/glide/i;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 698
    invoke-static {p0}, Lcom/bumptech/glide/c;->e(Landroid/content/Context;)Lcom/bumptech/glide/manager/l;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/l;->i(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized init(Landroid/content/Context;Lcom/bumptech/glide/d;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/bumptech/glide/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    const-class v0, Lcom/bumptech/glide/c;

    monitor-enter v0

    .line 201
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    if-eqz v1, :cond_0

    .line 202
    invoke-static {}, Lcom/bumptech/glide/c;->tearDown()V

    .line 204
    :cond_0
    invoke-static {p0, p1}, Lcom/bumptech/glide/c;->a(Landroid/content/Context;Lcom/bumptech/glide/d;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 205
    monitor-exit v0

    return-void

    .line 200
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized init(Lcom/bumptech/glide/c;)V
    .locals 2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-class v0, Lcom/bumptech/glide/c;

    monitor-enter v0

    .line 193
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    if-eqz v1, :cond_0

    .line 194
    invoke-static {}, Lcom/bumptech/glide/c;->tearDown()V

    .line 196
    :cond_0
    sput-object p0, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    monitor-exit v0

    return-void

    .line 192
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized tearDown()V
    .locals 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    const-class v0, Lcom/bumptech/glide/c;

    monitor-enter v0

    .line 209
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    if-eqz v1, :cond_0

    .line 210
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    invoke-virtual {v1}, Lcom/bumptech/glide/c;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 211
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    .line 212
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 213
    sget-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;

    iget-object v1, v1, Lcom/bumptech/glide/c;->h:Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/Engine;->shutdown()V

    .line 215
    :cond_0
    const/4 v1, 0x0

    sput-object v1, Lcom/bumptech/glide/c;->c:Lcom/bumptech/glide/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit v0

    return-void

    .line 208
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;
    .locals 2
    .param p1    # Lcom/bumptech/glide/MemoryCategory;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 653
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 655
    iget-object v0, p0, Lcom/bumptech/glide/c;->k:Lcom/bumptech/glide/load/engine/a/j;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->p()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/a/j;->b(F)V

    .line 656
    iget-object v0, p0, Lcom/bumptech/glide/c;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->p()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->b(F)V

    .line 657
    iget-object v0, p0, Lcom/bumptech/glide/c;->E:Lcom/bumptech/glide/MemoryCategory;

    .line 658
    iput-object p1, p0, Lcom/bumptech/glide/c;->E:Lcom/bumptech/glide/MemoryCategory;

    .line 659
    return-object v0
.end method

.method a(Lcom/bumptech/glide/i;)V
    .locals 2

    .line 804
    iget-object v0, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    monitor-enter v0

    .line 805
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 808
    iget-object v1, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 809
    monitor-exit v0

    .line 810
    return-void

    .line 806
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot register already registered manager"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 809
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public varargs a([Lcom/bumptech/glide/load/engine/prefill/c$a;)V
    .locals 1
    .param p1    # [Lcom/bumptech/glide/load/engine/prefill/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 583
    iget-object v0, p0, Lcom/bumptech/glide/c;->l:Lcom/bumptech/glide/load/engine/prefill/a;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/prefill/a;->b([Lcom/bumptech/glide/load/engine/prefill/c$a;)V

    .line 584
    return-void
.end method

.method a(Lcom/bumptech/glide/request/target/n;)Z
    .locals 3
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)Z"
        }
    .end annotation

    .line 792
    iget-object v0, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    monitor-enter v0

    .line 793
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/i;

    .line 794
    invoke-virtual {v2, p1}, Lcom/bumptech/glide/i;->f(Lcom/bumptech/glide/request/target/n;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 795
    const/4 p1, 0x1

    monitor-exit v0

    return p1

    .line 797
    :cond_0
    goto :goto_0

    .line 798
    :cond_1
    monitor-exit v0

    .line 800
    const/4 p1, 0x0

    return p1

    .line 798
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method b(Lcom/bumptech/glide/i;)V
    .locals 2

    .line 813
    iget-object v0, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    monitor-enter v0

    .line 814
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 817
    iget-object v1, p0, Lcom/bumptech/glide/c;->D:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 818
    monitor-exit v0

    .line 819
    return-void

    .line 815
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot unregister not yet registered manager"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 818
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public e()Lcom/bumptech/glide/load/engine/bitmap_recycle/d;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 531
    iget-object v0, p0, Lcom/bumptech/glide/c;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    return-object v0
.end method

.method public f()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 536
    iget-object v0, p0, Lcom/bumptech/glide/c;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    return-object v0
.end method

.method g()Lcom/bumptech/glide/manager/d;
    .locals 1

    .line 548
    iget-object v0, p0, Lcom/bumptech/glide/c;->C:Lcom/bumptech/glide/manager/d;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 544
    iget-object v0, p0, Lcom/bumptech/glide/c;->q:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method h()Lcom/bumptech/glide/e;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 553
    iget-object v0, p0, Lcom/bumptech/glide/c;->q:Lcom/bumptech/glide/e;

    return-object v0
.end method

.method public i()V
    .locals 1

    .line 594
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 596
    iget-object v0, p0, Lcom/bumptech/glide/c;->k:Lcom/bumptech/glide/load/engine/a/j;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/j;->i()V

    .line 597
    iget-object v0, p0, Lcom/bumptech/glide/c;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->i()V

    .line 598
    iget-object v0, p0, Lcom/bumptech/glide/c;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->i()V

    .line 599
    return-void
.end method

.method public j()V
    .locals 1

    .line 625
    invoke-static {}, Lcom/bumptech/glide/util/k;->eG()V

    .line 626
    iget-object v0, p0, Lcom/bumptech/glide/c;->h:Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine;->j()V

    .line 627
    return-void
.end method

.method public k()Lcom/bumptech/glide/manager/l;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 634
    iget-object v0, p0, Lcom/bumptech/glide/c;->A:Lcom/bumptech/glide/manager/l;

    return-object v0
.end method

.method public l()Lcom/bumptech/glide/Registry;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 788
    iget-object v0, p0, Lcom/bumptech/glide/c;->r:Lcom/bumptech/glide/Registry;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 829
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 833
    invoke-virtual {p0}, Lcom/bumptech/glide/c;->i()V

    .line 834
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 0

    .line 823
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/c;->trimMemory(I)V

    .line 824
    return-void
.end method

.method public trimMemory(I)V
    .locals 1

    .line 608
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 610
    iget-object v0, p0, Lcom/bumptech/glide/c;->k:Lcom/bumptech/glide/load/engine/a/j;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/a/j;->trimMemory(I)V

    .line 611
    iget-object v0, p0, Lcom/bumptech/glide/c;->i:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->trimMemory(I)V

    .line 612
    iget-object v0, p0, Lcom/bumptech/glide/c;->v:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->trimMemory(I)V

    .line 613
    return-void
.end method
