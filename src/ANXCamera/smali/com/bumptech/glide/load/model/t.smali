.class public Lcom/bumptech/glide/load/model/t;
.super Ljava/lang/Object;
.source "StringLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/t$a;,
        Lcom/bumptech/glide/load/model/t$b;,
        Lcom/bumptech/glide/load/model/t$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/m<",
        "Ljava/lang/String;",
        "TData;>;"
    }
.end annotation


# instance fields
.field private final jF:Lcom/bumptech/glide/load/model/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m<",
            "Landroid/net/Uri;",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/model/m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/m<",
            "Landroid/net/Uri;",
            "TData;>;)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/bumptech/glide/load/model/t;->jF:Lcom/bumptech/glide/load/model/m;

    .line 26
    return-void
.end method

.method private static q(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 43
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    const/4 p0, 0x0

    return-object p0

    .line 46
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_1

    .line 47
    invoke-static {p0}, Lcom/bumptech/glide/load/model/t;->r(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    .line 49
    :cond_1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    invoke-static {p0}, Lcom/bumptech/glide/load/model/t;->r(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    .line 55
    :cond_2
    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method private static r(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    .line 59
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/model/m$a<",
            "TData;>;"
        }
    .end annotation

    .line 31
    invoke-static {p1}, Lcom/bumptech/glide/load/model/t;->q(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 32
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/model/t;->jF:Lcom/bumptech/glide/load/model/m;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public synthetic b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/t;->a(Ljava/lang/String;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object p1

    return-object p1
.end method

.method public synthetic o(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/model/t;->p(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public p(Ljava/lang/String;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 37
    const/4 p1, 0x1

    return p1
.end method
