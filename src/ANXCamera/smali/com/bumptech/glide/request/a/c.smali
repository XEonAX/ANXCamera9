.class public Lcom/bumptech/glide/request/a/c;
.super Ljava/lang/Object;
.source "DrawableCrossFadeFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/a/c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/g<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final duration:I

.field private final oR:Z

.field private oS:Lcom/bumptech/glide/request/a/d;


# direct methods
.method protected constructor <init>(IZ)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Lcom/bumptech/glide/request/a/c;->duration:I

    .line 25
    iput-boolean p2, p0, Lcom/bumptech/glide/request/a/c;->oR:Z

    .line 26
    return-void
.end method

.method private ex()Lcom/bumptech/glide/request/a/f;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/a/f<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/bumptech/glide/request/a/c;->oS:Lcom/bumptech/glide/request/a/d;

    if-nez v0, :cond_0

    .line 36
    new-instance v0, Lcom/bumptech/glide/request/a/d;

    iget v1, p0, Lcom/bumptech/glide/request/a/c;->duration:I

    iget-boolean v2, p0, Lcom/bumptech/glide/request/a/c;->oR:Z

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/request/a/d;-><init>(IZ)V

    iput-object v0, p0, Lcom/bumptech/glide/request/a/c;->oS:Lcom/bumptech/glide/request/a/d;

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a/c;->oS:Lcom/bumptech/glide/request/a/d;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/DataSource;",
            "Z)",
            "Lcom/bumptech/glide/request/a/f<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 30
    sget-object p2, Lcom/bumptech/glide/load/DataSource;->cx:Lcom/bumptech/glide/load/DataSource;

    if-ne p1, p2, :cond_0

    .line 31
    invoke-static {}, Lcom/bumptech/glide/request/a/e;->eA()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/request/a/c;->ex()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    .line 30
    :goto_0
    return-object p1
.end method
