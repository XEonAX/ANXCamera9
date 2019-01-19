.class public final Lcom/bumptech/glide/request/target/k;
.super Lcom/bumptech/glide/request/target/l;
.source "PreloadTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/l<",
        "TZ;>;"
    }
.end annotation


# static fields
.field private static final oA:I = 0x1

.field private static final oB:Landroid/os/Handler;


# instance fields
.field private final X:Lcom/bumptech/glide/i;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/request/target/k$1;

    invoke-direct {v2}, Lcom/bumptech/glide/request/target/k$1;-><init>()V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    sput-object v0, Lcom/bumptech/glide/request/target/k;->oB:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Lcom/bumptech/glide/i;II)V
    .locals 0

    .line 46
    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/request/target/l;-><init>(II)V

    .line 47
    iput-object p1, p0, Lcom/bumptech/glide/request/target/k;->X:Lcom/bumptech/glide/i;

    .line 48
    return-void
.end method

.method public static b(Lcom/bumptech/glide/i;II)Lcom/bumptech/glide/request/target/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/i;",
            "II)",
            "Lcom/bumptech/glide/request/target/k<",
            "TZ;>;"
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/bumptech/glide/request/target/k;

    invoke-direct {v0, p0, p1, p2}, Lcom/bumptech/glide/request/target/k;-><init>(Lcom/bumptech/glide/i;II)V

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TZ;",
            "Lcom/bumptech/glide/request/a/f<",
            "-TZ;>;)V"
        }
    .end annotation

    .line 52
    sget-object p1, Lcom/bumptech/glide/request/target/k;->oB:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 53
    return-void
.end method

.method clear()V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/bumptech/glide/request/target/k;->X:Lcom/bumptech/glide/i;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    .line 58
    return-void
.end method
