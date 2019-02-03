.class Lcom/bumptech/glide/load/engine/c;
.super Ljava/lang/Object;
.source "DataCacheWriter.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/a$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DataType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/a/a$b;"
    }
.end annotation


# instance fields
.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TDataType;"
        }
    .end annotation
.end field

.field private final eg:Lcom/bumptech/glide/load/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/a<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field private final eh:Lcom/bumptech/glide/load/f;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/a;Ljava/lang/Object;Lcom/bumptech/glide/load/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/a<",
            "TDataType;>;TDataType;",
            "Lcom/bumptech/glide/load/f;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/c;->eg:Lcom/bumptech/glide/load/a;

    .line 25
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/c;->data:Ljava/lang/Object;

    .line 26
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/c;->eh:Lcom/bumptech/glide/load/f;

    .line 27
    return-void
.end method


# virtual methods
.method public f(Ljava/io/File;)Z
    .locals 3
    .param p1    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 31
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/c;->eg:Lcom/bumptech/glide/load/a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/c;->data:Ljava/lang/Object;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/c;->eh:Lcom/bumptech/glide/load/f;

    invoke-interface {v0, v1, p1, v2}, Lcom/bumptech/glide/load/a;->a(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/f;)Z

    move-result p1

    return p1
.end method
