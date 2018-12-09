.class public Lcom/android/camera/animation/type/SlideInOnSubscribe;
.super Lcom/android/camera/animation/type/BaseOnSubScribe;
.source "SlideInOnSubscribe.java"


# instance fields
.field private mGravity:I


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/android/camera/animation/type/BaseOnSubScribe;-><init>(Landroid/view/View;)V

    .line 18
    iput p2, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mGravity:I

    .line 19
    return-void
.end method

.method public static directSetResult(Landroid/view/View;I)V
    .locals 0

    .line 55
    const/4 p1, 0x0

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 56
    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 57
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 58
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 59
    return-void
.end method


# virtual methods
.method protected getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .locals 6

    .line 23
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 25
    nop

    .line 26
    nop

    .line 27
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 28
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 30
    iget v3, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mGravity:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    const/4 v4, 0x5

    if-eq v3, v4, :cond_2

    const/16 v0, 0x30

    if-eq v3, v0, :cond_1

    const/16 v0, 0x50

    if-eq v3, v0, :cond_0

    .line 45
    move v0, v1

    goto :goto_1

    .line 41
    :cond_0
    nop

    .line 45
    move v0, v2

    goto :goto_1

    .line 35
    :cond_1
    neg-int v0, v2

    .line 36
    goto :goto_1

    .line 38
    :cond_2
    nop

    .line 39
    goto :goto_0

    .line 32
    :cond_3
    neg-int v0, v0

    .line 33
    nop

    .line 45
    :goto_0
    move v5, v1

    move v1, v0

    move v0, v5

    :goto_1
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    int-to-float v1, v1

    invoke-static {v2, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 46
    iget-object v1, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    int-to-float v0, v0

    invoke-static {v1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 47
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 49
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideInOnSubscribe;->mAniView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 50
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 49
    return-object v0
.end method
