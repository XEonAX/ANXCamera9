.class public Lcom/bumptech/glide/i;
.super Ljava/lang/Object;
.source "RequestManager.java"

# interfaces
.implements Lcom/bumptech/glide/g;
.implements Lcom/bumptech/glide/manager/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/i$a;,
        Lcom/bumptech/glide/i$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/g<",
        "Lcom/bumptech/glide/h<",
        "Landroid/graphics/drawable/Drawable;",
        ">;>;",
        "Lcom/bumptech/glide/manager/i;"
    }
.end annotation


# static fields
.field private static final aH:Lcom/bumptech/glide/request/f;

.field private static final aX:Lcom/bumptech/glide/request/f;

.field private static final aY:Lcom/bumptech/glide/request/f;


# instance fields
.field private final U:Landroid/os/Handler;

.field private aJ:Lcom/bumptech/glide/request/f;

.field final aZ:Lcom/bumptech/glide/manager/h;

.field private final ba:Lcom/bumptech/glide/manager/n;

.field private final bb:Lcom/bumptech/glide/manager/m;

.field private final bc:Lcom/bumptech/glide/manager/o;

.field private final bd:Ljava/lang/Runnable;

.field private final be:Lcom/bumptech/glide/manager/c;

.field protected final c:Lcom/bumptech/glide/c;

.field protected final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 52
    const-class v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->o(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dF()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->aX:Lcom/bumptech/glide/request/f;

    .line 53
    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->o(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dF()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->aY:Lcom/bumptech/glide/request/f;

    .line 54
    sget-object v0, Lcom/bumptech/glide/load/engine/g;->fm:Lcom/bumptech/glide/load/engine/g;

    .line 55
    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/Priority;->aq:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    .line 56
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->aH:Lcom/bumptech/glide/request/f;

    .line 54
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Landroid/content/Context;)V
    .locals 7
    .param p1    # Lcom/bumptech/glide/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/manager/h;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/manager/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 78
    new-instance v4, Lcom/bumptech/glide/manager/n;

    invoke-direct {v4}, Lcom/bumptech/glide/manager/n;-><init>()V

    .line 83
    invoke-virtual {p1}, Lcom/bumptech/glide/c;->g()Lcom/bumptech/glide/manager/d;

    move-result-object v5

    .line 78
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/i;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/n;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V

    .line 85
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/n;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V
    .locals 2

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lcom/bumptech/glide/manager/o;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/o;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    .line 64
    new-instance v0, Lcom/bumptech/glide/i$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/i$1;-><init>(Lcom/bumptech/glide/i;)V

    iput-object v0, p0, Lcom/bumptech/glide/i;->bd:Ljava/lang/Runnable;

    .line 70
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/bumptech/glide/i;->U:Landroid/os/Handler;

    .line 96
    iput-object p1, p0, Lcom/bumptech/glide/i;->c:Lcom/bumptech/glide/c;

    .line 97
    iput-object p2, p0, Lcom/bumptech/glide/i;->aZ:Lcom/bumptech/glide/manager/h;

    .line 98
    iput-object p3, p0, Lcom/bumptech/glide/i;->bb:Lcom/bumptech/glide/manager/m;

    .line 99
    iput-object p4, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    .line 100
    iput-object p6, p0, Lcom/bumptech/glide/i;->context:Landroid/content/Context;

    .line 102
    nop

    .line 104
    invoke-virtual {p6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    new-instance p6, Lcom/bumptech/glide/i$b;

    invoke-direct {p6, p4}, Lcom/bumptech/glide/i$b;-><init>(Lcom/bumptech/glide/manager/n;)V

    .line 103
    invoke-interface {p5, p3, p6}, Lcom/bumptech/glide/manager/d;->a(Landroid/content/Context;Lcom/bumptech/glide/manager/c$a;)Lcom/bumptech/glide/manager/c;

    move-result-object p3

    iput-object p3, p0, Lcom/bumptech/glide/i;->be:Lcom/bumptech/glide/manager/c;

    .line 111
    invoke-static {}, Lcom/bumptech/glide/util/k;->eI()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 112
    iget-object p3, p0, Lcom/bumptech/glide/i;->U:Landroid/os/Handler;

    iget-object p4, p0, Lcom/bumptech/glide/i;->bd:Ljava/lang/Runnable;

    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 114
    :cond_0
    invoke-interface {p2, p0}, Lcom/bumptech/glide/manager/h;->a(Lcom/bumptech/glide/manager/i;)V

    .line 116
    :goto_0
    iget-object p3, p0, Lcom/bumptech/glide/i;->be:Lcom/bumptech/glide/manager/c;

    invoke-interface {p2, p3}, Lcom/bumptech/glide/manager/h;->a(Lcom/bumptech/glide/manager/i;)V

    .line 118
    invoke-virtual {p1}, Lcom/bumptech/glide/c;->h()Lcom/bumptech/glide/e;

    move-result-object p2

    invoke-virtual {p2}, Lcom/bumptech/glide/e;->m()Lcom/bumptech/glide/request/f;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/i;->c(Lcom/bumptech/glide/request/f;)V

    .line 120
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/c;->a(Lcom/bumptech/glide/i;)V

    .line 121
    return-void
.end method

.method private d(Lcom/bumptech/glide/request/f;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 128
    iget-object v0, p0, Lcom/bumptech/glide/i;->aJ:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/i;->aJ:Lcom/bumptech/glide/request/f;

    .line 129
    return-void
.end method

.method private e(Lcom/bumptech/glide/request/target/n;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    .line 571
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->f(Lcom/bumptech/glide/request/target/n;)Z

    move-result v0

    .line 589
    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/i;->c:Lcom/bumptech/glide/c;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/c;->a(Lcom/bumptech/glide/request/target/n;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dj()Lcom/bumptech/glide/request/c;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 590
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dj()Lcom/bumptech/glide/request/c;

    move-result-object v0

    .line 591
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Lcom/bumptech/glide/request/target/n;->j(Lcom/bumptech/glide/request/c;)V

    .line 592
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    .line 594
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 267
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 268
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->z()V

    .line 269
    iget-object v0, p0, Lcom/bumptech/glide/i;->bb:Lcom/bumptech/glide/manager/m;

    invoke-interface {v0}, Lcom/bumptech/glide/manager/m;->cQ()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/i;

    .line 270
    invoke-virtual {v1}, Lcom/bumptech/glide/i;->z()V

    .line 271
    goto :goto_0

    .line 272
    :cond_0
    return-void
.end method

.method public B()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 322
    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->aX:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public C()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Lcom/bumptech/glide/load/resource/gif/b;",
            ">;"
        }
    .end annotation

    .line 341
    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->aY:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public D()Lcom/bumptech/glide/h;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 357
    const-class v0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public E()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 486
    const-class v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->aH:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public F()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 513
    const-class v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/bumptech/glide/request/f;->g(Z)Lcom/bumptech/glide/request/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method a(Ljava/lang/Class;)Lcom/bumptech/glide/j;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/bumptech/glide/j<",
            "*TT;>;"
        }
    .end annotation

    .line 623
    iget-object v0, p0, Lcom/bumptech/glide/i;->c:Lcom/bumptech/glide/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/c;->h()Lcom/bumptech/glide/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/e;->a(Ljava/lang/Class;)Lcom/bumptech/glide/j;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/net/Uri;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/net/Uri;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/io/File;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/io/File;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/net/URL;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/net/URL;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a([B)Ljava/lang/Object;
    .locals 0
    .param p1    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b([B)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/c;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;",
            "Lcom/bumptech/glide/request/c;",
            ")V"
        }
    .end annotation

    .line 613
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/manager/o;->g(Lcom/bumptech/glide/request/target/n;)V

    .line 614
    iget-object p1, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/manager/n;->a(Lcom/bumptech/glide/request/c;)V

    .line 615
    return-void
.end method

.method public b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 369
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 381
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/net/Uri;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 405
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/net/Uri;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/io/File;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 417
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/io/File;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Class;)Lcom/bumptech/glide/h;
    .locals 3
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
            "<ResourceType:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TResourceType;>;)",
            "Lcom/bumptech/glide/h<",
            "TResourceType;>;"
        }
    .end annotation

    .line 528
    new-instance v0, Lcom/bumptech/glide/h;

    iget-object v1, p0, Lcom/bumptech/glide/i;->c:Lcom/bumptech/glide/c;

    iget-object v2, p0, Lcom/bumptech/glide/i;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p1, v2}, Lcom/bumptech/glide/h;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/i;Ljava/lang/Class;Landroid/content/Context;)V

    return-object v0
.end method

.method public b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 430
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/String;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 393
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/net/URL;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 443
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/net/URL;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b([B)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 456
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b([B)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 544
    new-instance v0, Lcom/bumptech/glide/i$a;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/i$a;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 545
    return-void
.end method

.method protected c(Lcom/bumptech/glide/request/f;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 124
    invoke-virtual {p1}, Lcom/bumptech/glide/request/f;->dr()Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p1}, Lcom/bumptech/glide/request/f;->dG()Lcom/bumptech/glide/request/f;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/i;->aJ:Lcom/bumptech/glide/request/f;

    .line 125
    return-void
.end method

.method public d(Lcom/bumptech/glide/request/target/n;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    .line 554
    if-nez p1, :cond_0

    .line 555
    return-void

    .line 558
    :cond_0
    invoke-static {}, Lcom/bumptech/glide/util/k;->eH()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 559
    invoke-direct {p0, p1}, Lcom/bumptech/glide/i;->e(Lcom/bumptech/glide/request/target/n;)V

    goto :goto_0

    .line 561
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/i;->U:Landroid/os/Handler;

    new-instance v1, Lcom/bumptech/glide/i$2;

    invoke-direct {v1, p0, p1}, Lcom/bumptech/glide/i$2;-><init>(Lcom/bumptech/glide/i;Lcom/bumptech/glide/request/target/n;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 568
    :goto_0
    return-void
.end method

.method public e(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 469
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->D()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->e(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public e(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/i;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 151
    invoke-direct {p0, p1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/f;)V

    .line 152
    return-object p0
.end method

.method public f(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/i;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 173
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->c(Lcom/bumptech/glide/request/f;)V

    .line 174
    return-object p0
.end method

.method f(Lcom/bumptech/glide/request/target/n;)Z
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

    .line 597
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dj()Lcom/bumptech/glide/request/c;

    move-result-object v0

    .line 599
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 600
    return v1

    .line 603
    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v2, v0}, Lcom/bumptech/glide/manager/n;->b(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 604
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/manager/o;->h(Lcom/bumptech/glide/request/target/n;)V

    .line 605
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/bumptech/glide/request/target/n;->j(Lcom/bumptech/glide/request/c;)V

    .line 606
    return v1

    .line 608
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public g(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/bumptech/glide/h<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 498
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->E()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->e(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public isPaused()Z
    .locals 1

    .line 184
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 185
    iget-object v0, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->isPaused()Z

    move-result v0

    return v0
.end method

.method public synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->e(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method m()Lcom/bumptech/glide/request/f;
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/bumptech/glide/i;->aJ:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .line 301
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onDestroy()V

    .line 302
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->getAll()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/n;

    .line 303
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 304
    goto :goto_0

    .line 305
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->clear()V

    .line 306
    iget-object v0, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->cX()V

    .line 307
    iget-object v0, p0, Lcom/bumptech/glide/i;->aZ:Lcom/bumptech/glide/manager/h;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/manager/h;->b(Lcom/bumptech/glide/manager/i;)V

    .line 308
    iget-object v0, p0, Lcom/bumptech/glide/i;->aZ:Lcom/bumptech/glide/manager/h;

    iget-object v1, p0, Lcom/bumptech/glide/i;->be:Lcom/bumptech/glide/manager/c;

    invoke-interface {v0, v1}, Lcom/bumptech/glide/manager/h;->b(Lcom/bumptech/glide/manager/i;)V

    .line 309
    iget-object v0, p0, Lcom/bumptech/glide/i;->U:Landroid/os/Handler;

    iget-object v1, p0, Lcom/bumptech/glide/i;->bd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 310
    iget-object v0, p0, Lcom/bumptech/glide/i;->c:Lcom/bumptech/glide/c;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/c;->b(Lcom/bumptech/glide/i;)V

    .line 311
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 281
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->z()V

    .line 282
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onStart()V

    .line 283
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 291
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->w()V

    .line 292
    iget-object v0, p0, Lcom/bumptech/glide/i;->bc:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onStop()V

    .line 293
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 628
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{tracker="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", treeNode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/i;->bb:Lcom/bumptech/glide/manager/m;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public w()V
    .locals 1

    .line 199
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 200
    iget-object v0, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->w()V

    .line 201
    return-void
.end method

.method public x()V
    .locals 1

    .line 220
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 221
    iget-object v0, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->x()V

    .line 222
    return-void
.end method

.method public y()V
    .locals 2

    .line 241
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 242
    invoke-virtual {p0}, Lcom/bumptech/glide/i;->w()V

    .line 243
    iget-object v0, p0, Lcom/bumptech/glide/i;->bb:Lcom/bumptech/glide/manager/m;

    invoke-interface {v0}, Lcom/bumptech/glide/manager/m;->cQ()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/i;

    .line 244
    invoke-virtual {v1}, Lcom/bumptech/glide/i;->w()V

    .line 245
    goto :goto_0

    .line 246
    :cond_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 255
    invoke-static {}, Lcom/bumptech/glide/util/k;->eF()V

    .line 256
    iget-object v0, p0, Lcom/bumptech/glide/i;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->z()V

    .line 257
    return-void
.end method
