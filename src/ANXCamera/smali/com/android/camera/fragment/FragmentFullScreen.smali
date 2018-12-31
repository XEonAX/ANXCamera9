.class public Lcom/android/camera/fragment/FragmentFullScreen;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentFullScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/fragment/BaseFragment;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;",
        "Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;",
        "Lio/reactivex/functions/Consumer<",
        "Landroid/util/Pair<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xff6

.field private static final TAG:Ljava/lang/String; = "FragmentFullScreen"


# instance fields
.field private mBottomActionView:Landroid/view/ViewGroup;

.field private mBottomLayout:Landroid/view/ViewGroup;

.field private mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

.field private mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

.field private mCombineProgress:Landroid/widget/ProgressBar;

.field private mCombineReady:Z

.field private mConcatDisposable:Lio/reactivex/disposables/Disposable;

.field private mConcatProgress:Landroid/widget/ProgressBar;

.field private mConcatReady:Z

.field private mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

.field private mHandler:Landroid/os/Handler;

.field private mIsPlaying:Z

.field private mLiveViewLayout:Landroid/view/View;

.field private mLiveViewStub:Landroid/view/ViewStub;

.field private mPendingShare:Z

.field private mPreviewBack:Landroid/widget/ImageView;

.field private mPreviewCombine:Landroid/widget/ImageView;

.field private mPreviewLayout:Landroid/widget/FrameLayout;

.field private mPreviewShare:Landroid/widget/ImageView;

.field private mPreviewStart:Landroid/widget/ImageView;

.field private mPreviewTextureView:Landroid/view/TextureView;

.field private mRootView:Landroid/view/View;

.field private mSaveContentValues:Landroid/content/ContentValues;

.field private mSavedUri:Landroid/net/Uri;

.field private mScreenLightIndicator:Landroid/view/View;

.field private mShareProgress:Landroid/widget/ProgressBar;

.field private mTimeView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/view/View;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/view/View;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onCombineSuccess()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onCombineError()V

    return-void
.end method

.method static synthetic access$402(Lcom/android/camera/fragment/FragmentFullScreen;Z)Z
    .locals 0

    .line 55
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mIsPlaying:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/widget/ImageView;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/widget/ProgressBar;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method private animateIn()V
    .locals 0

    .line 395
    return-void
.end method

.method private checkAndShare()Z
    .locals 1

    .line 682
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 683
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startShare()V

    .line 684
    const/4 v0, 0x1

    return v0

    .line 686
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private initLiveListener()V
    .locals 1

    .line 398
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$5;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    .line 405
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$6;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    .line 437
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$7;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    .line 446
    return-void
.end method

.method private initLiveView(Landroid/view/View;)V
    .locals 3

    .line 350
    const v0, 0x7f0d005c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewLayout:Landroid/widget/FrameLayout;

    .line 351
    const v0, 0x7f0d005e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    .line 352
    const v0, 0x7f0d0065

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    .line 353
    const v0, 0x7f0d0067

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    .line 355
    const v0, 0x7f0d0060

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mTimeView:Landroid/widget/TextView;

    .line 358
    const v0, 0x7f0d0063

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    .line 359
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    iget v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCurrentMode:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    .line 360
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 361
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 363
    const v0, 0x7f0d0064

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    .line 364
    const v0, 0x7f0d0062

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    .line 365
    const v0, 0x7f0d0066

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    .line 366
    const v0, 0x7f0d005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    .line 369
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/CameraSnapView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 371
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 372
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 375
    const v0, 0x7f0d005f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    .line 376
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    .line 377
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 378
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 381
    const v0, 0x7f0d0061

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomLayout:Landroid/view/ViewGroup;

    .line 382
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomLayout:Landroid/view/ViewGroup;

    .line 383
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 384
    nop

    .line 385
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09007c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sget v1, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v0, v1

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 389
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    const v0, 0x7f0a0049

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 390
    return-void
.end method

.method private onCombineError()V
    .locals 2

    .line 449
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$8;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 455
    return-void
.end method

.method private onCombineSuccess()V
    .locals 2

    .line 458
    const-string v0, "FragmentFullScreen"

    const-string v1, "combineSuccess"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineReady:Z

    .line 460
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPendingShare:Z

    if-eqz v0, :cond_0

    .line 461
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 462
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    .line 463
    invoke-virtual {v0}, Lcom/android/camera/module/LiveModule;->startSaveToLocal()V

    .line 464
    return-void

    .line 466
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$9;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 474
    return-void
.end method

.method private onPlayCompleted()V
    .locals 2

    .line 477
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$10;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$10;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 484
    return-void
.end method

.method private pausePlay()V
    .locals 2

    .line 560
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mIsPlaying:Z

    if-nez v0, :cond_0

    .line 561
    return-void

    .line 563
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 564
    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mIsPlaying:Z

    .line 566
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 567
    if-nez v0, :cond_1

    .line 568
    return-void

    .line 571
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->pausePlay()V

    .line 573
    return-void
.end method

.method private setProgressBarVisible(I)V
    .locals 4

    .line 584
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 585
    return-void

    .line 588
    :cond_0
    const-wide/16 v0, 0x12c

    const/4 v2, 0x2

    if-nez p1, :cond_1

    .line 589
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 590
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 591
    new-array p1, v2, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 592
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 593
    const-wide/16 v0, 0xa0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 594
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 595
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$11;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$11;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 604
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 605
    goto :goto_0

    .line 606
    :cond_1
    new-array p1, v2, [F

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 607
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 608
    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 609
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$12;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$12;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 616
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$13;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$13;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 637
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 639
    :goto_0
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private showExitConfirm()V
    .locals 3

    .line 304
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 306
    const v1, 0x7f0b0268

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 307
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 309
    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$3;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    const v2, 0x7f0b0269

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 316
    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$4;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    const v2, 0x7f0b01b4

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 322
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 323
    return-void
.end method

.method private startCombine()V
    .locals 4

    .line 576
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineReady:Z

    .line 577
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveContentValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 579
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xd1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 580
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface {v1, v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->combineVideoAudio(Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 581
    return-void
.end method

.method private startConcatVideoIfNeed()V
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 241
    return-void

    .line 244
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    .line 245
    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mIsPlaying:Z

    .line 248
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$2;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 256
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 257
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 258
    invoke-virtual {v0, p0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatDisposable:Lio/reactivex/disposables/Disposable;

    .line 259
    return-void
.end method

.method private startPlay()V
    .locals 2

    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mIsPlaying:Z

    .line 551
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 552
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewLayout:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 554
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 555
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->startPlay()V

    .line 556
    return-void
.end method

.method private startShare()V
    .locals 4

    .line 691
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPendingShare:Z

    .line 692
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 693
    const-string v1, "android.intent.extra.STREAM"

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 694
    const/4 v1, 0x2

    invoke-static {v1}, Lcom/android/camera/Util;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 695
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 696
    const v1, 0x7f0b026a

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentFullScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 698
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 701
    goto :goto_0

    .line 699
    :catch_0
    move-exception v0

    .line 700
    const-string v1, "FragmentFullScreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to share video "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 702
    :goto_0
    return-void
.end method


# virtual methods
.method public accept(Landroid/util/Pair;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 264
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->canProvide()Z

    move-result v0

    if-nez v0, :cond_0

    .line 265
    return-void

    .line 267
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    .line 268
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    .line 269
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    .line 270
    const-string p1, "concat:"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 273
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->initLiveListener()V

    .line 274
    new-instance p1, Landroid/view/TextureView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewTextureView:Landroid/view/TextureView;

    .line 275
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewLayout:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewTextureView:Landroid/view/TextureView;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 276
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewTextureView:Landroid/view/TextureView;

    iget-object v5, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    iget-object v6, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface/range {v1 .. v6}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->init(Landroid/view/TextureView;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 278
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-nez p1, :cond_1

    .line 279
    const-string p1, "FragmentFullScreen"

    const-string v1, "concat finish and start preview"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 281
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startPlay()V

    goto :goto_0

    .line 282
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 283
    const-string p1, "FragmentFullScreen"

    const-string v1, "concat finish and start save"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 285
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible(I)V

    .line 286
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startCombine()V

    goto :goto_0

    .line 288
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 289
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat finish and pending share"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startCombine()V

    .line 293
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 55
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentFullScreen;->accept(Landroid/util/Pair;)V

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 147
    const/16 v0, 0xff6

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 142
    const v0, 0x7f04001a

    return v0
.end method

.method public getSaveContentValues()Landroid/content/ContentValues;
    .locals 1

    .line 678
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveContentValues:Landroid/content/ContentValues;

    return-object v0
.end method

.method public hideScreenLight()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 104
    return-void

    .line 106
    :cond_0
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$1;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 113
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    .line 73
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    .line 74
    const v0, 0x7f0d0058

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    .line 75
    const v0, 0x7f0d0057

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewStub:Landroid/view/ViewStub;

    .line 76
    return-void
.end method

.method public isLiveRecordPreviewShown()Z
    .locals 1

    .line 662
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onBackEvent(I)Z
    .locals 1

    .line 644
    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    .line 646
    return v0

    .line 650
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 651
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->showExitConfirm()V

    .line 652
    const/4 p1, 0x1

    return p1

    .line 657
    :cond_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 488
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    .line 489
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    .line 490
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 494
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d005d

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eq p1, v0, :cond_5

    const v0, 0x7f0d0066

    if-eq p1, v0, :cond_3

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 513
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    if-eqz p1, :cond_1

    .line 514
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onCombineSuccess()V

    goto/16 :goto_0

    .line 515
    :cond_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    if-nez p1, :cond_2

    .line 516
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat not finished, show save progress and wait to save"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 518
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible(I)V

    .line 519
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startConcatVideoIfNeed()V

    goto :goto_0

    .line 521
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->pausePlay()V

    .line 522
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 523
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible(I)V

    .line 524
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startCombine()V

    .line 527
    goto :goto_0

    .line 508
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->showExitConfirm()V

    .line 509
    goto :goto_0

    .line 531
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->checkAndShare()Z

    move-result p1

    if-nez p1, :cond_7

    .line 532
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPendingShare:Z

    .line 533
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 534
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 535
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    if-nez p1, :cond_4

    .line 536
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat not finished, show share progress and wait to share"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startConcatVideoIfNeed()V

    goto :goto_0

    .line 539
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->pausePlay()V

    .line 540
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startCombine()V

    goto :goto_0

    .line 496
    :cond_5
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    if-nez p1, :cond_6

    .line 497
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat not finished, show play progress"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 499
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 500
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startConcatVideoIfNeed()V

    goto :goto_0

    .line 502
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startPlay()V

    .line 504
    nop

    .line 546
    :cond_7
    :goto_0
    return-void

    .line 491
    :cond_8
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d0062
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onLiveSaveToLocalFinished(Landroid/net/Uri;)V
    .locals 1

    .line 668
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    .line 669
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPendingShare:Z

    if-eqz p1, :cond_0

    .line 670
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 671
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 672
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startShare()V

    .line 674
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 298
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 299
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->pausePlay()V

    .line 301
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 179
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 180
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    .line 181
    if-eqz p3, :cond_0

    .line 182
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 184
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    .line 187
    :cond_1
    :goto_0
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 0

    .line 126
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .line 136
    const/4 v0, 0x0

    return-object v0
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

    .line 191
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 193
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 194
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_0
    return-void
.end method

.method public quitLiveRecordPreview(Z)V
    .locals 2

    .line 328
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 331
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 333
    if-nez v0, :cond_0

    .line 334
    return-void

    .line 336
    :cond_0
    if-eqz p1, :cond_1

    .line 337
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewDoneClicked()V

    goto :goto_0

    .line 339
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 343
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 344
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->onDestory()V

    .line 346
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 80
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 81
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 82
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentFullScreen;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 83
    return-void
.end method

.method public setScreenLightColor(I)V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 118
    return-void
.end method

.method public showScreenLight()V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 95
    return-void

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 98
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 99
    return-void
.end method

.method public startLiveRecordPreview(Landroid/content/ContentValues;)V
    .locals 3

    .line 204
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSavedUri:Landroid/net/Uri;

    .line 205
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveContentValues:Landroid/content/ContentValues;

    .line 207
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-nez p1, :cond_0

    .line 208
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewStub:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    .line 209
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentFullScreen;->initLiveView(Landroid/view/View;)V

    .line 212
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewLayout:Landroid/widget/FrameLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 213
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 214
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 215
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 216
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mShareProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 219
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 220
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewCombine:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 221
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 222
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 223
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 227
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v2, 0xc9

    invoke-virtual {p1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 228
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mTimeView:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->getTimeValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mTimeView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 232
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 233
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 234
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startConcatVideoIfNeed()V

    .line 235
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 87
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 88
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 89
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentFullScreen;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 90
    return-void
.end method
