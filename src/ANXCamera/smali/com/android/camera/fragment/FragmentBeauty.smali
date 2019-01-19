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

    .line 432
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    .line 433
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    .line 434
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 435
    const/high16 v2, -0x3d380000    # -100.0f

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 436
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 437
    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 438
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    .line 439
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 440
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 441
    return-void
.end method

.method private extraExitAnim()V
    .locals 3

    .line 444
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v1, -0x3d380000    # -100.0f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    .line 445
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    .line 446
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 447
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 448
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 449
    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    .line 450
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 451
    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 452
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 453
    return-void
.end method

.method private notifyTipsMargin(I)V
    .locals 2

    .line 261
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 262
    const/4 p1, 0x0

    .line 265
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 266
    if-eqz v0, :cond_1

    .line 267
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 269
    :cond_1
    return-void
.end method

.method private removeFragmentBeauty(I)Z
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->removeFragmentBeauty(I)Z

    move-result p1

    .line 354
    if-eqz p1, :cond_0

    .line 355
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    .line 357
    :cond_0
    return p1
.end method

.method private showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 1

    .line 424
    if-eqz p1, :cond_0

    .line 425
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0016

    invoke-static {p1, v0, p2, p3}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    .line 427
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 429
    :goto_0
    return-void
.end method

.method private showHideEyeLighting(Z)V
    .locals 2

    .line 369
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fn()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyMakeup()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 370
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    if-nez v0, :cond_0

    .line 371
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    .line 373
    :cond_0
    if-eqz p1, :cond_1

    .line 374
    const/4 p1, 0x1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 375
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraEnterAnim()V

    .line 376
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBeauty$2;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    goto :goto_0

    .line 393
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBeauty$3;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    .line 413
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraExitAnim()V

    .line 415
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    .line 416
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 417
    if-eqz p1, :cond_2

    const v0, 0x7f0d00fc

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v1, 0xfc

    if-ne v0, v1, :cond_2

    .line 418
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 421
    :cond_2
    return-void
.end method

.method private showZoomTipImage()V
    .locals 2

    .line 206
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_0

    const/16 v1, 0xad

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 208
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fI()Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    return-void

    .line 214
    :cond_0
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 215
    if-eqz v0, :cond_2

    .line 216
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    .line 217
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 218
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v1

    if-nez v1, :cond_2

    .line 219
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    .line 221
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 223
    if-eqz v0, :cond_1

    .line 224
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->clearAlertStatus()V

    .line 226
    :cond_1
    nop

    .line 231
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

    .line 501
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getTypeArray()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBeautyType()I
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getBeautyType()I

    move-result v0

    return v0
.end method

.method public getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 511
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentBeautyType()I
    .locals 1

    .line 297
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentBeautyType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .line 151
    const/16 v0, 0xfb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 146
    const v0, 0x7f040007

    return v0
.end method

.method public getProgress()I
    .locals 1

    .line 506
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->getProgress()I

    move-result v0

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 85
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 86
    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 88
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 90
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mRemoveFragmentBeauty:Z

    .line 91
    const v1, 0x7f0d0016

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    .line 92
    const v1, 0x7f0d0015

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    .line 93
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xc5

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 94
    nop

    .line 95
    if-eqz p1, :cond_2

    .line 96
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->getBeautyActionMenuType()I

    move-result p1

    goto :goto_0

    .line 98
    :cond_2
    move p1, v0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->getCurrentShowFragmentList(I)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    .line 99
    new-instance p1, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    invoke-direct {p1, p0, v1, v2}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    .line 100
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 101
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setFocusable(Z)V

    .line 102
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBeauty$1;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 108
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/FragmentBeauty$ViewPagerListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 110
    return-void
.end method

.method public isBeautyPanelShow()Z
    .locals 1

    .line 471
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    return v0
.end method

.method public needViewClear()Z
    .locals 1

    .line 522
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 523
    const/4 v0, 0x1

    return v0

    .line 525
    :cond_0
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->needViewClear()Z

    move-result v0

    return v0
.end method

.method public onBackEvent(I)Z
    .locals 2

    .line 242
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->removeFragmentBeauty(I)Z

    move-result v0

    .line 243
    if-eqz v0, :cond_0

    .line 244
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->notifyTipsMargin(I)V

    .line 248
    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xab

    if-ne p1, v1, :cond_1

    .line 250
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xd2

    .line 251
    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 252
    if-eqz p1, :cond_1

    .line 254
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel()V

    .line 257
    :cond_1
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 303
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 362
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onDestroyView()V

    .line 363
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->notifyTipsMargin(I)V

    .line 364
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->showZoomTipImage()V

    .line 365
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 337
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 338
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->removeFragmentBeauty(I)Z

    .line 350
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

    .line 236
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 237
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->onBackEvent(I)Z

    .line 238
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 156
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 159
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 160
    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 161
    return-object p1

    :array_0
    .array-data 4
        0xa7
        0xa1
    .end array-data
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .line 166
    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-static {v0, v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation(Landroid/view/animation/Animation$AnimationListener;[I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 169
    const-wide/16 v1, 0x8c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 170
    new-instance v1, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 171
    return-object v0

    :array_0
    .array-data 4
        0xa8
        0xa2
    .end array-data
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 68
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 69
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 70
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 71
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    .line 72
    new-instance p1, Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-direct {p1}, Lcom/android/camera/fragment/beauty/MiBeauty;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    .line 73
    return-void
.end method

.method public resetBeauty()V
    .locals 1

    .line 481
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MiBeauty;->resetBeauty()V

    .line 482
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 3

    .line 457
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 458
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFragments:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 459
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

    .line 460
    instance-of v2, v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    if-eqz v2, :cond_0

    .line 461
    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    .line 462
    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;->setEnableClick(Z)V

    .line 463
    goto :goto_1

    .line 465
    :cond_0
    goto :goto_0

    .line 467
    :cond_1
    :goto_1
    return-void
.end method

.method public setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 1

    .line 496
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 497
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 476
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setProgress(I)V

    .line 477
    return-void
.end method

.method public setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 1

    .line 486
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 487
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 1

    .line 491
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 492
    return-void
.end method

.method public switchBeautyType(I)V
    .locals 4

    .line 273
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setCurrentBeautyType(I)V

    .line 274
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mMiBeautyBusiness:Lcom/android/camera/fragment/beauty/MiBeauty;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->setBeautyType(I)V

    .line 275
    const/4 v0, 0x0

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    .line 280
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->getMenuData()Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/MenuItem;

    .line 281
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget v2, v2, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    invoke-virtual {v3, v2, v0}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 277
    :cond_0
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    .line 278
    nop

    .line 284
    :goto_0
    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentBeautyType:I

    .line 285
    iget v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mLastSelectBeautyType:I

    if-eq v2, v1, :cond_1

    goto :goto_1

    .line 287
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    .line 288
    nop

    .line 292
    :goto_1
    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mLastSelectBeautyType:I

    .line 293
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 77
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 78
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 79
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 80
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPanelShow:Z

    .line 81
    return-void
.end method
