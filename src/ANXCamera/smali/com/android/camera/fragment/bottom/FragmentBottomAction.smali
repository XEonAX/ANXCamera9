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

.field private mReverseDialog:Landroid/app/AlertDialog;

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

    .line 153
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

.method static synthetic access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
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

.method static synthetic access$302(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/CameraSnapView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    .line 82
    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    return p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 2

    .line 541
    const v0, 0x7f0b003e

    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    .line 542
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 543
    return-void

    .line 546
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    .line 547
    const/4 v1, 0x1

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 550
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 551
    goto :goto_0

    .line 555
    :cond_1
    const p2, 0x7f0b0049

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 558
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

    .line 1545
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 1546
    if-nez p2, :cond_0

    .line 1547
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1549
    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1552
    :cond_1
    if-nez p2, :cond_2

    .line 1553
    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 1555
    :cond_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1558
    :goto_0
    return-void
.end method

.method private changeCamera(Landroid/view/View;)V
    .locals 9

    .line 1070
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1071
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 1072
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    .line 1073
    nop

    .line 1076
    move v4, v3

    goto :goto_0

    .line 1074
    :cond_0
    nop

    .line 1076
    move v4, v2

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 1078
    const-wide/16 v5, 0x12c

    if-ne v4, v3, :cond_1

    .line 1079
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, -0x3ccc0000    # -180.0f

    .line 1080
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1081
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1082
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    .line 1084
    :cond_1
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x43340000    # 180.0f

    .line 1085
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1086
    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1087
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1090
    :goto_1
    const-string p1, "FragmentBottomAction"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "switch camera from %d to %d, for module 0x%x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    .line 1092
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

    .line 1090
    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1093
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

    .line 1099
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1100
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 1102
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v0, 0x5

    const/16 v1, 0xa2

    if-eq p1, v1, :cond_4

    packed-switch p1, :pswitch_data_0

    .line 1104
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    .line 1105
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1106
    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1107
    invoke-virtual {v0, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1108
    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1105
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1110
    goto :goto_4

    .line 1116
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1117
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1118
    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1119
    invoke-virtual {v0, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1117
    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1120
    goto :goto_4

    .line 1124
    :cond_4
    nop

    .line 1125
    if-nez v4, :cond_7

    .line 1126
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    .line 1127
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1128
    const/16 p1, 0xa9

    goto :goto_3

    .line 1129
    :cond_5
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1130
    const/16 p1, 0xa8

    goto :goto_3

    .line 1131
    :cond_6
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 1132
    const/16 p1, 0xaa

    goto :goto_3

    .line 1136
    :cond_7
    move p1, v1

    :goto_3
    if-eq p1, v1, :cond_8

    .line 1137
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1140
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1141
    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1142
    invoke-virtual {p1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1143
    invoke-virtual {p1, v8}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1140
    invoke-virtual {v1, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1150
    :goto_4
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 1151
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f0900fa

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1152
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x8000

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1154
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

    .line 263
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    .line 264
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 270
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

    .line 272
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 273
    return-void

    .line 276
    :cond_1
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkStoragePermissions()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 277
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    .line 279
    :cond_2
    goto :goto_0

    .line 280
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 281
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 282
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 283
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 284
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v1, 0x7f0201d5

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 286
    :goto_0
    return-void
.end method

.method private isFPS960()Z
    .locals 2

    .line 1157
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fu()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1158
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    return v0

    .line 1160
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isThumbLoading()Z
    .locals 1

    .line 631
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private setProgressBarVisible(I)V
    .locals 4

    .line 821
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 822
    return-void

    .line 825
    :cond_0
    const-wide/16 v0, 0x12c

    const/4 v2, 0x2

    if-nez p1, :cond_1

    .line 826
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 827
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 828
    new-array p1, v2, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 829
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 830
    const-wide/16 v0, 0xa0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 831
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 832
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 841
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 842
    goto :goto_0

    .line 843
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_2

    .line 844
    return-void

    .line 846
    :cond_2
    new-array p1, v2, [F

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 847
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 848
    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 849
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 856
    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 877
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 880
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

    .line 330
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 351
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    .line 352
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 348
    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 349
    goto :goto_1

    .line 340
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 341
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 343
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 344
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 332
    :pswitch_3
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xae

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 334
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 337
    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 338
    nop

    .line 357
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

    .line 1039
    const-string v0, "live\u5f55\u5236\u56de\u9000"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 1041
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1043
    const v1, 0x7f090277

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1044
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1046
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f090278

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1060
    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f0901b6

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1066
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    .line 1067
    return-void
.end method

.method private startBottomAnimation(Z)V
    .locals 7

    .line 423
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    if-ne v0, p1, :cond_0

    .line 424
    return-void

    .line 426
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    .line 428
    const v0, 0x3f666666    # 0.9f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 429
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 430
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x96

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 431
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 432
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 433
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

    .line 434
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 435
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 436
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

    .line 437
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 438
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 439
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 440
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

    .line 441
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0

    .line 443
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 444
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

    .line 445
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 446
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 447
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 448
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 449
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 450
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 451
    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 452
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 453
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 454
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

    .line 455
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 457
    :goto_0
    return-void
.end method

.method private startExtraLayoutAnimation(Landroid/view/View;Z)V
    .locals 6

    .line 461
    const/high16 v0, 0x3f800000    # 1.0f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    .line 462
    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int p2, p2

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 463
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 464
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 465
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 466
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 481
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 483
    :cond_0
    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 484
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const-wide/16 v4, 0x96

    invoke-virtual {p2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 485
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 486
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 487
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

    .line 488
    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 504
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 506
    :goto_0
    return-void
.end method

.method private startExtraLayoutExchangeAnimation(Landroid/view/View;)V
    .locals 3

    .line 509
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 510
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 511
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

    .line 512
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    .line 513
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 528
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 529
    return-void
.end method

.method private updateBottomInRecording(ZZ)V
    .locals 5

    .line 1165
    const/16 v0, 0x8

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 1166
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1167
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    if-eq v2, v0, :cond_1

    .line 1168
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 1171
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1172
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 1173
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    check-cast v2, Lcom/android/camera/module/VideoModule;

    .line 1174
    invoke-virtual {v2}, Lcom/android/camera/module/VideoModule;->showFPS960Hint()V

    .line 1178
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

    .line 1180
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1181
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1182
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1183
    goto :goto_2

    .line 1204
    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1205
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1206
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    goto :goto_2

    .line 1190
    :cond_3
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1191
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1192
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 1193
    goto :goto_2

    .line 1196
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1197
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 1199
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->gw()Z

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

    .line 1200
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    .line 1201
    nop

    .line 1210
    :goto_2
    if-eqz p1, :cond_9

    .line 1211
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1212
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v3, 0x7f02014f

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1213
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1214
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1215
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1218
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_8

    .line 1219
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v3, 0x7f02014d

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1220
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1221
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1222
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1225
    :cond_8
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_9

    .line 1226
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v2, 0x7f020112

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1227
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 1228
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1233
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1234
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1237
    :cond_a
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    .line 1239
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_b

    const-wide/16 v1, 0xfa

    goto :goto_3

    :cond_b
    const-wide/16 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1240
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1270
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1315
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 1316
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

    .line 1783
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1784
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isBlockSnap()Z

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

    .line 1386
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public changeMode(II)V
    .locals 3

    .line 1332
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, v0, :cond_0

    .line 1333
    return-void

    .line 1337
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1342
    :cond_1
    :pswitch_0
    if-eq p1, v1, :cond_5

    packed-switch p1, :pswitch_data_1

    .line 1352
    :goto_0
    const/16 v0, 0xae

    const/4 v1, 0x1

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveModuleClicked()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1353
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setLiveModuleClicked(Z)V

    .line 1356
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1357
    return-void

    .line 1361
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa1

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1362
    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1363
    return-void

    .line 1372
    :cond_4
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1373
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1374
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1376
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1377
    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1378
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x4

    .line 1379
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    .line 1380
    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1381
    invoke-virtual {p1, v1}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    .line 1377
    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1382
    return-void

    .line 1347
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

    .line 311
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 312
    return-void
.end method

.method public getBeautyActionMenuType()I
    .locals 1

    .line 2058
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 1453
    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 1448
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

    .line 2063
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method public hideExtra()V
    .locals 2

    .line 2011
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/16 v1, 0xa4

    if-eqz v0, :cond_1

    .line 2013
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2015
    if-eqz v0, :cond_0

    .line 2016
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 2018
    :cond_0
    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    .line 2020
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 2022
    if-eqz v0, :cond_2

    .line 2023
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 2026
    :cond_2
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 173
    const v0, 0x7f0d0019

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 174
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    .line 175
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 176
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 178
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0083

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    .line 180
    const v0, 0x7f0d0023

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 181
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 182
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 183
    nop

    .line 184
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a007c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 187
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    .line 188
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d001a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateMenuView()Lcom/android/camera/ui/EdgeHorizonScrollView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 192
    const v0, 0x7f0d001b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateSelectView()Lcom/android/camera/ui/ModeSelectView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    .line 195
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 196
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/ModeSelectView;->setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V

    .line 198
    const v0, 0x7f0d0024

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    .line 199
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v1, 0x7f0d0025

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 201
    const v0, 0x7f0d0027

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    .line 202
    const v0, 0x7f0d0026

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    .line 205
    const v0, 0x7f0d0028

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    .line 206
    const v0, 0x7f0d002a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    .line 207
    const v0, 0x7f0d002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    .line 208
    const v0, 0x7f0d002c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    .line 209
    const v0, 0x7f0d001f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    .line 211
    const v0, 0x7f0d0020

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    .line 213
    const v0, 0x7f0d0029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    .line 220
    const v0, 0x7f0d0021

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    .line 221
    const v0, 0x7f0d0022

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    .line 222
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1, p0}, Lcom/android/camera/ui/CameraSnapView;->setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V

    .line 225
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    .line 227
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100004

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    .line 228
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f100005

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    .line 230
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 238
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v1, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->provideAnimateElement(ILjava/util/List;I)V

    .line 240
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 242
    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 243
    new-instance p1, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 245
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a002e

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    .line 248
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 249
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->setAccessibilityFocusable(Landroid/view/View;Z)V

    .line 251
    :cond_1
    return-void
.end method

.method public isShowFilterView()Z
    .locals 1

    .line 316
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public isShowLightingView()Z
    .locals 1

    .line 321
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    .line 1758
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1759
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-nez p1, :cond_0

    .line 1760
    new-instance p1, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1761
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d001f

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 1762
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1761
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1765
    new-instance p1, Lcom/android/camera/fragment/FragmentLighting;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentLighting;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1766
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0020

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    .line 1767
    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentLighting;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1766
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 1769
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1770
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 1772
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1773
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    .line 1776
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initBeautyMenuView()V

    .line 1777
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 1778
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1733
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1734
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    .line 1735
    iget-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eq p1, p2, :cond_0

    .line 1736
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    .line 1737
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 1738
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 1740
    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 1744
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1745
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 1747
    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1748
    const/16 p1, 0xa2

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, p2, :cond_2

    .line 1749
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900cf

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1751
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900ce

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1754
    :cond_3
    :goto_0
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1584
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 5

    .line 1989
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-ne p1, v2, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v3, 0xa1

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v2, :cond_0

    .line 1991
    move v2, v1

    goto :goto_0

    .line 1989
    :cond_0
    nop

    .line 1991
    move v2, v0

    :goto_0
    if-ne p1, v1, :cond_2

    iget-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v3, :cond_2

    .line 1993
    :cond_1
    move v3, v1

    goto :goto_1

    .line 1991
    :cond_2
    nop

    .line 1993
    move v3, v0

    :goto_1
    const/4 v4, 0x2

    if-ne p1, v4, :cond_3

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1994
    move p1, v1

    goto :goto_2

    .line 1993
    :cond_3
    nop

    .line 1994
    move p1, v0

    :goto_2
    if-nez v2, :cond_5

    if-nez v3, :cond_5

    if-eqz p1, :cond_4

    goto :goto_3

    .line 2005
    :cond_4
    return v0

    .line 1996
    :cond_5
    :goto_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 1998
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1999
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 2000
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 2001
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    .line 2003
    :cond_6
    return v1
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 1588
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1603
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1607
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1613
    return-void
.end method

.method public onBottomMenuAnimate(II)V
    .locals 1

    .line 2068
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->bottomMenuAnimate(II)V

    .line 2069
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 924
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 925
    return-void

    .line 928
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 929
    if-nez v0, :cond_1

    .line 930
    return-void

    .line 933
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 934
    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 935
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 936
    return-void

    .line 939
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0d0022

    if-eq v1, v2, :cond_16

    const v2, 0x7f0d0024

    if-eq v1, v2, :cond_13

    const v2, 0x7f0d0026

    if-eq v1, v2, :cond_c

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_6

    .line 1024
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_3

    goto :goto_0

    .line 1028
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hasSegments()Z

    move-result p1

    if-nez p1, :cond_4

    .line 1029
    return-void

    .line 1032
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showReverseConfirmDialog()V

    goto/16 :goto_6

    .line 1025
    :cond_5
    :goto_0
    return-void

    .line 1011
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_6

    goto :goto_2

    .line 1014
    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1015
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v0, v0, Lcom/android/camera/module/VideoModule;

    if-nez v0, :cond_7

    goto :goto_1

    .line 1019
    :cond_7
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 1020
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    .line 1021
    goto/16 :goto_6

    .line 1016
    :cond_8
    :goto_1
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: recording snap is not allowed!!!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1017
    return-void

    .line 1012
    :cond_9
    :goto_2
    return-void

    .line 953
    :pswitch_2
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 954
    return-void

    .line 956
    :cond_a
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 957
    return-void

    .line 959
    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    .line 960
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    .line 961
    goto/16 :goto_6

    .line 972
    :cond_c
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz p1, :cond_12

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_d

    goto :goto_5

    .line 976
    :cond_d
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xa2

    if-eq p1, v0, :cond_11

    const/16 v0, 0xae

    if-eq p1, v0, :cond_e

    packed-switch p1, :pswitch_data_1

    .line 978
    return-void

    .line 989
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    sub-long/2addr v0, v2

    .line 990
    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_f

    const-wide/16 v2, 0x1f4

    cmp-long p1, v0, v2

    if-gez p1, :cond_f

    .line 991
    return-void

    .line 995
    :cond_f
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-eqz p1, :cond_10

    .line 996
    const-string p1, "live\u5f55\u5236\u7ee7\u7eed"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    goto :goto_3

    .line 998
    :cond_10
    const-string p1, "live\u5f55\u5236\u6682\u505c"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 1001
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    .line 1002
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 1003
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    .line 1004
    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    goto :goto_4

    .line 983
    :cond_11
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 984
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    .line 985
    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    .line 986
    nop

    .line 1008
    :goto_4
    goto :goto_6

    .line 973
    :cond_12
    :goto_5
    return-void

    .line 941
    :cond_13
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 942
    return-void

    .line 944
    :cond_14
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    if-nez p1, :cond_15

    .line 945
    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto :goto_6

    .line 947
    :cond_15
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    .line 949
    goto :goto_6

    .line 964
    :cond_16
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-nez v0, :cond_17

    .line 965
    return-void

    .line 967
    :cond_17
    const-string v0, "live\u5f55\u5236\u5207\u6362"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 968
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    .line 969
    nop

    .line 1035
    :goto_6
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
.end method

.method public onHandleSwitcher(I)Z
    .locals 2

    .line 290
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez v0, :cond_0

    .line 291
    const/4 p1, 0x0

    return p1

    .line 294
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 295
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 296
    const/4 v1, 0x1

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 301
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_2

    .line 302
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentFilter;->switchFilter(I)V

    goto :goto_0

    .line 303
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_3

    .line 304
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentLighting;->switchLighting(I)V

    .line 306
    :cond_3
    :goto_0
    return v1

    .line 297
    :cond_4
    :goto_1
    return v1
.end method

.method public onModeClicked(I)V
    .locals 1

    .line 1320
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isShowFilterView()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isShowLightingView()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1324
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1325
    return-void

    .line 1321
    :cond_1
    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 256
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    .line 257
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 259
    return-void
.end method

.method public onSnapClick()V
    .locals 3

    .line 1834
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1835
    return-void

    .line 1838
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1839
    return-void

    .line 1842
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 1843
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 1844
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1845
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1846
    return-void

    .line 1849
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1850
    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because screen slide is off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1851
    return-void

    .line 1855
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1856
    if-nez v0, :cond_4

    .line 1857
    return-void

    .line 1860
    :cond_4
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapClick"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1861
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa

    packed-switch v1, :pswitch_data_0

    .line 1864
    :pswitch_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isBlockSnap()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1865
    return-void

    .line 1870
    :pswitch_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1871
    return-void

    .line 1881
    :cond_5
    :pswitch_2
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v1, :cond_6

    .line 1882
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 1885
    :cond_6
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1867
    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 1868
    nop

    .line 1889
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1890
    const/16 v0, 0xa2

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne v0, v1, :cond_9

    .line 1891
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1892
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fc

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1894
    :cond_8
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fd

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1897
    :cond_9
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f0900fb

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1899
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x8000

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1901
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

    .line 1905
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1906
    return-void

    .line 1910
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1911
    if-nez v0, :cond_1

    .line 1912
    return-void

    .line 1915
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1916
    return-void

    .line 1919
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1920
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    .line 1921
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1922
    return-void

    .line 1926
    :cond_3
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPress"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1928
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1929
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1931
    :cond_4
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    .line 1955
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1956
    return-void

    .line 1960
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1961
    if-nez v0, :cond_1

    .line 1962
    return-void

    .line 1965
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1966
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1968
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_3

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xab

    if-eq v0, v1, :cond_2

    .line 1970
    goto :goto_0

    .line 1981
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    .line 1973
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_4

    .line 1974
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1984
    :cond_4
    :goto_0
    return-void
.end method

.method public onSnapLongPressCancelOut()V
    .locals 3

    .line 1935
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1936
    return-void

    .line 1940
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1941
    if-nez v0, :cond_1

    .line 1942
    return-void

    .line 1945
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1946
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1948
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_2

    .line 1949
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    .line 1951
    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    .line 1789
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1790
    return-void

    .line 1794
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1795
    if-nez v0, :cond_1

    .line 1796
    return-void

    .line 1798
    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1799
    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    .line 1800
    return-void
.end method

.method public onSwitchBeautyActionMenu(I)V
    .locals 2

    .line 2049
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2050
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2052
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    .line 2053
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2054
    return-void
.end method

.method public onSwitchCameraActionMenu(I)V
    .locals 2

    .line 2030
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    .line 2031
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 2032
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2035
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    .line 2036
    return-void
.end method

.method public onSwitchLiveActionMenu(I)V
    .locals 3

    .line 2040
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2041
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2043
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentLiveActionMenuType:I

    .line 2044
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    .line 2045
    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 4

    .line 1804
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1805
    return-void

    .line 1808
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1810
    if-nez v0, :cond_1

    .line 1811
    return-void

    .line 1813
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

    .line 1814
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    .line 1815
    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 4

    .line 1819
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1820
    return-void

    .line 1823
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1825
    if-nez v0, :cond_1

    .line 1826
    return-void

    .line 1828
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

    .line 1829
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    .line 1830
    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 0

    .line 885
    if-eqz p1, :cond_0

    .line 886
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    goto :goto_0

    .line 888
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    .line 890
    :goto_0
    return-void
.end method

.method public processingFailed()V
    .locals 1

    .line 764
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateLoading(Z)V

    .line 765
    return-void
.end method

.method public processingFinish()V
    .locals 4

    .line 733
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 734
    return-void

    .line 737
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 738
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 740
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 741
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 742
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 743
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 744
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 745
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 747
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v0, v2, :cond_2

    .line 748
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 749
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 750
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 753
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 754
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    invoke-static {v1, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 755
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 756
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 757
    invoke-direct {p0, v1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 760
    return-void
.end method

.method public processingPause()V
    .locals 3

    .line 698
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 700
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 701
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f02014e

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 702
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0900d4

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 704
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    .line 705
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 706
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 707
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 708
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 709
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    .line 710
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 712
    :cond_1
    return-void
.end method

.method public processingPostAction()V
    .locals 5

    .line 807
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 808
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    .line 810
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 811
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 812
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 813
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 814
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 815
    invoke-direct {p0, v1, v4}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 816
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    .line 817
    return-void
.end method

.method public processingPrepare()V
    .locals 5

    .line 671
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 672
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    .line 673
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    .line 672
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v4, v0, v3, v1, v2}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 674
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 675
    invoke-direct {p0, v3, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    .line 676
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 678
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    .line 679
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 681
    :cond_0
    return-void
.end method

.method public processingResume()V
    .locals 5

    .line 716
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    .line 718
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 719
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f02014d

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 720
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f0900d3

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 722
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v1, v2, :cond_2

    .line 723
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    .line 724
    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 725
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    .line 726
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const/16 v3, 0x8

    if-nez v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v0

    :goto_0
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 727
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    if-nez v1, :cond_1

    move v0, v3

    nop

    :cond_1
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 729
    :cond_2
    return-void
.end method

.method public processingStart()V
    .locals 5

    .line 685
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 686
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 687
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 688
    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 689
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    .line 690
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v4

    .line 689
    invoke-static {v1, v2, v0, v3, v4}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 691
    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    .line 693
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    .line 694
    return-void
.end method

.method public processingWorkspace(Z)V
    .locals 2

    .line 769
    const/16 v0, 0x8

    if-eqz p1, :cond_2

    .line 770
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    .line 771
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 772
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 773
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_0

    .line 775
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f02014e

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 776
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 778
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_1

    .line 779
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 781
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_5

    .line 782
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 786
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 787
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    .line 788
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 789
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    .line 790
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 791
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 792
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 794
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 795
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 797
    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_5

    .line 798
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 802
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

    .line 1460
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1461
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-ne p3, v3, :cond_0

    .line 1462
    move v3, v2

    goto :goto_0

    .line 1461
    :cond_0
    nop

    .line 1462
    move v3, v1

    :goto_0
    if-nez v3, :cond_1

    if-eq v0, p1, :cond_4

    .line 1463
    :cond_1
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    if-eqz v4, :cond_2

    .line 1464
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->dismiss()V

    .line 1467
    :cond_2
    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v4, :cond_3

    .line 1468
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideFilterView()Z

    goto :goto_1

    .line 1469
    :cond_3
    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v4, :cond_4

    .line 1470
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideLightingView()Z

    .line 1474
    :cond_4
    :goto_1
    const/16 v4, 0xae

    if-ne v0, v4, :cond_6

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_6

    .line 1475
    if-nez v3, :cond_5

    .line 1476
    return-void

    .line 1478
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    .line 1482
    :cond_6
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 1485
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz p3, :cond_7

    .line 1486
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p3, p2}, Lcom/android/camera/fragment/FragmentFilter;->isShowAnimation(Ljava/util/List;)V

    .line 1490
    :cond_7
    const/16 p3, 0xa5

    if-eq p1, p3, :cond_8

    goto :goto_2

    .line 1492
    :cond_8
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0b003e

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1496
    :goto_2
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    if-eqz p2, :cond_9

    move v0, v2

    goto :goto_3

    :cond_9
    move v0, v1

    :goto_3
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    invoke-virtual {p3, p1, v0, v3}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    .line 1504
    iget-boolean p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-nez p3, :cond_a

    iget-boolean p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez p3, :cond_a

    .line 1505
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3}, Lcom/android/camera/ui/ModeSelectView;->getVisibility()I

    move-result p3

    if-eqz p3, :cond_a

    .line 1506
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 1510
    :cond_a
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    .line 1513
    const/4 p3, -0x1

    packed-switch p1, :pswitch_data_0

    .line 1515
    :pswitch_0
    nop

    .line 1516
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1517
    nop

    .line 1536
    :goto_4
    move p3, v2

    goto :goto_5

    .line 1519
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->hC()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 1520
    nop

    .line 1521
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    .line 1523
    :cond_b
    nop

    .line 1524
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1526
    goto :goto_5

    .line 1531
    :pswitch_2
    nop

    .line 1532
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1536
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, p3, :cond_c

    .line 1537
    return-void

    .line 1539
    :cond_c
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1541
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p0, p3, p2, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->animateViews(ILjava/util/List;Landroid/view/View;)V

    .line 1542
    return-void

    nop

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

    .line 1563
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 1568
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 1569
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 1572
    return-object p1

    .line 1565
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 1577
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

    .line 1717
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1719
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1720
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1721
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1722
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1724
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1726
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1727
    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1728
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 897
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 898
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 899
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 900
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 901
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 902
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 903
    return-void
.end method

.method public selectMode(II)V
    .locals 7

    .line 1392
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1393
    return-void

    .line 1395
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

    .line 1396
    if-ne p1, v2, :cond_1

    .line 1397
    nop

    .line 1409
    :goto_0
    move p1, v4

    goto :goto_2

    .line 1398
    :cond_1
    if-ne p1, v1, :cond_4

    .line 1399
    goto :goto_1

    .line 1402
    :cond_2
    if-ne p1, v2, :cond_3

    .line 1403
    nop

    .line 1409
    :goto_1
    move p1, v3

    goto :goto_2

    .line 1404
    :cond_3
    if-ne p1, v1, :cond_4

    .line 1405
    goto :goto_0

    .line 1409
    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    .line 1412
    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa9

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa8

    if-eq v1, v2, :cond_5

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xaa

    if-ne v1, v2, :cond_6

    .line 1415
    :cond_5
    const/16 v0, 0xa2

    .line 1418
    :cond_6
    nop

    .line 1419
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 1420
    const/4 v2, 0x0

    move v5, v2

    :goto_3
    if-ge v5, v1, :cond_8

    .line 1421
    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v6, v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v6

    if-ne v6, v0, :cond_7

    .line 1422
    nop

    .line 1423
    nop

    .line 1426
    move v2, v5

    goto :goto_4

    .line 1420
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1426
    :cond_8
    :goto_4
    if-eq p1, v3, :cond_a

    if-eq p1, v4, :cond_9

    goto :goto_5

    .line 1434
    :cond_9
    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_b

    .line 1435
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1428
    :cond_a
    if-lez v2, :cond_b

    .line 1429
    add-int/lit8 v2, v2, -0x1

    .line 1442
    :cond_b
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result p1

    .line 1443
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeMode(II)V

    .line 1444
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 534
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 537
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    .line 538
    return-void
.end method

.method public setLightingViewStatus(Z)V
    .locals 0

    .line 326
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 327
    return-void
.end method

.method public showOrHideBottomViewWithAnim(Z)V
    .locals 7

    .line 1617
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1618
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1619
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1620
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

    .line 1621
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1622
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1623
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1624
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1625
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1626
    if-eqz p1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1627
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1628
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1629
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    .line 1630
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1631
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 1632
    if-eqz p1, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1633
    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 1634
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1636
    return-void
.end method

.method public showOrHideFilterView()Z
    .locals 3

    .line 366
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 367
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 368
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 370
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 371
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const v2, 0x7f0900f9

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 372
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 375
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_1

    .line 376
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 377
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 380
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 381
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->reInit()V

    .line 383
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 384
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 386
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 388
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public showOrHideLightingView()Z
    .locals 3

    .line 393
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 395
    invoke-direct {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 396
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    goto :goto_0

    .line 405
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 406
    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowFilter:Z

    .line 407
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V

    .line 410
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 411
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    .line 413
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    .line 414
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    .line 416
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    .line 418
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 907
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 909
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 910
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 911
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 912
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 913
    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 914
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 915
    return-void
.end method

.method public updateLoading(Z)V
    .locals 3

    .line 643
    if-nez p1, :cond_2

    .line 644
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p1, :cond_0

    .line 645
    return-void

    .line 647
    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 648
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xac

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 650
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 651
    goto :goto_0

    .line 657
    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 658
    goto :goto_0

    .line 663
    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 664
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 665
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 667
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

    .line 361
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 362
    return-void
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 3

    .line 564
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 565
    return-void

    .line 572
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 573
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    .line 574
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v2

    if-eq v2, p1, :cond_1

    .line 575
    invoke-virtual {v0, p1, v1, v1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 576
    const-string v0, "FragmentBottomAction"

    const-string v2, "inconsistent thumbnail"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 580
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    .line 581
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2

    .line 582
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 585
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v0, :cond_3

    .line 586
    return-void

    .line 589
    :cond_3
    if-nez p1, :cond_4

    .line 590
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const p2, 0x7f02015f

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 591
    return-void

    .line 595
    :cond_4
    nop

    .line 596
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object p1

    .line 597
    invoke-virtual {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 598
    invoke-virtual {p1, v1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    .line 599
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 601
    if-eqz p2, :cond_6

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz p1, :cond_5

    goto :goto_0

    .line 621
    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const p2, 0x3e99999a    # 0.3f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 622
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 623
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 624
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

    .line 625
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 626
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 628
    return-void

    .line 602
    :cond_6
    :goto_0
    return-void
.end method
