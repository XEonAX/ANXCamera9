.class Lcom/bumptech/glide/util/a/c$a;
.super Lcom/bumptech/glide/util/a/c;
.source "StateVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/util/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private volatile pC:Ljava/lang/RuntimeException;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/util/a/c;-><init>(Lcom/bumptech/glide/util/a/c$1;)V

    return-void
.end method


# virtual methods
.method public eN()V
    .locals 3

    .line 65
    iget-object v0, p0, Lcom/bumptech/glide/util/a/c$a;->pC:Ljava/lang/RuntimeException;

    if-nez v0, :cond_0

    .line 68
    return-void

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object v1, p0, Lcom/bumptech/glide/util/a/c$a;->pC:Ljava/lang/RuntimeException;

    const-string v2, "Already released"

    invoke-direct {v0, v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method m(Z)V
    .locals 1

    .line 72
    if-eqz p1, :cond_0

    .line 73
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Released"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/bumptech/glide/util/a/c$a;->pC:Ljava/lang/RuntimeException;

    goto :goto_0

    .line 75
    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/bumptech/glide/util/a/c$a;->pC:Ljava/lang/RuntimeException;

    .line 77
    :goto_0
    return-void
.end method
