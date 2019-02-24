.class public Lcom/android/camera/fragment/FragmentBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;,
        Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;,
        Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xfb


# instance fields
.field private mBeautyExtraView:Landroid/view/View;

.field private mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

.field private mBeautyPanelShow:Z

.field private mCurrentBeautyType:I

.field private mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

.field mFragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private mIsEyeLightShow:Z

.field private mLastSelectBeautyType:I

.field private mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

.field private mRemoveFragmentBeauty:Z

.field private mViewPager:Lcom/android/camera/ui/NoScrollViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentBeauty;)Z
    .locals 0

    .line 47
    iget-boolean p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/FragmentBeauty;Z)Z
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/FragmentBeauty;ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/FragmentBeauty;->showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    return-void
.end method

.method private extraEnterAnim()V
    .locals 3

    .line 446
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    .line 447
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    .line 448
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 449
    const/high16 v2, -0x3d380000    # -100.0f

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 450
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 451
    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 452
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    .line 453
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 454
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 455
    return-void
.end method

.method private extraExitAnim()V
    .locals 3

    .line 458
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v1, -0x3d380000    # -100.0f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    .line 459
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    .line 460
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 461
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 462
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 463
    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    .line 464
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 465
    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 466
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 467
    return-void
.end method

.method private notifyTipsMargin(I)V
    .locals 2

    .line 274
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    const/4 p1, 0x0

    .line 278
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 279
    if-eqz v0, :cond_1

    .line 280
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 282
    :cond_1
    return-void
.end method

.method private removeFragmentBeauty(I)Z
    .locals 1

    .line 366
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->removeFragmentBeauty(I)Z

    move-result p1

    .line 367
    if-eqz p1, :cond_0

    .line 368
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    .line 370
    :cond_0
    return p1
.end method

.method private showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 1

    .line 438
    if-eqz p1, :cond_0

    .line 439
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0014

    invoke-static {p1, v0, p2, p3}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 441
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 443
    :goto_0
    return-void
.end method

.method private showHideEyeLighting(Z)V
    .locals 3

    .line 382
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fp()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyMakeup()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 383
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    if-nez v0, :cond_0

    .line 384
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    .line 386
    :cond_0
    if-eqz p1, :cond_1

    .line 387
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBeauty;->showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 388
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraEnterAnim()V

    .line 389
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v2, Lcom/android/camera/fragment/FragmentBeauty$2;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBeauty$2;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    goto :goto_0

    .line 406
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v2, Lcom/android/camera/fragment/FragmentBeauty$3;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBeauty$3;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    .line 426
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraExitAnim()V

    .line 428
    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    .line 429
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    .line 430
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 431
    if-eqz p1, :cond_2

    const v0, 0x7f0d00ff

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v1, 0xfc

    if-ne v0, v1, :cond_2

    .line 432
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 435
    :cond_2
    return-void
.end method

.method private showZoomTipImage()V
    .locals 2

    .line 219
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_0

    const/16 v1, 0xad

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 221
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fM()Z

    move-result v0

    if-nez v0, :cond_0

    .line 222
    return-void

    .line 227
    :cond_0
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 228
    if-eqz v0, :cond_2

    .line 229
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    .line 230
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 231
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v1

    if-nez v1, :cond_2

    .line 232
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    .line 234
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 236
    if-eqz v0, :cond_1

    .line 237
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->clearAlertStatus()V

    .line 239
    :cond_1
    nop

    .line 244
    :cond_2
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public closeEyeLight()V
    .locals 1

    .line 548
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    if-eqz v0, :cond_0

    .line 549
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->closeEyeLight()V

    .line 551
    :cond_0
    return-void
.end method

.method public getBeautyItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 515
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getTypeArray()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBeautyType()I
    .locals 1

    .line 530
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getBeautyType()I

    move-result v0

    return v0
.end method

.method public getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 525
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentBeautyType()I
    .locals 1

    .line 310
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentBeautyType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 154
    const/16 v0, 0xfb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 149
    const v0, 0x7f040007

    return v0
.end method

.method public getProgress()I
    .locals 1

    .line 520
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getProgress()I

    move-result v0

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 88
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 89
    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 93
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    .line 94
    const v1, 0x7f0d0014

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    .line 95
    const v1, 0x7f0d0013

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    .line 96
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xc5

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 97
    nop

    .line 98
    if-eqz p1, :cond_2

    .line 99
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->getBeautyActionMenuType()I

    move-result p1

    goto :goto_0

    .line 101
    :cond_2
    move p1, v0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->getCurrentShowFragmentList(I)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    .line 102
    new-instance p1, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    invoke-direct {p1, p0, v1, v2}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    .line 103
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 104
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setFocusable(Z)V

    .line 105
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBeauty$1;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 111
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 113
    return-void
.end method

.method public isBeautyPanelShow()Z
    .locals 1

    .line 485
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    return v0
.end method

.method public isEyeLightShow()Z
    .locals 1

    .line 544
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    return v0
.end method

.method public needViewClear()Z
    .locals 1

    .line 536
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 537
    const/4 v0, 0x1

    return v0

    .line 539
    :cond_0
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->needViewClear()Z

    move-result v0

    return v0
.end method

.method public onBackEvent(I)Z
    .locals 2

    .line 255
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->removeFragmentBeauty(I)Z

    move-result v0

    .line 256
    if-eqz v0, :cond_0

    .line 257
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->notifyTipsMargin(I)V

    .line 261
    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xab

    if-ne p1, v1, :cond_1

    .line 263
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xd2

    .line 264
    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 265
    if-eqz p1, :cond_1

    .line 267
    const/4 v1, 0x1

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel(Z)V

    .line 270
    :cond_1
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 316
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 375
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onDestroyView()V

    .line 376
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->notifyTipsMargin(I)V

    .line 377
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->showZoomTipImage()V

    .line 378
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 350
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 351
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->removeFragmentBeauty(I)Z

    .line 363
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

    .line 249
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 250
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->onBackEvent(I)Z

    .line 251
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 159
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 162
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 163
    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 164
    return-object p1

    :array_0
    .array-data 4
        0xa7
        0xa1
    .end array-data
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 169
    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-static {v0, v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation(Landroid/view/animation/Animation$AnimationListener;[I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 172
    const-wide/16 v1, 0x8c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 173
    new-instance v1, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 174
    return-object v0

    :array_0
    .array-data 4
        0xa8
        0xa2
    .end array-data
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 69
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 70
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 71
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 72
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    .line 73
    new-instance p1, Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-direct {p1}, Lcom/android/camera/fragment/beauty/MiBeauty;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    .line 74
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    .line 75
    return-void
.end method

.method public resetBeauty()V
    .locals 1

    .line 495
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->resetBeauty()V

    .line 496
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 3

    .line 471
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 472
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 473
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    .line 474
    instance-of v2, v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    if-eqz v2, :cond_0

    .line 475
    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    .line 476
    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;->setEnableClick(Z)V

    .line 477
    goto :goto_1

    .line 479
    :cond_0
    goto :goto_0

    .line 481
    :cond_1
    :goto_1
    return-void
.end method

.method public setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 1

    .line 510
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 511
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 490
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setProgress(I)V

    .line 491
    return-void
.end method

.method public setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 1

    .line 500
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 501
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 1

    .line 505
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 506
    return-void
.end method

.method public switchBeautyType(I)V
    .locals 4

    .line 286
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setCurrentBeautyType(I)V

    .line 287
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setBeautyType(I)V

    .line 288
    const/4 v0, 0x0

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    .line 293
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getMenuData()Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/MenuItem;

    .line 294
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget v2, v2, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    invoke-virtual {v3, v2, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 290
    :cond_0
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    .line 291
    nop

    .line 297
    :goto_0
    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentBeautyType:I

    .line 298
    iget v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mLastSelectBeautyType:I

    if-eq v2, v1, :cond_1

    goto :goto_1

    .line 300
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    .line 301
    nop

    .line 305
    :goto_1
    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mLastSelectBeautyType:I

    .line 306
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 79
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 80
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 81
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 82
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    .line 83
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    .line 84
    return-void
.end method
