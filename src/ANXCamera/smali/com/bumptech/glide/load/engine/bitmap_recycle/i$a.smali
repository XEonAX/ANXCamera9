.class final Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;
.super Ljava/lang/Object;
.source "LruArrayPool.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/bitmap_recycle/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/bitmap_recycle/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final gI:Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;

.field private gJ:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field size:I


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;)V
    .locals 0

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 246
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gI:Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;

    .line 247
    return-void
.end method


# virtual methods
.method public bg()V
    .locals 1

    .line 270
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gI:Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;->a(Lcom/bumptech/glide/load/engine/bitmap_recycle/l;)V

    .line 271
    return-void
.end method

.method d(ILjava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 250
    iput p1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->size:I

    .line 251
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    .line 252
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 256
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 257
    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;

    .line 258
    iget v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->size:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->size:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    iget-object p1, p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 260
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 275
    iget v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->size:I

    .line 276
    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v1, v0

    .line 277
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Key{size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "array="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->gJ:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
