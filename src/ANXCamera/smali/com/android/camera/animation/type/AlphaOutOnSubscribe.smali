.class public Lcom/android/camera/animation/type/AlphaOutOnSubscribe;
.super Lcom/android/camera/animation/type/BaseOnSubScribe;
.source "AlphaOutOnSubscribe.java"


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/android/camera/animation/type/BaseOnSubScribe;-><init>(Landroid/view/View;)V

    .line 15
    return-void
.end method

.method public static directSetResult(Landroid/view/View;)V
    .locals 1

    .line 31
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 32
    return-void
.end method


# virtual methods
.method protected getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .locals 2

    .line 19
    iget-object v0, p0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->mAniView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 20
    iget-object v0, p0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->mAniView:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 21
    iget-object v0, p0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->mAniView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    return-object v0
.end method

.method protected onAnimationEnd()V
    .locals 2

    .line 26
    invoke-super {p0}, Lcom/android/camera/animation/type/BaseOnSubScribe;->onAnimationEnd()V

    .line 27
    iget-object v0, p0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->mAniView:Landroid/view/View;

    iget-boolean v1, p0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->mTargetGone:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    invoke-static {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 28
    return-void
.end method
