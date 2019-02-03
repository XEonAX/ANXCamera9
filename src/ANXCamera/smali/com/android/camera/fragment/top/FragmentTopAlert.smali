.class public Lcom/android/camera/fragment/top/FragmentTopAlert;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopAlert.java"


# static fields
.field public static final FRAGMENT_INFO:I = 0xfd

.field public static final HINT_DELAY_TIME:J = 0x7d0L

.field private static final TAG:Ljava/lang/String;

.field private static sPendingRecordingTimeState:I


# instance fields
.field private mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

.field private mAiSceneSwitchHintText:Landroid/widget/TextView;

.field private mAlertAiDetectHintTv:Landroid/widget/TextView;

.field private mAlertAiDetectTipHitRunable:Ljava/lang/Runnable;

.field private mAlertAiSceneSwitchHintTime:J

.field private mAlertAiSceneSwitchHintTopMargin:I

.field private mAlertImageType:I

.field private mAlertImageView:Landroid/widget/ImageView;

.field private mAlertLiearLayout:Landroid/widget/LinearLayout;

.field private mAlertRecordingText:Landroid/widget/TextView;

.field private mAlertStatusValue:Landroid/widget/TextView;

.field private mAlertTopHintText:Landroid/widget/TextView;

.field private mAlertTopMargin:I

.field private mBlingAnimation:Landroid/view/animation/AlphaAnimation;

.field private mDisplayRectTopMargin:I

.field private mLayoutTransition:Landroid/animation/LayoutTransition;

.field private mLiveMusiHintText:Landroid/widget/TextView;

.field private mLiveMusicClose:Landroid/widget/ImageView;

.field private mLiveMusicHintLayout:Landroid/widget/LinearLayout;

.field private mSelectorTopMargin:I

.field private mShow:Z

.field private mShowAction:Ljava/lang/Runnable;

.field private mStateValueText:Ljava/lang/String;

.field private mStateValueTextFromLighting:Z

.field private mTopHintTextResource:I

.field public final mViewHideRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const-class v0, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/top/FragmentTopAlert;->TAG:Ljava/lang/String;

    .line 66
    const/4 v0, 0x0

    sput v0, Lcom/android/camera/fragment/top/FragmentTopAlert;->sPendingRecordingTimeState:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 60
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 86
    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mTopHintTextResource:I

    .line 90
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 94
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopMargin:I

    .line 380
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$4;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShowAction:Ljava/lang/Runnable;

    .line 516
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$8;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$8;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    .line 875
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$9;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$9;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectTipHitRunable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/top/FragmentTopAlert;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->showCloseConfirm()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/LinearLayout;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/fragment/top/FragmentTopAlert;)I
    .locals 0

    .line 60
    iget p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTopMargin:I

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/top/FragmentTopAlert;)Z
    .locals 0

    .line 60
    iget-boolean p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/top/FragmentTopAlert;IZ)I
    .locals 0

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/top/FragmentTopAlert;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateAiSceneSelectViewMargin()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;)I
    .locals 0

    .line 60
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V
    .locals 0

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/ImageView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    return-object p0
.end method

.method private alertAiSceneSelector(Ljava/lang/String;Ljava/lang/String;IILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V
    .locals 3

    .line 463
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 464
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/ToggleSwitch;->setTextOnAndOff(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    :cond_0
    if-nez p3, :cond_3

    .line 467
    iput p4, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mSelectorTopMargin:I

    .line 468
    const-wide/16 p1, 0x7d0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    iget-wide v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTime:J

    sub-long/2addr p3, v0

    sub-long/2addr p1, p3

    .line 469
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result p3

    .line 470
    sget p4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne p3, p4, :cond_2

    .line 471
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShowAction:Ljava/lang/Runnable;

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    move-wide p1, v0

    :cond_1
    invoke-virtual {p3, p4, p1, p2}, Lcom/android/camera/ui/ToggleSwitch;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 473
    :cond_2
    goto :goto_0

    .line 474
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShowAction:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/ToggleSwitch;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 475
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p1}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 476
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 477
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    .line 478
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/4 p2, 0x0

    .line 479
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 p2, 0x190

    invoke-virtual {p1, p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 480
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/ToggleSwitch;->setVisibility(I)V

    .line 481
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    invoke-direct {p0, p4, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 484
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p1, p5}, Lcom/android/camera/ui/ToggleSwitch;->setOnCheckedChangeListener(Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 485
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/ToggleSwitch;->setChecked(Z)V

    .line 486
    return-void
.end method

.method private customTransition()Landroid/animation/LayoutTransition;
    .locals 7

    .line 277
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 279
    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 280
    const-wide/16 v3, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 281
    const-wide/16 v5, 0xc8

    invoke-virtual {v0, v2, v5, v6}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 284
    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 285
    invoke-virtual {v0, v2, v3, v4}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 286
    invoke-virtual {v0, v2, v5, v6}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 289
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 290
    invoke-virtual {v0, v2, v3, v4}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 291
    invoke-virtual {v0, v2, v5, v6}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 294
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 295
    invoke-virtual {v0, v2, v3, v4}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 296
    invoke-virtual {v0, v2, v5, v6}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 299
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 300
    invoke-virtual {v0, v2, v3, v4}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 301
    invoke-virtual {v0, v2, v5, v6}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 303
    invoke-virtual {v0, v2}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 304
    return-object v0
.end method

.method private getAlertImageBottom()I
    .locals 3

    .line 773
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 774
    const/4 v0, 0x0

    return v0

    .line 776
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00c0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 777
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a00c1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 778
    sget-boolean v2, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v2, :cond_1

    if-lez v1, :cond_1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    if-lez v2, :cond_1

    .line 779
    return v1

    .line 780
    :cond_1
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_2

    if-lez v0, :cond_2

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    if-eqz v1, :cond_2

    .line 781
    return v0

    .line 783
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    .line 784
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 785
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    .line 786
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    add-int/2addr v0, v1

    .line 787
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0021

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 788
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a00a6

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 785
    return v0
.end method

.method private getChildMeasureHeight(Landroid/view/View;)I
    .locals 1

    .line 817
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 818
    if-lez v0, :cond_0

    .line 819
    return v0

    .line 821
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 822
    invoke-virtual {p1, v0, v0}, Landroid/view/View;->measure(II)V

    .line 823
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    return p1
.end method

.method private getStateTextTopMargin(IZ)I
    .locals 1

    .line 653
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p2}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 654
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p1

    goto :goto_0

    .line 655
    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_1

    .line 656
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result p1

    goto :goto_0

    .line 657
    :cond_1
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_2

    .line 658
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p1

    goto :goto_0

    .line 659
    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_3

    .line 660
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p1

    goto :goto_0

    .line 661
    :cond_3
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_4

    .line 662
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p1

    goto :goto_0

    .line 664
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0a00c0

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 665
    sget-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v0, :cond_5

    if-lez p2, :cond_5

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    if-eqz v0, :cond_5

    .line 666
    nop

    .line 669
    move p1, p2

    :cond_5
    :goto_0
    return p1
.end method

.method private getUpdateEV()Ljava/lang/String;
    .locals 6

    .line 827
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 828
    invoke-static {}, Lcom/android/camera/CameraSettings;->readExposure()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationStep()F

    move-result v0

    mul-float/2addr v1, v0

    .line 829
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v2, 0x3d4ccccd    # 0.05f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_1

    .line 830
    const/4 v0, 0x0

    cmpg-float v0, v1, v0

    if-gez v0, :cond_0

    const-string v0, "-"

    goto :goto_0

    :cond_0
    const-string v0, "+"

    .line 831
    :goto_0
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "%s %.1f"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 832
    return-object v0

    .line 834
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getUpdateZoom()Ljava/lang/String;
    .locals 4

    .line 839
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v0

    .line 840
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    .line 841
    const/4 v0, 0x0

    return-object v0

    .line 844
    :cond_0
    float-to-int v1, v0

    .line 845
    int-to-float v2, v1

    sub-float/2addr v0, v2

    const/high16 v2, 0x41200000    # 10.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    .line 847
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "x "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 848
    return-object v0
.end method

.method private getViewBottom(Landroid/view/View;)I
    .locals 3

    .line 793
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 794
    const/4 p1, 0x0

    return p1

    .line 796
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00c0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 797
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a00c1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 798
    sget-boolean v2, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v2, :cond_1

    if-lez v1, :cond_1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    if-lez v2, :cond_1

    .line 799
    return v1

    .line 800
    :cond_1
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_2

    if-lez v0, :cond_2

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    if-eqz v1, :cond_2

    .line 801
    return v0

    .line 803
    :cond_2
    nop

    .line 804
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 805
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 806
    if-nez v1, :cond_3

    .line 807
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getChildMeasureHeight(Landroid/view/View;)I

    move-result v1

    .line 809
    :cond_3
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p1, v1

    .line 811
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0021

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr p1, v0

    .line 812
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00a6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int/2addr p1, v0

    .line 809
    return p1
.end method

.method private setAlertImageVisible(II)V
    .locals 1

    .line 734
    if-nez p1, :cond_0

    .line 735
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 736
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 737
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    .line 738
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 739
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    goto :goto_1

    .line 742
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    .line 743
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 745
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    .line 746
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 747
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 748
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    invoke-direct {p0, p2, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p2

    .line 747
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 751
    :cond_3
    :goto_1
    return-void
.end method

.method public static setPendingRecordingState(I)V
    .locals 0

    .line 232
    sput p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->sPendingRecordingTimeState:I

    .line 233
    return-void
.end method

.method private setViewMargin(Landroid/view/View;I)V
    .locals 1

    .line 765
    nop

    .line 766
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 767
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 768
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 769
    const/4 p2, 0x0

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 770
    return-void
.end method

.method private showCloseConfirm()V
    .locals 3

    .line 135
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 137
    const v1, 0x7f09026e

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 138
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 140
    new-instance v1, Lcom/android/camera/fragment/top/FragmentTopAlert$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$2;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    const v2, 0x7f09026f

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 164
    new-instance v1, Lcom/android/camera/fragment/top/FragmentTopAlert$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$3;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    const v2, 0x7f090270

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 170
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 171
    return-void
.end method

.method private transViewAnim(Landroid/view/View;I)V
    .locals 1

    .line 754
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 755
    nop

    .line 756
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 757
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr p2, v0

    .line 758
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    const/16 p1, 0x64

    .line 759
    invoke-virtual {v0, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 758
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 760
    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 762
    :cond_0
    return-void
.end method

.method private updateAiSceneSelectViewMargin()V
    .locals 2

    .line 396
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    goto :goto_0

    .line 398
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 399
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    goto :goto_0

    .line 400
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 401
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    goto :goto_0

    .line 403
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mSelectorTopMargin:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 405
    :goto_0
    return-void
.end method

.method private updateAlertStatusView(Z)V
    .locals 2

    .line 863
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v0

    .line 864
    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 865
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 866
    return-void

    .line 868
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isLandScape()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 869
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->starAnimatetViewGone(Landroid/view/View;Z)V

    goto :goto_0

    .line 870
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 871
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->startAnimateViewVisible(Landroid/view/View;Z)V

    .line 873
    :cond_2
    :goto_0
    return-void
.end method

.method private updateStateText(IZ)V
    .locals 1

    .line 673
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 674
    iput-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    .line 675
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    .line 676
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 678
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isLandScape()Z

    move-result p1

    if-nez p1, :cond_1

    .line 679
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 682
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 684
    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    .line 685
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 687
    :goto_0
    return-void
.end method

.method private updateTopHint(ILjava/lang/String;I)V
    .locals 0

    .line 567
    if-nez p1, :cond_0

    .line 568
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 569
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 570
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    .line 571
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 572
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    goto :goto_1

    .line 575
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p1, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 576
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p2}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result p2

    if-nez p2, :cond_1

    .line 577
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    goto :goto_0

    :cond_1
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    invoke-direct {p0, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p2

    .line 576
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 579
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public alertAiDetectTipHint(IIIJ)V
    .locals 1
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 893
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 894
    return-void

    .line 896
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 897
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-direct {p0, v0, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 898
    if-nez p1, :cond_2

    .line 899
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 900
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 901
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_1

    .line 902
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 903
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 905
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectTipHitRunable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 906
    const-wide/16 p1, 0x0

    cmp-long p1, p4, p1

    if-ltz p1, :cond_4

    .line 907
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectTipHitRunable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2, p4, p5}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 910
    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectTipHitRunable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 911
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p1, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 912
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p2}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result p2

    if-nez p2, :cond_3

    .line 913
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    goto :goto_0

    :cond_3
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    invoke-direct {p0, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p2

    .line 912
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 915
    :cond_4
    :goto_1
    return-void
.end method

.method public alertAiSceneSelector(II)V
    .locals 7

    .line 408
    nop

    .line 409
    if-nez p1, :cond_0

    .line 410
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$5;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    goto :goto_0

    .line 426
    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v6, v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0901fc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 427
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0901fd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 428
    move-object v1, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(Ljava/lang/String;Ljava/lang/String;IILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 429
    return-void
.end method

.method public alertFlash(IIZ)V
    .locals 2

    .line 331
    const/4 v0, 0x1

    const/4 v1, 0x2

    if-nez p1, :cond_4

    .line 332
    if-eqz p3, :cond_0

    .line 333
    move v0, v1

    goto :goto_0

    .line 332
    :cond_0
    nop

    .line 333
    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-ne v1, v0, :cond_1

    .line 334
    return-void

    .line 336
    :cond_1
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 337
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/mi/config/b;->hF()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 339
    const/4 p3, 0x0

    .line 341
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    if-eqz p3, :cond_3

    .line 342
    const p3, 0x7f0200b9

    goto :goto_1

    :cond_3
    const p3, 0x7f0200b8

    .line 341
    :goto_1
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 343
    goto :goto_2

    .line 344
    :cond_4
    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-eq p3, v1, :cond_5

    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-eq p3, v0, :cond_5

    .line 346
    return-void

    .line 348
    :cond_5
    const/4 p3, -0x1

    iput p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 350
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertImageVisible(II)V

    .line 351
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateMusicHint()V

    .line 352
    return-void
.end method

.method public alertHDR(IIZ)V
    .locals 2

    .line 312
    const/4 v0, 0x3

    const/4 v1, 0x4

    if-nez p1, :cond_3

    .line 313
    if-eqz p3, :cond_0

    .line 314
    move v0, v1

    goto :goto_0

    .line 313
    :cond_0
    nop

    .line 314
    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-ne v1, v0, :cond_1

    .line 315
    return-void

    .line 317
    :cond_1
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 318
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    if-eqz p3, :cond_2

    .line 319
    const p3, 0x7f0200bb

    goto :goto_1

    :cond_2
    const p3, 0x7f0200ba

    .line 318
    :goto_1
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 320
    goto :goto_2

    .line 321
    :cond_3
    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-eq p3, v1, :cond_4

    iget p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-eq p3, v0, :cond_4

    .line 323
    return-void

    .line 325
    :cond_4
    const/4 p3, -0x1

    iput p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 327
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertImageVisible(II)V

    .line 328
    return-void
.end method

.method public alertLightingHint(II)V
    .locals 1

    .line 624
    nop

    .line 625
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 630
    :pswitch_0
    goto :goto_0

    .line 632
    :pswitch_1
    const p1, 0x7f090204

    .line 633
    goto :goto_1

    .line 638
    :pswitch_2
    const p1, 0x7f090205

    .line 639
    goto :goto_1

    .line 635
    :pswitch_3
    const p1, 0x7f090206

    .line 636
    goto :goto_1

    .line 627
    :cond_0
    nop

    .line 644
    :goto_0
    move p1, v0

    :goto_1
    if-ne p1, v0, :cond_1

    .line 645
    const-string p1, ""

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    goto :goto_2

    .line 647
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 649
    :goto_2
    const/4 p1, 0x1

    invoke-direct {p0, p2, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateStateText(IZ)V

    .line 650
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public alertLightingTitle(ZI)V
    .locals 2

    .line 608
    if-eqz p1, :cond_0

    .line 609
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 610
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    const p2, 0x7f090202

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 611
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 612
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 613
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 615
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    const/16 p2, 0x8

    if-eq p1, p2, :cond_1

    .line 616
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 617
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 620
    :cond_1
    :goto_0
    return-void
.end method

.method public alertMoonSelector(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 7

    .line 440
    nop

    .line 441
    if-nez p3, :cond_0

    .line 442
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$6;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    goto :goto_0

    .line 458
    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v6, v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(Ljava/lang/String;Ljava/lang/String;IILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 459
    return-void
.end method

.method public alertMusicClose(Z)V
    .locals 1

    .line 355
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 356
    if-eqz p1, :cond_0

    .line 357
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 358
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setClickable(Z)V

    goto :goto_0

    .line 360
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    const v0, 0x3ecccccd    # 0.4f

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 361
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 364
    :cond_1
    :goto_0
    return-void
.end method

.method public alertSwitchHint(III)V
    .locals 0
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 513
    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(ILjava/lang/String;I)V

    .line 514
    return-void
.end method

.method public alertSwitchHint(ILjava/lang/String;I)V
    .locals 2

    .line 489
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, v0, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 490
    iput p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTopMargin:I

    .line 491
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 492
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 493
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 494
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 495
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    .line 496
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 498
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTime:J

    .line 499
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateAiSceneSelectViewMargin()V

    .line 500
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    new-instance p2, Lcom/android/camera/fragment/top/FragmentTopAlert$7;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$7;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 508
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 509
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 510
    return-void
.end method

.method public alertTopHint(III)V
    .locals 3
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 591
    const/16 v0, 0x8

    if-lez p2, :cond_0

    if-nez p1, :cond_0

    .line 592
    iput p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mTopHintTextResource:I

    goto :goto_0

    .line 593
    :cond_0
    if-ne p1, v0, :cond_1

    .line 594
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mTopHintTextResource:I

    .line 596
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 597
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mTopHintTextResource:I

    if-nez v2, :cond_2

    .line 598
    nop

    .line 602
    move p1, v0

    goto :goto_1

    .line 600
    :cond_2
    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 602
    :goto_1
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 603
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, p2, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 604
    invoke-direct {p0, p1, v1, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateTopHint(ILjava/lang/String;I)V

    .line 605
    return-void
.end method

.method public alertTopHint(IILjava/lang/String;)V
    .locals 1

    .line 582
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 583
    const/16 p1, 0x8

    .line 585
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 586
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 587
    invoke-direct {p0, p1, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateTopHint(ILjava/lang/String;I)V

    .line 588
    return-void
.end method

.method public alertTopMusicHint(ILjava/lang/String;I)V
    .locals 1

    .line 558
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 559
    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getStateTextTopMargin(IZ)I

    move-result p3

    .line 560
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0, p3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 561
    if-nez p1, :cond_0

    .line 562
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusiHintText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 564
    :cond_0
    return-void
.end method

.method public alertUpdateValue(II)V
    .locals 2

    .line 538
    const-string p1, ""

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 542
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 543
    const/16 v0, 0xb6

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 544
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 545
    return-void

    .line 548
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getUpdateZoom()Ljava/lang/String;

    move-result-object p1

    .line 549
    if-eqz p1, :cond_1

    .line 550
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 554
    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateStateText(IZ)V

    .line 555
    return-void
.end method

.method public clear()V
    .locals 3

    .line 706
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clearAlertStatus()V

    .line 708
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 709
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 710
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 712
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 713
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->setVisibility(I)V

    .line 715
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 716
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-eq v2, v1, :cond_2

    if-eqz v0, :cond_2

    instance-of v2, v0, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    check-cast v0, Ljava/lang/Integer;

    .line 717
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    .line 718
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 720
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_3

    .line 721
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 723
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 724
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 726
    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_5

    .line 727
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 729
    :cond_5
    return-void
.end method

.method public clearAlertStatus()V
    .locals 2

    .line 698
    const-string v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 699
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueTextFromLighting:Z

    .line 700
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 701
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 703
    :cond_0
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 180
    const/16 v0, 0xfd

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 175
    const v0, 0x7f040031

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    .line 100
    const v0, 0x7f0d00a0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    .line 101
    const v0, 0x7f0d009e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    .line 102
    const v0, 0x7f0d00a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    .line 103
    const v0, 0x7f0d00a8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ToggleSwitch;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    .line 104
    const v0, 0x7f0d00a1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    .line 105
    const v0, 0x7f0d00a2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopHintText:Landroid/widget/TextView;

    .line 106
    const v0, 0x7f0d009f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertLiearLayout:Landroid/widget/LinearLayout;

    .line 107
    const v0, 0x7f0d00a3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiDetectHintTv:Landroid/widget/TextView;

    .line 108
    const v0, 0x7f0d00a5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusiHintText:Landroid/widget/TextView;

    .line 109
    const v0, 0x7f0d00a4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    .line 110
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    const v0, 0x7f0d00a6

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    .line 111
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicClose:Landroid/widget/ImageView;

    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$1;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    sget-boolean p1, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz p1, :cond_0

    .line 118
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    sget v0, Lcom/android/camera/Util;->sStatusBarHeight:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 120
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->customTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLayoutTransition:Landroid/animation/LayoutTransition;

    .line 121
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertLiearLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 123
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 124
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateAlertStatusView(Z)V

    .line 128
    sget v0, Lcom/android/camera/fragment/top/FragmentTopAlert;->sPendingRecordingTimeState:I

    if-eqz v0, :cond_1

    .line 129
    sget v0, Lcom/android/camera/fragment/top/FragmentTopAlert;->sPendingRecordingTimeState:I

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setRecordingTimeState(I)V

    .line 130
    invoke-static {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setPendingRecordingState(I)V

    .line 132
    :cond_1
    return-void
.end method

.method public isShow()Z
    .locals 1

    .line 694
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShow:Z

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 199
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 201
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 202
    if-eqz p1, :cond_0

    .line 203
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->reInitAlert(Z)V

    .line 205
    :cond_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    .line 214
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 216
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mDisplayRectTopMargin:I

    .line 218
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear()V

    .line 219
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 220
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

    .line 853
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 854
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateAlertStatusView(Z)V

    .line 855
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 185
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 186
    return-void
.end method

.method public setAlertTopMargin(I)V
    .locals 0

    .line 208
    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertTopMargin:I

    .line 209
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 2

    .line 236
    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    .line 271
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1}, Landroid/view/animation/AlphaAnimation;->cancel()V

    goto/16 :goto_1

    .line 260
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-nez p1, :cond_0

    .line 261
    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    .line 262
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v0, 0x190

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 263
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v0, 0x64

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    .line 264
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 265
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 266
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 268
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 269
    goto :goto_1

    .line 254
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz p1, :cond_1

    .line 255
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1}, Landroid/view/animation/AlphaAnimation;->cancel()V

    .line 257
    :cond_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 258
    goto :goto_1

    .line 238
    :pswitch_3
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mCurrentMode:I

    const/16 v0, 0xac

    if-eq p1, v0, :cond_2

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    goto :goto_0

    .line 248
    :pswitch_4
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 244
    :cond_2
    :pswitch_5
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const-string v0, "00:00"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    nop

    .line 251
    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 252
    nop

    .line 274
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

    :pswitch_data_1
    .packed-switch 0xa1
        :pswitch_4
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xa8
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public setShow(Z)V
    .locals 0

    .line 690
    iput-boolean p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShow:Z

    .line 691
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0

    .line 190
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 191
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz p1, :cond_0

    .line 192
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1}, Landroid/view/animation/AlphaAnimation;->cancel()V

    .line 193
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    .line 195
    :cond_0
    return-void
.end method

.method public updateMusicHint()V
    .locals 6

    .line 367
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object v0

    .line 368
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a010d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 369
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusicHintLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 370
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLiveMusiHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v3, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopMusicHint(ILjava/lang/String;I)V

    goto :goto_0

    .line 371
    :cond_0
    const/4 v2, 0x1

    aget-object v4, v0, v2

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    iget v4, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mCurrentMode:I

    const/16 v5, 0xae

    if-ne v4, v5, :cond_1

    .line 372
    aget-object v0, v0, v2

    invoke-virtual {p0, v3, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopMusicHint(ILjava/lang/String;I)V

    .line 374
    :cond_1
    :goto_0
    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    .line 308
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 309
    return-void
.end method
