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

.field private mLastPauseTime:J

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

.field private mVideoRecordingPaused:Z

.field private mVideoRecordingStarted:Z

.field private mVideoReverseEnable:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 82
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 131
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 132
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 133
    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 151
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/CameraSnapView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    return-object p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 2

    .line 539
    const v0, 0x7f0b003e

    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    .line 540
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 541
    return-void

    .line 544
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    .line 545
    const/4 v1, 0x1

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 548
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 549
    goto :goto_0

    .line 553
    :cond_1
    const p2, 0x7f0b0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 556
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

    .line 1531
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 1532
    if-nez p2, :cond_0

    .line 1533
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1535
    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1538
    :cond_1
    if-nez p2, :cond_2

    .line 1539
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1541
    :cond_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1544
    :goto_0
    return-void
.end method

.method private changeCamera(Landroid/view/View;)V
    .locals 9

    .line 1066
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1067
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1068
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 1069
    nop

    .line 1072
    move v4, v3

    goto :goto_0

    .line 1070
    :cond_0
    nop

    .line 1072
    move v4, v2

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1074
    const-wide/16 v5, 0x12c

    if-ne v4, v3, :cond_1

    .line 1075
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, -0x3ccc0000    # -180.0f

    .line 1076
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1077
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1078
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    .line 1080
    :cond_1
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x43340000    # 180.0f

    .line 1081
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1082
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1083
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1086
    :goto_1
    const-string p1, "FragmentBottomAction"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "switch camera from %d to %d, for module 0x%x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1088
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    iget v7, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x2

    aput-object v7, v6, v8

    .line 1086
    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1089
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

    .line 1095
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1096
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 1098
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v0, 0x5

    const/16 v1, 0xa2

    if-eq p1, v1, :cond_4

    packed-switch p1, :pswitch_data_0

    .line 1100
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    .line 1101
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1102
    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1103
    invoke-virtual {v0, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1104
    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1101
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1106
    goto :goto_4

    .line 1112
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1113
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1114
    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1115
    invoke-virtual {v0, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1113
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1116
    goto :goto_4

    .line 1120
    :cond_4
    nop

    .line 1121
    if-nez v4, :cond_7

    .line 1122
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    .line 1123
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1124
    const/16 p1, 0xa9

    goto :goto_3

    .line 1125
    :cond_5
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1126
    const/16 p1, 0xa8

    goto :goto_3

    .line 1127
    :cond_6
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 1128
    const/16 p1, 0xaa

    goto :goto_3

    .line 1132
    :cond_7
    move p1, v1

    :goto_3
    if-eq p1, v1, :cond_8

    .line 1133
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1136
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1137
    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1138
    invoke-virtual {p1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1139
    invoke-virtual {p1, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1136
    invoke-virtual {v1, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1146
    :goto_4
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 1147
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f0900fa

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1148
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x8000

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1150
    :cond_9
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private initThumbLayoutByIntent()V
    .locals 4

    .line 261
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    .line 262
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 268
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

    .line 270
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 271
    return-void

    .line 274
    :cond_1
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkStoragePermissions()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 275
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    .line 277
    :cond_2
    goto :goto_0

    .line 278
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 279
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 280
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 281
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 282
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v1, 0x7f0201bd

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 284
    :goto_0
    return-void
.end method

.method private isFPS960()Z
    .locals 2

    .line 1153
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1154
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    return v0

    .line 1156
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isThumbLoading()Z
    .locals 1

    .line 629
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private setProgressBarVisible(I)V
    .locals 4

    .line 819
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 820
    return-void

    .line 823
    :cond_0
    const-wide/16 v0, 0x12c

    const/4 v2, 0x2

    if-nez p1, :cond_1

    .line 824
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 825
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 826
    new-array p1, v2, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 827
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 828
    const-wide/16 v0, 0xa0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 829
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 830
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 839
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 840
    goto :goto_0

    .line 841
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_2

    .line 842
    return-void

    .line 844
    :cond_2
    new-array p1, v2, [F

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 845
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 846
    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 847
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 854
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 875
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 878
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

    .line 328
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 349
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    .line 350
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 346
    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 347
    goto :goto_1

    .line 338
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 339
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 341
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 342
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 330
    :pswitch_3
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xae

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 332
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 336
    nop

    .line 355
    :cond_2
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showReverseConfirmDialog()V
    .locals 3

    .line 1036
    const-string v0, "live\u5f55\u5236\u56de\u9000"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 1038
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1040
    const v1, 0x7f090274

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1041
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1043
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f090275

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1056
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f0901b4

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1062
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1063
    return-void
.end method

.method private startBottomAnimation(Z)V
    .locals 7

    .line 421
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    if-ne v0, p1, :cond_0

    .line 422
    return-void

    .line 424
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 426
    const v0, 0x3f666666    # 0.9f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 427
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 428
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x96

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 429
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 430
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 431
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

    .line 432
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 433
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 434
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

    .line 435
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 436
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 437
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 438
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

    .line 439
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0

    .line 441
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 442
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

    .line 443
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 444
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 445
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 446
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 447
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 448
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 449
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 450
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 451
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 452
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

    .line 453
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 455
    :goto_0
    return-void
.end method

.method private startExtraLayoutAnimation(Landroid/view/View;Z)V
    .locals 6

    .line 459
    const/high16 v0, 0x3f800000    # 1.0f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    .line 460
    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int p2, p2

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 461
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 462
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 463
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 464
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 479
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 481
    :cond_0
    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 482
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const-wide/16 v4, 0x96

    invoke-virtual {p2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 483
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 484
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 485
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

    .line 486
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 502
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 504
    :goto_0
    return-void
.end method

.method private startExtraLayoutExchangeAnimation(Landroid/view/View;)V
    .locals 3

    .line 507
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 508
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 509
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

    .line 510
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 511
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 526
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 527
    return-void
.end method

.method private updateBottomInRecording(ZZ)V
    .locals 5

    .line 1161
    const/16 v0, 0x8

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 1162
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1163
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    if-eq v2, v0, :cond_1

    .line 1164
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 1167
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1168
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 1169
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    check-cast v2, Lcom/android/camera/module/VideoModule;

    .line 1170
    invoke-virtual {v2}, Lcom/android/camera/module/VideoModule;->showFPS960Hint()V

    .line 1174
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

    .line 1176
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1177
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1178
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1179
    goto :goto_2

    .line 1200
    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1201
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1202
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    goto :goto_2

    .line 1186
    :cond_3
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1187
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1188
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1189
    goto :goto_2

    .line 1192
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1193
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1195
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->gh()Z

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

    .line 1196
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1197
    nop

    .line 1206
    :goto_2
    if-eqz p1, :cond_9

    .line 1207
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1208
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v3, 0x7f020148

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1209
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1210
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1211
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1214
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_8

    .line 1215
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v3, 0x7f020146

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1216
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1217
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1218
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1221
    :cond_8
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_9

    .line 1222
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v2, 0x7f02010c

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1223
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1224
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1229
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1230
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1233
    :cond_a
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    .line 1235
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_b

    const-wide/16 v1, 0xfa

    goto :goto_3

    :cond_b
    const-wide/16 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1236
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1266
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1311
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 1312
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

    .line 1769
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1770
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

    .line 1379
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public changeMode(II)V
    .locals 2

    .line 1325
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, v0, :cond_0

    .line 1326
    return-void

    .line 1330
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1335
    :cond_1
    :pswitch_0
    if-eq p1, v1, :cond_5

    packed-switch p1, :pswitch_data_1

    .line 1345
    :goto_0
    const/16 v0, 0xae

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveModuleClicked()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1346
    invoke-static {}, Lcom/android/camera/CameraSettings;->setLiveModuleClicked()V

    .line 1349
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1350
    return-void

    .line 1354
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1355
    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1356
    return-void

    .line 1365
    :cond_4
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1366
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1367
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1369
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1370
    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1371
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x4

    .line 1372
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    .line 1373
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x1

    .line 1374
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1370
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1375
    return-void

    .line 1340
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

    .line 309
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 310
    return-void
.end method

.method public getBeautyActionMenuType()I
    .locals 1

    .line 2044
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 1446
    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 1441
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

    .line 2049
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method public hideExtra()V
    .locals 2

    .line 1997
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/16 v1, 0xa4

    if-eqz v0, :cond_1

    .line 1999
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2001
    if-eqz v0, :cond_0

    .line 2002
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 2004
    :cond_0
    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    .line 2006
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2008
    if-eqz v0, :cond_2

    .line 2009
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 2012
    :cond_2
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 171
    const v0, 0x7f0d001b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 172
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 173
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 174
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 176
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0083

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    .line 178
    const v0, 0x7f0d0025

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 179
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 180
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 181
    nop

    .line 182
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a007c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 185
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    .line 186
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    if-nez v0, :cond_0

    .line 187
    new-instance v0, Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d001c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateMenuView()Lcom/android/camera/ui/EdgeHorizonScrollView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 190
    const v0, 0x7f0d001d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateSelectView()Lcom/android/camera/ui/ModeSelectView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 194
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/ModeSelectView;->setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V

    .line 196
    const v0, 0x7f0d0026

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    .line 197
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v1, 0x7f0d0027

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 199
    const v0, 0x7f0d0029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    .line 200
    const v0, 0x7f0d0028

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    .line 203
    const v0, 0x7f0d002a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    .line 204
    const v0, 0x7f0d002c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    .line 205
    const v0, 0x7f0d002d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    .line 206
    const v0, 0x7f0d002e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    .line 207
    const v0, 0x7f0d0021

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    .line 209
    const v0, 0x7f0d0022

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    .line 211
    const v0, 0x7f0d002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    .line 218
    const v0, 0x7f0d0023

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    .line 219
    const v0, 0x7f0d0024

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    .line 220
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1, p0}, Lcom/android/camera/ui/CameraSnapView;->setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V

    .line 223
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    .line 225
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100004

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    .line 226
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100005

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    .line 228
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 236
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v1, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->provideAnimateElement(ILjava/util/List;I)V

    .line 238
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 240
    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 241
    new-instance p1, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 243
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a002e

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    .line 246
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 247
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->setAccessibilityFocusable(Landroid/view/View;Z)V

    .line 249
    :cond_1
    return-void
.end method

.method public isShowFilterView()Z
    .locals 1

    .line 314
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public isShowLightingView()Z
    .locals 1

    .line 319
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    .line 1744
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1745
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-nez p1, :cond_0

    .line 1746
    new-instance p1, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1747
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0021

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1748
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1747
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1751
    new-instance p1, Lcom/android/camera/fragment/FragmentLighting;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentLighting;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1752
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0022

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1753
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentLighting;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1752
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 1755
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1756
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 1758
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1759
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    .line 1762
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initBeautyMenuView()V

    .line 1763
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 1764
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1719
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1720
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    .line 1721
    iget-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eq p1, p2, :cond_0

    .line 1722
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 1723
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 1724
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 1726
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 1730
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1731
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 1733
    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1734
    const/16 p1, 0xa2

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, p2, :cond_2

    .line 1735
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900cf

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1737
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900ce

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1740
    :cond_3
    :goto_0
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1570
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 5

    .line 1975
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-ne p1, v2, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v3, 0xa1

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v2, :cond_0

    .line 1977
    move v2, v1

    goto :goto_0

    .line 1975
    :cond_0
    nop

    .line 1977
    move v2, v0

    :goto_0
    if-ne p1, v1, :cond_2

    iget-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v3, :cond_2

    .line 1979
    :cond_1
    move v3, v1

    goto :goto_1

    .line 1977
    :cond_2
    nop

    .line 1979
    move v3, v0

    :goto_1
    const/4 v4, 0x2

    if-ne p1, v4, :cond_3

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1980
    move p1, v1

    goto :goto_2

    .line 1979
    :cond_3
    nop

    .line 1980
    move p1, v0

    :goto_2
    if-nez v2, :cond_5

    if-nez v3, :cond_5

    if-eqz p1, :cond_4

    goto :goto_3

    .line 1991
    :cond_4
    return v0

    .line 1982
    :cond_5
    :goto_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 1984
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1985
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 1986
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1987
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    .line 1989
    :cond_6
    return v1
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 1574
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1589
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1593
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1599
    return-void
.end method

.method public onBottomMenuAnimate(II)V
    .locals 1

    .line 2054
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->bottomMenuAnimate(II)V

    .line 2055
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 922
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 923
    return-void

    .line 926
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 927
    if-nez v0, :cond_1

    .line 928
    return-void

    .line 931
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 932
    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 933
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 934
    return-void

    .line 937
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0024

    if-eq v1, v2, :cond_16

    const v2, 0x7f0d0026

    if-eq v1, v2, :cond_13

    const v2, 0x7f0d0028

    if-eq v1, v2, :cond_c

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_6

    .line 1021
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_3

    goto :goto_0

    .line 1025
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hasSegments()Z

    move-result p1

    if-nez p1, :cond_4

    .line 1026
    return-void

    .line 1029
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showReverseConfirmDialog()V

    goto/16 :goto_6

    .line 1022
    :cond_5
    :goto_0
    return-void

    .line 1008
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_6

    goto :goto_2

    .line 1011
    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1012
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v0, v0, Lcom/android/camera/module/VideoModule;

    if-nez v0, :cond_7

    goto :goto_1

    .line 1016
    :cond_7
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1017
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    .line 1018
    goto/16 :goto_6

    .line 1013
    :cond_8
    :goto_1
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: recording snap is not allowed!!!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1014
    return-void

    .line 1009
    :cond_9
    :goto_2
    return-void

    .line 951
    :pswitch_2
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 952
    return-void

    .line 954
    :cond_a
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 955
    return-void

    .line 957
    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 958
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    .line 959
    goto/16 :goto_6

    .line 970
    :cond_c
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz p1, :cond_12

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_d

    goto :goto_5

    .line 974
    :cond_d
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xa2

    if-eq p1, v0, :cond_11

    const/16 v0, 0xae

    if-eq p1, v0, :cond_e

    packed-switch p1, :pswitch_data_1

    .line 976
    return-void

    .line 987
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f4

    cmp-long p1, v0, v2

    if-gez p1, :cond_f

    .line 988
    return-void

    .line 992
    :cond_f
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-eqz p1, :cond_10

    .line 993
    const-string p1, "live\u5f55\u5236\u7ee7\u7eed"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    goto :goto_3

    .line 995
    :cond_10
    const-string p1, "live\u5f55\u5236\u6682\u505c"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 998
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    .line 999
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1000
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1001
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    goto :goto_4

    .line 981
    :cond_11
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 982
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 983
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    .line 984
    nop

    .line 1005
    :goto_4
    goto :goto_6

    .line 971
    :cond_12
    :goto_5
    return-void

    .line 939
    :cond_13
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 940
    return-void

    .line 942
    :cond_14
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    if-nez p1, :cond_15

    .line 943
    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto :goto_6

    .line 945
    :cond_15
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 947
    goto :goto_6

    .line 962
    :cond_16
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-nez v0, :cond_17

    .line 963
    return-void

    .line 965
    :cond_17
    const-string v0, "live\u5f55\u5236\u5207\u6362"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 966
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    .line 967
    nop

    .line 1032
    :goto_6
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
.end method

.method public onHandleSwitcher(I)Z
    .locals 2

    .line 288
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez v0, :cond_0

    .line 289
    const/4 p1, 0x0

    return p1

    .line 292
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 293
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 294
    const/4 v1, 0x1

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 299
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_2

    .line 300
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentFilter;->switchFilter(I)V

    goto :goto_0

    .line 301
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_3

    .line 302
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentLighting;->switchLighting(I)V

    .line 304
    :cond_3
    :goto_0
    return v1

    .line 295
    :cond_4
    :goto_1
    return v1
.end method

.method public onModeClicked(I)V
    .locals 1

    .line 1317
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1318
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 254
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    .line 255
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 257
    return-void
.end method

.method public onSnapClick()V
    .locals 3

    .line 1820
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1821
    return-void

    .line 1824
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1825
    return-void

    .line 1828
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1829
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 1830
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1831
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1832
    return-void

    .line 1835
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1836
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because screen slide is off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1837
    return-void

    .line 1841
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1842
    if-nez v0, :cond_4

    .line 1843
    return-void

    .line 1846
    :cond_4
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapClick"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1847
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa

    packed-switch v1, :pswitch_data_0

    .line 1850
    :pswitch_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1851
    return-void

    .line 1856
    :pswitch_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1857
    return-void

    .line 1867
    :cond_5
    :pswitch_2
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v1, :cond_6

    .line 1868
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 1871
    :cond_6
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1853
    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 1854
    nop

    .line 1875
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1876
    const/16 v0, 0xa2

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne v0, v1, :cond_9

    .line 1877
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1878
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fc

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1880
    :cond_8
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fd

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1883
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fb

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1885
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x8000

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1887
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

    .line 1891
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1892
    return-void

    .line 1896
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1897
    if-nez v0, :cond_1

    .line 1898
    return-void

    .line 1901
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1902
    return-void

    .line 1905
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1906
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    .line 1907
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1908
    return-void

    .line 1912
    :cond_3
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPress"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1914
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1915
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1917
    :cond_4
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    .line 1941
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1942
    return-void

    .line 1946
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1947
    if-nez v0, :cond_1

    .line 1948
    return-void

    .line 1951
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1952
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1954
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_3

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xab

    if-eq v0, v1, :cond_2

    .line 1956
    goto :goto_0

    .line 1967
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    .line 1959
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_4

    .line 1960
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1970
    :cond_4
    :goto_0
    return-void
.end method

.method public onSnapLongPressCancelOut()V
    .locals 3

    .line 1921
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1922
    return-void

    .line 1926
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1927
    if-nez v0, :cond_1

    .line 1928
    return-void

    .line 1931
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1932
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1934
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_2

    .line 1935
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1937
    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    .line 1775
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1776
    return-void

    .line 1780
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1781
    if-nez v0, :cond_1

    .line 1782
    return-void

    .line 1784
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1785
    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    .line 1786
    return-void
.end method

.method public onSwitchBeautyActionMenu(I)V
    .locals 2

    .line 2035
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2036
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2038
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    .line 2039
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2040
    return-void
.end method

.method public onSwitchCameraActionMenu(I)V
    .locals 2

    .line 2016
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    .line 2017
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 2018
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2021
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    .line 2022
    return-void
.end method

.method public onSwitchLiveActionMenu(I)V
    .locals 3

    .line 2026
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2027
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2029
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentLiveActionMenuType:I

    .line 2030
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2031
    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 4

    .line 1790
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1791
    return-void

    .line 1794
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1796
    if-nez v0, :cond_1

    .line 1797
    return-void

    .line 1799
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

    .line 1800
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    .line 1801
    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 4

    .line 1805
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1806
    return-void

    .line 1809
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1811
    if-nez v0, :cond_1

    .line 1812
    return-void

    .line 1814
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

    .line 1815
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    .line 1816
    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 0

    .line 883
    if-eqz p1, :cond_0

    .line 884
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    goto :goto_0

    .line 886
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    .line 888
    :goto_0
    return-void
.end method

.method public processingFailed()V
    .locals 1

    .line 762
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateLoading(Z)V

    .line 763
    return-void
.end method

.method public processingFinish()V
    .locals 4

    .line 731
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 732
    return-void

    .line 735
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 736
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 738
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 739
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 740
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 741
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 742
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 743
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 745
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v0, v2, :cond_2

    .line 746
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 747
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 748
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 751
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 752
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    invoke-static {v1, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 753
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 754
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 755
    invoke-direct {p0, v1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 758
    return-void
.end method

.method public processingPause()V
    .locals 3

    .line 696
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 698
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 699
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f020147

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 700
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0900d4

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 702
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    .line 703
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 704
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 705
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 706
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 707
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    .line 708
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 710
    :cond_1
    return-void
.end method

.method public processingPostAction()V
    .locals 5

    .line 805
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 806
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 808
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 809
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 810
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 811
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 812
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 813
    invoke-direct {p0, v1, v4}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 814
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 815
    return-void
.end method

.method public processingPrepare()V
    .locals 5

    .line 669
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 670
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    .line 671
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    .line 670
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v4, v0, v3, v1, v2}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 672
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 673
    invoke-direct {p0, v3, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 674
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 676
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    .line 677
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 679
    :cond_0
    return-void
.end method

.method public processingResume()V
    .locals 5

    .line 714
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 716
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 717
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f020146

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 718
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f0900d3

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 720
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v1, v2, :cond_2

    .line 721
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 722
    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 723
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    .line 724
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const/16 v3, 0x8

    if-nez v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v0

    :goto_0
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 725
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    if-nez v1, :cond_1

    move v0, v3

    nop

    :cond_1
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 727
    :cond_2
    return-void
.end method

.method public processingStart()V
    .locals 5

    .line 683
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 684
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 686
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 687
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    .line 688
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    .line 687
    const/4 v4, 0x1

    invoke-static {v1, v0, v4, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 689
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 691
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 692
    return-void
.end method

.method public processingWorkspace(Z)V
    .locals 2

    .line 767
    const/16 v0, 0x8

    if-eqz p1, :cond_2

    .line 768
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 769
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 770
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 771
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_0

    .line 773
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f020147

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 774
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 776
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_1

    .line 777
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 779
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_5

    .line 780
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 784
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 785
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 786
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 787
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 788
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 789
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 790
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 792
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 793
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 795
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_5

    .line 796
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 800
    :cond_5
    :goto_0
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

    .line 1453
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1454
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-ne p3, v3, :cond_0

    .line 1455
    move v3, v2

    goto :goto_0

    .line 1454
    :cond_0
    nop

    .line 1455
    move v3, v1

    :goto_0
    if-nez v3, :cond_1

    if-eq v0, p1, :cond_3

    .line 1456
    :cond_1
    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v4, :cond_2

    .line 1457
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideFilterView()Z

    goto :goto_1

    .line 1458
    :cond_2
    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v4, :cond_3

    .line 1459
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideLightingView()Z

    .line 1463
    :cond_3
    :goto_1
    const/16 v4, 0xae

    if-ne v0, v4, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_5

    .line 1464
    if-nez v3, :cond_4

    .line 1465
    return-void

    .line 1467
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    .line 1471
    :cond_5
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 1474
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz p3, :cond_6

    .line 1475
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p3, p2}, Lcom/android/camera/fragment/FragmentFilter;->isShowAnimation(Ljava/util/List;)V

    .line 1479
    :cond_6
    const/16 p3, 0xa5

    if-eq p1, p3, :cond_7

    goto :goto_2

    .line 1481
    :cond_7
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0b003e

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1485
    :goto_2
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    if-eqz p2, :cond_8

    move v0, v2

    goto :goto_3

    :cond_8
    move v0, v1

    :goto_3
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    invoke-virtual {p3, p1, v0, v3}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    .line 1493
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3}, Lcom/android/camera/ui/ModeSelectView;->getVisibility()I

    move-result p3

    if-eqz p3, :cond_9

    .line 1494
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 1496
    :cond_9
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    .line 1499
    const/4 p3, -0x1

    packed-switch p1, :pswitch_data_0

    .line 1501
    :pswitch_0
    nop

    .line 1502
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1503
    nop

    .line 1522
    :goto_4
    move p3, v2

    goto :goto_5

    .line 1505
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 1506
    nop

    .line 1507
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    .line 1509
    :cond_a
    nop

    .line 1510
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1512
    goto :goto_5

    .line 1517
    :pswitch_2
    nop

    .line 1518
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1522
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, p3, :cond_b

    .line 1523
    return-void

    .line 1525
    :cond_b
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1527
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p0, p3, p2, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->animateViews(ILjava/util/List;Landroid/view/View;)V

    .line 1528
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

    .line 1549
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 1554
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 1555
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 1558
    return-object p1

    .line 1551
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 1563
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

    .line 1703
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1705
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1706
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1707
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1708
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1710
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1712
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1713
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1714
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 895
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 896
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 897
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 898
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 899
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 900
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 901
    return-void
.end method

.method public selectMode(II)V
    .locals 7

    .line 1385
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1386
    return-void

    .line 1388
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

    .line 1389
    if-ne p1, v2, :cond_1

    .line 1390
    nop

    .line 1402
    :goto_0
    move p1, v4

    goto :goto_2

    .line 1391
    :cond_1
    if-ne p1, v1, :cond_4

    .line 1392
    goto :goto_1

    .line 1395
    :cond_2
    if-ne p1, v2, :cond_3

    .line 1396
    nop

    .line 1402
    :goto_1
    move p1, v3

    goto :goto_2

    .line 1397
    :cond_3
    if-ne p1, v1, :cond_4

    .line 1398
    goto :goto_0

    .line 1402
    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1405
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa9

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa8

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xaa

    if-ne v1, v2, :cond_6

    .line 1408
    :cond_5
    const/16 v0, 0xa2

    .line 1411
    :cond_6
    nop

    .line 1412
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 1413
    const/4 v2, 0x0

    move v5, v2

    :goto_3
    if-ge v5, v1, :cond_8

    .line 1414
    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v6, v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v6

    if-ne v6, v0, :cond_7

    .line 1415
    nop

    .line 1416
    nop

    .line 1419
    move v2, v5

    goto :goto_4

    .line 1413
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1419
    :cond_8
    :goto_4
    if-eq p1, v3, :cond_a

    if-eq p1, v4, :cond_9

    goto :goto_5

    .line 1427
    :cond_9
    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_b

    .line 1428
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1421
    :cond_a
    if-lez v2, :cond_b

    .line 1422
    add-int/lit8 v2, v2, -0x1

    .line 1435
    :cond_b
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result p1

    .line 1436
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1437
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 532
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 535
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    .line 536
    return-void
.end method

.method public setLightingViewStatus(Z)V
    .locals 0

    .line 324
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 325
    return-void
.end method

.method public showOrHideBottomViewWithAnim(Z)V
    .locals 7

    .line 1603
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1604
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1605
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1606
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

    .line 1607
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1608
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1609
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1610
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1611
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1612
    if-eqz p1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1613
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1614
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1615
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1616
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1617
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1618
    if-eqz p1, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1619
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1620
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1622
    return-void
.end method

.method public showOrHideFilterView()Z
    .locals 3

    .line 364
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 365
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 366
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 368
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 369
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const v2, 0x7f0900f9

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 370
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 373
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_1

    .line 374
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 375
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 378
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 379
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->reInit()V

    .line 381
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 382
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 384
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 386
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public showOrHideLightingView()Z
    .locals 3

    .line 391
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 393
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 394
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    goto :goto_0

    .line 403
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 404
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 405
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 408
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 409
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 411
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 412
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 414
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 416
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 905
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 907
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 908
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 909
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 910
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 911
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 912
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 913
    return-void
.end method

.method public updateLoading(Z)V
    .locals 3

    .line 641
    if-nez p1, :cond_2

    .line 642
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p1, :cond_0

    .line 643
    return-void

    .line 645
    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 646
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xac

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 648
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 649
    goto :goto_0

    .line 655
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 656
    goto :goto_0

    .line 661
    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 662
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 663
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 665
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

    .line 359
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 360
    return-void
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 3

    .line 562
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 563
    return-void

    .line 570
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 571
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    .line 572
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v2

    if-eq v2, p1, :cond_1

    .line 573
    invoke-virtual {v0, p1, v1, v1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 574
    const-string v0, "FragmentBottomAction"

    const-string v2, "inconsistent thumbnail"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 578
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 579
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2

    .line 580
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 583
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v0, :cond_3

    .line 584
    return-void

    .line 587
    :cond_3
    if-nez p1, :cond_4

    .line 588
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const p2, 0x7f020158

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 589
    return-void

    .line 593
    :cond_4
    nop

    .line 594
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object p1

    .line 595
    invoke-virtual {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 596
    invoke-virtual {p1, v1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    .line 597
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 599
    if-eqz p2, :cond_6

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz p1, :cond_5

    goto :goto_0

    .line 619
    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const p2, 0x3e99999a    # 0.3f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 620
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 621
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 622
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

    .line 623
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 624
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 626
    return-void

    .line 600
    :cond_6
    :goto_0
    return-void
.end method
