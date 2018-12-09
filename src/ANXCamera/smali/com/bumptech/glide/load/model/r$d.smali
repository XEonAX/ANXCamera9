.class public Lcom/bumptech/glide/load/model/r$d;
.super Ljava/lang/Object;
.source "ResourceLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/n<",
        "Ljava/lang/Integer;",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field private final jG:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-object p1, p0, Lcom/bumptech/glide/load/model/r$d;->jG:Landroid/content/res/Resources;

    .line 141
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/model/q;)Lcom/bumptech/glide/load/model/m;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/q;",
            ")",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/lang/Integer;",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 146
    new-instance p1, Lcom/bumptech/glide/load/model/r;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/r$d;->jG:Landroid/content/res/Resources;

    invoke-static {}, Lcom/bumptech/glide/load/model/u;->cd()Lcom/bumptech/glide/load/model/u;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/bumptech/glide/load/model/r;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/model/m;)V

    return-object p1
.end method

.method public bR()V
    .locals 0

    .line 152
    return-void
.end method
