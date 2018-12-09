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

.field private mConcatDisposable:Lio/reactivex/disposables/Disposable;

.field private mConcatProgress:Landroid/widget/ProgressBar;

.field private mConcatReady:Z

.field private mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

.field private mHandler:Landroid/os/Handler;

.field private mLiveViewLayout:Landroid/view/View;

.field private mLiveViewStub:Landroid/view/ViewStub;

.field private mPreviewBack:Landroid/widget/ImageView;

.field private mPreviewSave:Landroid/widget/ImageView;

.field private mPreviewShare:Landroid/widget/ImageView;

.field private mPreviewStart:Landroid/widget/ImageView;

.field private mPreviewSurface:Landroid/widget/FrameLayout;

.field private mRootView:Landroid/view/View;

.field private mSaveContentValues:Landroid/content/ContentValues;

.field private mSaveProgress:Landroid/widget/ProgressBar;

.field private mScreenLightIndicator:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/view/View;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/view/View;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onCombineSuccess()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onPlayCompleted()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/FragmentFullScreen;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->onCombineError()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/widget/ImageView;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/FragmentFullScreen;)Landroid/widget/ProgressBar;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method private animateIn()V
    .locals 0

    .line 320
    return-void
.end method

.method private initLiveListener()V
    .locals 1

    .line 323
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$3;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    .line 330
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$4;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    .line 361
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$5;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    .line 369
    return-void
.end method

.method private initLiveView(Landroid/view/View;)V
    .locals 3

    .line 278
    const v0, 0x7f0d0055

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSurface:Landroid/widget/FrameLayout;

    .line 279
    const v0, 0x7f0d0057

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    .line 280
    const v0, 0x7f0d005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    .line 283
    const v0, 0x7f0d005b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    .line 284
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    iget v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCurrentMode:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    .line 285
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 286
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 288
    const v0, 0x7f0d005c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    .line 289
    const v0, 0x7f0d005a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    .line 290
    const v0, 0x7f0d005e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    .line 291
    const v0, 0x7f0d0056

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    .line 294
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/CameraSnapView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 300
    const v0, 0x7f0d0058

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    .line 301
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    .line 302
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 303
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 306
    const v0, 0x7f0d0059

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomLayout:Landroid/view/ViewGroup;

    .line 307
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomLayout:Landroid/view/ViewGroup;

    .line 308
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 309
    nop

    .line 310
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09007c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sget v1, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v0, v1

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 314
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mBottomActionView:Landroid/view/ViewGroup;

    const v0, 0x7f0a0049

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 315
    return-void
.end method

.method private onCombineError()V
    .locals 2

    .line 372
    const-string v0, "FragmentFullScreen"

    const-string v1, "combineError"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$6;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 379
    return-void
.end method

.method private onCombineSuccess()V
    .locals 2

    .line 382
    const-string v0, "FragmentFullScreen"

    const-string v1, "combineSuccess"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$7;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$7;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 389
    return-void
.end method

.method private onPlayCompleted()V
    .locals 2

    .line 392
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$8;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 398
    return-void
.end method

.method private setProgressBarVisible()V
    .locals 5

    .line 456
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 457
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 458
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 459
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 460
    const-wide/16 v1, 0xa0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 461
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const/high16 v2, 0x3e800000    # 0.25f

    const v3, 0x3dcccccd    # 0.1f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 462
    new-instance v1, Lcom/android/camera/fragment/FragmentFullScreen$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFullScreen$9;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 471
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 472
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private startConcatVideo()V
    .locals 2

    .line 207
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    .line 210
    new-instance v0, Lcom/android/camera/fragment/FragmentFullScreen$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentFullScreen$2;-><init>(Lcom/android/camera/fragment/FragmentFullScreen;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 218
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 219
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 220
    invoke-virtual {v0, p0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatDisposable:Lio/reactivex/disposables/Disposable;

    .line 221
    return-void
.end method

.method private startPlay()V
    .locals 2

    .line 439
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 440
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSurface:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 442
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 443
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->startPlay()V

    .line 444
    return-void
.end method

.method private startSave()V
    .locals 4

    .line 447
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 448
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible()V

    .line 449
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveContentValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 451
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xd1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 452
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface {v1, v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->combineVideoAudio(Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 453
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

    .line 226
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->canProvide()Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    return-void

    .line 229
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    .line 230
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    .line 231
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    .line 232
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

    .line 234
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 235
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->initLiveListener()V

    .line 236
    new-instance v2, Landroid/view/TextureView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 237
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSurface:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 238
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCombineListener:Lcom/ss/android/vesdk/VECommonCallback;

    iget-object v6, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mErrorListener:Lcom/ss/android/vesdk/VECommonCallback;

    invoke-interface/range {v1 .. v6}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->init(Landroid/view/TextureView;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VECommonCallback;Lcom/ss/android/vesdk/VECommonCallback;)V

    .line 240
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    .line 241
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat finish and start preview"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 243
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startPlay()V

    .line 246
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 247
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat finish and start save"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startSave()V

    .line 251
    :cond_2
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentFullScreen;->accept(Landroid/util/Pair;)V

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 135
    const/16 v0, 0xff6

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 130
    const v0, 0x7f040019

    return v0
.end method

.method public hideScreenLight()V
    .locals 2

    .line 91
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 92
    return-void

    .line 94
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

    .line 101
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    .line 61
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    .line 62
    const v0, 0x7f0d0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    .line 63
    const v0, 0x7f0d0050

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewStub:Landroid/view/ViewStub;

    .line 64
    return-void
.end method

.method public isLiveRecordPreviewShown()Z
    .locals 1

    .line 486
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
    .locals 2

    .line 476
    const/4 v0, 0x0

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 477
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentFullScreen;->quitLiveRecordPreview(Z)V

    .line 478
    const/4 p1, 0x1

    return p1

    .line 481
    :cond_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 402
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d0056

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eq p1, v0, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 420
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    if-nez p1, :cond_0

    .line 421
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat not finished, show save progress and wait to save"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 423
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible()V

    goto :goto_0

    .line 425
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->setProgressBarVisible()V

    .line 426
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startSave()V

    .line 429
    goto :goto_0

    .line 415
    :pswitch_1
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentFullScreen;->quitLiveRecordPreview(Z)V

    .line 416
    goto :goto_0

    .line 404
    :cond_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatReady:Z

    if-nez p1, :cond_2

    .line 405
    const-string p1, "FragmentFullScreen"

    const-string v0, "concat not finished, show play progress"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 407
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 409
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startPlay()V

    .line 411
    nop

    .line 436
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0d005a
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
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

    .line 159
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 160
    if-eqz p3, :cond_0

    .line 161
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 162
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 166
    :cond_0
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 0

    .line 114
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .line 124
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

    .line 170
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 172
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 173
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_0
    return-void
.end method

.method public quitLiveRecordPreview(Z)V
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 259
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 261
    if-nez v0, :cond_0

    .line 262
    return-void

    .line 264
    :cond_0
    if-eqz p1, :cond_1

    .line 265
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewDoneClicked()V

    goto :goto_0

    .line 267
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 271
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;

    .line 272
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$LiveVideoEditor;->onDestory()V

    .line 274
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 68
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 69
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 70
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentFullScreen;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 71
    return-void
.end method

.method public setScreenLightColor(I)V
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 106
    return-void
.end method

.method public showScreenLight()V
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 83
    return-void

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mScreenLightIndicator:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 86
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mRootView:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 87
    return-void
.end method

.method public startLiveRecordPreview(Landroid/content/ContentValues;)V
    .locals 2

    .line 183
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveContentValues:Landroid/content/ContentValues;

    .line 185
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    if-nez p1, :cond_0

    .line 186
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewStub:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    .line 187
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentFullScreen;->initLiveView(Landroid/view/View;)V

    .line 190
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSurface:Landroid/widget/FrameLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 191
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSurface:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 192
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mLiveViewLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 193
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mSaveProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 194
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mConcatProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 196
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mCameraSnapView:Lcom/android/camera/ui/CameraSnapView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 197
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewSave:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 198
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewBack:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 199
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewShare:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 200
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFullScreen;->mPreviewStart:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 202
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFullScreen;->startConcatVideo()V

    .line 203
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 75
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 76
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 77
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentFullScreen;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 78
    return-void
.end method
