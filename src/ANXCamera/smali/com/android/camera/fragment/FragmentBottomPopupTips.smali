.class public Lcom/android/camera/fragment/FragmentBottomPopupTips;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomPopupTips.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBottomPopupTips$TipImageType;
    }
.end annotation


# static fields
.field private static final ANIM_DELAY_SHOW:I = 0x3

.field private static final ANIM_DIRECT_HIDE:I = 0x1

.field private static final ANIM_DIRECT_SHOW:I = 0x0

.field private static final ANIM_HIDE:I = 0x4

.field private static final ANIM_SHOW:I = 0x2

.field private static final CALL_TYPE_NOTIFY:I = 0x1

.field private static final CALL_TYPE_PROVIDE:I = 0x0

.field private static final CENTER_TIP_IMAGE_SPEED:I = 0x21

.field public static final FRAGMENT_INFO:I = 0xff1

.field private static final LEFT_TIP_IMAGE_CLOSE:I = 0x14

.field private static final LEFT_TIP_IMAGE_LIGHTING:I = 0x13

.field private static final LEFT_TIP_IMAGE_STICKER:I = 0x12

.field private static final LEFT_TIP_IMAGE_ULTRA_WIDE:I = 0x15

.field private static final MSG_HIDE_TIP:I = 0x1

.field private static final TIP_BACK_FACING_IMAGE_BEAUTY:I = 0x4

.field private static final TIP_IMAGE_BEAUTY:I = 0x3

.field private static final TIP_IMAGE_INVALID:I = -0x1

.field private static final TIP_IMAGE_STICKER:I = 0x2


# instance fields
.field private mBottomTipHeight:I

.field private mCenterTipImage:Landroid/widget/ImageView;

.field private mCloseIv:Landroid/widget/ImageView;

.field private mCloseType:I

.field private mCurrentTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mCurrentTipType:I

.field private mHandler:Landroid/os/Handler;

.field private mIsShowLeftImageIntro:Z

.field private mLastTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mLastTipType:I

.field private mLeftImageIntro:Landroid/widget/FrameLayout;

.field private mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

.field private mLeftImageIntroContent:Landroid/widget/TextView;

.field private mLeftImageIntroRadius:I

.field private mLeftImageIntroWidth:I

.field private mLeftTipImage:Landroid/widget/ImageView;

.field private mLightingPattern:Landroid/widget/TextView;

.field private mPortraitSuccessHint:Landroid/view/View;

.field private mQrCodeButton:Landroid/widget/TextView;

.field private mRootView:Landroid/view/View;

.field private mSpeedTipImage:Landroid/view/ViewGroup;

.field private mTipImage:Landroid/widget/ImageView;

.field private mTipMessage:Landroid/widget/TextView;

.field private stringLightingRes:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 71
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 132
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    .line 137
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 0

    .line 71
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    .line 71
    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/fragment/FragmentBottomPopupTips;I)I
    .locals 0

    .line 71
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    .line 71
    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    .line 71
    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 0

    .line 71
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/FrameLayout;
    .locals 0

    .line 71
    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/FragmentBottomPopupTips;Landroid/view/View;I)V
    .locals 0

    .line 71
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->setBeautyIntroButtonWidth(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V
    .locals 0

    .line 71
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    return-void
.end method

.method private adjustViewBackground(I)V
    .locals 1

    .line 1506
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    .line 1507
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 1510
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v0, 0x7f020019

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 1511
    goto :goto_0

    .line 1515
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v0, 0x7f02001a

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 1518
    :goto_0
    return-void
.end method

.method private checkLeftImageTipClose(I)I
    .locals 2

    .line 1213
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1214
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1215
    const/16 p1, 0x14

    .line 1217
    :cond_0
    return p1
.end method

.method private closeFilter()V
    .locals 2

    .line 460
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showCloseTip(IZ)V

    .line 461
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 462
    if-eqz v0, :cond_0

    .line 463
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 465
    :cond_0
    return-void
.end method

.method private closeLight()V
    .locals 3

    .line 448
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showCloseTip(IZ)V

    .line 449
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 450
    if-eqz v1, :cond_0

    .line 451
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 454
    :cond_0
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 455
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    .line 457
    :cond_1
    return-void
.end method

.method private directHideLeftImageIntro()V
    .locals 1

    .line 1689
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    .line 1690
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1691
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1693
    :cond_0
    return-void
.end method

.method private getLeftImageIntroWide()I
    .locals 4

    .line 217
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/widget/TextView;->measure(II)V

    .line 218
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v0

    .line 219
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a009f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 220
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a00a0

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 221
    add-int/2addr v0, v1

    add-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    sub-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    return v0
.end method

.method private hideAllTipImage()V
    .locals 1

    .line 468
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTipImage()V

    .line 469
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideLeftTipImage()V

    .line 471
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideSpeedTipImage()V

    .line 472
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideZoomTipImage(I)V

    .line 473
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideCenterTipImage()V

    .line 475
    :cond_0
    return-void
.end method

.method private hideTip(Landroid/view/View;)Z
    .locals 2

    .line 824
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 825
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 826
    const/4 p1, 0x1

    return p1

    .line 828
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private hideZoomTipImage(I)V
    .locals 1

    .line 395
    const/16 v0, 0xa3

    if-eq p1, v0, :cond_0

    const/16 v0, 0xad

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 397
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fK()Z

    move-result p1

    if-nez p1, :cond_0

    .line 398
    return-void

    .line 403
    :cond_0
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb6

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 404
    if-eqz p1, :cond_2

    .line 405
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->hideZoomButton()V

    .line 407
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 409
    if-eqz p1, :cond_1

    .line 410
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertUpdateValue(I)V

    .line 412
    :cond_1
    nop

    .line 417
    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isPortraitSuccessHintVisible()Z
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

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

.method private onLeftImageClick(Landroid/view/View;)V
    .locals 2

    .line 351
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 353
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 355
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 374
    :pswitch_0
    if-eqz v0, :cond_0

    .line 375
    const/16 p1, 0xcd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto :goto_0

    .line 357
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    packed-switch p1, :pswitch_data_1

    .line 365
    goto :goto_0

    .line 362
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeLight()V

    .line 363
    goto :goto_0

    .line 359
    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeFilter()V

    .line 360
    goto :goto_0

    .line 369
    :pswitch_4
    if-eqz v0, :cond_0

    .line 370
    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    .line 379
    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_4
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private reIntTipViewMarginBottom(Landroid/view/View;I)V
    .locals 9

    .line 611
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 613
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 615
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xb5

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    .line 616
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xc2

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 618
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xd2

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v4

    check-cast v4, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 619
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0a013d

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 620
    nop

    .line 621
    iget v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const v7, 0x7f0a0096

    const/16 v8, 0xa5

    if-ne v6, v8, :cond_1

    .line 623
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    .line 624
    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    .line 625
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 626
    div-int/lit8 v1, v1, 0x2

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr v1, p2

    .line 627
    goto/16 :goto_1

    .line 628
    :cond_0
    sget p2, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float p2, p2

    const/high16 v1, 0x3f400000    # 0.75f

    div-float/2addr p2, v1

    float-to-int p2, p2

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr p2, v1

    div-int/lit8 p2, p2, 0x2

    .line 629
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a009a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v1, p2

    goto/16 :goto_1

    .line 631
    :cond_1
    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v6

    if-lez v6, :cond_2

    .line 632
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v1

    goto/16 :goto_1

    .line 633
    :cond_2
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v2

    const v6, 0x7f0a00d5

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_5

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_5

    .line 636
    :goto_0
    if-eqz v3, :cond_4

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 637
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    add-int v1, p2, v5

    goto/16 :goto_1

    .line 639
    :cond_4
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    goto/16 :goto_1

    .line 641
    :cond_5
    if-eqz v1, :cond_6

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 642
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->visibleHeight()I

    move-result v1

    goto :goto_1

    .line 643
    :cond_6
    if-eqz v4, :cond_7

    invoke-interface {v4}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->isFNumberVisible()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 644
    invoke-interface {v4}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->visibleHeight()I

    move-result p2

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    float-to-int v1, v1

    add-int/2addr p2, v1

    add-int v1, p2, v5

    goto :goto_1

    .line 647
    :cond_7
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 649
    if-eqz v1, :cond_8

    const v2, 0x7f0d00fe

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-ne v1, v2, :cond_8

    .line 651
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 652
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a006d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v1, p2

    .line 653
    goto :goto_1

    :cond_8
    if-eqz v3, :cond_9

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 655
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    add-int v1, p2, v5

    goto :goto_1

    .line 657
    :cond_9
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 659
    div-int/lit8 v1, v1, 0x2

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr v1, p2

    .line 663
    :goto_1
    iget p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq p2, v1, :cond_a

    .line 664
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 665
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 667
    :cond_a
    return-void
.end method

.method private setBeautyIntroButtonWidth(Landroid/view/View;I)V
    .locals 1

    .line 863
    if-nez p1, :cond_0

    .line 864
    return-void

    .line 866
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 867
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 868
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 869
    return-void
.end method

.method private showBeauty(I)V
    .locals 1

    .line 382
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/MiBeauty;->showBeautyActionFromMode(I)V

    .line 384
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v0, 0xab

    if-ne p1, v0, :cond_0

    .line 386
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd2

    .line 387
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 388
    if-eqz p1, :cond_0

    .line 389
    const/4 v0, 0x0

    invoke-interface {p1, v0, v0}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->hideFNumberPanel(ZZ)V

    .line 392
    :cond_0
    return-void
.end method

.method private showLiveSpeed()V
    .locals 2

    .line 434
    const-string v0, "live_speed"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 435
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 437
    if-eqz v0, :cond_0

    .line 438
    const/16 v1, 0xa5

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchLiveActionMenu(I)V

    .line 440
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 441
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 442
    if-eqz v0, :cond_1

    .line 443
    const/16 v1, 0xd

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 445
    :cond_1
    return-void
.end method

.method private showLiveSticker()V
    .locals 2

    .line 420
    const-string v0, "live_sticker"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    .line 421
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 423
    if-eqz v0, :cond_0

    .line 424
    const/16 v1, 0xa4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchLiveActionMenu(I)V

    .line 426
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 427
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 428
    if-eqz v0, :cond_1

    .line 429
    const/16 v1, 0xc

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 431
    :cond_1
    return-void
.end method

.method private startLeftImageIntroAnim(I)V
    .locals 6

    .line 1631
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 1632
    return-void

    .line 1634
    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    .line 1635
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1636
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    if-nez v1, :cond_1

    .line 1637
    const/4 v1, 0x2

    new-array v2, v1, [I

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroWidth:I

    aput v3, v2, p1

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    mul-int/2addr v3, v1

    aput v3, v2, v0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v2

    .line 1638
    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1639
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    const-string v4, "alpha"

    new-array v5, v1, [F

    fill-array-data v5, :array_0

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 1640
    const-wide/16 v4, 0xfa

    invoke-virtual {v3, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1642
    new-instance v4, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    .line 1649
    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1650
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    .line 1651
    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-array v1, v1, [Landroid/animation/Animator;

    aput-object v2, v1, p1

    aput-object v3, v1, v0

    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1652
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3e800000    # 0.25f

    invoke-direct {v0, v2, v1, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1653
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 1654
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1678
    goto :goto_0

    .line 1679
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1680
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->clearAnimation()V

    .line 1681
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 1683
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 1684
    invoke-static {}, Lcom/android/camera/CameraSettings;->addPopupUltraWideIntroShowTimes()V

    .line 1685
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private updateCenterTipImage(IILjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 1227
    nop

    .line 1228
    const/16 v0, 0x12

    const/4 v1, -0x1

    const/16 v2, 0xae

    if-eq p1, v2, :cond_0

    .line 1234
    move v2, v1

    goto :goto_0

    .line 1230
    :cond_0
    nop

    .line 1234
    move v2, v0

    .line 1235
    :goto_0
    nop

    .line 1236
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v2, v1, :cond_3

    if-eq v2, v0, :cond_1

    .line 1249
    move v1, v3

    move v0, v4

    goto :goto_2

    .line 1241
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v0

    .line 1242
    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1243
    const v0, 0x7f020120

    .line 1249
    :goto_1
    move v1, v3

    goto :goto_2

    .line 1245
    :cond_2
    const v0, 0x7f020121

    goto :goto_1

    .line 1238
    :cond_3
    nop

    .line 1239
    nop

    .line 1249
    move v0, v4

    move v1, v0

    :goto_2
    if-lez v0, :cond_4

    .line 1250
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1253
    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v0, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    .line 1254
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 1255
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 1256
    if-ne p1, v2, :cond_5

    .line 1257
    return-void

    .line 1261
    :cond_5
    if-eqz v1, :cond_6

    .line 1262
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v0, v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 1265
    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1268
    if-nez p3, :cond_8

    .line 1269
    if-eqz v1, :cond_7

    .line 1270
    nop

    .line 1295
    :goto_3
    move v3, v4

    goto :goto_5

    .line 1272
    :cond_7
    goto :goto_5

    .line 1275
    :cond_8
    const/16 p1, 0xa5

    if-eqz v1, :cond_b

    .line 1276
    if-ne p2, p1, :cond_a

    .line 1278
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 1279
    goto :goto_3

    .line 1281
    :cond_9
    const/4 v3, 0x3

    goto :goto_5

    .line 1284
    :cond_a
    const/4 v3, 0x2

    goto :goto_5

    .line 1287
    :cond_b
    if-eq p2, p1, :cond_d

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p2, p1, :cond_c

    goto :goto_4

    .line 1290
    :cond_c
    const/4 v3, 0x4

    goto :goto_5

    .line 1288
    :cond_d
    :goto_4
    nop

    .line 1295
    :goto_5
    packed-switch v3, :pswitch_data_0

    goto :goto_6

    .line 1306
    :pswitch_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1307
    goto :goto_6

    .line 1309
    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1310
    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1311
    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1309
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1303
    :pswitch_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1304
    goto :goto_6

    .line 1300
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1301
    goto :goto_6

    .line 1297
    :pswitch_4
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1298
    nop

    .line 1314
    :goto_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateImageBgColor(ILandroid/view/View;Z)V
    .locals 2

    .line 1033
    if-eqz p3, :cond_0

    .line 1034
    const p3, 0x7f020007

    .line 1035
    const v0, 0x7f0201cc

    goto :goto_0

    .line 1037
    :cond_0
    const p3, 0x7f02000a

    .line 1038
    const v0, 0x7f0201cd

    .line 1040
    :goto_0
    const/16 v1, 0xa5

    if-eq p1, v1, :cond_1

    .line 1045
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    .line 1042
    :cond_1
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1043
    nop

    .line 1048
    :goto_1
    return-void
.end method

.method private updateLeftTipImage(IIILjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 1057
    nop

    .line 1058
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 1059
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v1

    .line 1060
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fx()Z

    move-result v2

    .line 1061
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-virtual {v3, v0, v4}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v3

    .line 1062
    const/4 v4, -0x1

    const/16 v5, 0x15

    packed-switch p2, :pswitch_data_0

    :pswitch_0
    goto :goto_3

    .line 1064
    :pswitch_1
    if-eqz v1, :cond_4

    .line 1065
    const/16 p1, 0x13

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 1072
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fa()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1073
    goto :goto_1

    .line 1067
    :pswitch_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->eZ()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1068
    goto :goto_1

    .line 1075
    :cond_0
    :goto_0
    move p1, v4

    :goto_1
    goto :goto_4

    .line 1082
    :pswitch_4
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1083
    goto :goto_3

    .line 1100
    :pswitch_5
    if-nez v0, :cond_4

    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    .line 1101
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_1

    .line 1102
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    .line 1103
    return-void

    .line 1105
    :cond_1
    goto :goto_2

    .line 1087
    :cond_2
    :pswitch_6
    if-eqz v2, :cond_4

    if-nez v0, :cond_4

    .line 1088
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_3

    .line 1089
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    .line 1090
    return-void

    .line 1092
    :cond_3
    nop

    .line 1110
    :goto_2
    move p1, v5

    goto :goto_4

    :cond_4
    :goto_3
    move p1, v4

    :goto_4
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->checkLeftImageTipClose(I)I

    move-result p1

    .line 1111
    nop

    .line 1112
    nop

    .line 1113
    nop

    .line 1114
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v4, :cond_9

    if-eq p1, v5, :cond_6

    packed-switch p1, :pswitch_data_2

    .line 1136
    move v4, v0

    move v2, v1

    move v3, v2

    goto :goto_8

    .line 1127
    :pswitch_7
    const v2, 0x7f0200f9

    .line 1128
    const v3, 0x7f090265

    .line 1129
    nop

    .line 1136
    move v4, v0

    goto :goto_8

    .line 1119
    :pswitch_8
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v2

    .line 1120
    const-string v3, ""

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1121
    const v2, 0x7f020120

    .line 1136
    :goto_5
    move v4, v0

    move v3, v1

    goto :goto_8

    .line 1123
    :cond_5
    const v2, 0x7f020121

    .line 1125
    goto :goto_5

    .line 1131
    :cond_6
    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v2

    .line 1132
    if-eqz v2, :cond_7

    const v3, 0x7f02017a

    goto :goto_6

    :cond_7
    const v3, 0x7f020179

    .line 1133
    :goto_6
    if-eqz v2, :cond_8

    const v2, 0x7f090247

    goto :goto_7

    :cond_8
    const v2, 0x7f090248

    .line 1136
    :goto_7
    move v4, v0

    move v6, v3

    move v3, v2

    move v2, v6

    goto :goto_8

    .line 1116
    :cond_9
    nop

    .line 1117
    nop

    .line 1136
    move v2, v1

    move v3, v2

    move v4, v3

    :goto_8
    if-lez v2, :cond_a

    .line 1137
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1139
    :cond_a
    if-lez v3, :cond_b

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1140
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1143
    :cond_b
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p0, p2, v2, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    .line 1144
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_c

    .line 1145
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 1146
    if-ne p2, p1, :cond_c

    .line 1147
    return-void

    .line 1151
    :cond_c
    if-eqz v4, :cond_d

    .line 1152
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v2, v2

    invoke-static {p2, v2}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 1155
    :cond_d
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1158
    if-nez p4, :cond_f

    .line 1159
    if-eqz v4, :cond_e

    .line 1160
    nop

    .line 1186
    move v0, v1

    goto :goto_c

    .line 1162
    :cond_e
    goto :goto_c

    .line 1165
    :cond_f
    const/16 p1, 0xa5

    if-eqz v4, :cond_12

    .line 1166
    if-ne p3, p1, :cond_11

    .line 1168
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_10

    .line 1169
    nop

    .line 1176
    move v0, v1

    goto :goto_a

    .line 1171
    :cond_10
    const/4 p1, 0x3

    goto :goto_9

    .line 1174
    :cond_11
    const/4 p1, 0x2

    .line 1176
    :goto_9
    move v0, p1

    :goto_a
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    goto :goto_c

    .line 1178
    :cond_12
    if-eq p3, p1, :cond_14

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p2, p1, :cond_13

    goto :goto_b

    .line 1181
    :cond_13
    const/4 v0, 0x4

    goto :goto_c

    .line 1179
    :cond_14
    :goto_b
    nop

    .line 1186
    :goto_c
    packed-switch v0, :pswitch_data_3

    goto :goto_d

    .line 1197
    :pswitch_9
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1198
    goto :goto_d

    .line 1200
    :pswitch_a
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1201
    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1202
    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1200
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 1194
    :pswitch_b
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1195
    goto :goto_d

    .line 1191
    :pswitch_c
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1192
    goto :goto_d

    .line 1188
    :pswitch_d
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1189
    nop

    .line 1205
    :goto_d
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x12
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method private updateLightingPattern(ZZ)V
    .locals 1

    .line 1463
    if-eqz p1, :cond_0

    .line 1464
    const/4 p1, -0x2

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 1466
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    const/16 v0, 0xab

    .line 1467
    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 1468
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1469
    return-void

    .line 1471
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1472
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->starAnimatetViewGone(Landroid/view/View;Z)V

    goto :goto_0

    .line 1473
    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    if-lez p1, :cond_3

    .line 1474
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startAnimateViewVisible(Landroid/view/View;Z)V

    .line 1476
    :cond_3
    :goto_0
    return-void
.end method

.method private updateSpeedTipImage(IILjava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 1324
    nop

    .line 1325
    nop

    .line 1326
    const/4 v0, -0x1

    const/16 v1, 0x21

    const/16 v2, 0xae

    if-eq p1, v2, :cond_0

    .line 1332
    move p1, v0

    goto :goto_0

    .line 1328
    :cond_0
    nop

    .line 1332
    move p1, v1

    .line 1333
    :goto_0
    nop

    .line 1334
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p1, v0, :cond_2

    if-eq p1, v1, :cond_1

    .line 1344
    move v4, v2

    move v5, v4

    move v0, v3

    goto :goto_1

    .line 1339
    :cond_1
    const v0, 0x7f040003

    .line 1340
    nop

    .line 1344
    move v4, v2

    move v5, v3

    goto :goto_1

    .line 1336
    :cond_2
    nop

    .line 1337
    nop

    .line 1344
    move v5, v2

    move v0, v3

    move v4, v0

    .line 1345
    :goto_1
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 1346
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1347
    if-ne v6, p1, :cond_3

    .line 1348
    nop

    .line 1352
    move v6, v3

    goto :goto_2

    :cond_3
    move v6, v2

    :goto_2
    if-eqz v6, :cond_4

    .line 1353
    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1354
    if-lez v0, :cond_4

    .line 1355
    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1358
    :cond_4
    if-ne p1, v1, :cond_5

    .line 1359
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeedText()Ljava/lang/String;

    move-result-object v0

    .line 1360
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const v7, 0x7f0d0010

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1361
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1363
    :cond_5
    if-nez v6, :cond_6

    .line 1364
    return-void

    .line 1367
    :cond_6
    if-eqz v4, :cond_7

    if-eqz v5, :cond_7

    .line 1368
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    goto :goto_3

    .line 1370
    :cond_7
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 1373
    :goto_3
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 1376
    if-nez p3, :cond_9

    .line 1377
    if-eqz v4, :cond_8

    .line 1378
    nop

    .line 1398
    :goto_4
    move v2, v3

    goto :goto_5

    .line 1380
    :cond_8
    goto :goto_5

    .line 1383
    :cond_9
    if-eqz v4, :cond_c

    .line 1384
    const/16 p1, 0xa3

    if-ne p2, p1, :cond_b

    .line 1385
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 1386
    goto :goto_4

    .line 1388
    :cond_a
    const/4 v2, 0x3

    goto :goto_5

    .line 1391
    :cond_b
    const/4 v2, 0x2

    goto :goto_5

    .line 1394
    :cond_c
    const/4 v2, 0x4

    .line 1398
    :goto_5
    packed-switch v2, :pswitch_data_0

    goto :goto_6

    .line 1409
    :pswitch_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1410
    goto :goto_6

    .line 1412
    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1413
    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1414
    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1412
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1406
    :pswitch_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1407
    goto :goto_6

    .line 1403
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1404
    goto :goto_6

    .line 1400
    :pswitch_4
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1401
    nop

    .line 1417
    :goto_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateTipImage(IILjava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .line 872
    nop

    .line 873
    const/16 v0, 0xae

    const/4 v1, -0x1

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/16 v4, 0xa5

    if-eq p1, v4, :cond_6

    const/16 v5, 0xab

    if-eq p1, v5, :cond_2

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_2

    .line 876
    :pswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 877
    goto/16 :goto_2

    .line 897
    :pswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v5

    const-string v6, "pref_camera_auto_zoom"

    invoke-virtual {v5, v6}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 898
    goto :goto_2

    .line 902
    :cond_0
    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v5

    .line 903
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBogusCameraId()I

    move-result v6

    invoke-virtual {v5, v6, p1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v5

    .line 904
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 905
    if-eqz v5, :cond_8

    invoke-virtual {v5}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 906
    goto :goto_0

    .line 908
    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 910
    if-eqz v5, :cond_8

    invoke-virtual {v5}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 911
    goto :goto_1

    .line 888
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-static {}, Lcom/mi/config/b;->ht()Z

    move-result v5

    if-nez v5, :cond_4

    :cond_3
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 889
    :cond_4
    goto :goto_0

    .line 890
    :cond_5
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 892
    goto :goto_1

    .line 880
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 881
    nop

    .line 917
    :goto_0
    move v5, v3

    goto :goto_3

    .line 882
    :cond_7
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 884
    nop

    .line 917
    :goto_1
    move v5, v2

    goto :goto_3

    :cond_8
    :goto_2
    move v5, v1

    .line 918
    :goto_3
    nop

    .line 919
    nop

    .line 920
    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eq v5, v1, :cond_c

    packed-switch v5, :pswitch_data_1

    .line 952
    move v9, v6

    move v0, v7

    move v8, v0

    goto :goto_6

    .line 930
    :pswitch_3
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v8

    const v9, 0x7f0200bf

    if-nez v8, :cond_9

    .line 931
    goto :goto_5

    .line 934
    :cond_9
    iget v8, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v8, v0, :cond_a

    .line 939
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    iget v8, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 940
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFaceBeautyOn(Ljava/lang/String;)Z

    move-result v0

    goto :goto_4

    .line 936
    :cond_a
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveBeautyOpen()Z

    move-result v0

    .line 937
    nop

    .line 943
    :goto_4
    if-eqz v0, :cond_b

    .line 944
    const v0, 0x7f0200c0

    .line 949
    move v9, v0

    goto :goto_5

    .line 946
    :cond_b
    nop

    .line 949
    :goto_5
    const v0, 0x7f0900f4

    .line 952
    move v8, v0

    move v0, v9

    move v9, v6

    goto :goto_6

    .line 925
    :pswitch_4
    const v0, 0x7f0200c2

    .line 926
    nop

    .line 952
    move v9, v6

    move v8, v7

    goto :goto_6

    .line 922
    :cond_c
    nop

    .line 923
    nop

    .line 952
    move v0, v7

    move v8, v0

    move v9, v8

    :goto_6
    if-lez v0, :cond_d

    .line 953
    iget-object v10, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v10, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 955
    :cond_d
    if-lez v8, :cond_e

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 956
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p0, v8}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 959
    :cond_e
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v0, v7}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    .line 960
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 961
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 962
    if-ne p1, v5, :cond_f

    .line 963
    return-void

    .line 967
    :cond_f
    if-eqz v9, :cond_10

    .line 968
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v0, v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 971
    :cond_10
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 974
    if-nez p3, :cond_12

    .line 975
    if-eqz v9, :cond_11

    .line 976
    nop

    .line 1001
    :goto_7
    move v2, v7

    goto :goto_a

    .line 978
    :cond_11
    nop

    .line 1001
    :goto_8
    move v2, v6

    goto :goto_a

    .line 981
    :cond_12
    if-eqz v9, :cond_15

    .line 982
    if-ne p2, v4, :cond_14

    .line 984
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_13

    .line 985
    goto :goto_7

    .line 987
    :cond_13
    nop

    .line 1001
    move v2, v3

    goto :goto_a

    .line 990
    :cond_14
    const/4 v2, 0x2

    goto :goto_a

    .line 993
    :cond_15
    if-eq p2, v4, :cond_17

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p1, v4, :cond_16

    goto :goto_9

    .line 996
    :cond_16
    goto :goto_a

    .line 994
    :cond_17
    :goto_9
    goto :goto_8

    .line 1001
    :goto_a
    packed-switch v2, :pswitch_data_2

    goto :goto_c

    .line 1020
    :pswitch_5
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1021
    goto :goto_c

    .line 1023
    :pswitch_6
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1024
    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1025
    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 1023
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 1017
    :pswitch_7
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1018
    goto :goto_c

    .line 1014
    :pswitch_8
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1015
    goto :goto_c

    .line 1003
    :pswitch_9
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa2

    .line 1004
    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1005
    if-eqz p1, :cond_18

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p1

    if-eqz p1, :cond_18

    goto :goto_b

    .line 1006
    :cond_18
    move v6, v7

    :goto_b
    if-eqz v6, :cond_19

    .line 1007
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1009
    :cond_19
    if-nez v6, :cond_1a

    .line 1010
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1028
    :cond_1a
    :goto_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_4
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public containTips(I)Z
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 687
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 688
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 687
    :goto_0
    return p1
.end method

.method public directHideTipImage()V
    .locals 3

    .line 489
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 490
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 491
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 493
    :cond_0
    return-void
.end method

.method public directShowOrHideLeftTipImage(Z)V
    .locals 1

    .line 1588
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 1589
    return-void

    .line 1591
    :cond_0
    if-eqz p1, :cond_1

    .line 1592
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    .line 1593
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 1595
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1596
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1598
    :goto_0
    return-void
.end method

.method public directlyHideTips()V
    .locals 3

    .line 671
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 672
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 673
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 674
    return-void

    .line 676
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 678
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    const/4 v1, 0x6

    const/4 v2, 0x4

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isPortraitHintVisible()Z

    move-result v0

    if-nez v0, :cond_1

    .line 679
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    .line 682
    :cond_1
    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 683
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 231
    const/16 v0, 0xff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 226
    const v0, 0x7f04000d

    return v0
.end method

.method public hideCenterTipImage()V
    .locals 2

    .line 1570
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1573
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1574
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1575
    return-void

    .line 1571
    :cond_1
    :goto_0
    return-void
.end method

.method public hideLeftTipImage()V
    .locals 2

    .line 1552
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1555
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1556
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1557
    return-void

    .line 1553
    :cond_1
    :goto_0
    return-void
.end method

.method public hideQrCodeTip()V
    .locals 2

    .line 785
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 786
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 788
    :cond_0
    return-void
.end method

.method public hideSpeedTipImage()V
    .locals 2

    .line 1561
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1564
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 1565
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1566
    return-void

    .line 1562
    :cond_1
    :goto_0
    return-void
.end method

.method public hideTipImage()V
    .locals 2

    .line 479
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 482
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 483
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 485
    return-void

    .line 480
    :cond_1
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 158
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    .line 160
    const v0, 0x7f0d0031

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    .line 163
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 166
    const v1, 0x800055

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 168
    const v0, 0x7f0d0032

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    .line 169
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 170
    const v1, 0x800053

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 172
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const v1, 0x7f02013c

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 173
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    const v0, 0x7f0d0036

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    .line 177
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    const v0, 0x7f0d0033

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    .line 180
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 181
    const/16 v1, 0x51

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 182
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    const v0, 0x7f0d0034

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    .line 185
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    const v0, 0x7f0d0035

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    .line 187
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a009e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    .line 188
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getLeftImageIntroWide()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroWidth:I

    .line 190
    :cond_0
    const v0, 0x7f0d0038

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    .line 191
    const v0, 0x7f0d0037

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    .line 192
    const v0, 0x7f0d0039

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    .line 193
    const v0, 0x7f0d003a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    .line 195
    nop

    .line 196
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 197
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 199
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    .line 202
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;I)V

    .line 203
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 204
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 205
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/Util;->startScreenSlideAlphaInAnimation(Landroid/view/View;)V

    .line 207
    :cond_1
    const v0, 0x7f0d003b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    .line 208
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-nez p1, :cond_2

    .line 211
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 213
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0039

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    .line 214
    return-void
.end method

.method public isLightingHintVisible()Z
    .locals 2

    .line 711
    nop

    .line 712
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;

    .line 713
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 714
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;->isAnyViewVisible()Z

    move-result v0

    goto :goto_0

    .line 716
    :cond_0
    move v0, v1

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    goto :goto_2

    :cond_2
    :goto_1
    const/4 v1, 0x1

    :goto_2
    return v1
.end method

.method public isPortraitHintVisible()Z
    .locals 1

    .line 706
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

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

.method public notifyAfterFrameAvailable(I)V
    .locals 0

    .line 1502
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1503
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 2

    .line 1481
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1483
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1485
    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    .line 1486
    goto :goto_0

    .line 1488
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    .line 1491
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    .line 1493
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1494
    const/4 p1, 0x1

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    .line 1495
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateSpeedTipImage(IILjava/util/List;)V

    .line 1496
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateCenterTipImage(IILjava/util/List;)V

    .line 1498
    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBackEvent(I)Z
    .locals 3

    .line 793
    const/16 v0, 0x9

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 795
    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v2, 0x6

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v2, 0x7

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0xb

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    if-eq p1, v0, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0xc

    if-ne p1, v2, :cond_1

    .line 800
    :cond_0
    return v1

    .line 804
    :cond_1
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    if-ne p1, v0, :cond_2

    .line 805
    return v1

    .line 808
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 809
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 810
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 811
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 812
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 813
    nop

    .line 820
    :pswitch_2
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 255
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 256
    return-void

    .line 260
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 261
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 262
    return-void

    .line 265
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 266
    return-void

    .line 269
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_3

    .line 310
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    packed-switch p1, :pswitch_data_1

    .line 318
    goto/16 :goto_3

    .line 315
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeLight()V

    .line 316
    goto/16 :goto_3

    .line 312
    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeFilter()V

    .line 313
    goto/16 :goto_3

    .line 271
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideQrCodeTip()V

    .line 272
    const-string p1, "counter"

    const-string v0, "qrcode_detected"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc3

    .line 275
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    .line 276
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showQRCodeResult()V

    .line 277
    goto/16 :goto_3

    .line 330
    :pswitch_5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 331
    const/16 v1, 0x21

    if-ne v0, v1, :cond_3

    .line 332
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    .line 333
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showLiveSpeed()V

    goto :goto_0

    .line 322
    :pswitch_6
    const/16 v0, 0x15

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 323
    invoke-static {}, Lcom/android/camera/CameraSettings;->setPopupUltraWideIntroClicked()V

    .line 324
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    goto :goto_1

    .line 337
    :cond_3
    :goto_0
    :pswitch_7
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 338
    const/16 v0, 0x12

    if-eq p1, v0, :cond_4

    goto :goto_3

    .line 340
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    .line 341
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showLiveSticker()V

    goto :goto_3

    .line 326
    :goto_1
    :pswitch_8
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->onLeftImageClick(Landroid/view/View;)V

    .line 327
    goto :goto_3

    .line 280
    :pswitch_9
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 281
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    .line 282
    invoke-static {}, Lcom/android/camera/CameraSettings;->setPopupTipBeautyIntroClicked()V

    .line 284
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 285
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 286
    packed-switch p1, :pswitch_data_2

    goto :goto_2

    .line 292
    :pswitch_a
    const-string p1, "counter"

    const-string v0, "beauty_button"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showBeauty(I)V

    .line 295
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa2

    .line 296
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 298
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    .line 299
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 300
    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p1

    if-eqz p1, :cond_5

    if-eqz v0, :cond_5

    .line 301
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    .line 304
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideQrCodeTip()V

    goto :goto_2

    .line 288
    :pswitch_b
    const/4 p1, 0x4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 289
    nop

    .line 307
    :goto_2
    nop

    .line 348
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d0031
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_b
        :pswitch_a
        :pswitch_a
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    .line 836
    const/4 v0, 0x0

    const/4 v1, 0x3

    if-eq p3, v1, :cond_0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v1, p1, :cond_1

    .line 837
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 838
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    .line 841
    :cond_1
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    .line 842
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 844
    const/4 p3, 0x4

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->onBackEvent(I)Z

    .line 847
    nop

    .line 848
    invoke-virtual {p0, v0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 850
    invoke-direct {p0, p1, v1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    .line 852
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p3

    if-eqz p3, :cond_2

    .line 853
    invoke-direct {p0, v0, p1, v1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    .line 854
    invoke-direct {p0, p1, v1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateSpeedTipImage(IILjava/util/List;)V

    .line 855
    invoke-direct {p0, p1, v1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateCenterTipImage(IILjava/util/List;)V

    .line 860
    :cond_2
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    .line 1423
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_1

    .line 1424
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getFragmentInto()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 1427
    :cond_0
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1

    .line 1425
    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .line 1432
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1433
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    .line 1434
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1437
    :cond_0
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 1438
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_1

    .line 1439
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1441
    :cond_1
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_2

    .line 1442
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1444
    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p2

    if-nez p2, :cond_3

    .line 1445
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 1446
    const/16 v0, 0x21

    if-eq p2, v0, :cond_3

    .line 1447
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1450
    :cond_3
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_4

    .line 1451
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1454
    :cond_4
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLightingPattern(ZZ)V

    .line 1455
    return-void
.end method

.method public reInitTipImage()V
    .locals 3

    .line 497
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;I)V

    .line 498
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 236
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 237
    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 238
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 239
    invoke-static {}, Lcom/android/camera/CameraSettings;->isShowUltraWideIntro()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 240
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    .line 242
    :cond_0
    return-void
.end method

.method public selectBeautyTipImage(Z)V
    .locals 1

    .line 1579
    if-eqz p1, :cond_0

    .line 1580
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const v0, 0x7f0200c0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 1582
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const v0, 0x7f0200bf

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1584
    :goto_0
    return-void
.end method

.method public setLightingPattern(Ljava/lang/String;)V
    .locals 2

    .line 721
    const/4 v0, -0x2

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 722
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "7"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    goto :goto_1

    :pswitch_1
    const-string v1, "6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x6

    goto :goto_1

    :pswitch_2
    const-string v1, "5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    goto :goto_1

    :pswitch_3
    const-string v1, "4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_1

    :pswitch_4
    const-string v1, "3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_1

    :pswitch_5
    const-string v1, "2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_1

    :pswitch_6
    const-string v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :pswitch_7
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    packed-switch p1, :pswitch_data_1

    goto :goto_2

    .line 745
    :pswitch_8
    const p1, 0x7f09020c

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    .line 742
    :pswitch_9
    const p1, 0x7f09020d

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 743
    goto :goto_2

    .line 739
    :pswitch_a
    const p1, 0x7f09020e

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 740
    goto :goto_2

    .line 736
    :pswitch_b
    const p1, 0x7f09020b

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 737
    goto :goto_2

    .line 733
    :pswitch_c
    const p1, 0x7f09020a

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 734
    goto :goto_2

    .line 730
    :pswitch_d
    const p1, 0x7f090209

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 731
    goto :goto_2

    .line 727
    :pswitch_e
    const p1, 0x7f090208

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 728
    goto :goto_2

    .line 724
    :pswitch_f
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    .line 725
    nop

    .line 749
    :goto_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    if-ne p1, v0, :cond_1

    .line 750
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 752
    :cond_1
    const/16 p1, 0xc

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    .line 753
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 754
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 755
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideTipImage()V

    .line 757
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    .line 758
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 759
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p1

    if-nez p1, :cond_2

    .line 760
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 764
    :cond_2
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method public setPortraitHintVisible(I)V
    .locals 2

    .line 693
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLightingHintVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 694
    return-void

    .line 696
    :cond_0
    if-nez p1, :cond_1

    const/4 v0, 0x7

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    :goto_0
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 697
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    .line 698
    if-nez p1, :cond_2

    .line 699
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    .line 701
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 702
    return-void
.end method

.method public showCloseTip(IZ)V
    .locals 3

    .line 1523
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    const/16 v1, 0xa7

    const/4 v2, 0x0

    if-nez v0, :cond_2

    .line 1524
    if-eqz p2, :cond_1

    .line 1526
    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p2, v1, :cond_0

    .line 1527
    return-void

    .line 1529
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    .line 1530
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 1532
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1533
    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    goto :goto_1

    .line 1536
    :cond_2
    if-eqz p2, :cond_4

    .line 1538
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne v0, v1, :cond_3

    .line 1539
    return-void

    .line 1541
    :cond_3
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    goto :goto_0

    .line 1543
    :cond_4
    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    .line 1545
    :goto_0
    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showOrHideCloseImage(Z)V

    .line 1547
    :goto_1
    return-void
.end method

.method public showOrHideCloseImage(Z)V
    .locals 2

    .line 1602
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 1603
    return-void

    .line 1605
    :cond_0
    const v0, 0x7f020124

    .line 1606
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1607
    if-eqz p1, :cond_3

    .line 1608
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1609
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 1611
    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const v0, 0x7f090266

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1612
    nop

    .line 1617
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1618
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 1620
    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1621
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1623
    :goto_1
    return-void
.end method

.method public showQrCodeTip()V
    .locals 4

    .line 768
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 770
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    .line 771
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 772
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 781
    :cond_0
    return-void
.end method

.method public showTips(III)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 523
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    .line 524
    return-void

    .line 528
    :cond_0
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 529
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBogusCameraId()I

    move-result v0

    if-nez v0, :cond_1

    .line 530
    return-void

    .line 533
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLightingHintVisible()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 534
    return-void

    .line 538
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isPortraitSuccessHintVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 539
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 542
    :cond_3
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 543
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    .line 545
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    .line 546
    iput p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    .line 548
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 549
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    .line 550
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 551
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 552
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 553
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 554
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    new-instance p2, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    const-wide/16 v0, 0xbb8

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 563
    :cond_4
    const/4 p1, 0x0

    .line 564
    packed-switch p3, :pswitch_data_0

    goto :goto_0

    .line 580
    :pswitch_0
    const/16 p1, 0xbb8

    goto :goto_0

    .line 577
    :pswitch_1
    const/16 p1, 0x7d0

    .line 578
    goto :goto_0

    .line 575
    :pswitch_2
    goto :goto_0

    .line 572
    :pswitch_3
    const/16 p1, 0x3a98

    .line 573
    goto :goto_0

    .line 569
    :pswitch_4
    const/16 p1, 0x1388

    .line 570
    goto :goto_0

    .line 566
    :pswitch_5
    const/16 p1, 0x3e8

    .line 567
    nop

    .line 584
    :goto_0
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 585
    if-lez p1, :cond_5

    .line 586
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 p3, 0x1

    int-to-long v0, p1

    invoke-virtual {p2, p3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 589
    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public showTips(IIII)V
    .locals 2

    .line 593
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;III)V

    int-to-long p1, p4

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 599
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    .line 246
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 247
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 248
    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 249
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 250
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    .line 251
    return-void
.end method

.method public updateLeftTipImage()V
    .locals 4

    .line 1627
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v2, v0, v1, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    .line 1628
    return-void
.end method

.method public updateTipBottomMargin(IZ)V
    .locals 3

    .line 502
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    .line 503
    if-ge v0, p1, :cond_0

    .line 504
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    int-to-float v1, p1

    const v2, 0x3f99999a    # 1.2f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 506
    :cond_0
    if-eqz p2, :cond_2

    .line 507
    int-to-float p2, p1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_1

    .line 508
    new-instance p2, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-direct {p2, v0, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 509
    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 508
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 509
    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 511
    :cond_1
    new-instance p2, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-direct {p2, v0, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance p1, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 512
    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    .line 511
    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    .line 512
    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 515
    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-static {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 517
    :goto_0
    return-void
.end method

.method public updateTipImage()V
    .locals 3

    .line 1697
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    .line 1698
    return-void
.end method
