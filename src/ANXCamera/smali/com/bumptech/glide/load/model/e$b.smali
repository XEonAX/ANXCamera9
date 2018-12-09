.class final Lcom/bumptech/glide/load/model/e$b;
.super Ljava/lang/Object;
.source "DataUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/d<",
        "TData;>;"
    }
.end annotation


# instance fields
.field private data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TData;"
        }
    .end annotation
.end field

.field private final iR:Ljava/lang/String;

.field private final iS:Lcom/bumptech/glide/load/model/e$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/e$a<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/bumptech/glide/load/model/e$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/bumptech/glide/load/model/e$a<",
            "TData;>;)V"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/bumptech/glide/load/model/e$b;->iR:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Lcom/bumptech/glide/load/model/e$b;->iS:Lcom/bumptech/glide/load/model/e$a;

    .line 75
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/a/d$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/a/d$a<",
            "-TData;>;)V"
        }
    .end annotation

    .line 80
    :try_start_0
    iget-object p1, p0, Lcom/bumptech/glide/load/model/e$b;->iS:Lcom/bumptech/glide/load/model/e$a;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/e$b;->iR:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/bumptech/glide/load/model/e$a;->m(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/model/e$b;->data:Ljava/lang/Object;

    .line 81
    iget-object p1, p0, Lcom/bumptech/glide/load/model/e$b;->data:Ljava/lang/Object;

    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/a/d$a;->i(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    goto :goto_0

    .line 82
    :catch_0
    move-exception p1

    .line 83
    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/a/d$a;->b(Ljava/lang/Exception;)V

    .line 85
    :goto_0
    return-void
.end method

.method public ad()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TData;>;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/bumptech/glide/load/model/e$b;->iS:Lcom/bumptech/glide/load/model/e$a;

    invoke-interface {v0}, Lcom/bumptech/glide/load/model/e$a;->ad()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public ae()Lcom/bumptech/glide/load/DataSource;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 110
    sget-object v0, Lcom/bumptech/glide/load/DataSource;->cr:Lcom/bumptech/glide/load/DataSource;

    return-object v0
.end method

.method public cancel()V
    .locals 0

    .line 99
    return-void
.end method

.method public cleanup()V
    .locals 2

    .line 90
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/model/e$b;->iS:Lcom/bumptech/glide/load/model/e$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/model/e$b;->data:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/model/e$a;->h(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 94
    :goto_0
    return-void
.end method
