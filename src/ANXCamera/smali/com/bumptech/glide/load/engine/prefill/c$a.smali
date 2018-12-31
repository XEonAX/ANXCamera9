.class public Lcom/bumptech/glide/load/engine/prefill/c$a;
.super Ljava/lang/Object;
.source "PreFillType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/prefill/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private config:Landroid/graphics/Bitmap$Config;

.field private final height:I

.field private weight:I

.field private final width:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 110
    invoke-direct {p0, p1, p1}, Lcom/bumptech/glide/load/engine/prefill/c$a;-><init>(II)V

    .line 111
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->weight:I

    .line 121
    if-lez p1, :cond_1

    .line 124
    if-lez p2, :cond_0

    .line 127
    iput p1, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->width:I

    .line 128
    iput p2, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->height:I

    .line 129
    return-void

    .line 125
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Height must be > 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 122
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Width must be > 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method bQ()Lcom/bumptech/glide/load/engine/prefill/c;
    .locals 5

    .line 170
    new-instance v0, Lcom/bumptech/glide/load/engine/prefill/c;

    iget v1, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->width:I

    iget v2, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->height:I

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->config:Landroid/graphics/Bitmap$Config;

    iget v4, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->weight:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/bumptech/glide/load/engine/prefill/c;-><init>(IILandroid/graphics/Bitmap$Config;I)V

    return-object v0
.end method

.method public e(Landroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/prefill/c$a;
    .locals 0
    .param p1    # Landroid/graphics/Bitmap$Config;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 138
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->config:Landroid/graphics/Bitmap$Config;

    .line 139
    return-object p0
.end method

.method getConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->config:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public u(I)Lcom/bumptech/glide/load/engine/prefill/c$a;
    .locals 1

    .line 159
    if-lez p1, :cond_0

    .line 162
    iput p1, p0, Lcom/bumptech/glide/load/engine/prefill/c$a;->weight:I

    .line 163
    return-object p0

    .line 160
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Weight must be > 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
