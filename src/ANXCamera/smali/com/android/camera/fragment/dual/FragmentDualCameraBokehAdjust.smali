.class public Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentDualCameraBokehAdjust.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/manually/ManuallyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$CenterAlignImageSpan;
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xffb

.field private static final HIDE_POPUP:I = 0x1


# instance fields
.field private fDrawable:Landroid/graphics/drawable/Drawable;

.field private fImageSpan:Landroid/text/style/ImageSpan;

.field private mBokehFButtonHeight:I

.field private mCurrentState:I

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDualBokehFButton:Landroid/widget/TextView;

.field private mDualParentLayout:Landroid/view/ViewGroup;

.field private mHandler:Landroid/os/Handler;

.field private mHorizontalSlideLayout:Landroid/view/ViewGroup;

.field private mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

.field private mImageIndicator:Landroid/widget/ImageView;

.field private mShowImageIndicator:Z

.field private mSlideLayoutHeight:I

.field private mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

.field private mSnapStyle:Landroid/text/style/TextAppearanceSpan;

.field private mStringBuilder:Landroid/text/SpannableStringBuilder;

.field private mXTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mZoomInAnimator:Landroid/animation/AnimatorSet;

.field private mZoomInOutAnimator:Landroid/animation/AnimatorSet;

.field private mZoomOutAnimator:Landroid/animation/AnimatorSet;

.field private mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 68
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 104
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$1;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    .line 115
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->sendHideMessage()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/widget/ImageView;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/widget/TextView;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    return-object p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 0

    .line 588
    const p2, 0x7f0a0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 589
    return-void
.end method

.method private hideSlideView()V
    .locals 5

    .line 483
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 484
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 485
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->setEnable(Z)V

    .line 488
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    .line 489
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 490
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 491
    if-nez v0, :cond_1

    .line 492
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 494
    :cond_1
    new-instance v2, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v2, v3, v4}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v3, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v3}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 495
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 494
    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    .line 495
    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 499
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 500
    if-nez v0, :cond_3

    .line 501
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 503
    :cond_3
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 504
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 503
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 504
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 508
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    const/16 v2, 0x8

    if-nez v0, :cond_6

    .line 509
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v4

    if-eq v4, v2, :cond_5

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    goto :goto_2

    :cond_5
    move v2, v1

    :goto_2
    invoke-direct {v0, v3, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 510
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 509
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 510
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_4

    .line 512
    :cond_6
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v4

    if-eq v4, v2, :cond_7

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    goto :goto_3

    :cond_7
    move v2, v1

    :goto_3
    invoke-direct {v0, v3, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 513
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 512
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 513
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 516
    :goto_4
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->notifyTipsMargin(I)V

    .line 517
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 518
    if-eqz v0, :cond_8

    .line 519
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 521
    :cond_8
    return-void
.end method

.method private initSlideFNumberView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 3

    .line 450
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {v0, v1, p1, v2, p0}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    .line 451
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnPositionSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;)V

    .line 452
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setJustifyEnabled(Z)V

    .line 453
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    .line 454
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object p1

    .line 455
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mapFNumberToPosition(Ljava/lang/String;)F

    move-result p1

    .line 456
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(F)V

    .line 457
    return-void
.end method

.method private isVisible(Landroid/view/View;)Z
    .locals 1

    .line 383
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private notifyTipsMargin(I)V
    .locals 2

    .line 525
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 526
    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 527
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 528
    return-void
.end method

.method private requestFNumber(Ljava/lang/String;)V
    .locals 2

    .line 541
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 542
    const/16 v1, 0xae

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 543
    if-eqz v0, :cond_0

    .line 544
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onBokehFNumberValueChanged(Ljava/lang/String;)V

    .line 546
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 547
    return-void
.end method

.method private resetFNumber()V
    .locals 0

    .line 207
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 208
    return-void
.end method

.method private sendHideMessage()V
    .locals 4

    .line 201
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 202
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 203
    return-void
.end method

.method private setFNumberText()V
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 213
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string v1, "F"

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    const/16 v3, 0x21

    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 214
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object v0

    .line 215
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v1, v0, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 216
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 217
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    const v4, 0x7f0b00ff

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v0, v5, v2

    invoke-virtual {p0, v4, v5}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 218
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    const-wide/16 v4, 0xbb8

    invoke-virtual {v0, v1, v4, v5}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fImageSpan:Landroid/text/style/ImageSpan;

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 228
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    return-void
.end method

.method private showSlideView()V
    .locals 4

    .line 460
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->setEnable(Z)V

    .line 461
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 462
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 463
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 464
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 465
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 464
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 465
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 467
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 468
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 469
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 468
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 469
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 470
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->notifyTipsMargin(I)V

    .line 471
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xaf

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 472
    if-eqz v0, :cond_0

    .line 473
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideTipImage()V

    .line 474
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    .line 476
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 477
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 478
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 477
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 478
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 479
    iput-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 480
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 321
    const/16 v0, 0xffb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 316
    const v0, 0x7f040016

    return v0
.end method

.method public hideFNumberPanel(Z)V
    .locals 1

    .line 283
    if-eqz p1, :cond_0

    .line 284
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 285
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 287
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 289
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 139
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 141
    nop

    .line 142
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 145
    const v0, 0x7f0d0045

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    .line 147
    const v0, 0x7f0d0049

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    .line 148
    const v0, 0x7f0d004a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    .line 149
    const v0, 0x7f0d004b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    .line 150
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    .line 151
    const v0, 0x7f0d004c

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/HorizontalSlideView;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    .line 152
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 154
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 156
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    const v0, 0x7f0b0100

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 157
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$3;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 166
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f090092

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    .line 169
    new-instance p1, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c0014

    invoke-direct {p1, v0, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 170
    new-instance p1, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c0015

    invoke-direct {p1, v0, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 172
    nop

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f060001

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    .line 174
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 175
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 176
    nop

    .line 177
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x7f060000

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    .line 178
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 179
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 180
    nop

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f060002

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    .line 182
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 183
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 186
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 187
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    int-to-float p1, p1

    const/high16 v1, 0x3f400000    # 0.75f

    div-float v1, p1, v1

    sub-float/2addr v1, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v1, p1

    float-to-int p1, v1

    .line 189
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0900bf

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr p1, v1

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 190
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    .line 192
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->adjustViewBackground(Landroid/view/View;I)V

    .line 193
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->provideAnimateElement(ILjava/util/List;Z)V

    .line 195
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f02002f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fDrawable:Landroid/graphics/drawable/Drawable;

    .line 196
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v2

    invoke-virtual {p1, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 197
    new-instance p1, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$CenterAlignImageSpan;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p1, p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$CenterAlignImageSpan;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->fImageSpan:Landroid/text/style/ImageSpan;

    .line 198
    return-void
.end method

.method public isFNumberVisible()Z
    .locals 2

    .line 261
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    .line 262
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 261
    :goto_0
    return v1
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 2

    .line 583
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 584
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->provideAnimateElement(ILjava/util/List;Z)V

    .line 585
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 0

    .line 561
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 562
    const/4 p2, 0x3

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 564
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->adjustViewBackground(Landroid/view/View;I)V

    .line 568
    :goto_0
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 2

    .line 388
    iget-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 390
    return v0

    .line 393
    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/16 v1, 0xab

    if-eq p1, v1, :cond_1

    .line 394
    return v0

    .line 397
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 398
    return v0

    .line 401
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 403
    const/4 p1, 0x1

    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 408
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 409
    return-void

    .line 412
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 413
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 414
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 415
    return-void

    .line 418
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 420
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_3

    .line 421
    new-instance p1, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;

    .line 422
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    .line 423
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->initSlideFNumberView(Lcom/android/camera/data/data/ComponentData;)V

    .line 424
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->showSlideView()V

    .line 428
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa2

    .line 429
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 431
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    .line 432
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 433
    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p1

    if-eqz p1, :cond_2

    if-eqz v0, :cond_2

    .line 434
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 436
    :cond_2
    goto :goto_0

    .line 438
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 440
    goto :goto_0

    .line 442
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_4

    .line 443
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 447
    :cond_4
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0d0049
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 533
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isInModeChanging()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 534
    return-void

    .line 536
    :cond_0
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->requestFNumber(Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 573
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 574
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/16 v1, 0xab

    if-ne v0, v1, :cond_0

    .line 575
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 576
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 579
    :cond_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 327
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    .line 328
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 330
    nop

    .line 331
    const/4 p3, -0x1

    const/4 v0, 0x1

    const/16 v1, 0xab

    if-eq p1, v1, :cond_0

    .line 339
    move p1, p3

    goto :goto_0

    .line 333
    :cond_0
    nop

    .line 334
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDegree:I

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setRotation(F)V

    .line 335
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDegree:I

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setRotation(F)V

    .line 339
    move p1, v0

    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    if-ne v1, p1, :cond_2

    .line 340
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    if-ne v0, p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 341
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 343
    :cond_1
    return-void

    .line 346
    :cond_2
    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 348
    const/16 v1, 0x8

    if-eq p1, p3, :cond_7

    if-eq p1, v0, :cond_3

    goto/16 :goto_3

    .line 350
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 351
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    const/4 p3, 0x4

    if-nez p1, :cond_4

    .line 352
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 354
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 355
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p3

    if-eq p3, v1, :cond_5

    iget p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float p3, p3

    goto :goto_1

    :cond_5
    const/4 p3, 0x0

    :goto_1
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 356
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->resetFNumber()V

    .line 357
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 358
    if-nez p2, :cond_6

    .line 359
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 361
    :cond_6
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 362
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 361
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 368
    :cond_7
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 369
    if-nez p2, :cond_8

    .line 370
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_2

    .line 372
    :cond_8
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    .line 374
    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 373
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 372
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    :cond_9
    :goto_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 380
    :cond_a
    :goto_3
    return-void
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .line 551
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 552
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 553
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/widget/TextView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 554
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 556
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 298
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 300
    const/16 v0, 0xd2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 302
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 303
    return-void
.end method

.method public showFNumberPanel()V
    .locals 0

    .line 293
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 294
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 307
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 308
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 309
    const/16 v0, 0xd2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 311
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 312
    return-void
.end method

.method public updateFNumberValue()V
    .locals 0

    .line 256
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 257
    return-void
.end method

.method public visibleHeight()I
    .locals 3

    .line 267
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 268
    return v1

    .line 270
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 271
    return v1

    .line 274
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    if-eqz v0, :cond_2

    .line 275
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    return v0

    .line 278
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    add-int/2addr v0, v1

    return v0
.end method
