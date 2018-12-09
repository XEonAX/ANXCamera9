.class public Lcom/bumptech/glide/request/target/g;
.super Landroid/graphics/drawable/Drawable;
.source "FixedSizeDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/target/g$a;
    }
.end annotation


# instance fields
.field private final matrix:Landroid/graphics/Matrix;

.field private final os:Landroid/graphics/RectF;

.field private final ot:Landroid/graphics/RectF;

.field private ou:Landroid/graphics/drawable/Drawable;

.field private ov:Lcom/bumptech/glide/request/target/g$a;

.field private ow:Z


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;II)V
    .locals 2

    .line 34
    new-instance v0, Lcom/bumptech/glide/request/target/g$a;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-direct {v0, v1, p2, p3}, Lcom/bumptech/glide/request/target/g$a;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;II)V

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/request/target/g;-><init>(Lcom/bumptech/glide/request/target/g$a;Landroid/graphics/drawable/Drawable;)V

    .line 35
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/request/target/g$a;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 38
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/request/target/g$a;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    .line 39
    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    .line 42
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 44
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/target/g;->matrix:Landroid/graphics/Matrix;

    .line 45
    new-instance p1, Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    int-to-float p2, p2

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, v0, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/bumptech/glide/request/target/g;->os:Landroid/graphics/RectF;

    .line 46
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/target/g;->ot:Landroid/graphics/RectF;

    .line 47
    return-void
.end method

.method private em()V
    .locals 4

    .line 64
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->matrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/bumptech/glide/request/target/g;->os:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/bumptech/glide/request/target/g;->ot:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 65
    return-void
.end method


# virtual methods
.method public clearColorFilter()V
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 107
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 165
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 166
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 167
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 168
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 169
    return-void
.end method

.method public getAlpha()I
    .locals 1
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x13
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getCallback()Landroid/graphics/drawable/Drawable$Callback;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    return-object v0
.end method

.method public getChangingConfigurations()I
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    return-object v0
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    iget v0, v0, Lcom/bumptech/glide/request/target/g$a;->height:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    iget v0, v0, Lcom/bumptech/glide/request/target/g$a;->width:I

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 1
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 142
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public invalidateSelf()V
    .locals 1

    .line 147
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 148
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 149
    return-void
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 189
    iget-boolean v0, p0, Lcom/bumptech/glide/request/target/g;->ow:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    .line 191
    new-instance v0, Lcom/bumptech/glide/request/target/g$a;

    iget-object v1, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    invoke-direct {v0, v1}, Lcom/bumptech/glide/request/target/g$a;-><init>(Lcom/bumptech/glide/request/target/g$a;)V

    iput-object v0, p0, Lcom/bumptech/glide/request/target/g;->ov:Lcom/bumptech/glide/request/target/g$a;

    .line 192
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/target/g;->ow:Z

    .line 194
    :cond_0
    return-object p0
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .locals 1
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 159
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 160
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 161
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 174
    return-void
.end method

.method public setBounds(IIII)V
    .locals 1

    .line 51
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 52
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ot:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    int-to-float p3, p3

    int-to-float p4, p4

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 53
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/g;->em()V

    .line 54
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .locals 1
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 58
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 59
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ot:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 60
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/g;->em()V

    .line 61
    return-void
.end method

.method public setChangingConfigurations(I)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 70
    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 1
    .param p2    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 101
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 102
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 179
    return-void
.end method

.method public setDither(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 81
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 86
    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1
.end method

.method public unscheduleSelf(Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 153
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 154
    iget-object v0, p0, Lcom/bumptech/glide/request/target/g;->ou:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 155
    return-void
.end method
