.class public Lcom/android/camera/fragment/bottom/FragmentBottomAction;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
.implements Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;
.implements Lcom/android/camera/protocol/ModeProtocol$HandlerSwitcher;
.implements Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;
.implements Lcom/android/camera/ui/CameraSnapView$SnapListener;
.implements Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;


# static fields
.field public static final FRAGMENT_INFO:I = 0xf1

.field private static final MSG_SHOW_PROGRESS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "FragmentBottomAction"


# instance fields
.field private mBottomActionView:Landroid/widget/FrameLayout;

.field private mBottomAnimator:Landroid/animation/ValueAnimator;

.field private mBottomMenuLayout:Landroid/view/View;

.field private mBottomRecordingCameraPicker:Landroid/widget/ImageView;

.field private mBottomRecordingTime:Landroid/widget/TextView;

.field private mBottomRollDownHeight:I

.field private mCameraPickEnable:Z

.field private mCameraPicker:Landroid/widget/ImageView;

.field private mCaptureProgressDelay:I

.field private mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mCurrentBeautyActionMenuType:I

.field private mCurrentLiveActionMenuType:I

.field private mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

.field private mFilterListHeight:I

.field private mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

.field private mFragmentLayoutExtra:Landroid/view/View;

.field private mFragmentLayoutExtra2:Landroid/view/View;

.field private mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mInLoading:Z

.field private mIsBottomRollDown:Z

.field private mIsIntentAction:Z

.field private mIsShowFilter:Z

.field private mIsShowLighting:Z

.field private mLongPressBurst:Z

.field private mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

.field private mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

.field private mPostProcess:Landroid/widget/ProgressBar;

.field private mRecordProgressDelay:I

.field private mRecordingPause:Landroid/widget/ImageView;

.field private mRecordingReverse:Landroid/widget/ImageView;

.field private mRecordingSnap:Landroid/widget/ImageView;

.field private mShutterButton:Lcom/android/camera/ui/CameraSnapView;

.field private mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

.field private mThumbnailImage:Landroid/widget/ImageView;

.field private mThumbnailImageLayout:Landroid/view/ViewGroup;

.field private mThumbnailProgress:Landroid/widget/ProgressBar;

.field private mV9bottomParentLayout:Landroid/widget/RelativeLayout;

.field private mVideoCaptureEnable:Z

.field private mVideoPauseSupported:Z

.field private mVideoRecordingStarted:Z

.field private mVideoReverseEnable:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 80
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 128
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 129
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 146
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 80
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 80
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/CameraSnapView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 80
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 80
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    return-object p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 2

    .line 531
    const v0, 0x7f0a003e

    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    .line 532
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 533
    return-void

    .line 536
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    .line 537
    const/4 v1, 0x1

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 540
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 541
    goto :goto_0

    .line 545
    :cond_1
    const p2, 0x7f0a0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 548
    :goto_0
    return-void
.end method

.method private animateViews(ILjava/util/List;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1494
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 1495
    if-nez p2, :cond_0

    .line 1496
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1498
    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1501
    :cond_1
    if-nez p2, :cond_2

    .line 1502
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1504
    :cond_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1507
    :goto_0
    return-void
.end method

.method private changeCamera(Landroid/view/View;)I
    .locals 9

    .line 1090
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1091
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1092
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 1093
    nop

    .line 1096
    move v4, v3

    goto :goto_0

    .line 1094
    :cond_0
    nop

    .line 1096
    move v4, v2

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1098
    const-wide/16 v5, 0x12c

    if-ne v4, v3, :cond_1

    .line 1099
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, -0x3ccc0000    # -180.0f

    .line 1100
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1101
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1102
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    .line 1104
    :cond_1
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x43340000    # 180.0f

    .line 1105
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1106
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1107
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1110
    :goto_1
    const-string p1, "FragmentBottomAction"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "switch camera from %d to %d, for module 0x%x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1112
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    const/4 v7, 0x2

    iget v8, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    .line 1110
    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1113
    if-ne v1, v3, :cond_2

    move p1, v3

    goto :goto_2

    :cond_2
    move p1, v2

    :goto_2
    if-ne v4, v3, :cond_3

    move v2, v3

    nop

    :cond_3
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {p1, v2, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    .line 1116
    return v4
.end method

.method private initThumbLayoutByIntent()V
    .locals 4

    .line 256
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    .line 257
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 263
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isJumpBack()Z

    move-result v3

    if-nez v3, :cond_1

    .line 265
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 266
    return-void

    .line 269
    :cond_1
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkStoragePermissions()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 270
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    .line 272
    :cond_2
    goto :goto_0

    .line 273
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 274
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 275
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 276
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 277
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v1, 0x7f0201aa

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 279
    :goto_0
    return-void
.end method

.method private isFPS960()Z
    .locals 2

    .line 1120
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fr()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1121
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    return v0

    .line 1123
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isThumbLoading()Z
    .locals 1

    .line 625
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private setProgressBarVisible(I)V
    .locals 4

    .line 807
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 808
    return-void

    .line 811
    :cond_0
    const-wide/16 v0, 0x12c

    const/4 v2, 0x2

    if-nez p1, :cond_1

    .line 812
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 813
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 814
    new-array p1, v2, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 815
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 816
    const-wide/16 v0, 0xa0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 817
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 818
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 827
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 828
    goto :goto_0

    .line 829
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_2

    .line 830
    return-void

    .line 832
    :cond_2
    new-array p1, v2, [F

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 833
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 834
    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 835
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 842
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 863
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 866
    :goto_0
    return-void

    nop

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

.method private setRecordingTimeState(I)V
    .locals 1

    .line 323
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 342
    :pswitch_0
    goto :goto_1

    .line 333
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 334
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 336
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 337
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 325
    :pswitch_2
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xae

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 327
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 331
    nop

    .line 347
    :cond_2
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showReverseConfirmDialog()V
    .locals 3

    .line 1063
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1065
    const v1, 0x7f0b026b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1066
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1068
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f0b026c

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1080
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f0b01b4

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1086
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1087
    return-void
.end method

.method private startBottomAnimation(Z)V
    .locals 7

    .line 413
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    if-ne v0, p1, :cond_0

    .line 414
    return-void

    .line 416
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 418
    const v0, 0x3f666666    # 0.9f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 419
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 420
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x96

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 421
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 422
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 423
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 424
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 425
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 426
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v3, v3

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 427
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 428
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 429
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 430
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 431
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0

    .line 433
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 434
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x32

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0xfa

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 435
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 436
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 437
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 438
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 439
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 440
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 441
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 442
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 443
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 444
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 445
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 447
    :goto_0
    return-void
.end method

.method private startExtraLayoutAnimation(Landroid/view/View;Z)V
    .locals 6

    .line 451
    const/high16 v0, 0x3f800000    # 1.0f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    .line 452
    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int p2, p2

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 453
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 454
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 455
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 456
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 471
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 473
    :cond_0
    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 474
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const-wide/16 v4, 0x96

    invoke-virtual {p2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 475
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 476
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 477
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 478
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 494
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 496
    :goto_0
    return-void
.end method

.method private startExtraLayoutExchangeAnimation(Landroid/view/View;)V
    .locals 3

    .line 499
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 500
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 501
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 502
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 503
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 518
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 519
    return-void
.end method

.method private updateBottomInRecording(ZZ)V
    .locals 5

    .line 1128
    const/16 v0, 0x8

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 1129
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1130
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    if-eq v2, v0, :cond_1

    .line 1131
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 1134
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1135
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 1136
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    check-cast v2, Lcom/android/camera/module/VideoModule;

    .line 1137
    invoke-virtual {v2}, Lcom/android/camera/module/VideoModule;->showFPS960Hint()V

    .line 1141
    :cond_1
    :goto_0
    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v3, 0xa2

    const/4 v4, 0x0

    if-eq v2, v3, :cond_4

    const/16 v3, 0xac

    if-eq v2, v3, :cond_3

    const/16 v3, 0xae

    if-eq v2, v3, :cond_2

    packed-switch v2, :pswitch_data_0

    .line 1143
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1144
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1145
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1146
    goto :goto_2

    .line 1167
    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1168
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1169
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    goto :goto_2

    .line 1153
    :cond_3
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1154
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1155
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1156
    goto :goto_2

    .line 1159
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1160
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1162
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->fW()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_1

    :cond_6
    move v1, v4

    :goto_1
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1163
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1164
    nop

    .line 1173
    :goto_2
    if-eqz p1, :cond_9

    .line 1174
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1175
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v3, 0x7f020009

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1176
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1177
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1178
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1181
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_8

    .line 1182
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v3, 0x7f020136

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1183
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1184
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1185
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1188
    :cond_8
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_9

    .line 1189
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v2, 0x7f020106

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1190
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1191
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1196
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1197
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1200
    :cond_a
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    .line 1202
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_b

    const-wide/16 v1, 0xfa

    goto :goto_3

    :cond_b
    const-wide/16 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1203
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1233
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1278
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 1279
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public canSnap()Z
    .locals 2

    .line 1726
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1727
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public canSwipeChangeMode()Z
    .locals 1

    .line 1346
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public changeMode(II)V
    .locals 2

    .line 1292
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, v0, :cond_0

    .line 1293
    return-void

    .line 1297
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1302
    :cond_1
    :pswitch_0
    if-eq p1, v1, :cond_5

    packed-switch p1, :pswitch_data_1

    .line 1312
    :goto_0
    const/16 v0, 0xae

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveModuleClicked()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1313
    invoke-static {}, Lcom/android/camera/CameraSettings;->setLiveModuleClicked()V

    .line 1316
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1317
    return-void

    .line 1321
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1322
    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1323
    return-void

    .line 1332
    :cond_4
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1333
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1334
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1336
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1337
    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1338
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x3

    .line 1339
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    .line 1340
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x1

    .line 1341
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1337
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1342
    return-void

    .line 1307
    :cond_5
    :pswitch_1
    return-void

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public filterUiChange()V
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 305
    return-void
.end method

.method public getBeautyActionMenuType()I
    .locals 1

    .line 1989
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 1413
    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 1408
    const v0, 0x7f04000b

    return v0
.end method

.method public getMenuData()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    .line 1994
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method public hideExtra()V
    .locals 2

    .line 1953
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/16 v1, 0xa4

    if-eqz v0, :cond_1

    .line 1955
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1957
    if-eqz v0, :cond_0

    .line 1958
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 1960
    :cond_0
    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    .line 1962
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1964
    if-eqz v0, :cond_2

    .line 1965
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 1968
    :cond_2
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 166
    const v0, 0x7f0d001b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 167
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 168
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 169
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 171
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090083

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    .line 173
    const v0, 0x7f0d0025

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 174
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 175
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 176
    nop

    .line 177
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09007c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 180
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    .line 181
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d001c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateMenuView()Lcom/android/camera/ui/EdgeHorizonScrollView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 185
    const v0, 0x7f0d001d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    .line 186
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateSelectView()Lcom/android/camera/ui/ModeSelectView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    .line 188
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 189
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/ModeSelectView;->setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V

    .line 191
    const v0, 0x7f0d0026

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    .line 192
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v1, 0x7f0d0027

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 194
    const v0, 0x7f0d0029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    .line 195
    const v0, 0x7f0d0028

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    .line 198
    const v0, 0x7f0d002a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    .line 199
    const v0, 0x7f0d002c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    .line 200
    const v0, 0x7f0d002d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    .line 201
    const v0, 0x7f0d002e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    .line 202
    const v0, 0x7f0d0021

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    .line 204
    const v0, 0x7f0d0022

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    .line 206
    const v0, 0x7f0d002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    .line 213
    const v0, 0x7f0d0023

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    .line 214
    const v0, 0x7f0d0024

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    .line 215
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1, p0}, Lcom/android/camera/ui/CameraSnapView;->setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V

    .line 218
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 220
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100004

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    .line 221
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100005

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    .line 223
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 231
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->provideAnimateElement(ILjava/util/List;Z)V

    .line 233
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 235
    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 236
    new-instance p1, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 238
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f09002e

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    .line 241
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 242
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->setAccessibilityFocusable(Landroid/view/View;Z)V

    .line 244
    :cond_1
    return-void
.end method

.method public isShowFilterView()Z
    .locals 1

    .line 309
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public isShowLightingView()Z
    .locals 1

    .line 314
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    .line 1702
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1703
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-nez p1, :cond_0

    .line 1704
    new-instance p1, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1705
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0021

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1706
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1705
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1709
    new-instance p1, Lcom/android/camera/fragment/FragmentLighting;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentLighting;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1710
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0022

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1711
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentLighting;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1710
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 1713
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1714
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 1716
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1717
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    .line 1720
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initBeautyMenuView()V

    .line 1721
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1679
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1680
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    .line 1681
    iget-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eq p1, p2, :cond_0

    .line 1682
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 1683
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 1684
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 1686
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 1687
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 1688
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1689
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 1691
    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1692
    const/16 p1, 0xa2

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, p2, :cond_2

    .line 1693
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0b00d0

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1695
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0b00cf

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1698
    :cond_3
    :goto_0
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1533
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 4

    .line 1932
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0xa1

    if-ne v0, v3, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_0

    .line 1933
    move v0, v2

    goto :goto_0

    .line 1932
    :cond_0
    nop

    .line 1933
    move v0, v1

    :goto_0
    if-eq p1, v2, :cond_1

    .line 1935
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x2

    if-ne p1, v3, :cond_2

    :cond_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez p1, :cond_4

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez p1, :cond_4

    :cond_2
    if-eqz v0, :cond_3

    goto :goto_1

    .line 1947
    :cond_3
    return v1

    .line 1938
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 1940
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1941
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 1942
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1943
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    .line 1945
    :cond_5
    return v2
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 1537
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1552
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1556
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1562
    return-void
.end method

.method public onBottomMenuAnimate(II)V
    .locals 1

    .line 1999
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->bottomMenuAnimate(II)V

    .line 2000
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 910
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 911
    return-void

    .line 914
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 915
    if-nez v0, :cond_1

    .line 916
    return-void

    .line 919
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 920
    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 921
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 922
    return-void

    .line 925
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0024

    const/16 v3, 0xa2

    if-eq v1, v2, :cond_14

    const v2, 0x7f0d0026

    if-eq v1, v2, :cond_11

    const v2, 0x7f0d0028

    if-eq v1, v2, :cond_c

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_8

    .line 1049
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_3

    goto :goto_0

    .line 1053
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hasSegments()Z

    move-result p1

    if-nez p1, :cond_4

    .line 1054
    return-void

    .line 1057
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showReverseConfirmDialog()V

    goto/16 :goto_8

    .line 1050
    :cond_5
    :goto_0
    return-void

    .line 1036
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_6

    goto :goto_2

    .line 1039
    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1040
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v0, v0, Lcom/android/camera/module/VideoModule;

    if-nez v0, :cond_7

    goto :goto_1

    .line 1044
    :cond_7
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1045
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    .line 1046
    goto/16 :goto_8

    .line 1041
    :cond_8
    :goto_1
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: recording snap is not allowed!!!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1042
    return-void

    .line 1037
    :cond_9
    :goto_2
    return-void

    .line 939
    :pswitch_2
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 940
    return-void

    .line 942
    :cond_a
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 943
    return-void

    .line 946
    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    goto :goto_5

    .line 1010
    :cond_c
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz p1, :cond_10

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_d

    goto :goto_4

    .line 1014
    :cond_d
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-eq p1, v3, :cond_f

    const/16 v0, 0xae

    if-eq p1, v0, :cond_e

    packed-switch p1, :pswitch_data_1

    .line 1016
    return-void

    .line 1027
    :cond_e
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1028
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1029
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    goto :goto_3

    .line 1021
    :cond_f
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1022
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1023
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    .line 1024
    nop

    .line 1033
    :goto_3
    goto/16 :goto_8

    .line 1011
    :cond_10
    :goto_4
    return-void

    .line 927
    :cond_11
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result p1

    if-eqz p1, :cond_12

    .line 928
    return-void

    .line 930
    :cond_12
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    if-nez p1, :cond_13

    .line 931
    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto/16 :goto_8

    .line 933
    :cond_13
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 935
    goto/16 :goto_8

    .line 952
    :cond_14
    :goto_5
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)I

    move-result p1

    .line 955
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 956
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 958
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v3, :cond_15

    packed-switch v0, :pswitch_data_2

    .line 960
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 961
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 962
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 964
    goto :goto_7

    .line 970
    :pswitch_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 971
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 972
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 973
    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 971
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 974
    goto :goto_7

    .line 978
    :cond_15
    nop

    .line 979
    if-nez p1, :cond_18

    .line 980
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    .line 981
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 982
    const/16 p1, 0xa9

    goto :goto_6

    .line 983
    :cond_16
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 984
    const/16 p1, 0xa8

    goto :goto_6

    .line 985
    :cond_17
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result p1

    if-eqz p1, :cond_18

    .line 986
    const/16 p1, 0xaa

    goto :goto_6

    .line 990
    :cond_18
    move p1, v3

    :goto_6
    if-eq p1, v3, :cond_19

    .line 991
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 994
    :cond_19
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 995
    invoke-virtual {p1, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 996
    invoke-virtual {p1, v1}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 994
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1003
    :goto_7
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 1004
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f0b00fa

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1005
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x8000

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1060
    :cond_1a
    :goto_8
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d002c
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xa8
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onHandleSwitcher(I)Z
    .locals 2

    .line 283
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez v0, :cond_0

    .line 284
    const/4 p1, 0x0

    return p1

    .line 287
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 288
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 289
    const/4 v1, 0x1

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 294
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_2

    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentFilter;->switchFilter(I)V

    goto :goto_0

    .line 296
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_3

    .line 297
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentLighting;->switchLighting(I)V

    .line 299
    :cond_3
    :goto_0
    return v1

    .line 290
    :cond_4
    :goto_1
    return v1
.end method

.method public onModeClicked(I)V
    .locals 1

    .line 1284
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1285
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 249
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    .line 250
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 252
    return-void
.end method

.method public onSnapClick()V
    .locals 3

    .line 1777
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1778
    return-void

    .line 1781
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1782
    return-void

    .line 1785
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1786
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 1787
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1788
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1789
    return-void

    .line 1792
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1793
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because screen slide is off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1794
    return-void

    .line 1798
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1799
    if-nez v0, :cond_4

    .line 1800
    return-void

    .line 1803
    :cond_4
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapClick"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1804
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa

    packed-switch v1, :pswitch_data_0

    .line 1807
    :pswitch_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1808
    return-void

    .line 1813
    :pswitch_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1814
    return-void

    .line 1824
    :cond_5
    :pswitch_2
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v1, :cond_6

    .line 1825
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 1828
    :cond_6
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1810
    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 1811
    nop

    .line 1832
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1833
    const/16 v0, 0xa2

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne v0, v1, :cond_9

    .line 1834
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1835
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00fc

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1837
    :cond_8
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00fd

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1840
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00fb

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1842
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x8000

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1844
    :cond_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSnapLongPress()V
    .locals 3

    .line 1848
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1849
    return-void

    .line 1853
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1854
    if-nez v0, :cond_1

    .line 1855
    return-void

    .line 1858
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1859
    return-void

    .line 1862
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1863
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    .line 1864
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1865
    return-void

    .line 1869
    :cond_3
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPress"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1871
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1872
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1874
    :cond_4
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    .line 1898
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1899
    return-void

    .line 1903
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1904
    if-nez v0, :cond_1

    .line 1905
    return-void

    .line 1908
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1909
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1911
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_3

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xab

    if-eq v0, v1, :cond_2

    .line 1913
    goto :goto_0

    .line 1924
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    .line 1916
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_4

    .line 1917
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1927
    :cond_4
    :goto_0
    return-void
.end method

.method public onSnapLongPressCancelOut()V
    .locals 3

    .line 1878
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1879
    return-void

    .line 1883
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1884
    if-nez v0, :cond_1

    .line 1885
    return-void

    .line 1888
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1889
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1891
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_2

    .line 1892
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1894
    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    .line 1732
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1733
    return-void

    .line 1737
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1738
    if-nez v0, :cond_1

    .line 1739
    return-void

    .line 1741
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1742
    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    .line 1743
    return-void
.end method

.method public onSwitchBeautyActionMenu(I)V
    .locals 2

    .line 1983
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    .line 1984
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 1985
    return-void
.end method

.method public onSwitchCameraActionMenu(I)V
    .locals 2

    .line 1972
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    .line 1973
    return-void
.end method

.method public onSwitchLiveActionMenu(I)V
    .locals 3

    .line 1977
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentLiveActionMenuType:I

    .line 1978
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 1979
    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 4

    .line 1747
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1748
    return-void

    .line 1751
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1753
    if-nez v0, :cond_1

    .line 1754
    return-void

    .line 1756
    :cond_1
    const-string v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTrackSnapMissTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1757
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    .line 1758
    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 4

    .line 1762
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1763
    return-void

    .line 1766
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1768
    if-nez v0, :cond_1

    .line 1769
    return-void

    .line 1771
    :cond_1
    const-string v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTrackSnapTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1772
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    .line 1773
    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 0

    .line 871
    if-eqz p1, :cond_0

    .line 872
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    goto :goto_0

    .line 874
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    .line 876
    :goto_0
    return-void
.end method

.method public processingFailed()V
    .locals 1

    .line 750
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateLoading(Z)V

    .line 751
    return-void
.end method

.method public processingFinish()V
    .locals 4

    .line 724
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 725
    return-void

    .line 728
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 729
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 731
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 732
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 733
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 734
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 735
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 737
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 738
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    invoke-static {v1, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 739
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 740
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 741
    invoke-direct {p0, v1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 743
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_2

    .line 744
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 746
    :cond_2
    return-void
.end method

.method public processingPause()V
    .locals 3

    .line 692
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 693
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f020137

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 694
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0b00d5

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 696
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    .line 697
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 698
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 700
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    .line 701
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const/16 v2, 0x8

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 702
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 703
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 706
    :cond_1
    return-void
.end method

.method public processingPostAction()V
    .locals 5

    .line 793
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 794
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 797
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 798
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 799
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 800
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 801
    invoke-direct {p0, v1, v4}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 802
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 803
    return-void
.end method

.method public processingPrepare()V
    .locals 5

    .line 665
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 666
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    .line 667
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    .line 666
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v4, v0, v3, v1, v2}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 668
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 669
    invoke-direct {p0, v3, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 670
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 672
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    .line 673
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 675
    :cond_0
    return-void
.end method

.method public processingResume()V
    .locals 5

    .line 710
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 711
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f020136

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 712
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0b00d4

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 714
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_2

    .line 715
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 716
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    .line 717
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v0, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 718
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    if-nez v0, :cond_1

    move v2, v3

    nop

    :cond_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 720
    :cond_2
    return-void
.end method

.method public processingStart()V
    .locals 5

    .line 679
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 680
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 682
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 683
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    .line 684
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    .line 683
    const/4 v4, 0x1

    invoke-static {v1, v0, v4, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 685
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 687
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 688
    return-void
.end method

.method public processingWorkspace(Z)V
    .locals 2

    .line 755
    const/16 v0, 0x8

    if-eqz p1, :cond_2

    .line 756
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 757
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 758
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 759
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_0

    .line 761
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f020137

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 762
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 764
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_1

    .line 765
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 767
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_5

    .line 768
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 772
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 773
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 774
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 775
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 776
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 777
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 778
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 780
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 781
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 783
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_5

    .line 784
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 788
    :cond_5
    :goto_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .line 1420
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1421
    if-nez p3, :cond_0

    if-eq v0, p1, :cond_2

    .line 1422
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v1, :cond_1

    .line 1423
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideFilterView()Z

    goto :goto_0

    .line 1424
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v1, :cond_2

    .line 1425
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideLightingView()Z

    .line 1429
    :cond_2
    :goto_0
    const/16 v1, 0xae

    if-ne v0, v1, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_4

    .line 1430
    if-nez p3, :cond_3

    .line 1431
    return-void

    .line 1433
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    .line 1437
    :cond_4
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1440
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz p3, :cond_5

    .line 1441
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p3, p2}, Lcom/android/camera/fragment/FragmentFilter;->isShowAnimation(Ljava/util/List;)V

    .line 1445
    :cond_5
    const/16 p3, 0xa5

    if-eq p1, p3, :cond_6

    goto :goto_1

    .line 1447
    :cond_6
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0a003e

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1451
    :goto_1
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_7

    move v2, v1

    goto :goto_2

    :cond_7
    move v2, v0

    :goto_2
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    invoke-virtual {p3, p1, v2, v3}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    .line 1459
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    .line 1462
    const/4 p3, -0x1

    packed-switch p1, :pswitch_data_0

    .line 1464
    :pswitch_0
    nop

    .line 1465
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1466
    nop

    .line 1485
    :goto_3
    move p3, v1

    goto :goto_4

    .line 1468
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 1469
    nop

    .line 1470
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_3

    .line 1472
    :cond_8
    nop

    .line 1473
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1475
    goto :goto_4

    .line 1480
    :pswitch_2
    nop

    .line 1481
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1485
    :goto_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, p3, :cond_9

    .line 1486
    return-void

    .line 1488
    :cond_9
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1490
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p0, p3, p2, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->animateViews(ILjava/util/List;Landroid/view/View;)V

    .line 1491
    return-void

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 1512
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 1517
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 1518
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 1521
    return-object p1

    .line 1514
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 1526
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xa2

    aput v2, v0, v1

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

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

    .line 1666
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1668
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1669
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1670
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1671
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1673
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1674
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 883
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 884
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 885
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 886
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 887
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 888
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 889
    return-void
.end method

.method public selectMode(II)V
    .locals 7

    .line 1352
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1353
    return-void

    .line 1355
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x3

    const v3, 0x800003

    const v4, 0x800005

    if-eqz v0, :cond_2

    .line 1356
    if-ne p1, v2, :cond_1

    .line 1357
    nop

    .line 1369
    :goto_0
    move p1, v4

    goto :goto_2

    .line 1358
    :cond_1
    if-ne p1, v1, :cond_4

    .line 1359
    goto :goto_1

    .line 1362
    :cond_2
    if-ne p1, v2, :cond_3

    .line 1363
    nop

    .line 1369
    :goto_1
    move p1, v3

    goto :goto_2

    .line 1364
    :cond_3
    if-ne p1, v1, :cond_4

    .line 1365
    goto :goto_0

    .line 1369
    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1372
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa9

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa8

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xaa

    if-ne v1, v2, :cond_6

    .line 1375
    :cond_5
    const/16 v0, 0xa2

    .line 1378
    :cond_6
    nop

    .line 1379
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 1380
    const/4 v2, 0x0

    move v5, v2

    :goto_3
    if-ge v5, v1, :cond_8

    .line 1381
    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v6, v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v6

    if-ne v6, v0, :cond_7

    .line 1382
    nop

    .line 1383
    nop

    .line 1386
    move v2, v5

    goto :goto_4

    .line 1380
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1386
    :cond_8
    :goto_4
    if-eq p1, v3, :cond_a

    if-eq p1, v4, :cond_9

    goto :goto_5

    .line 1394
    :cond_9
    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_b

    .line 1395
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1388
    :cond_a
    if-lez v2, :cond_b

    .line 1389
    add-int/lit8 v2, v2, -0x1

    .line 1402
    :cond_b
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result p1

    .line 1403
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1404
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 524
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 527
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 528
    return-void
.end method

.method public setLightingViewStatus(Z)V
    .locals 0

    .line 319
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 320
    return-void
.end method

.method public showOrHideBottomViewWithAnim(Z)V
    .locals 7

    .line 1566
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1567
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1568
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1569
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    :goto_0
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1570
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1571
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1572
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1573
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1574
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1575
    if-eqz p1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1576
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1577
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1578
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1579
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1580
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1581
    if-eqz p1, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1582
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1583
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1585
    return-void
.end method

.method public showOrHideFilterView()Z
    .locals 3

    .line 356
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 357
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 358
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 360
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 361
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const v2, 0x7f0b00f9

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 362
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 365
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_1

    .line 366
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 367
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 370
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 371
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->reInit()V

    .line 373
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 374
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 376
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 378
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public showOrHideLightingView()Z
    .locals 3

    .line 383
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 385
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 386
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    goto :goto_0

    .line 395
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 396
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 397
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 400
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 401
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 403
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 404
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 406
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 408
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 893
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 895
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 896
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 897
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 898
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 899
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 900
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 901
    return-void
.end method

.method public updateLoading(Z)V
    .locals 3

    .line 637
    if-nez p1, :cond_2

    .line 638
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p1, :cond_0

    .line 639
    return-void

    .line 641
    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 642
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xac

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 644
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 645
    goto :goto_0

    .line 651
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 652
    goto :goto_0

    .line 657
    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 658
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 659
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 661
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    .line 351
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 352
    return-void
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 3

    .line 554
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 555
    return-void

    .line 562
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 563
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    .line 564
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v2

    if-eq v2, p1, :cond_1

    .line 565
    invoke-virtual {v0, p1, v1, v1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 566
    const-string v0, "FragmentBottomAction"

    const-string v2, "inconsistent thumbnail"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 570
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 571
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2

    .line 572
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 575
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v0, :cond_3

    .line 576
    return-void

    .line 579
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_4

    .line 580
    return-void

    .line 583
    :cond_4
    if-nez p1, :cond_5

    .line 584
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const p2, 0x7f020147

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 585
    return-void

    .line 589
    :cond_5
    nop

    .line 590
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object p1

    .line 591
    invoke-virtual {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 592
    invoke-virtual {p1, v1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    .line 593
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 595
    if-nez p2, :cond_6

    .line 596
    return-void

    .line 615
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const p2, 0x3e99999a    # 0.3f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 616
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 617
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 618
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x50

    .line 619
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 620
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 622
    return-void
.end method
