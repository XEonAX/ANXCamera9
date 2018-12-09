.class public Lcom/bumptech/glide/request/a/h;
.super Ljava/lang/Object;
.source "ViewAnimationFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/a/h$b;,
        Lcom/bumptech/glide/request/a/h$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/g<",
        "TR;>;"
    }
.end annotation


# instance fields
.field private oQ:Lcom/bumptech/glide/request/a/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/a/f<",
            "TR;>;"
        }
    .end annotation
.end field

.field private final oX:Lcom/bumptech/glide/request/a/k$a;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 24
    new-instance v0, Lcom/bumptech/glide/request/a/h$b;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/request/a/h$b;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/a/h;-><init>(Lcom/bumptech/glide/request/a/k$a;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/view/animation/Animation;)V
    .locals 1

    .line 20
    new-instance v0, Lcom/bumptech/glide/request/a/h$a;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/request/a/h$a;-><init>(Landroid/view/animation/Animation;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/a/h;-><init>(Lcom/bumptech/glide/request/a/k$a;)V

    .line 21
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/request/a/k$a;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/bumptech/glide/request/a/h;->oX:Lcom/bumptech/glide/request/a/k$a;

    .line 30
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/DataSource;",
            "Z)",
            "Lcom/bumptech/glide/request/a/f<",
            "TR;>;"
        }
    .end annotation

    .line 42
    sget-object v0, Lcom/bumptech/glide/load/DataSource;->cw:Lcom/bumptech/glide/load/DataSource;

    if-eq p1, v0, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/request/a/h;->oQ:Lcom/bumptech/glide/request/a/f;

    if-nez p1, :cond_1

    .line 47
    new-instance p1, Lcom/bumptech/glide/request/a/k;

    iget-object p2, p0, Lcom/bumptech/glide/request/a/h;->oX:Lcom/bumptech/glide/request/a/k$a;

    invoke-direct {p1, p2}, Lcom/bumptech/glide/request/a/k;-><init>(Lcom/bumptech/glide/request/a/k$a;)V

    iput-object p1, p0, Lcom/bumptech/glide/request/a/h;->oQ:Lcom/bumptech/glide/request/a/f;

    .line 50
    :cond_1
    iget-object p1, p0, Lcom/bumptech/glide/request/a/h;->oQ:Lcom/bumptech/glide/request/a/f;

    return-object p1

    .line 43
    :cond_2
    :goto_0
    invoke-static {}, Lcom/bumptech/glide/request/a/e;->eA()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    return-object p1
.end method
