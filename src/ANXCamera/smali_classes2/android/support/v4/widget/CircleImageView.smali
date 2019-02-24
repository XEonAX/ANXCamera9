.class Landroid/support/v4/widget/CircleImageView;
.super Landroid/widget/ImageView;
.source "CircleImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/CircleImageView$OvalShadow;
    }
.end annotation


# static fields
.field private static final FILL_SHADOW_COLOR:I = 0x3d000000

.field private static final KEY_SHADOW_COLOR:I = 0x1e000000

.field private static final SHADOW_ELEVATION:I = 0x4

.field private static final SHADOW_RADIUS:F = 3.5f

.field private static final X_OFFSET:F = 0.0f

.field private static final Y_OFFSET:F = 1.75f


# instance fields
.field private mListener:Landroid/view/animation/Animation$AnimationListener;

.field private mShadowRadius:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IF)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "color"    # I
    .param p3, "radius"    # F

    .line 52
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 53
    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 54
    .local v0, "density":F
    mul-float v1, p3, v0

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    .line 55
    .local v1, "diameter":I
    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float/2addr v2, v0

    float-to-int v2, v2

    .line 56
    .local v2, "shadowYOffset":I
    const/4 v3, 0x0

    mul-float/2addr v3, v0

    float-to-int v3, v3

    .line 58
    .local v3, "shadowXOffset":I
    const/high16 v4, 0x40600000    # 3.5f

    mul-float/2addr v4, v0

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    .line 61
    invoke-direct {p0}, Landroid/support/v4/widget/CircleImageView;->elevationSupported()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 62
    new-instance v4, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v5, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v5}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 63
    .local v4, "circle":Landroid/graphics/drawable/ShapeDrawable;
    const/high16 v5, 0x40800000    # 4.0f

    mul-float/2addr v5, v0

    invoke-static {p0, v5}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    goto :goto_63

    .line 65
    .end local v4    # "circle":Landroid/graphics/drawable/ShapeDrawable;
    :cond_3b
    new-instance v4, Landroid/support/v4/widget/CircleImageView$OvalShadow;

    iget v5, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    invoke-direct {v4, p0, v5, v1}, Landroid/support/v4/widget/CircleImageView$OvalShadow;-><init>(Landroid/support/v4/widget/CircleImageView;II)V

    .line 66
    .local v4, "oval":Landroid/graphics/drawable/shapes/OvalShape;
    new-instance v5, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v5, v4}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 67
    .local v5, "circle":Landroid/graphics/drawable/ShapeDrawable;
    const/4 v6, 0x1

    invoke-virtual {v5}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v7

    invoke-static {p0, v6, v7}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    .line 68
    invoke-virtual {v5}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v6

    iget v7, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    int-to-float v7, v7

    int-to-float v8, v3

    int-to-float v9, v2

    const/high16 v10, 0x1e000000

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 70
    iget v6, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    .line 72
    .local v6, "padding":I
    invoke-virtual {p0, v6, v6, v6, v6}, Landroid/support/v4/widget/CircleImageView;->setPadding(IIII)V

    .line 74
    .end local v4    # "oval":Landroid/graphics/drawable/shapes/OvalShape;
    .end local v6    # "padding":I
    move-object v4, v5

    .end local v5    # "circle":Landroid/graphics/drawable/ShapeDrawable;
    .local v4, "circle":Landroid/graphics/drawable/ShapeDrawable;
    :goto_63
    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/CircleImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/widget/CircleImageView;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/widget/CircleImageView;

    .line 38
    iget v0, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    return v0
.end method

.method static synthetic access$002(Landroid/support/v4/widget/CircleImageView;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/widget/CircleImageView;
    .param p1, "x1"    # I

    .line 38
    iput p1, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    return p1
.end method

.method private elevationSupported()Z
    .registers 3

    .line 79
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method


# virtual methods
.method public onAnimationEnd()V
    .registers 3

    .line 105
    invoke-super {p0}, Landroid/widget/ImageView;->onAnimationEnd()V

    .line 106
    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView;->mListener:Landroid/view/animation/Animation$AnimationListener;

    if-eqz v0, :cond_10

    .line 107
    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView;->mListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/animation/Animation$AnimationListener;->onAnimationEnd(Landroid/view/animation/Animation;)V

    .line 109
    :cond_10
    return-void
.end method

.method public onAnimationStart()V
    .registers 3

    .line 97
    invoke-super {p0}, Landroid/widget/ImageView;->onAnimationStart()V

    .line 98
    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView;->mListener:Landroid/view/animation/Animation$AnimationListener;

    if-eqz v0, :cond_10

    .line 99
    iget-object v0, p0, Landroid/support/v4/widget/CircleImageView;->mListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/animation/Animation$AnimationListener;->onAnimationStart(Landroid/view/animation/Animation;)V

    .line 101
    :cond_10
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 84
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 85
    invoke-direct {p0}, Landroid/support/v4/widget/CircleImageView;->elevationSupported()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 86
    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getMeasuredWidth()I

    move-result v0

    iget v1, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getMeasuredHeight()I

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/CircleImageView;->mShadowRadius:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/widget/CircleImageView;->setMeasuredDimension(II)V

    .line 89
    :cond_1e
    return-void
.end method

.method public setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 92
    iput-object p1, p0, Landroid/support/v4/widget/CircleImageView;->mListener:Landroid/view/animation/Animation$AnimationListener;

    .line 93
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .line 122
    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/ShapeDrawable;

    if-eqz v0, :cond_15

    .line 123
    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    :cond_15
    return-void
.end method

.method public setBackgroundColorRes(I)V
    .registers 3
    .param p1, "colorRes"    # I

    .line 117
    invoke-virtual {p0}, Landroid/support/v4/widget/CircleImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/CircleImageView;->setBackgroundColor(I)V

    .line 118
    return-void
.end method
