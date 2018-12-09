.class public Lcom/android/camera/ui/LightingView;
.super Landroid/view/View;
.source "LightingView.java"

# interfaces
.implements Lcom/android/camera/ui/Rotatable;


# instance fields
.field private faceViewRectF:Landroid/graphics/RectF;

.field private focusRectF:Landroid/graphics/RectF;

.field private mDisplayRectTopMargin:I

.field private mHeight:I

.field private mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

.field private mRotation:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 33
    invoke-direct {p0, p1}, Lcom/android/camera/ui/LightingView;->initView(Landroid/content/Context;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    invoke-direct {p0, p1}, Lcom/android/camera/ui/LightingView;->initView(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    invoke-direct {p0, p1}, Lcom/android/camera/ui/LightingView;->initView(Landroid/content/Context;)V

    .line 44
    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 1

    .line 47
    new-instance v0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    .line 48
    iget-object p1, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {p1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 50
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/LightingView;->faceViewRectF:Landroid/graphics/RectF;

    .line 51
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/LightingView;->focusRectF:Landroid/graphics/RectF;

    .line 52
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->clear()V

    .line 125
    return-void
.end method

.method public getFaceViewRectF()Landroid/graphics/RectF;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->faceViewRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getFocusRectF()Landroid/graphics/RectF;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->focusRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 115
    invoke-virtual {p0}, Lcom/android/camera/ui/LightingView;->invalidate()V

    .line 116
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 129
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 130
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 131
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->clear()V

    .line 132
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 121
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 57
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-eq v0, v1, :cond_0

    .line 77
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    goto :goto_0

    .line 59
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/LightingView;->mWidth:I

    .line 60
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/LightingView;->mHeight:I

    .line 61
    iget p1, p0, Lcom/android/camera/ui/LightingView;->mWidth:I

    iget p2, p0, Lcom/android/camera/ui/LightingView;->mHeight:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/LightingView;->setMeasuredDimension(II)V

    .line 63
    iget-object p1, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    if-eqz p1, :cond_1

    .line 64
    iget-object p1, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    iget p2, p0, Lcom/android/camera/ui/LightingView;->mWidth:I

    iget v0, p0, Lcom/android/camera/ui/LightingView;->mHeight:I

    iget v1, p0, Lcom/android/camera/ui/LightingView;->mRotation:I

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->setWidthHeight(III)V

    .line 66
    iget p1, p0, Lcom/android/camera/ui/LightingView;->mWidth:I

    iget p2, p0, Lcom/android/camera/ui/LightingView;->mHeight:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    const v0, 0x3f1374bc    # 0.576f

    mul-float/2addr p1, v0

    .line 67
    iget v0, p0, Lcom/android/camera/ui/LightingView;->mWidth:I

    int-to-float v0, v0

    div-float/2addr v0, p2

    .line 68
    iget v1, p0, Lcom/android/camera/ui/LightingView;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v1, p2

    const p2, 0x3f4ccccd    # 0.8f

    mul-float/2addr v1, p2

    .line 70
    iget-object p2, p0, Lcom/android/camera/ui/LightingView;->focusRectF:Landroid/graphics/RectF;

    sub-float v2, v0, p1

    sub-float v3, v1, p1

    add-float/2addr v0, p1

    add-float/2addr v1, p1

    invoke-virtual {p2, v2, v3, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 74
    nop

    .line 80
    :cond_1
    :goto_0
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 0

    .line 140
    iget p2, p0, Lcom/android/camera/ui/LightingView;->mRotation:I

    if-eq p2, p1, :cond_0

    .line 141
    iput p1, p0, Lcom/android/camera/ui/LightingView;->mRotation:I

    .line 142
    iget-object p1, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    if-eqz p1, :cond_0

    .line 143
    iget-object p1, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    iget p2, p0, Lcom/android/camera/ui/LightingView;->mRotation:I

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->updateMiddleValue(I)V

    .line 146
    :cond_0
    return-void
.end method

.method public setRotation(I)V
    .locals 0

    .line 135
    iput p1, p0, Lcom/android/camera/ui/LightingView;->mRotation:I

    .line 136
    return-void
.end method

.method public triggerAnimateExit()V
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->animateExit()V

    .line 111
    return-void
.end method

.method public triggerAnimateFocusing()V
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->triggerFocusing()V

    .line 107
    return-void
.end method

.method public triggerAnimateStart()V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->animateStart()V

    .line 99
    return-void
.end method

.method public triggerAnimateSuccess()V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/android/camera/ui/LightingView;->mLightingAnimateDrawable:Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->triggerSuccess()V

    .line 103
    return-void
.end method
