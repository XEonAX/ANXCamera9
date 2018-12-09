.class public final Lcom/bumptech/glide/load/model/e$c;
.super Ljava/lang/Object;
.source "DataUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/n<",
        "TModel;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final iT:Lcom/bumptech/glide/load/model/e$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/e$a<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    new-instance v0, Lcom/bumptech/glide/load/model/e$c$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/model/e$c$1;-><init>(Lcom/bumptech/glide/load/model/e$c;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/model/e$c;->iT:Lcom/bumptech/glide/load/model/e$a;

    .line 157
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/model/q;)Lcom/bumptech/glide/load/model/m;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/model/q;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/q;",
            ")",
            "Lcom/bumptech/glide/load/model/m<",
            "TModel;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 163
    new-instance p1, Lcom/bumptech/glide/load/model/e;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/e$c;->iT:Lcom/bumptech/glide/load/model/e$a;

    invoke-direct {p1, v0}, Lcom/bumptech/glide/load/model/e;-><init>(Lcom/bumptech/glide/load/model/e$a;)V

    return-object p1
.end method

.method public bR()V
    .locals 0

    .line 169
    return-void
.end method
