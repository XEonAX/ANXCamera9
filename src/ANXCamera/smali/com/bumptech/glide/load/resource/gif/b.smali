.class public Lcom/bumptech/glide/load/resource/gif/b;
.super Landroid/graphics/drawable/Drawable;
.source "GifDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;
.implements Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/gif/b$a;
    }
.end annotation


# static fields
.field public static final lA:I = -0x1

.field public static final lB:I = 0x0

.field private static final lC:I = 0x77


# instance fields
.field private fZ:Z

.field private isRunning:Z

.field private final lD:Lcom/bumptech/glide/load/resource/gif/b$a;

.field private lE:Z

.field private lF:Z

.field private lG:I

.field private lH:Z

.field private lI:Landroid/graphics/Rect;

.field private loopCount:I

.field private paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/b/a;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/i;IILandroid/graphics/Bitmap;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/b/a;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/d;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;II",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 110
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move v4, p5

    move v5, p6

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/load/resource/gif/b;-><init>(Landroid/content/Context;Lcom/bumptech/glide/b/a;Lcom/bumptech/glide/load/i;IILandroid/graphics/Bitmap;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/b/a;Lcom/bumptech/glide/load/i;IILandroid/graphics/Bitmap;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/b/a;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;II",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/b$a;

    new-instance v8, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 142
    invoke-static {p1}, Lcom/bumptech/glide/c;->b(Landroid/content/Context;)Lcom/bumptech/glide/c;

    move-result-object v2

    move-object v1, v8

    move-object v3, p2

    move v4, p4

    move v5, p5

    move-object v6, p3

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/b/a;IILcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V

    invoke-direct {v0, v8}, Lcom/bumptech/glide/load/resource/gif/b$a;-><init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V

    .line 138
    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/gif/b;-><init>(Lcom/bumptech/glide/load/resource/gif/b$a;)V

    .line 148
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;Landroid/graphics/Paint;)V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 156
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/b$a;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/gif/b$a;-><init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/gif/b;-><init>(Lcom/bumptech/glide/load/resource/gif/b$a;)V

    .line 157
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/gif/b;->paint:Landroid/graphics/Paint;

    .line 158
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/resource/gif/b$a;)V
    .locals 1

    .line 150
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lF:Z

    .line 73
    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lG:I

    .line 151
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/resource/gif/b$a;

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    .line 152
    return-void
.end method

.method private cD()V
    .locals 1

    .line 198
    const/4 v0, 0x0

    iput v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->loopCount:I

    .line 199
    return-void
.end method

.method private cF()V
    .locals 3

    .line 228
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->fZ:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request."

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 231
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getFrameCount()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 232
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->invalidateSelf()V

    goto :goto_0

    .line 233
    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    if-nez v0, :cond_1

    .line 234
    iput-boolean v1, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    .line 235
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->a(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;)V

    .line 236
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->invalidateSelf()V

    .line 238
    :cond_1
    :goto_0
    return-void
.end method

.method private cG()Landroid/graphics/Rect;
    .locals 1

    .line 311
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lI:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lI:Landroid/graphics/Rect;

    .line 314
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lI:Landroid/graphics/Rect;

    return-object v0
.end method

.method private cH()Landroid/graphics/drawable/Drawable$Callback;
    .locals 2

    .line 332
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 333
    :goto_0
    instance-of v1, v0, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 334
    check-cast v0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    goto :goto_0

    .line 336
    :cond_0
    return-object v0
.end method

.method private getPaint()Landroid/graphics/Paint;
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->paint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 319
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->paint:Landroid/graphics/Paint;

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->paint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private stopRunning()V
    .locals 1

    .line 241
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    .line 242
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->b(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;)V

    .line 243
    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->a(Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V

    .line 173
    return-void
.end method

.method public cA()Landroid/graphics/Bitmap;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cA()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public cB()Lcom/bumptech/glide/load/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cB()Lcom/bumptech/glide/load/i;

    move-result-object v0

    return-object v0
.end method

.method public cC()I
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getCurrentIndex()I

    move-result v0

    return v0
.end method

.method public cE()V
    .locals 2

    .line 207
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "You cannot restart a currently running animation."

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cM()V

    .line 209
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->start()V

    .line 210
    return-void
.end method

.method public cI()V
    .locals 2

    .line 341
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cH()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    if-nez v0, :cond_0

    .line 342
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->stop()V

    .line 343
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->invalidateSelf()V

    .line 344
    return-void

    .line 347
    :cond_0
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->invalidateSelf()V

    .line 349
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cC()I

    move-result v0

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getFrameCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1

    .line 350
    iget v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->loopCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->loopCount:I

    .line 353
    :cond_1
    iget v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lG:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->loopCount:I

    iget v1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lG:I

    if-lt v0, v1, :cond_2

    .line 354
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->stop()V

    .line 356
    :cond_2
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 287
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->fZ:Z

    if-eqz v0, :cond_0

    .line 288
    return-void

    .line 291
    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lH:Z

    if-eqz v0, :cond_1

    .line 292
    const/16 v0, 0x77

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cG()Landroid/graphics/Rect;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 293
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lH:Z

    .line 296
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cJ()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 297
    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cG()Landroid/graphics/Rect;

    move-result-object v2

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getPaint()Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 298
    return-void
.end method

.method f(Z)V
    .locals 0

    .line 276
    iput-boolean p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    .line 277
    return-void
.end method

.method public getBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    return-object v0
.end method

.method public getFrameCount()I
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getFrameCount()I

    move-result v0

    return v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 266
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .line 327
    const/4 v0, -0x2

    return v0
.end method

.method public getSize()I
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getSize()I

    move-result v0

    return v0
.end method

.method isRecycled()Z
    .locals 1

    .line 373
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->fZ:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 271
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->isRunning:Z

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 281
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 282
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lH:Z

    .line 283
    return-void
.end method

.method public recycle()V
    .locals 1

    .line 367
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->fZ:Z

    .line 368
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->clear()V

    .line 369
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 302
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 303
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 307
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 308
    return-void
.end method

.method public setLoopCount(I)V
    .locals 1

    .line 379
    const/4 v0, -0x1

    if-gtz p1, :cond_1

    if-eq p1, v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 380
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Loop count must be greater than 0, or equal to GlideDrawable.LOOP_FOREVER, or equal to GlideDrawable.LOOP_INTRINSIC"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 384
    :cond_1
    :goto_0
    if-nez p1, :cond_3

    .line 385
    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lD:Lcom/bumptech/glide/load/resource/gif/b$a;

    iget-object p1, p1, Lcom/bumptech/glide/load/resource/gif/b$a;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getLoopCount()I

    move-result p1

    .line 386
    nop

    .line 387
    if-nez p1, :cond_2

    move p1, v0

    :cond_2
    iput p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lG:I

    .line 388
    goto :goto_1

    .line 389
    :cond_3
    iput p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lG:I

    .line 391
    :goto_1
    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 2

    .line 247
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->fZ:Z

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View\'s visibility."

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    .line 250
    iput-boolean p1, p0, Lcom/bumptech/glide/load/resource/gif/b;->lF:Z

    .line 251
    if-nez p1, :cond_0

    .line 252
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->stopRunning()V

    goto :goto_0

    .line 253
    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lE:Z

    if-eqz v0, :cond_1

    .line 254
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cF()V

    .line 256
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1
.end method

.method public start()V
    .locals 1

    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lE:Z

    .line 215
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cD()V

    .line 216
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lF:Z

    if-eqz v0, :cond_0

    .line 217
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->cF()V

    .line 219
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 223
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/b;->lE:Z

    .line 224
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/b;->stopRunning()V

    .line 225
    return-void
.end method
