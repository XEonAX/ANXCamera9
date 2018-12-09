.class Lcom/bumptech/glide/load/model/b$d$1;
.super Ljava/lang/Object;
.source "ByteArrayLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bumptech/glide/load/model/b$d;->a(Lcom/bumptech/glide/load/model/q;)Lcom/bumptech/glide/load/model/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/b$b<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic iN:Lcom/bumptech/glide/load/model/b$d;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/model/b$d;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/bumptech/glide/load/model/b$d$1;->iN:Lcom/bumptech/glide/load/model/b$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ad()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 138
    const-class v0, Ljava/io/InputStream;

    return-object v0
.end method

.method public synthetic h([B)Ljava/lang/Object;
    .locals 0

    .line 130
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/model/b$d$1;->i([B)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public i([B)Ljava/io/InputStream;
    .locals 1

    .line 133
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method
