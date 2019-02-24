.class public final Lcom/bumptech/glide/load/engine/prefill/c;
.super Ljava/lang/Object;
.source "PreFillType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/prefill/c$a;
    }
.end annotation


# static fields
.field static final DEFAULT_CONFIG:Landroid/graphics/Bitmap$Config;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private final config:Landroid/graphics/Bitmap$Config;

.field private final height:I

.field private final weight:I

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    sput-object v0, Lcom/bumptech/glide/load/engine/prefill/c;->DEFAULT_CONFIG:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method constructor <init>(IILandroid/graphics/Bitmap$Config;I)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-string v0, "Config must not be null"

    invoke-static {p3, v0}, Lcom/bumptech/glide/util/i;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/graphics/Bitmap$Config;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    .line 34
    iput p1, p0, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    .line 35
    iput p2, p0, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    .line 36
    iput p4, p0, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    .line 37
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 70
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/prefill/c;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 71
    check-cast p1, Lcom/bumptech/glide/load/engine/prefill/c;

    .line 72
    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    iget-object p1, p1, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 75
    :cond_1
    return v1
.end method

.method getConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method getHeight()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    return v0
.end method

.method getWeight()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    return v0
.end method

.method getWidth()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 80
    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    .line 81
    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    add-int/2addr v0, v2

    .line 82
    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v2}, Landroid/graphics/Bitmap$Config;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 83
    mul-int/2addr v1, v0

    iget v0, p0, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    add-int/2addr v1, v0

    .line 84
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PreFillSize{width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/load/engine/prefill/c;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/load/engine/prefill/c;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", config="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/prefill/c;->config:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", weight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/load/engine/prefill/c;->weight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
