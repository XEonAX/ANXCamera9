.class Lcom/bumptech/glide/load/engine/q;
.super Ljava/lang/Object;
.source "ResourceCacheGenerator.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/d$a;
.implements Lcom/bumptech/glide/load/engine/d;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/d$a<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/bumptech/glide/load/engine/d;"
    }
.end annotation


# instance fields
.field private final dX:Lcom/bumptech/glide/load/engine/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;"
        }
    .end annotation
.end field

.field private final dY:Lcom/bumptech/glide/load/engine/d$a;

.field private dZ:I

.field private ea:Lcom/bumptech/glide/load/c;

.field private eb:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/io/File;",
            "*>;>;"
        }
    .end annotation
.end field

.field private ec:I

.field private volatile ed:Lcom/bumptech/glide/load/model/m$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;"
        }
    .end annotation
.end field

.field private ee:Ljava/io/File;

.field private gj:I

.field private gk:Lcom/bumptech/glide/load/engine/r;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;",
            "Lcom/bumptech/glide/load/engine/d$a;",
            ")V"
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    .line 36
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 37
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/q;->dY:Lcom/bumptech/glide/load/engine/d$a;

    .line 38
    return-void
.end method

.method private an()Z
    .locals 2

    .line 110
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->ec:I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->eb:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public am()Z
    .locals 14

    .line 44
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/e;->aA()Ljava/util/List;

    move-result-object v0

    .line 45
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 46
    return v2

    .line 48
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->ax()Ljava/util/List;

    move-result-object v1

    .line 49
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 50
    const-class v3, Ljava/io/File;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->av()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 51
    return v2

    .line 60
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->eb:Ljava/util/List;

    const/4 v4, 0x1

    if-eqz v3, :cond_5

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->an()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    .line 94
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    .line 95
    nop

    .line 96
    :goto_1
    if-nez v2, :cond_4

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->an()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 97
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->eb:Ljava/util/List;

    iget v1, p0, Lcom/bumptech/glide/load/engine/q;->ec:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->ec:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/model/m;

    .line 98
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->ee:Ljava/io/File;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 99
    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/e;->getWidth()I

    move-result v3

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v5}, Lcom/bumptech/glide/load/engine/e;->getHeight()I

    move-result v5

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/e;->at()Lcom/bumptech/glide/load/f;

    move-result-object v6

    .line 98
    invoke-interface {v0, v1, v3, v5, v6}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    .line 100
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    iget-object v1, v1, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v1}, Lcom/bumptech/glide/load/a/d;->ad()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/e;->c(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 101
    nop

    .line 102
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->as()Lcom/bumptech/glide/Priority;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/bumptech/glide/load/a/d;->a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V

    .line 104
    move v2, v4

    :cond_3
    goto :goto_1

    .line 106
    :cond_4
    return v2

    .line 61
    :cond_5
    :goto_2
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    .line 62
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lt v3, v5, :cond_7

    .line 63
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->dZ:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->dZ:I

    .line 64
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->dZ:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-lt v3, v4, :cond_6

    .line 65
    return v2

    .line 67
    :cond_6
    iput v2, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    .line 70
    :cond_7
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->dZ:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/load/c;

    .line 71
    iget v4, p0, Lcom/bumptech/glide/load/engine/q;->gj:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Ljava/lang/Class;

    .line 72
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4, v11}, Lcom/bumptech/glide/load/engine/e;->e(Ljava/lang/Class;)Lcom/bumptech/glide/load/i;

    move-result-object v10

    .line 76
    new-instance v13, Lcom/bumptech/glide/load/engine/r;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 78
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->f()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    move-result-object v5

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 80
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->au()Lcom/bumptech/glide/load/c;

    move-result-object v7

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 81
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->getWidth()I

    move-result v8

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 82
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->getHeight()I

    move-result v9

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    .line 85
    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->at()Lcom/bumptech/glide/load/f;

    move-result-object v12

    move-object v4, v13

    move-object v6, v3

    invoke-direct/range {v4 .. v12}, Lcom/bumptech/glide/load/engine/r;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;IILcom/bumptech/glide/load/i;Ljava/lang/Class;Lcom/bumptech/glide/load/f;)V

    iput-object v13, p0, Lcom/bumptech/glide/load/engine/q;->gk:Lcom/bumptech/glide/load/engine/r;

    .line 86
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->aq()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->gk:Lcom/bumptech/glide/load/engine/r;

    invoke-interface {v4, v5}, Lcom/bumptech/glide/load/engine/a/a;->e(Lcom/bumptech/glide/load/c;)Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lcom/bumptech/glide/load/engine/q;->ee:Ljava/io/File;

    .line 87
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->ee:Ljava/io/File;

    if-eqz v4, :cond_8

    .line 88
    iput-object v3, p0, Lcom/bumptech/glide/load/engine/q;->ea:Lcom/bumptech/glide/load/c;

    .line 89
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->dX:Lcom/bumptech/glide/load/engine/e;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->ee:Ljava/io/File;

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/load/engine/e;->g(Ljava/io/File;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/bumptech/glide/load/engine/q;->eb:Ljava/util/List;

    .line 90
    iput v2, p0, Lcom/bumptech/glide/load/engine/q;->ec:I

    .line 92
    :cond_8
    goto/16 :goto_0
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 4
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 129
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->dY:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->gk:Lcom/bumptech/glide/load/engine/r;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    iget-object v2, v2, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    sget-object v3, Lcom/bumptech/glide/load/DataSource;->cw:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V

    .line 130
    return-void
.end method

.method public cancel()V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    .line 116
    if-eqz v0, :cond_0

    .line 117
    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cancel()V

    .line 119
    :cond_0
    return-void
.end method

.method public i(Ljava/lang/Object;)V
    .locals 6

    .line 123
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->dY:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->ea:Lcom/bumptech/glide/load/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->ed:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v2, Lcom/bumptech/glide/load/model/m$a;->jp:Lcom/bumptech/glide/load/a/d;

    sget-object v4, Lcom/bumptech/glide/load/DataSource;->cw:Lcom/bumptech/glide/load/DataSource;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->gk:Lcom/bumptech/glide/load/engine/r;

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V

    .line 125
    return-void
.end method
