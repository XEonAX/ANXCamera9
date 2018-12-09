.class public Lcom/android/camera/animation/type/TranslateYOnSubscribe;
.super Lcom/android/camera/animation/type/BaseOnSubScribe;
.source "TranslateYOnSubscribe.java"


# instance fields
.field private mDistanceY:I


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/android/camera/animation/type/BaseOnSubScribe;-><init>(Landroid/view/View;)V

    .line 16
    iput p2, p0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->mDistanceY:I

    .line 17
    return-void
.end method

.method public static directSetResult(Landroid/view/View;I)V
    .locals 1

    .line 26
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 27
    int-to-float p1, p1

    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 28
    return-void
.end method


# virtual methods
.method protected getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .locals 2

    .line 21
    iget-object v0, p0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->mAniView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setAnimateViewVisible(Landroid/view/View;I)V

    .line 22
    iget-object v0, p0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->mAniView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->mDistanceY:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    return-object v0
.end method
