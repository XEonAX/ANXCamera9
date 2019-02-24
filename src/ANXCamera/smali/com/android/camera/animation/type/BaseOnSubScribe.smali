.class public abstract Lcom/android/camera/animation/type/BaseOnSubScribe;
.super Ljava/lang/Object;
.source "BaseOnSubScribe.java"

# interfaces
.implements Lio/reactivex/CompletableOnSubscribe;


# instance fields
.field protected mAniView:Landroid/view/View;

.field protected mDurationTime:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field protected mStartDelayTime:I

.field protected mTargetGone:Z


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/16 v0, 0x12c

    iput v0, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mDurationTime:I

    .line 30
    iput-object p1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mAniView:Landroid/view/View;

    .line 31
    return-void
.end method

.method protected static final setAnimateViewVisible(Landroid/view/View;I)V
    .locals 1

    .line 99
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 103
    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;
.end method

.method protected onAnimationEnd()V
    .locals 0

    .line 95
    return-void
.end method

.method public setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;
    .locals 0

    .line 39
    iput p1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mDurationTime:I

    .line 40
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 45
    return-object p0
.end method

.method public setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;
    .locals 0

    .line 34
    iput p1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mStartDelayTime:I

    .line 35
    return-object p0
.end method

.method public final startAnimationImmediately()V
    .locals 1

    .line 106
    invoke-static {p0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 107
    return-void
.end method

.method public subscribe(Lio/reactivex/CompletableEmitter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    invoke-virtual {p0}, Lcom/android/camera/animation/type/BaseOnSubScribe;->getAnimation()Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mStartDelayTime:I

    int-to-long v1, v1

    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mDurationTime:I

    int-to-long v1, v1

    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/android/camera/animation/AnimationDelegate;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    :goto_0
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/animation/type/BaseOnSubScribe$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/animation/type/BaseOnSubScribe$1;-><init>(Lcom/android/camera/animation/type/BaseOnSubScribe;Lio/reactivex/CompletableEmitter;)V

    .line 61
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 90
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 91
    return-void
.end method

.method public targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;
    .locals 1

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/animation/type/BaseOnSubScribe;->mTargetGone:Z

    .line 50
    return-object p0
.end method
