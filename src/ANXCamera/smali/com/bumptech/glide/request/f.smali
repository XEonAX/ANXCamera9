.class public Lcom/bumptech/glide/request/f;
.super Ljava/lang/Object;
.source "RequestOptions.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final PRIORITY:I = 0x8

.field private static final UNSET:I = -0x1

.field private static nA:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nB:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nC:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nD:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nE:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nF:Lcom/bumptech/glide/request/f; = null
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static final nf:I = 0x2

.field private static final ng:I = 0x4

.field private static final nh:I = 0x10

.field private static final ni:I = 0x20

.field private static final nj:I = 0x40

.field private static final nk:I = 0x80

.field private static final nl:I = 0x100

.field private static final nm:I = 0x200

.field private static final nn:I = 0x400

.field private static final no:I = 0x800

.field private static final np:I = 0x1000

.field private static final nq:I = 0x2000

.field private static final nr:I = 0x4000

.field private static final ns:I = 0x8000

.field private static final nt:I = 0x10000

.field private static final nu:I = 0x20000

.field private static final nv:I = 0x40000

.field private static final nw:I = 0x80000

.field private static final nx:I = 0x100000

.field private static ny:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static nz:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private dT:Z

.field private eC:Z

.field private ee:Lcom/bumptech/glide/load/c;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private eg:Lcom/bumptech/glide/load/f;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private ei:Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private ek:Ljava/util/Map;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;"
        }
    .end annotation
.end field

.field private en:Lcom/bumptech/glide/Priority;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private eo:Lcom/bumptech/glide/load/engine/g;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private ep:Z

.field private eq:Z

.field private fQ:Z

.field private isLocked:Z

.field private nG:I

.field private nH:F

.field private nI:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nJ:I

.field private nK:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nL:I

.field private nM:I

.field private nN:I

.field private nO:Z

.field private nP:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nQ:I

.field private nR:Landroid/content/res/Resources$Theme;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nS:Z

.field private nT:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/bumptech/glide/request/f;->nH:F

    .line 86
    sget-object v0, Lcom/bumptech/glide/load/engine/g;->fo:Lcom/bumptech/glide/load/engine/g;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    .line 88
    sget-object v0, Lcom/bumptech/glide/Priority;->ao:Lcom/bumptech/glide/Priority;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->dT:Z

    .line 97
    const/4 v1, -0x1

    iput v1, p0, Lcom/bumptech/glide/request/f;->nM:I

    .line 98
    iput v1, p0, Lcom/bumptech/glide/request/f;->nN:I

    .line 99
    nop

    .line 100
    invoke-static {}, Lcom/bumptech/glide/e/b;->eB()Lcom/bumptech/glide/e/b;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    .line 102
    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    .line 106
    new-instance v1, Lcom/bumptech/glide/load/f;

    invoke-direct {v1}, Lcom/bumptech/glide/load/f;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    .line 108
    new-instance v1, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;

    invoke-direct {v1}, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    .line 110
    const-class v1, Ljava/lang/Object;

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    .line 118
    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->eq:Z

    return-void
.end method

.method public static E(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 166
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->J(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static F(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 184
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->L(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static G(I)Lcom/bumptech/glide/request/f;
    .locals 0
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 226
    invoke-static {p0, p0}, Lcom/bumptech/glide/request/f;->j(II)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static H(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 377
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->O(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static I(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x64L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 388
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->N(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 399
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/DecodeFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 348
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/engine/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 138
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 304
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1233
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1234
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 1237
    :cond_0
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/p;

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/load/resource/bitmap/p;-><init>(Lcom/bumptech/glide/load/i;Z)V

    .line 1239
    const-class v1, Landroid/graphics/Bitmap;

    invoke-direct {p0, v1, p1, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    .line 1240
    const-class v1, Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    .line 1245
    const-class v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/p;->co()Lcom/bumptech/glide/load/i;

    move-result-object v0

    invoke-direct {p0, v1, v0, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    .line 1246
    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    new-instance v1, Lcom/bumptech/glide/load/resource/gif/e;

    invoke-direct {v1, p1}, Lcom/bumptech/glide/load/resource/gif/e;-><init>(Lcom/bumptech/glide/load/i;)V

    invoke-direct {p0, v0, v1, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    .line 1247
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 368
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1162
    if-eqz p3, :cond_0

    .line 1163
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    .line 1164
    :goto_0
    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/bumptech/glide/request/f;->eq:Z

    .line 1165
    return-object p1
.end method

.method private a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
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
            "Lcom/bumptech/glide/load/i<",
            "TT;>;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1279
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1280
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-direct {v0, p1, p2, p3}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 1283
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1284
    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1285
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1286
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x800

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1287
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->nO:Z

    .line 1288
    iget p2, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v0, 0x10000

    or-int/2addr p2, v0

    iput p2, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1291
    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/bumptech/glide/request/f;->eq:Z

    .line 1292
    if-eqz p3, :cond_1

    .line 1293
    iget p2, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 p3, 0x20000

    or-int/2addr p2, p3

    iput p2, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1294
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->ep:Z

    .line 1296
    :cond_1
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static b(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 148
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static b(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/e<",
            "TT;>;TT;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 329
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static c(J)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # J
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 358
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->d(J)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1148
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method private d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1154
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method private dH()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1545
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    if-nez v0, :cond_0

    .line 1548
    return-object p0

    .line 1546
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot modify locked RequestOptions, consider clone()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static dl()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 244
    sget-object v0, Lcom/bumptech/glide/request/f;->nA:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 245
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 246
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dy()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 247
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nA:Lcom/bumptech/glide/request/f;

    .line 249
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nA:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dm()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 259
    sget-object v0, Lcom/bumptech/glide/request/f;->nB:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 260
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 261
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dA()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 262
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nB:Lcom/bumptech/glide/request/f;

    .line 264
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nB:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dn()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 274
    sget-object v0, Lcom/bumptech/glide/request/f;->nC:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 275
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 276
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dw()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 277
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nC:Lcom/bumptech/glide/request/f;

    .line 279
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nC:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static do()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 289
    sget-object v0, Lcom/bumptech/glide/request/f;->nD:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 290
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 291
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dC()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 292
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nD:Lcom/bumptech/glide/request/f;

    .line 294
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nD:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dp()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 314
    sget-object v0, Lcom/bumptech/glide/request/f;->nE:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 315
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 316
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dD()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 317
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nE:Lcom/bumptech/glide/request/f;

    .line 319
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nE:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dq()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 410
    sget-object v0, Lcom/bumptech/glide/request/f;->nF:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    .line 411
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    .line 412
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dE()Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 413
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->nF:Lcom/bumptech/glide/request/f;

    .line 415
    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->nF:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static g(F)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 129
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->h(F)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static g(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 157
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static g(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 193
    if-eqz p0, :cond_1

    .line 194
    sget-object p0, Lcom/bumptech/glide/request/f;->ny:Lcom/bumptech/glide/request/f;

    if-nez p0, :cond_0

    .line 195
    new-instance p0, Lcom/bumptech/glide/request/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object p0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object p0

    sput-object p0, Lcom/bumptech/glide/request/f;->ny:Lcom/bumptech/glide/request/f;

    .line 197
    :cond_0
    sget-object p0, Lcom/bumptech/glide/request/f;->ny:Lcom/bumptech/glide/request/f;

    return-object p0

    .line 199
    :cond_1
    sget-object p0, Lcom/bumptech/glide/request/f;->nz:Lcom/bumptech/glide/request/f;

    if-nez p0, :cond_2

    .line 200
    new-instance p0, Lcom/bumptech/glide/request/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object p0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object p0

    sput-object p0, Lcom/bumptech/glide/request/f;->nz:Lcom/bumptech/glide/request/f;

    .line 202
    :cond_2
    sget-object p0, Lcom/bumptech/glide/request/f;->nz:Lcom/bumptech/glide/request/f;

    return-object p0
.end method

.method public static h(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 175
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private isSet(I)Z
    .locals 1

    .line 1666
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    invoke-static {v0, p1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result p1

    return p1
.end method

.method public static j(II)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 215
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->l(II)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static j(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 235
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private static k(II)Z
    .locals 0

    .line 419
    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static o(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 338
    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public J(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 590
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 591
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->J(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 594
    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->nL:I

    .line 595
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x80

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 597
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public K(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 642
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->K(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 646
    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->nQ:I

    .line 647
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x4000

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 649
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public L(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 680
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 681
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->L(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 683
    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->nJ:I

    .line 684
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x20

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 686
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public M(I)Lcom/bumptech/glide/request/f;
    .locals 0
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 776
    invoke-virtual {p0, p1, p1}, Lcom/bumptech/glide/request/f;->l(II)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public N(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x64L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 889
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jT:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public O(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 988
    sget-object v0, Lcom/bumptech/glide/load/model/a/b;->jO:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/res/Resources$Theme;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 710
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 711
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->a(Landroid/content/res/Resources$Theme;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 714
    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    .line 715
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    const v0, 0x8000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 717
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method final a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1122
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1123
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 1126
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    .line 1127
    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/load/i<",
            "TT;>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1271
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public varargs a([Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # [Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1207
    new-instance v0, Lcom/bumptech/glide/load/d;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/d;-><init>([Lcom/bumptech/glide/load/i;)V

    const/4 p1, 0x1

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final aZ()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1580
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    return-object v0
.end method

.method public final ar()Lcom/bumptech/glide/load/engine/g;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1585
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    return-object v0
.end method

.method public final as()Lcom/bumptech/glide/Priority;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1642
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    return-object v0
.end method

.method public final at()Lcom/bumptech/glide/load/f;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1575
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    return-object v0
.end method

.method public final au()Lcom/bumptech/glide/load/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1633
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    return-object v0
.end method

.method ay()Z
    .locals 1

    .line 1662
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->eq:Z

    return v0
.end method

.method public b(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 879
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->jU:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/DecodeFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 933
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/n;->kE:Lcom/bumptech/glide/load/e;

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/resource/gif/g;->kE:Lcom/bumptech/glide/load/e;

    .line 935
    invoke-virtual {v0, v1, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    .line 934
    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/engine/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 533
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 534
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 536
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/g;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    .line 537
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 539
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1186
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 971
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kA:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method final b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1137
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1138
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 1141
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    .line 1142
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Class;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/load/i<",
            "TT;>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1315
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 551
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 552
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 555
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/Priority;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    .line 556
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 558
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/e<",
            "TT;>;TT;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 838
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 839
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 842
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 843
    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 844
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/load/f;

    .line 845
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 1227
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public d(J)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # J
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 905
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->lk:Lcom/bumptech/glide/load/e;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public dA()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1084
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kx:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/k;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/k;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dB()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1098
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->ku:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/l;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/l;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dC()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1113
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kx:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/l;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/l;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dD()Lcom/bumptech/glide/request/f;
    .locals 3
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1326
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1327
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dD()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0

    .line 1330
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1331
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1332
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ep:Z

    .line 1333
    iget v1, p0, Lcom/bumptech/glide/request/f;->nG:I

    const v2, -0x20001

    and-int/2addr v1, v2

    iput v1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1334
    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    .line 1335
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1336
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->eq:Z

    .line 1337
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dE()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1352
    sget-object v0, Lcom/bumptech/glide/load/resource/gif/g;->lX:Lcom/bumptech/glide/load/e;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dF()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1519
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    .line 1521
    return-object p0
.end method

.method public dG()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1534
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1535
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot auto lock an already locked options object, try clone() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1538
    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    .line 1539
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dF()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method protected dI()Z
    .locals 1

    .line 1552
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    return v0
.end method

.method public final dJ()Z
    .locals 1

    .line 1556
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final dK()Z
    .locals 1

    .line 1560
    const/16 v0, 0x100

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final dL()Ljava/util/Map;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;"
        }
    .end annotation

    .line 1565
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    return-object v0
.end method

.method public final dM()Z
    .locals 1

    .line 1570
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->ep:Z

    return v0
.end method

.method public final dN()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 1591
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final dO()I
    .locals 1

    .line 1596
    iget v0, p0, Lcom/bumptech/glide/request/f;->nJ:I

    return v0
.end method

.method public final dP()I
    .locals 1

    .line 1601
    iget v0, p0, Lcom/bumptech/glide/request/f;->nL:I

    return v0
.end method

.method public final dQ()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 1607
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final dR()I
    .locals 1

    .line 1612
    iget v0, p0, Lcom/bumptech/glide/request/f;->nQ:I

    return v0
.end method

.method public final dS()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 1618
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final dT()Z
    .locals 1

    .line 1628
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->dT:Z

    return v0
.end method

.method public final dU()Z
    .locals 1

    .line 1637
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final dV()I
    .locals 1

    .line 1646
    iget v0, p0, Lcom/bumptech/glide/request/f;->nN:I

    return v0
.end method

.method public final dW()Z
    .locals 2

    .line 1650
    iget v0, p0, Lcom/bumptech/glide/request/f;->nN:I

    iget v1, p0, Lcom/bumptech/glide/request/f;->nM:I

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/k;->p(II)Z

    move-result v0

    return v0
.end method

.method public final dX()I
    .locals 1

    .line 1654
    iget v0, p0, Lcom/bumptech/glide/request/f;->nM:I

    return v0
.end method

.method public final dY()F
    .locals 1

    .line 1658
    iget v0, p0, Lcom/bumptech/glide/request/f;->nH:F

    return v0
.end method

.method public final dZ()Z
    .locals 1

    .line 1672
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nT:Z

    return v0
.end method

.method public dr()Lcom/bumptech/glide/request/f;
    .locals 3
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .line 822
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/f;

    .line 823
    new-instance v1, Lcom/bumptech/glide/load/f;

    invoke-direct {v1}, Lcom/bumptech/glide/load/f;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    .line 824
    iget-object v1, v0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    iget-object v2, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/f;)V

    .line 825
    new-instance v1, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;

    invoke-direct {v1}, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    .line 826
    iget-object v1, v0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    iget-object v2, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 827
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/bumptech/glide/request/f;->isLocked:Z

    .line 828
    iput-boolean v1, v0, Lcom/bumptech/glide/request/f;->nS:Z
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 829
    return-object v0

    .line 830
    :catch_0
    move-exception v0

    .line 831
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final ds()Z
    .locals 1

    .line 861
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    return v0
.end method

.method public final dt()Z
    .locals 1

    .line 865
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public du()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 958
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/n;->kH:Lcom/bumptech/glide/load/e;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dv()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1003
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->ku:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/j;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/j;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dw()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1018
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->ku:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/j;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/j;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dx()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1035
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kt:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/q;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/q;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dy()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1052
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kt:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/q;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/q;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dz()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1068
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->kx:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/k;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/k;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public final ea()Z
    .locals 1

    .line 1678
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->fQ:Z

    return v0
.end method

.method public final eb()Z
    .locals 1

    .line 1684
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->eC:Z

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1458
    instance-of v0, p1, Lcom/bumptech/glide/request/f;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1459
    check-cast p1, Lcom/bumptech/glide/request/f;

    .line 1460
    iget v0, p1, Lcom/bumptech/glide/request/f;->nH:F

    iget v2, p0, Lcom/bumptech/glide/request/f;->nH:F

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->nJ:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->nJ:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    .line 1462
    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->nL:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->nL:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    .line 1464
    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->nQ:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->nQ:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    .line 1466
    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->dT:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->dT:Z

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->nM:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->nM:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->nN:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->nN:I

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->ep:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->ep:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->nO:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nT:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->nT:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->eC:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->eC:Z

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    .line 1474
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    .line 1476
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/load/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    .line 1477
    invoke-interface {v0, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    .line 1478
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    .line 1479
    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    iget-object p1, p1, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    .line 1480
    invoke-static {v0, p1}, Lcom/bumptech/glide/util/k;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    nop

    .line 1460
    :cond_0
    return v1

    .line 1482
    :cond_1
    return v1
.end method

.method public g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 1373
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 1374
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 1377
    :cond_0
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1378
    iget v0, p1, Lcom/bumptech/glide/request/f;->nH:F

    iput v0, p0, Lcom/bumptech/glide/request/f;->nH:F

    .line 1380
    :cond_1
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x40000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1381
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->nT:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->nT:Z

    .line 1383
    :cond_2
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x100000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1384
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->fQ:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->fQ:Z

    .line 1386
    :cond_3
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1387
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    .line 1389
    :cond_4
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1390
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    .line 1392
    :cond_5
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x10

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1393
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    .line 1395
    :cond_6
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x20

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1396
    iget v0, p1, Lcom/bumptech/glide/request/f;->nJ:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->nJ:I

    .line 1398
    :cond_7
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x40

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1399
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    .line 1401
    :cond_8
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x80

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1402
    iget v0, p1, Lcom/bumptech/glide/request/f;->nL:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->nL:I

    .line 1404
    :cond_9
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x100

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1405
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->dT:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->dT:Z

    .line 1407
    :cond_a
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x200

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1408
    iget v0, p1, Lcom/bumptech/glide/request/f;->nN:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->nN:I

    .line 1409
    iget v0, p1, Lcom/bumptech/glide/request/f;->nM:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->nM:I

    .line 1411
    :cond_b
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x400

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1412
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    .line 1414
    :cond_c
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x1000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1415
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    .line 1417
    :cond_d
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x2000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1418
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    .line 1420
    :cond_e
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x4000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1421
    iget v0, p1, Lcom/bumptech/glide/request/f;->nQ:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->nQ:I

    .line 1423
    :cond_f
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const v1, 0x8000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1424
    iget-object v0, p1, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    .line 1426
    :cond_10
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x10000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1427
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->nO:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    .line 1429
    :cond_11
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x20000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1430
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->ep:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ep:Z

    .line 1432
    :cond_12
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/16 v1, 0x800

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1433
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    iget-object v1, p1, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1434
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->eq:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->eq:Z

    .line 1436
    :cond_13
    iget v0, p1, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v1, 0x80000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->k(II)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1437
    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->eC:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->eC:Z

    .line 1441
    :cond_14
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nO:Z

    if-nez v0, :cond_15

    .line 1442
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1443
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1444
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ep:Z

    .line 1445
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    const v1, -0x20001

    and-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1446
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->eq:Z

    .line 1449
    :cond_15
    iget v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    iget v1, p1, Lcom/bumptech/glide/request/f;->nG:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 1450
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    iget-object p1, p1, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/f;)V

    .line 1452
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final getTheme()Landroid/content/res/Resources$Theme;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 1623
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    return-object v0
.end method

.method public h(F)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 435
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 436
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->h(F)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 439
    :cond_0
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_1

    .line 442
    iput p1, p0, Lcom/bumptech/glide/request/f;->nH:F

    .line 443
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 445
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 440
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sizeMultiplier must be between 0 and 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public h(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 463
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 464
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->h(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 467
    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->nT:Z

    .line 468
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v0, 0x40000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 470
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 1487
    iget v0, p0, Lcom/bumptech/glide/request/f;->nH:F

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->hashCode(F)I

    move-result v0

    .line 1488
    iget v1, p0, Lcom/bumptech/glide/request/f;->nJ:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->q(II)I

    move-result v0

    .line 1489
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1490
    iget v1, p0, Lcom/bumptech/glide/request/f;->nL:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->q(II)I

    move-result v0

    .line 1491
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1492
    iget v1, p0, Lcom/bumptech/glide/request/f;->nQ:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->q(II)I

    move-result v0

    .line 1493
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1494
    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->dT:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(ZI)I

    move-result v0

    .line 1495
    iget v1, p0, Lcom/bumptech/glide/request/f;->nM:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->q(II)I

    move-result v0

    .line 1496
    iget v1, p0, Lcom/bumptech/glide/request/f;->nN:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->q(II)I

    move-result v0

    .line 1497
    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->ep:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(ZI)I

    move-result v0

    .line 1498
    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->nO:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(ZI)I

    move-result v0

    .line 1499
    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->nT:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(ZI)I

    move-result v0

    .line 1500
    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->eC:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(ZI)I

    move-result v0

    .line 1501
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->eo:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1502
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->en:Lcom/bumptech/glide/Priority;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1503
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->eg:Lcom/bumptech/glide/load/f;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1504
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->ek:Ljava/util/Map;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1505
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1506
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1507
    iget-object v1, p0, Lcom/bumptech/glide/request/f;->nR:Landroid/content/res/Resources$Theme;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    .line 1508
    return v0
.end method

.method public i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 570
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 571
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 574
    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->nK:Landroid/graphics/drawable/Drawable;

    .line 575
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x40

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 577
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public i(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 489
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 490
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->i(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 493
    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->fQ:Z

    .line 494
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v0, 0x100000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 496
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final isLocked()Z
    .locals 1

    .line 869
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    return v0
.end method

.method public j(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 616
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 617
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->j(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 620
    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->nP:Landroid/graphics/drawable/Drawable;

    .line 621
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x2000

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 623
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public j(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 506
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 507
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->j(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 510
    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->eC:Z

    .line 511
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    const/high16 v0, 0x80000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 513
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 661
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 662
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 665
    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->nI:Landroid/graphics/drawable/Drawable;

    .line 666
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit8 p1, p1, 0x10

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 668
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 793
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 794
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 797
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/c;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->ee:Lcom/bumptech/glide/load/c;

    .line 798
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x400

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 799
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Z)Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 732
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 733
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 736
    :cond_0
    xor-int/2addr p1, v1

    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->dT:Z

    .line 737
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x100

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 739
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public l(II)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 754
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 755
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->l(II)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 758
    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->nN:I

    .line 759
    iput p2, p0, Lcom/bumptech/glide/request/f;->nM:I

    .line 760
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x200

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 762
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    .line 851
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->nS:Z

    if-eqz v0, :cond_0

    .line 852
    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    .line 855
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Class;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->ei:Ljava/lang/Class;

    .line 856
    iget p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    or-int/lit16 p1, p1, 0x1000

    iput p1, p0, Lcom/bumptech/glide/request/f;->nG:I

    .line 857
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->dH()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method
