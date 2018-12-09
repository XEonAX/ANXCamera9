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

.method static synthetic access$200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->resetBottom(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

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

    .line 533
    const v0, 0x7f0a003e

    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    .line 534
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 535
    return-void

    .line 538
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    .line 539
    const/4 v1, 0x1

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 542
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 543
    goto :goto_0

    .line 547
    :cond_1
    const p2, 0x7f0a0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 550
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

    .line 1560
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 1561
    if-nez p2, :cond_0

    .line 1562
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1564
    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1567
    :cond_1
    if-nez p2, :cond_2

    .line 1568
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1570
    :cond_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1573
    :goto_0
    return-void
.end method

.method private changeCamera(Landroid/view/View;)I
    .locals 9

    .line 1133
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1134
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1135
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 1136
    nop

    .line 1139
    move v4, v3

    goto :goto_0

    .line 1137
    :cond_0
    nop

    .line 1139
    move v4, v2

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1141
    const-wide/16 v5, 0x12c

    if-ne v4, v3, :cond_1

    .line 1142
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, -0x3ccc0000    # -180.0f

    .line 1143
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1144
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1145
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    .line 1147
    :cond_1
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x43340000    # 180.0f

    .line 1148
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1149
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1150
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1153
    :goto_1
    const-string p1, "FragmentBottomAction"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "switch camera from %d to %d, for module 0x%x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1155
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

    .line 1153
    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1156
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

    .line 1159
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

    const v1, 0x7f0201a0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 279
    :goto_0
    return-void
.end method

.method private isFPS960()Z
    .locals 2

    .line 1163
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fp()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1164
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    return v0

    .line 1166
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isThumbLoading()Z
    .locals 1

    .line 627
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V
    .locals 4

    .line 1171
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1173
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideConfigMenu()V

    .line 1175
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa6

    const/4 v3, 0x1

    if-eq v1, v2, :cond_2

    const/16 v2, 0xad

    if-eq v1, v2, :cond_2

    .line 1181
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v1, v2, :cond_0

    .line 1182
    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    goto :goto_0

    .line 1183
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1184
    const/4 v1, 0x5

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 1186
    :cond_1
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 1178
    :cond_2
    nop

    .line 1191
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1192
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideTipImage()V

    .line 1193
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideLeftTipImage()V

    .line 1194
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideCenterTipImage()V

    .line 1195
    invoke-direct {p0, v3, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 1196
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 1197
    return-void
.end method

.method private resetBottom(Z)V
    .locals 4

    .line 898
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 899
    return-void

    .line 901
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_3

    .line 912
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 914
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->showConfigMenu()V

    .line 916
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    const/4 v3, 0x2

    if-ne v1, v2, :cond_1

    .line 917
    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    goto :goto_0

    .line 919
    :cond_1
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    .line 923
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 925
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 926
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 927
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 929
    :cond_2
    if-eqz p1, :cond_3

    .line 930
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    goto :goto_1

    .line 932
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 934
    :goto_1
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 935
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 936
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 937
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 938
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_4
    const/4 p1, 0x1

    :goto_2
    invoke-direct {p0, v1, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 942
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private startBottomAnimation(Z)V
    .locals 7

    .line 415
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    if-ne v0, p1, :cond_0

    .line 416
    return-void

    .line 418
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 420
    const v0, 0x3f666666    # 0.9f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 421
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 422
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x96

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 423
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 424
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 425
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

    .line 426
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 427
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 428
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

    .line 429
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 430
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 431
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 432
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

    .line 433
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0

    .line 435
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 436
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

    .line 437
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 438
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 439
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 440
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 441
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 442
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 443
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 444
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 445
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 446
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

    .line 447
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 449
    :goto_0
    return-void
.end method

.method private startExtraLayoutAnimation(Landroid/view/View;Z)V
    .locals 6

    .line 453
    const/high16 v0, 0x3f800000    # 1.0f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    .line 454
    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int p2, p2

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 455
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 456
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 457
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 458
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 473
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 475
    :cond_0
    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 476
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const-wide/16 v4, 0x96

    invoke-virtual {p2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 477
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 478
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 479
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

    .line 480
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 496
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 498
    :goto_0
    return-void
.end method

.method private startExtraLayoutExchangeAnimation(Landroid/view/View;)V
    .locals 3

    .line 501
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 502
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 503
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

    .line 504
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 505
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 520
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 521
    return-void
.end method

.method private updateBottomInRecording(ZZ)V
    .locals 5

    .line 1200
    const/16 v0, 0x8

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 1201
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1202
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    if-eq v2, v0, :cond_1

    .line 1203
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 1206
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1207
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 1208
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    check-cast v2, Lcom/android/camera/module/VideoModule;

    .line 1209
    invoke-virtual {v2}, Lcom/android/camera/module/VideoModule;->showFPS960Hint()V

    .line 1213
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

    .line 1215
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1216
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1217
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1218
    goto :goto_2

    .line 1239
    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1240
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1241
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    goto :goto_2

    .line 1225
    :cond_3
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1226
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1227
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1228
    goto :goto_2

    .line 1231
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1232
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1234
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->fT()Z

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

    .line 1235
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1236
    nop

    .line 1245
    :goto_2
    if-eqz p1, :cond_9

    .line 1246
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1247
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v3, 0x7f020008

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1248
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1249
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1250
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1253
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_8

    .line 1254
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v3, 0x7f020127

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1255
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1256
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1257
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1260
    :cond_8
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_9

    .line 1261
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v2, 0x7f0200f9

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1262
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1263
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1269
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1270
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1273
    :cond_a
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    .line 1275
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_b

    const-wide/16 v1, 0xfa

    goto :goto_3

    :cond_b
    const-wide/16 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1276
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1306
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1351
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 1352
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

    .line 1792
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1793
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

    .line 1415
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public changeMode(II)V
    .locals 2

    .line 1365
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, v0, :cond_0

    .line 1366
    return-void

    .line 1370
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1375
    :cond_1
    :pswitch_0
    if-eq p1, v1, :cond_4

    packed-switch p1, :pswitch_data_1

    .line 1385
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1386
    return-void

    .line 1390
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1391
    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1392
    return-void

    .line 1401
    :cond_3
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1402
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1403
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1405
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1406
    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1407
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x3

    .line 1408
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    .line 1409
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x1

    .line 1410
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1406
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1411
    return-void

    .line 1380
    :cond_4
    :pswitch_1
    return-void

    nop

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

    .line 2059
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 1482
    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 1477
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

    .line 2064
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method public hideExtra()V
    .locals 2

    .line 2023
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/16 v1, 0xa4

    if-eqz v0, :cond_1

    .line 2025
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2027
    if-eqz v0, :cond_0

    .line 2028
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 2030
    :cond_0
    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    .line 2032
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2034
    if-eqz v0, :cond_2

    .line 2035
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 2038
    :cond_2
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 166
    const v0, 0x7f0d0019

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
    const v0, 0x7f0d0023

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

    const v2, 0x7f0d001a

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
    const v0, 0x7f0d001b

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
    const v0, 0x7f0d0024

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    .line 192
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v1, 0x7f0d0025

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 194
    const v0, 0x7f0d0027

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    .line 195
    const v0, 0x7f0d0026

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    .line 198
    const v0, 0x7f0d0028

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    .line 199
    const v0, 0x7f0d002a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    .line 200
    const v0, 0x7f0d002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    .line 201
    const v0, 0x7f0d002c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    .line 202
    const v0, 0x7f0d001f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    .line 204
    const v0, 0x7f0d0020

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    .line 206
    const v0, 0x7f0d0029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    .line 213
    const v0, 0x7f0d0021

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    .line 214
    const v0, 0x7f0d0022

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

    .line 1768
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1769
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-nez p1, :cond_0

    .line 1770
    new-instance p1, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1771
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d001f

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1772
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1771
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1775
    new-instance p1, Lcom/android/camera/fragment/FragmentLighting;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentLighting;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1776
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0020

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1777
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentLighting;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1776
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 1779
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1780
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 1782
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1783
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    .line 1786
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initBeautyMenuView()V

    .line 1787
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1745
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1746
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    .line 1747
    iget-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eq p1, p2, :cond_0

    .line 1748
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 1749
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 1750
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 1752
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 1753
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 1754
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1755
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 1757
    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1758
    const/16 p1, 0xa2

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, p2, :cond_2

    .line 1759
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0b00ca

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1761
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0b00c9

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1764
    :cond_3
    :goto_0
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1599
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 4

    .line 2002
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0xa1

    if-ne v0, v3, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_0

    .line 2003
    move v0, v2

    goto :goto_0

    .line 2002
    :cond_0
    nop

    .line 2003
    move v0, v1

    :goto_0
    if-eq p1, v2, :cond_1

    .line 2005
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

    .line 2017
    :cond_3
    return v1

    .line 2008
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 2010
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 2011
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 2012
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 2013
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    .line 2015
    :cond_5
    return v2
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 1603
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1618
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1622
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1628
    return-void
.end method

.method public onBottomMenuAnimate(II)V
    .locals 1

    .line 2069
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->bottomMenuAnimate(II)V

    .line 2070
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 975
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 976
    return-void

    .line 979
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 980
    if-nez v0, :cond_1

    .line 981
    return-void

    .line 984
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 985
    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 986
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 987
    return-void

    .line 990
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0022

    const/4 v3, 0x0

    const/16 v4, 0xa2

    if-eq v1, v2, :cond_14

    const v2, 0x7f0d0024

    if-eq v1, v2, :cond_11

    const v2, 0x7f0d0026

    if-eq v1, v2, :cond_9

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_9

    .line 1119
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_3

    goto :goto_0

    .line 1122
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1123
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1124
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->doReverse()V

    .line 1126
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->removeLastSegment()V

    goto/16 :goto_9

    .line 1120
    :cond_4
    :goto_0
    return-void

    .line 1110
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_5

    goto :goto_1

    .line 1113
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1114
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1115
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    .line 1116
    goto/16 :goto_9

    .line 1111
    :cond_6
    :goto_1
    return-void

    .line 1004
    :pswitch_2
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1005
    return-void

    .line 1007
    :cond_7
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1008
    return-void

    .line 1011
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    goto/16 :goto_6

    .line 1075
    :cond_9
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz p1, :cond_10

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_a

    goto :goto_5

    .line 1079
    :cond_a
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-eq p1, v4, :cond_f

    const/16 v0, 0xae

    if-eq p1, v0, :cond_b

    packed-switch p1, :pswitch_data_1

    .line 1081
    return-void

    .line 1093
    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1094
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1095
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    .line 1096
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    .line 1097
    const/16 v0, 0x8

    if-ne p1, v0, :cond_c

    .line 1098
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 1100
    :cond_c
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    if-nez p1, :cond_d

    move v2, v0

    goto :goto_2

    :cond_d
    move v2, v3

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1101
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    if-nez p1, :cond_e

    goto :goto_3

    :cond_e
    move v0, v3

    :goto_3
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_4

    .line 1086
    :cond_f
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1087
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1088
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    .line 1089
    nop

    .line 1107
    :goto_4
    goto/16 :goto_9

    .line 1076
    :cond_10
    :goto_5
    return-void

    .line 992
    :cond_11
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result p1

    if-eqz p1, :cond_12

    .line 993
    return-void

    .line 995
    :cond_12
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    if-nez p1, :cond_13

    .line 996
    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto/16 :goto_9

    .line 998
    :cond_13
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 1000
    goto/16 :goto_9

    .line 1017
    :cond_14
    :goto_6
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)I

    move-result p1

    .line 1020
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1021
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 1023
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v4, :cond_15

    packed-switch v0, :pswitch_data_2

    .line 1025
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1026
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1027
    invoke-virtual {p0, p1, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1029
    goto :goto_8

    .line 1035
    :pswitch_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1036
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v4}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1037
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1038
    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1036
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1039
    goto :goto_8

    .line 1043
    :cond_15
    nop

    .line 1044
    if-nez p1, :cond_18

    .line 1045
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    .line 1046
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1047
    const/16 p1, 0xa9

    goto :goto_7

    .line 1048
    :cond_16
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 1049
    const/16 p1, 0xa8

    goto :goto_7

    .line 1050
    :cond_17
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result p1

    if-eqz p1, :cond_18

    .line 1051
    const/16 p1, 0xaa

    goto :goto_7

    .line 1055
    :cond_18
    move p1, v4

    :goto_7
    if-eq p1, v4, :cond_19

    .line 1056
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1059
    :cond_19
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1060
    invoke-virtual {p1, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1061
    invoke-virtual {p1, v1}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1059
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1068
    :goto_8
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 1069
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f0b00f4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1070
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x8000

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1130
    :cond_1a
    :goto_9
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d002a
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

    .line 1357
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1358
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
    .locals 7

    .line 1843
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1844
    return-void

    .line 1847
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1848
    return-void

    .line 1851
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1852
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 1853
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1854
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1855
    return-void

    .line 1858
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1859
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because screen slide is off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1860
    return-void

    .line 1864
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1865
    if-nez v0, :cond_4

    .line 1866
    return-void

    .line 1869
    :cond_4
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapClick"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1870
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa

    packed-switch v1, :pswitch_data_0

    .line 1873
    :pswitch_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1874
    return-void

    .line 1879
    :pswitch_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1880
    return-void

    .line 1889
    :cond_5
    :pswitch_2
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v1, :cond_6

    .line 1890
    const/4 v1, 0x0

    iget v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1891
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v4

    .line 1892
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v5

    .line 1891
    const/4 v6, 0x1

    invoke-static {v1, v3, v6, v4, v5}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v1

    .line 1893
    invoke-virtual {v1}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v1

    .line 1894
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 1895
    iput-boolean v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 1898
    :cond_6
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1876
    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 1877
    nop

    .line 1902
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1903
    const/16 v0, 0xa2

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne v0, v1, :cond_9

    .line 1904
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1905
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00f6

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1907
    :cond_8
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00f7

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1910
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0b00f5

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1912
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x8000

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1914
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

    .line 1918
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1919
    return-void

    .line 1923
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1924
    if-nez v0, :cond_1

    .line 1925
    return-void

    .line 1928
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1929
    return-void

    .line 1932
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1933
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    .line 1934
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1935
    return-void

    .line 1939
    :cond_3
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPress"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1941
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1942
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1944
    :cond_4
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    .line 1968
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1969
    return-void

    .line 1973
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1974
    if-nez v0, :cond_1

    .line 1975
    return-void

    .line 1978
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1979
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1981
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_3

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xab

    if-eq v0, v1, :cond_2

    .line 1983
    goto :goto_0

    .line 1994
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    .line 1986
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_4

    .line 1987
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1997
    :cond_4
    :goto_0
    return-void
.end method

.method public onSnapLongPressCancelOut()V
    .locals 3

    .line 1948
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1949
    return-void

    .line 1953
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1954
    if-nez v0, :cond_1

    .line 1955
    return-void

    .line 1958
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1959
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1961
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_2

    .line 1962
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1964
    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    .line 1798
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1799
    return-void

    .line 1803
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1804
    if-nez v0, :cond_1

    .line 1805
    return-void

    .line 1807
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1808
    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    .line 1809
    return-void
.end method

.method public onSwitchBeautyActionMenu(I)V
    .locals 2

    .line 2053
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    .line 2054
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2055
    return-void
.end method

.method public onSwitchCameraActionMenu(I)V
    .locals 2

    .line 2042
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    .line 2043
    return-void
.end method

.method public onSwitchLiveActionMenu(I)V
    .locals 3

    .line 2047
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentLiveActionMenuType:I

    .line 2048
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2049
    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 4

    .line 1813
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1814
    return-void

    .line 1817
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1819
    if-nez v0, :cond_1

    .line 1820
    return-void

    .line 1822
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

    .line 1823
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    .line 1824
    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 4

    .line 1828
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1829
    return-void

    .line 1832
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1834
    if-nez v0, :cond_1

    .line 1835
    return-void

    .line 1837
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

    .line 1838
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    .line 1839
    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 0

    .line 890
    if-eqz p1, :cond_0

    .line 891
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    goto :goto_0

    .line 893
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    .line 895
    :goto_0
    return-void
.end method

.method public processingFailed()V
    .locals 2

    .line 766
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 767
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 768
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 769
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateLoading(Z)V

    .line 770
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->resetBottom(Z)V

    .line 771
    return-void
.end method

.method public processingFinish()V
    .locals 2

    .line 757
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 758
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 759
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 760
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarGone()V

    .line 761
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->resetBottom(Z)V

    .line 762
    return-void
.end method

.method public processingPause()V
    .locals 5

    .line 694
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x3

    const v2, 0x7f020128

    const/16 v3, 0xac

    if-eq v0, v3, :cond_1

    const/16 v4, 0xae

    if-eq v0, v4, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 711
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 712
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 713
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 716
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 717
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    goto :goto_0

    .line 701
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 702
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 704
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 706
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    .line 707
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0b00cf

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 708
    nop

    .line 720
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public processingPostAction()V
    .locals 2

    .line 819
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 828
    return-void
.end method

.method public processingResume()V
    .locals 5

    .line 724
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x4

    const v2, 0x7f020127

    const/16 v3, 0xac

    if-eq v0, v3, :cond_1

    const/16 v4, 0xae

    if-eq v0, v4, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 741
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 742
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 743
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 746
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 748
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideTipImage()V

    .line 749
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideLeftTipImage()V

    .line 750
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideCenterTipImage()V

    goto :goto_0

    .line 731
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 732
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 734
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 736
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    .line 737
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0b00ce

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 738
    nop

    .line 753
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public processingStart()V
    .locals 5

    .line 667
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 668
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 669
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 679
    :pswitch_1
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 680
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    .line 681
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    .line 680
    const/4 v4, 0x1

    invoke-static {v1, v0, v4, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 682
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 683
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v1, :cond_0

    .line 684
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 685
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 687
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 690
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public processingWorkspace(Z)V
    .locals 3

    .line 775
    const/16 v0, 0xaf

    const/16 v1, 0x8

    if-eqz p1, :cond_3

    .line 776
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 777
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 778
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 779
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v1, :cond_0

    .line 781
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f020128

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 782
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 784
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v1, :cond_1

    .line 785
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 787
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v1, :cond_2

    .line 788
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 791
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 792
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 793
    goto :goto_0

    .line 794
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 795
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 796
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 797
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 798
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 799
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 801
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_5

    .line 802
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 804
    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_6

    .line 805
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 808
    :cond_6
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 809
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideTipImage()V

    .line 810
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideLeftTipImage()V

    .line 811
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideCenterTipImage()V

    .line 814
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

    .line 1489
    if-nez p3, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-eq v0, p1, :cond_2

    .line 1490
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 1491
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideFilterView()Z

    goto :goto_0

    .line 1492
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    .line 1493
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideLightingView()Z

    .line 1497
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1499
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_4

    .line 1500
    if-nez p3, :cond_3

    .line 1501
    return-void

    .line 1503
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    .line 1506
    :cond_4
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz p3, :cond_5

    .line 1507
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p3, p2}, Lcom/android/camera/fragment/FragmentFilter;->isShowAnimation(Ljava/util/List;)V

    .line 1511
    :cond_5
    const/16 p3, 0xa5

    if-eq p1, p3, :cond_6

    goto :goto_1

    .line 1513
    :cond_6
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0a003e

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1517
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

    .line 1525
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    .line 1528
    const/4 p3, -0x1

    packed-switch p1, :pswitch_data_0

    .line 1530
    :pswitch_0
    nop

    .line 1531
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1532
    nop

    .line 1551
    :goto_3
    move p3, v1

    goto :goto_4

    .line 1534
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->hb()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 1535
    nop

    .line 1536
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_3

    .line 1538
    :cond_8
    nop

    .line 1539
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1541
    goto :goto_4

    .line 1546
    :pswitch_2
    nop

    .line 1547
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1551
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

    .line 1552
    return-void

    .line 1554
    :cond_9
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1556
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p0, p3, p2, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->animateViews(ILjava/util/List;Landroid/view/View;)V

    .line 1557
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

    .line 1578
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 1583
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 1584
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 1587
    return-object p1

    .line 1580
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 1592
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

    .line 1732
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1734
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1735
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1736
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1737
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1739
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1740
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 948
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 949
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 950
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 951
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 952
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 953
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 954
    return-void
.end method

.method public selectMode(II)V
    .locals 7

    .line 1421
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1422
    return-void

    .line 1424
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

    .line 1425
    if-ne p1, v2, :cond_1

    .line 1426
    nop

    .line 1438
    :goto_0
    move p1, v4

    goto :goto_2

    .line 1427
    :cond_1
    if-ne p1, v1, :cond_4

    .line 1428
    goto :goto_1

    .line 1431
    :cond_2
    if-ne p1, v2, :cond_3

    .line 1432
    nop

    .line 1438
    :goto_1
    move p1, v3

    goto :goto_2

    .line 1433
    :cond_3
    if-ne p1, v1, :cond_4

    .line 1434
    goto :goto_0

    .line 1438
    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1441
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa9

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa8

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xaa

    if-ne v1, v2, :cond_6

    .line 1444
    :cond_5
    const/16 v0, 0xa2

    .line 1447
    :cond_6
    nop

    .line 1448
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 1449
    const/4 v2, 0x0

    move v5, v2

    :goto_3
    if-ge v5, v1, :cond_8

    .line 1450
    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v6, v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v6

    if-ne v6, v0, :cond_7

    .line 1451
    nop

    .line 1452
    nop

    .line 1455
    move v2, v5

    goto :goto_4

    .line 1449
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1455
    :cond_8
    :goto_4
    if-eq p1, v3, :cond_a

    if-eq p1, v4, :cond_9

    goto :goto_5

    .line 1463
    :cond_9
    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_b

    .line 1464
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1457
    :cond_a
    if-lez v2, :cond_b

    .line 1458
    add-int/lit8 v2, v2, -0x1

    .line 1471
    :cond_b
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result p1

    .line 1472
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1473
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 526
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 529
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 530
    return-void
.end method

.method public setLightingViewStatus(Z)V
    .locals 0

    .line 319
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 320
    return-void
.end method

.method public setProgressBarGone()V
    .locals 3

    .line 850
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 851
    return-void

    .line 853
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 854
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 855
    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 856
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 863
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 884
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 885
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public setProgressBarVisible()V
    .locals 5

    .line 831
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 832
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 833
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 834
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 835
    const-wide/16 v1, 0xa0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 836
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const/high16 v2, 0x3e800000    # 0.25f

    const v3, 0x3dcccccd    # 0.1f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 837
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 846
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 847
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setRecordingTimeState(I)V
    .locals 1

    .line 324
    const/4 v0, 0x5

    if-eq p1, v0, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 344
    :pswitch_0
    goto :goto_1

    .line 326
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xae

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 328
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 332
    goto :goto_1

    .line 335
    :cond_1
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 336
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 338
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 339
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 349
    :cond_3
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public showOrHideBottomViewWithAnim(Z)V
    .locals 7

    .line 1632
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1633
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1634
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1635
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

    .line 1636
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1637
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1638
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1639
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1640
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1641
    if-eqz p1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1642
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1643
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1644
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1645
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1646
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1647
    if-eqz p1, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1648
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1649
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1651
    return-void
.end method

.method public showOrHideFilterView()Z
    .locals 3

    .line 358
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 359
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 360
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 362
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 363
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const v2, 0x7f0b00f3

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 364
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 367
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_1

    .line 368
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 369
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 372
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->reInit()V

    .line 375
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 376
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 378
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 380
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public showOrHideLightingView()Z
    .locals 3

    .line 385
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 387
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 388
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    goto :goto_0

    .line 397
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 398
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 399
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 402
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 403
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 405
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 406
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 408
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 410
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 958
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 960
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 961
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 962
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 963
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 964
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 965
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 966
    return-void
.end method

.method public updateLoading(Z)V
    .locals 3

    .line 639
    if-nez p1, :cond_2

    .line 640
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p1, :cond_0

    .line 641
    return-void

    .line 643
    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 644
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xac

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 646
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 647
    goto :goto_0

    .line 653
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 654
    goto :goto_0

    .line 659
    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 660
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 661
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 663
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

    .line 353
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    return-void
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 3

    .line 556
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 557
    return-void

    .line 564
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 565
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    .line 566
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v2

    if-eq v2, p1, :cond_1

    .line 567
    invoke-virtual {v0, p1, v1, v1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 568
    const-string v0, "FragmentBottomAction"

    const-string v2, "inconsistent thumbnail"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 572
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 573
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2

    .line 574
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 577
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v0, :cond_3

    .line 578
    return-void

    .line 581
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_4

    .line 582
    return-void

    .line 585
    :cond_4
    if-nez p1, :cond_5

    .line 586
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const p2, 0x7f020138

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 587
    return-void

    .line 591
    :cond_5
    nop

    .line 592
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object p1

    .line 593
    invoke-virtual {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 594
    invoke-virtual {p1, v1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    .line 595
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 597
    if-nez p2, :cond_6

    .line 598
    return-void

    .line 617
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const p2, 0x3e99999a    # 0.3f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 618
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 619
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 620
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

    .line 621
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 622
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 624
    return-void
.end method
