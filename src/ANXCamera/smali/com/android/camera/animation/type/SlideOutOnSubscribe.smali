.class public Lcom/android/camera/animation/type/SlideOutOnSubscribe;
.super Lcom/android/camera/animation/type/BaseOnSubScribe;
.source "SlideOutOnSubscribe.java"


# instance fields
.field private mGravity:I


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/android/camera/animation/type/BaseOnSubScribe;-><init>(Landroid/view/View;)V

    .line 17
    iput p2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mGravity:I

    .line 18
    return-void
.end method

.method public static directSetResult(Landroid/view/View;I)V
    .locals 4

    .line 60
    nop

    .line 61
    nop

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 65
    const/4 v2, 0x3

    const/4 v3, 0x0

    if-eq p1, v2, :cond_3

    const/4 v2, 0x5

    if-eq p1, v2, :cond_2

    const/16 v0, 0x30

    if-eq p1, v0, :cond_1

    const/16 v0, 0x50

    if-eq p1, v0, :cond_0

    .line 80
    move v1, v3

    goto :goto_1

    .line 76
    :cond_0
    goto :goto_1

    .line 70
    :cond_1
    neg-int v1, v1

    .line 71
    goto :goto_1

    .line 73
    :cond_2
    nop

    .line 74
    goto :goto_0

    .line 67
    :cond_3
    neg-int v0, v0

    .line 68
    nop

    .line 80
    :goto_0
    move v1, v3

    move v3, v0

    :goto_1
    int-to-float p1, v3

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 81
    int-to-float p1, v1

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 82
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 83
    const/4 p1, 0x4

    invoke-static {p0, p1}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 84
    return-void
.end method


# virtual methods
.method protected getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .locals 6

    .line 22
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 24
    nop

    .line 25
    nop

    .line 26
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 27
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 29
    iget v3, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mGravity:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    const/4 v4, 0x5

    if-eq v3, v4, :cond_2

    const/16 v0, 0x30

    if-eq v3, v0, :cond_1

    const/16 v0, 0x50

    if-eq v3, v0, :cond_0

    .line 44
    move v0, v1

    goto :goto_1

    .line 40
    :cond_0
    nop

    .line 44
    move v0, v2

    goto :goto_1

    .line 34
    :cond_1
    neg-int v0, v2

    .line 35
    goto :goto_1

    .line 37
    :cond_2
    nop

    .line 38
    goto :goto_0

    .line 31
    :cond_3
    neg-int v0, v0

    .line 32
    nop

    .line 44
    :goto_0
    move v5, v1

    move v1, v0

    move v0, v5

    :goto_1
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 45
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 46
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 48
    iget-object v2, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    int-to-float v1, v1

    .line 49
    invoke-virtual {v2, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    int-to-float v0, v0

    .line 50
    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 48
    return-object v0
.end method

.method protected onAnimationEnd()V
    .locals 2

    .line 55
    invoke-super {p0}, Lcom/android/camera/animation/type/BaseOnSubScribe;->onAnimationEnd()V

    .line 56
    iget-object v0, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mAniView:Landroid/view/View;

    iget-boolean v1, p0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->mTargetGone:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    invoke-static {v0, v1}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 57
    return-void
.end method
