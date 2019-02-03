.class Lcom/bumptech/glide/i$2;
.super Ljava/lang/Object;
.source "RequestManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bf:Lcom/bumptech/glide/i;

.field final synthetic bg:Lcom/bumptech/glide/request/target/n;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/i;Lcom/bumptech/glide/request/target/n;)V
    .locals 0

    .line 561
    iput-object p1, p0, Lcom/bumptech/glide/i$2;->bf:Lcom/bumptech/glide/i;

    iput-object p2, p0, Lcom/bumptech/glide/i$2;->bg:Lcom/bumptech/glide/request/target/n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 564
    iget-object v0, p0, Lcom/bumptech/glide/i$2;->bf:Lcom/bumptech/glide/i;

    iget-object v1, p0, Lcom/bumptech/glide/i$2;->bg:Lcom/bumptech/glide/request/target/n;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 565
    return-void
.end method
