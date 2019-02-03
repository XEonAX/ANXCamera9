.class public Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentDualCameraBokehAdjust.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/manually/ManuallyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# static fields
.field public static final FRAGMENT_INFO:I = 0xffb

.field private static final HIDE_POPUP:I = 0x1

.field public static final TAG:Ljava/lang/String; = "BokehAdjust"


# instance fields
.field private mBokehFButtonHeight:I

.field private mCurrentState:I

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDualBokehFButton:Landroid/view/View;

.field private mDualParentLayout:Landroid/view/ViewGroup;

.field private mFNumberHideStatus:Z

.field private mFNumberTextView:Landroid/widget/TextView;

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

    .line 56
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 76
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 95
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$1;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    .line 106
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->sendHideMessage()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/widget/ImageView;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/view/View;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    return-object p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 0

    .line 626
    const p2, 0x7f0b0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 627
    return-void
.end method

.method private hideSlideView()V
    .locals 5

    .line 494
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 495
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 496
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->setEnable(Z)V

    .line 499
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    .line 500
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 501
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 502
    if-nez v0, :cond_1

    .line 503
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 505
    :cond_1
    new-instance v2, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v2, v3, v4}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v3, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v3}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 506
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 505
    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    .line 506
    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 510
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 511
    if-nez v0, :cond_3

    .line 512
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 514
    :cond_3
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 515
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 514
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 515
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 519
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    const/16 v2, 0x8

    if-nez v0, :cond_6

    .line 520
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

    .line 521
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 520
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 521
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_4

    .line 523
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

    .line 524
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 523
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 524
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 527
    :goto_4
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->notifyTipsMargin(I)V

    .line 528
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 529
    if-eqz v0, :cond_8

    .line 530
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 532
    :cond_8
    return-void
.end method

.method private initSlideFNumberView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 3

    .line 449
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {v0, v1, p1, v2, p0}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    .line 450
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnPositionSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;)V

    .line 451
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setJustifyEnabled(Z)V

    .line 452
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    .line 453
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object p1

    .line 454
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->mapFNumberToPosition(Ljava/lang/String;)F

    move-result p1

    .line 455
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(F)V

    .line 456
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->resetFNumber()V

    .line 457
    return-void
.end method

.method private isVisible(Landroid/view/View;)Z
    .locals 1

    .line 376
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

    .line 536
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 537
    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 538
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 539
    return-void
.end method

.method private requestFNumber(Ljava/lang/String;)V
    .locals 3

    .line 552
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 553
    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 554
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 555
    const-string v0, "BokehAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "new f number is ignored: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    return-void

    .line 559
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    .line 560
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 561
    if-eqz v0, :cond_1

    .line 562
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onBokehFNumberValueChanged(Ljava/lang/String;)V

    .line 564
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 565
    return-void
.end method

.method private resetFNumber()V
    .locals 0

    .line 196
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 197
    return-void
.end method

.method private sendHideMessage()V
    .locals 4

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 192
    return-void
.end method

.method private setFNumberText()V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 201
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 202
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object v0

    .line 203
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    const/16 v3, 0x21

    invoke-static {v1, v0, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 204
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    const v2, 0x7f090105

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 206
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$4;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    return-void
.end method

.method private showSlideView()V
    .locals 4

    .line 461
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 462
    const/16 v1, 0xc2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 463
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 464
    const-string v0, "BokehAdjust"

    const-string v1, "beauty panel shown. do not show the slide view."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    return-void

    .line 467
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->setEnable(Z)V

    .line 468
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 469
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 470
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 471
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 472
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 471
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 472
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 474
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 475
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 476
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaInOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 475
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 476
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 477
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->notifyTipsMargin(I)V

    .line 478
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xaf

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 479
    if-eqz v0, :cond_1

    .line 480
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideTipImage()V

    .line 482
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 483
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    .line 487
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 488
    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 489
    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 488
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 489
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 490
    iput-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 491
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 301
    const/16 v0, 0xffb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 296
    const v0, 0x7f040017

    return v0
.end method

.method public hideFNumberPanel(ZZ)V
    .locals 1

    .line 248
    if-eqz p2, :cond_0

    .line 249
    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberHideStatus:Z

    .line 251
    :cond_0
    iget p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 252
    return-void

    .line 254
    :cond_1
    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 256
    if-eqz p1, :cond_2

    .line 257
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 258
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 260
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 262
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 130
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 132
    nop

    .line 133
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 134
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 136
    const v0, 0x7f0d0049

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    .line 138
    const v0, 0x7f0d004d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    .line 139
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    const v1, 0x7f0d004f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberTextView:Landroid/widget/TextView;

    .line 140
    const v0, 0x7f0d0050

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    .line 141
    const v0, 0x7f0d0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    .line 142
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    .line 143
    const v0, 0x7f0d0052

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/HorizontalSlideView;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    .line 144
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 146
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 148
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    const v0, 0x7f090106

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 149
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$3;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 158
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0096

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    .line 161
    new-instance p1, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c0014

    invoke-direct {p1, v0, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 162
    new-instance p1, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c0015

    invoke-direct {p1, v0, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 164
    nop

    .line 165
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f060001

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    .line 166
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 167
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 168
    nop

    .line 169
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x7f060000

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    .line 170
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 171
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 172
    nop

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f060002

    invoke-static {p1, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    .line 174
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 175
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 178
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 179
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

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a00c3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr p1, v1

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 182
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    .line 184
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->adjustViewBackground(Landroid/view/View;I)V

    .line 186
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->provideAnimateElement(ILjava/util/List;I)V

    .line 187
    return-void
.end method

.method public isFNumberVisible()Z
    .locals 2

    .line 226
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    .line 227
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 226
    :goto_0
    return v1
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 2

    .line 601
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 605
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/16 v0, 0xab

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 608
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 609
    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 610
    return-void

    .line 613
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 614
    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 615
    return-void

    .line 622
    :cond_2
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->provideAnimateElement(ILjava/util/List;I)V

    .line 623
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 0

    .line 579
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 580
    const/4 p2, 0x3

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 582
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->adjustViewBackground(Landroid/view/View;I)V

    .line 586
    :goto_0
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 3

    .line 381
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 383
    return v1

    .line 386
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/16 v2, 0xab

    if-eq v0, v2, :cond_1

    .line 387
    return v1

    .line 390
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 391
    return v1

    .line 394
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    .line 396
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalSlideView;->stopScroll()V

    .line 397
    return v1

    .line 399
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 401
    const/4 p1, 0x1

    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 406
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 407
    return-void

    .line 410
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 411
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 412
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 413
    return-void

    .line 416
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d004d

    const/4 v1, 0x0

    if-eq p1, v0, :cond_5

    const v0, 0x7f0d0050

    if-eq p1, v0, :cond_2

    goto :goto_0

    .line 418
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, v1

    if-eqz p1, :cond_4

    .line 419
    new-instance p1, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;

    .line 420
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    .line 421
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->initSlideFNumberView(Lcom/android/camera/data/data/ComponentData;)V

    .line 422
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->sendHideMessage()V

    .line 426
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa2

    .line 427
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 429
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    .line 430
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 431
    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p1

    if-eqz p1, :cond_3

    if-eqz v0, :cond_3

    .line 432
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 434
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->showSlideView()V

    .line 435
    goto :goto_0

    .line 437
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 439
    goto :goto_0

    .line 441
    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, v1

    if-eqz p1, :cond_6

    .line 442
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 446
    :cond_6
    :goto_0
    return-void
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 544
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isInModeChanging()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 545
    return-void

    .line 547
    :cond_0
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->requestFNumber(Ljava/lang/String;)V

    .line 548
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 591
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 592
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentMode:I

    const/16 v1, 0xab

    if-ne v0, v1, :cond_0

    .line 593
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 594
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 597
    :cond_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    .line 307
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 309
    const/4 v0, 0x0

    const/4 v1, 0x3

    if-ne p3, v1, :cond_0

    .line 310
    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberHideStatus:Z

    .line 313
    :cond_0
    nop

    .line 314
    const/16 v2, 0xab

    const/4 v3, 0x1

    const/4 v4, -0x1

    if-eq p1, v2, :cond_1

    .line 332
    :goto_0
    move p1, v4

    goto :goto_1

    .line 317
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result p1

    if-nez p1, :cond_2

    .line 320
    goto :goto_0

    .line 321
    :cond_2
    if-eq p3, v1, :cond_3

    iget-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberHideStatus:Z

    if-eqz p1, :cond_3

    .line 323
    goto :goto_0

    .line 325
    :cond_3
    nop

    .line 326
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    iget p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDegree:I

    int-to-float p3, p3

    invoke-virtual {p1, p3}, Landroid/view/View;->setRotation(F)V

    .line 327
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDegree:I

    int-to-float p3, p3

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setRotation(F)V

    .line 332
    move p1, v3

    :goto_1
    iget p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    if-ne p3, p1, :cond_5

    .line 333
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    if-ne v3, p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 334
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 336
    :cond_4
    return-void

    .line 339
    :cond_5
    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 341
    const/16 p3, 0x8

    if-eq p1, v4, :cond_a

    if-eq p1, v3, :cond_6

    goto/16 :goto_4

    .line 343
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 344
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    const/4 v0, 0x4

    if-nez p1, :cond_7

    .line 345
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 347
    :cond_7
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 348
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eq v0, p3, :cond_8

    iget p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    int-to-float p3, p3

    goto :goto_2

    :cond_8
    const/4 p3, 0x0

    :goto_2
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 349
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->resetFNumber()V

    .line 350
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_d

    .line 351
    if-nez p2, :cond_9

    .line 352
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_4

    .line 354
    :cond_9
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 355
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 354
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 361
    :cond_a
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 362
    if-nez p2, :cond_b

    .line 363
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_3

    .line 365
    :cond_b
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    .line 367
    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 366
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 365
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    :cond_c
    :goto_3
    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    .line 373
    :cond_d
    :goto_4
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

    .line 569
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 570
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 571
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualBokehFButton:Landroid/view/View;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 572
    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mImageIndicator:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 574
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 278
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 280
    const/16 v0, 0xd2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 282
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 283
    return-void
.end method

.method public showFNumberPanel()V
    .locals 2

    .line 266
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mFNumberHideStatus:Z

    .line 267
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 268
    return-void

    .line 270
    :cond_0
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    .line 272
    const-string v0, "BokehAdjust"

    const-string v1, "showFNumber"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->hideSlideView()V

    .line 274
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 287
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 288
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 289
    const/16 v0, 0xd2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 291
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 292
    return-void
.end method

.method public updateFNumberValue()V
    .locals 0

    .line 221
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->setFNumberText()V

    .line 222
    return-void
.end method

.method public visibleHeight()I
    .locals 3

    .line 232
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mCurrentState:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 233
    return v1

    .line 235
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 236
    return v1

    .line 239
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mShowImageIndicator:Z

    if-eqz v0, :cond_2

    .line 240
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    return v0

    .line 243
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mBokehFButtonHeight:I

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->mSlideLayoutHeight:I

    add-int/2addr v0, v1

    return v0
.end method
