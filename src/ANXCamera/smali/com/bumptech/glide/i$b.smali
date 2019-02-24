.class Lcom/bumptech/glide/i$b;
.super Ljava/lang/Object;
.source "RequestManager.java"

# interfaces
.implements Lcom/bumptech/glide/manager/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private final ba:Lcom/bumptech/glide/manager/n;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/manager/n;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 635
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 636
    iput-object p1, p0, Lcom/bumptech/glide/i$b;->ba:Lcom/bumptech/glide/manager/n;

    .line 637
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 0

    .line 641
    if-eqz p1, :cond_0

    .line 642
    iget-object p1, p0, Lcom/bumptech/glide/i$b;->ba:Lcom/bumptech/glide/manager/n;

    invoke-virtual {p1}, Lcom/bumptech/glide/manager/n;->cY()V

    .line 644
    :cond_0
    return-void
.end method
