.class public Lcom/bumptech/glide/request/a/i;
.super Ljava/lang/Object;
.source "ViewPropertyAnimationFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/g;


# annotations
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
.field private final pa:Lcom/bumptech/glide/request/a/j$a;

.field private pb:Lcom/bumptech/glide/request/a/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/a/j<",
            "TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/request/a/j$a;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/bumptech/glide/request/a/i;->pa:Lcom/bumptech/glide/request/a/j$a;

    .line 16
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

    .line 26
    sget-object v0, Lcom/bumptech/glide/load/DataSource;->cw:Lcom/bumptech/glide/load/DataSource;

    if-eq p1, v0, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/request/a/i;->pb:Lcom/bumptech/glide/request/a/j;

    if-nez p1, :cond_1

    .line 30
    new-instance p1, Lcom/bumptech/glide/request/a/j;

    iget-object p2, p0, Lcom/bumptech/glide/request/a/i;->pa:Lcom/bumptech/glide/request/a/j$a;

    invoke-direct {p1, p2}, Lcom/bumptech/glide/request/a/j;-><init>(Lcom/bumptech/glide/request/a/j$a;)V

    iput-object p1, p0, Lcom/bumptech/glide/request/a/i;->pb:Lcom/bumptech/glide/request/a/j;

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/bumptech/glide/request/a/i;->pb:Lcom/bumptech/glide/request/a/j;

    return-object p1

    .line 27
    :cond_2
    :goto_0
    invoke-static {}, Lcom/bumptech/glide/request/a/e;->eA()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    return-object p1
.end method
