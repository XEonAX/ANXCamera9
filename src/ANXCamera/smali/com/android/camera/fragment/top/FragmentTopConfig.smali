.class public Lcom/android/camera/fragment/top/FragmentTopConfig;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopConfig.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;
.implements Lcom/android/camera/protocol/ModeProtocol$TopAlert;


# static fields
.field private static final EXPAND_STATE_CENTER:I = 0x2

.field private static final EXPAND_STATE_LEFT:I = 0x0

.field private static final EXPAND_STATE_LEFT_FROM_SIBLING:I = 0x1

.field private static final EXPAND_STATE_RIGHT:I = 0x4

.field private static final EXPAND_STATE_RIGHT_FROM_SIBLING:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FragmentTopConfig"


# instance fields
.field private mAiSceneResources:[I

.field private mAutoZoomResources:[I

.field private mConfigViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentAiSceneLevel:I

.field private mDisabledFunctionMenu:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mDisplayRectTopMargin:I

.field private mExpandView:Landroid/support/v7/widget/RecyclerView;

.field private mFilterResources:[I

.field private mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

.field private mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

.field private mIsRTL:Z

.field private mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

.field private mLightingResource:[I

.field private mLiveMusicSelectResources:[I

.field private mLiveShotAnimator:Landroid/animation/ObjectAnimator;

.field private mLiveShotResource:[I

.field private mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

.field private mTopConfigMenu:Landroid/view/View;

.field private mTopDrawableWidth:I

.field private mTopExtraParent:Landroid/view/ViewGroup;

.field private mTotalWidth:I

.field private mUltraPixelPhotographyResources:[I

.field private mUltraWideBokehResources:[I

.field private mUltraWideResource:[I

.field private mVideoBokehResource:[I

.field private mVideoRecordingStarted:Z

.field private mViewPadding:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 76
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 101
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    return-void
.end method

.method private alertHDR(IZZZ)V
    .locals 2

    .line 1288
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1289
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 1293
    :cond_0
    if-eqz p4, :cond_2

    .line 1294
    if-nez p1, :cond_1

    .line 1295
    if-eqz p3, :cond_2

    .line 1296
    const/16 p3, 0xc2

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    goto :goto_0

    .line 1299
    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 p4, 0x1

    invoke-virtual {p3, p4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 1302
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result p3

    invoke-virtual {v0, p1, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertHDR(IIZ)V

    .line 1304
    return-void

    .line 1290
    :cond_3
    :goto_1
    return-void
.end method

.method private alertTopMusicHint(ILjava/lang/String;)V
    .locals 3

    .line 409
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 410
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a010d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 411
    if-eqz v0, :cond_0

    .line 412
    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopMusicHint(ILjava/lang/String;I)V

    .line 414
    :cond_0
    return-void
.end method

.method private expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V
    .locals 7

    .line 512
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 513
    return-void

    .line 518
    :cond_0
    new-instance v0, Lcom/android/camera/fragment/top/ExpandAdapter;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/fragment/top/ExpandAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;)V

    .line 522
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a001b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 523
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    mul-int/2addr v2, p1

    .line 524
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 525
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 526
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 527
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 533
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v3, 0x7f0a0021

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 534
    const/4 v3, 0x3

    mul-int/2addr p1, v3

    .line 536
    nop

    .line 537
    nop

    .line 538
    nop

    .line 541
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 542
    iget v4, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v5, 0x800003

    if-ne v4, v5, :cond_1

    .line 543
    move v4, v1

    goto :goto_0

    .line 542
    :cond_1
    nop

    .line 543
    move v4, v0

    :goto_0
    if-eqz v4, :cond_2

    .line 545
    nop

    .line 550
    move v1, v0

    goto :goto_1

    .line 548
    :cond_2
    nop

    .line 550
    :goto_1
    iget-boolean v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v5, :cond_3

    rsub-int/lit8 v1, v1, 0x4

    :cond_3
    packed-switch v1, :pswitch_data_0

    .line 591
    move p1, v0

    move v1, p1

    move v3, v1

    goto :goto_3

    .line 579
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 580
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 581
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/2addr p1, v3

    .line 582
    sub-int v3, v1, v2

    .line 583
    goto :goto_3

    .line 573
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 574
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    .line 575
    sub-int v3, v1, v2

    .line 576
    goto :goto_3

    .line 567
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 568
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    .line 569
    sub-int v3, v1, v2

    .line 571
    goto :goto_3

    .line 559
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 560
    nop

    .line 562
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result p1

    .line 563
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    .line 564
    goto :goto_2

    .line 552
    :pswitch_4
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 553
    nop

    .line 554
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v1

    sub-int p1, v1, p1

    .line 555
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    .line 556
    nop

    .line 591
    :goto_2
    move v3, v1

    move v1, v0

    :goto_3
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    iput-object v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 592
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v6

    iput v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    .line 593
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput p1, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    .line 594
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-virtual {v5, p3, v6}, Lcom/android/camera/fragment/top/LastAnimationComponent;->hideOtherViews(ILjava/util/List;)V

    .line 595
    if-nez v4, :cond_4

    .line 596
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput-object p2, p3, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 597
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    sub-int/2addr v1, p2

    invoke-virtual {p3, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->translateAnchorView(I)V

    .line 599
    :cond_4
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz p2, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    sub-int v0, p2, v2

    nop

    .line 600
    :cond_5
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    sub-int/2addr p1, v0

    sub-int/2addr v3, v0

    invoke-virtual {p2, p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->showExtraView(II)V

    .line 604
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1609
    nop

    .line 1610
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 1611
    if-ltz p1, :cond_0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 1612
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    .line 1614
    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 1615
    return-object p1
.end method

.method private getAiSceneResources()[I
    .locals 1

    .line 939
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 940
    nop

    .line 941
    nop

    .line 942
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02012b
        0x7f02012c
    .end array-data
.end method

.method private getAlertTopMargin()I
    .locals 3

    .line 1468
    nop

    .line 1470
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const v1, 0x7f0a0021

    const/16 v2, 0xa5

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-nez v0, :cond_0

    .line 1471
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1472
    int-to-float v0, v0

    const/high16 v2, 0x3f400000    # 0.75f

    div-float v2, v0, v2

    sub-float/2addr v2, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v2, v0

    float-to-int v0, v2

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sub-int/2addr v0, v2

    .line 1473
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1474
    goto :goto_1

    .line 1475
    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sget v2, Lcom/android/camera/Util;->sStatusBarHeight:I

    if-ne v0, v2, :cond_1

    .line 1476
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_1

    .line 1477
    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-lez v0, :cond_3

    .line 1478
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0a00c0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 1479
    sget-boolean v2, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v2, :cond_2

    if-lez v0, :cond_2

    .line 1480
    goto :goto_0

    .line 1482
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1483
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1485
    :goto_0
    goto :goto_1

    .line 1486
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 1487
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1492
    :goto_1
    return v0
.end method

.method private getAutoZoomResources()[I
    .locals 1

    .line 946
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 947
    nop

    .line 948
    nop

    .line 949
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200bc
        0x7f0200bd
    .end array-data
.end method

.method private getFPS960ImageResource(I)I
    .locals 0
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 506
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getImageResource()I

    move-result p1

    return p1
.end method

.method private getFilterResources()[I
    .locals 1

    .line 870
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 871
    nop

    .line 872
    nop

    .line 873
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02013c
        0x7f02013d
    .end array-data
.end method

.method private getFocusPeakImageResource()I
    .locals 3
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 466
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_peak_key"

    .line 467
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 468
    const-string v1, "zh"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 469
    if-eqz v0, :cond_0

    .line 470
    const v0, 0x7f020131

    return v0

    .line 472
    :cond_0
    const v0, 0x7f020134

    return v0

    .line 476
    :cond_1
    if-eqz v0, :cond_2

    .line 477
    const v0, 0x7f020133

    return v0

    .line 479
    :cond_2
    const v0, 0x7f020132

    return v0
.end method

.method private getHFRContentDesc(I)I
    .locals 1
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .line 496
    const/16 v0, 0xaa

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 497
    :goto_0
    if-eqz p1, :cond_1

    .line 498
    const p1, 0x7f0900fe

    return p1

    .line 500
    :cond_1
    const p1, 0x7f0900ff

    return p1
.end method

.method private getHFRImageResource(I)I
    .locals 1
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 486
    const/16 v0, 0xaa

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 487
    :goto_0
    if-eqz p1, :cond_1

    .line 488
    const p1, 0x7f02013a

    return p1

    .line 490
    :cond_1
    const p1, 0x7f02013b

    return p1
.end method

.method private getInitialMargin(I)I
    .locals 8

    .line 218
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigsSize()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_4

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigsSize()I

    move-result v0

    .line 222
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->findConfigPositionFromType(I)I

    move-result v2

    .line 223
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v3, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->findConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v3

    .line 224
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p1

    .line 225
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 226
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 227
    const/4 v5, 0x1

    const v6, 0x800003

    const v7, 0x800005

    packed-switch v0, :pswitch_data_0

    .line 245
    if-nez v2, :cond_6

    .line 246
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 247
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 248
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    return v1

    .line 234
    :pswitch_0
    if-nez v2, :cond_2

    .line 235
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 236
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget v6, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_0
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_2

    .line 237
    :cond_2
    if-ne v2, v5, :cond_4

    .line 238
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 239
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    iget v7, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_1
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 241
    :cond_4
    :goto_2
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 242
    return v1

    .line 229
    :pswitch_1
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 230
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_5

    goto :goto_3

    :cond_5
    iget v7, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_3
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 231
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    return v1

    .line 250
    :cond_6
    sub-int/2addr v0, v5

    if-ne v2, v0, :cond_7

    .line 251
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 252
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 253
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    return v1

    .line 256
    :cond_7
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    div-int/2addr p1, v0

    mul-int/2addr p1, v2

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr p1, v0

    return p1

    .line 219
    :cond_8
    :goto_4
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getLightingResources()[I
    .locals 1

    .line 925
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 926
    nop

    .line 927
    nop

    .line 928
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02013e
        0x7f02013f
    .end array-data
.end method

.method private getLiveShotResources()[I
    .locals 1

    .line 972
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020127
        0x7f020128
    .end array-data
.end method

.method private getMoreResources()I
    .locals 1

    .line 914
    const v0, 0x7f020140

    return v0
.end method

.method private getMusicSelectResources()[I
    .locals 1

    .line 1003
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 1004
    nop

    .line 1005
    nop

    .line 1006
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020109
        0x7f02010c
    .end array-data
.end method

.method private getPortraitResources()I
    .locals 1

    .line 896
    const v0, 0x7f020141

    return v0
.end method

.method private getSettingResources()I
    .locals 1

    .line 905
    const v0, 0x7f020139

    return v0
.end method

.method private getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;
    .locals 3

    .line 1445
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1446
    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1447
    return-object v1

    .line 1449
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1450
    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is not added yet"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1451
    return-object v1

    .line 1453
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    return-object v0
.end method

.method private getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    .locals 2

    .line 1463
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 1464
    const/16 v1, 0xf5

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 1463
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    return-object v0
.end method

.method private getUltraPixelPhotographyResources()[I
    .locals 1

    .line 986
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02015d
        0x7f02015e
    .end array-data
.end method

.method private getUltraWideBokehResources()[I
    .locals 1

    .line 996
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02015f
        0x7f020160
    .end array-data
.end method

.method private getUltraWideResources()[I
    .locals 1

    .line 958
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 959
    nop

    .line 960
    nop

    .line 961
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020179
        0x7f02017a
    .end array-data
.end method

.method private getVideoBokehResources()[I
    .locals 1

    .line 884
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 885
    nop

    .line 886
    nop

    .line 887
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020141
        0x7f020142
    .end array-data
.end method

.method private initTopView()V
    .locals 12

    .line 179
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v1, 0x7f0d00aa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 180
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v2, 0x7f0d00ab

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 181
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v3, 0x7f0d00ac

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 182
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v4, 0x7f0d00ad

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 183
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v5, 0x7f0d00ae

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 184
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v6, 0x7f0d00af

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 185
    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v7, 0x7f0d00b0

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 186
    iget-object v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v8, 0x7f0d00b1

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 187
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v9, 0x7f0d00b2

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    .line 188
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0d00b3

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 189
    iget-object v10, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v11, 0x7f0d00b4

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    .line 191
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    invoke-virtual {v6, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    invoke-virtual {v7, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    invoke-virtual {v8, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    invoke-virtual {v9, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    invoke-virtual {v10, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 203
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    .line 204
    iget-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    return-void
.end method

.method private reConfigCommonTip()V
    .locals 3

    .line 1550
    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1551
    const v0, 0x7f090283

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    goto :goto_1

    .line 1552
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1553
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1555
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1556
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getFrontComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(ILjava/lang/String;)V

    goto :goto_1

    .line 1557
    :cond_2
    const-string v0, "-1"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1558
    const v0, 0x7f090214

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(II)V

    goto :goto_1

    .line 1554
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopHint(ILjava/lang/String;)V

    .line 1560
    :cond_4
    :goto_1
    return-void
.end method

.method private reConfigTipOfFlash(Z)V
    .locals 3

    .line 1563
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1564
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    .line 1565
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1566
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1567
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "101"

    .line 1568
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1570
    :cond_0
    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1571
    const/4 v0, 0x1

    invoke-virtual {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZZ)V

    goto :goto_1

    .line 1573
    :cond_1
    const/16 v0, 0x8

    invoke-virtual {p0, v0, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZZ)V

    goto :goto_1

    .line 1569
    :cond_2
    :goto_0
    invoke-virtual {p0, v2, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZZ)V

    .line 1576
    :cond_3
    :goto_1
    return-void
.end method

.method private reConfigTipOfHdr(Z)V
    .locals 3

    .line 1579
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1580
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 1581
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1582
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1583
    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "normal"

    .line 1584
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1586
    :cond_0
    const-string v1, "live"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1587
    const/4 v0, 0x1

    invoke-direct {p0, v2, v0, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    goto :goto_1

    .line 1589
    :cond_1
    const/16 v0, 0x8

    invoke-direct {p0, v0, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    goto :goto_1

    .line 1585
    :cond_2
    :goto_0
    invoke-direct {p0, v2, v2, v2, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    .line 1592
    :cond_3
    :goto_1
    return-void
.end method

.method private resetImages()V
    .locals 15

    .line 1129
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    .line 1130
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 1131
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 1132
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1136
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v3

    .line 1132
    invoke-static {v2, v6, v0, v1, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 1137
    const/4 v7, 0x0

    move v8, v7

    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_5

    .line 1138
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/widget/ImageView;

    .line 1139
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 1140
    const/4 v0, 0x0

    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 1141
    const v11, 0x7f0d0007

    invoke-virtual {v9, v11}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v12

    .line 1142
    if-eqz v12, :cond_0

    move-object v0, v12

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1143
    move v13, v0

    goto :goto_1

    .line 1142
    :cond_0
    nop

    .line 1143
    move v13, v7

    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigTypeForViewPosition(I)I

    move-result v14

    .line 1144
    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v5, 0x0

    move-object v0, p0

    move v1, v14

    move-object v2, v9

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    move-result v0

    .line 1145
    nop

    .line 1146
    if-eqz v0, :cond_2

    if-eqz v12, :cond_2

    .line 1148
    invoke-virtual {v9, v11}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1149
    if-ne v13, v1, :cond_1

    goto :goto_2

    .line 1152
    :cond_1
    move v10, v7

    :cond_2
    :goto_2
    invoke-virtual {v9}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1153
    invoke-virtual {v9}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1154
    if-ne v1, v14, :cond_3

    if-eqz v10, :cond_3

    .line 1155
    goto :goto_3

    .line 1158
    :cond_3
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1159
    invoke-virtual {v9}, Landroid/widget/ImageView;->clearAnimation()V

    .line 1160
    invoke-virtual {v9, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1161
    if-eqz v0, :cond_4

    .line 1162
    const/4 v0, 0x0

    invoke-static {v9, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1163
    invoke-static {v9}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_3

    .line 1165
    :cond_4
    const/4 v0, 0x4

    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1137
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 1168
    :cond_5
    return-void
.end method

.method private setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z
    .locals 5

    .line 683
    nop

    .line 684
    nop

    .line 686
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 687
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 688
    const/16 v1, 0xd1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v1, :cond_17

    const/16 v1, 0xe1

    if-eq p1, v1, :cond_16

    const/16 v1, 0xf3

    if-eq p1, v1, :cond_13

    const/16 v1, 0xf5

    if-eq p1, v1, :cond_10

    const/16 v1, 0xfd

    if-eq p1, v1, :cond_e

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto/16 :goto_e

    .line 809
    :pswitch_0
    if-eqz p5, :cond_0

    .line 810
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p4

    const-string p5, "pref_ultra_wide_bokeh_enabled"

    .line 812
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 810
    invoke-interface {p4, p3, p5, v0}, Lcom/android/camera/data/backup/DataBackUp;->getBackupSwitchState(ILjava/lang/String;I)Z

    move-result p3

    goto :goto_0

    .line 814
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p3

    const-string p4, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {p3, p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p3

    .line 816
    :goto_0
    if-eqz p3, :cond_1

    .line 817
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v3

    .line 818
    :goto_1
    move v2, p4

    goto :goto_2

    .line 817
    :cond_1
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v2

    goto :goto_1

    .line 818
    :goto_2
    if-eqz p3, :cond_2

    .line 819
    const p3, 0x7f090250

    goto :goto_3

    :cond_2
    const p3, 0x7f090251

    .line 820
    :goto_3
    goto/16 :goto_18

    .line 822
    :pswitch_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p3

    .line 823
    if-eqz p3, :cond_3

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v3

    .line 824
    :goto_4
    move v2, p4

    goto :goto_5

    .line 823
    :cond_3
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v2

    goto :goto_4

    .line 824
    :goto_5
    if-eqz p3, :cond_4

    .line 825
    const p3, 0x7f090243

    goto :goto_6

    :cond_4
    const p3, 0x7f090244

    .line 826
    :goto_6
    goto/16 :goto_18

    .line 801
    :pswitch_2
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object p4

    .line 802
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_d

    .line 803
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v2

    .line 804
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getValueSelectedStringIdIgnoreClose(I)I

    move-result p3

    goto/16 :goto_18

    .line 765
    :pswitch_3
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFPS960ImageResource(I)I

    move-result v2

    .line 766
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p3

    .line 767
    invoke-virtual {p3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getContentDesc()I

    move-result p3

    .line 768
    goto/16 :goto_18

    .line 770
    :pswitch_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->isSwitchOn(I)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 771
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v3

    goto :goto_7

    .line 773
    :cond_5
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v2

    .line 775
    :goto_7
    if-eqz v0, :cond_11

    .line 776
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p4

    if-eqz p4, :cond_6

    .line 777
    const v2, 0x7f090104

    goto/16 :goto_11

    .line 779
    :cond_6
    const v2, 0x7f090103

    goto/16 :goto_11

    .line 756
    :pswitch_5
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getHFRImageResource(I)I

    move-result v2

    .line 757
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getHFRContentDesc(I)I

    move-result p3

    .line 758
    goto/16 :goto_18

    .line 750
    :pswitch_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result p3

    if-eqz p3, :cond_7

    .line 751
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p3, p3, v3

    .line 752
    :goto_8
    move v2, p3

    goto :goto_9

    .line 751
    :cond_7
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p3, p3, v2

    goto :goto_8

    .line 752
    :goto_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result p3

    if-eqz p3, :cond_8

    .line 753
    const p3, 0x7f0900e8

    goto :goto_a

    :cond_8
    const p3, 0x7f0900e9

    .line 754
    :goto_a
    goto/16 :goto_18

    .line 746
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v2

    .line 747
    const p3, 0x7f0900ed

    .line 748
    goto/16 :goto_18

    .line 690
    :pswitch_8
    return v2

    .line 734
    :pswitch_9
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMoreResources()I

    move-result v2

    .line 735
    const p3, 0x7f0900ea

    .line 736
    goto/16 :goto_18

    .line 713
    :pswitch_a
    if-eqz p5, :cond_9

    .line 714
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p5

    invoke-interface {p4, p3, p5}, Lcom/android/camera/data/backup/DataBackUp;->getBackupFilter(II)Ljava/lang/String;

    move-result-object p3

    goto :goto_b

    .line 716
    :cond_9
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 719
    :goto_b
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    .line 720
    sget p4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p3, p4, :cond_b

    if-gtz p3, :cond_a

    goto :goto_c

    .line 723
    :cond_a
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v3

    goto :goto_d

    .line 721
    :cond_b
    :goto_c
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v2

    .line 725
    :goto_d
    if-eqz v0, :cond_11

    .line 726
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p4

    if-eqz p4, :cond_c

    .line 727
    const v2, 0x7f0900e7

    goto/16 :goto_11

    .line 729
    :cond_c
    const v2, 0x7f0900e6

    goto/16 :goto_11

    .line 742
    :pswitch_b
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getPortraitResources()I

    move-result v2

    .line 743
    const p3, 0x7f0900ec

    .line 744
    goto/16 :goto_18

    .line 702
    :pswitch_c
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p4

    .line 703
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    .line 704
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v2

    .line 705
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedStringIdIgnoreClose(I)I

    move-result p3

    .line 706
    if-nez p5, :cond_1a

    .line 707
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfHdr(Z)V

    goto/16 :goto_18

    .line 692
    :pswitch_d
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p4

    .line 693
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    .line 694
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v2

    .line 695
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedStringIdIgnoreClose(I)I

    move-result p3

    .line 696
    if-nez p5, :cond_1a

    .line 697
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfFlash(Z)V

    goto/16 :goto_18

    .line 837
    :cond_d
    :goto_e
    move p3, v2

    goto/16 :goto_18

    .line 760
    :cond_e
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p3

    const-string p4, "pref_camera_auto_zoom"

    invoke-virtual {p3, p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_f

    .line 761
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v3

    .line 762
    :goto_f
    move v2, p3

    goto :goto_10

    .line 761
    :cond_f
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    aget p3, p3, v2

    goto :goto_f

    .line 762
    :goto_10
    const p3, 0x7f09027f

    .line 763
    goto/16 :goto_18

    .line 828
    :cond_10
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveMusic()[Ljava/lang/String;

    move-result-object p3

    .line 829
    aget-object p4, p3, v3

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_12

    .line 830
    aget-object p3, p3, v3

    invoke-direct {p0, v2, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertTopMusicHint(ILjava/lang/String;)V

    .line 831
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    aget p3, p3, v3

    .line 837
    :cond_11
    :goto_11
    move v4, v2

    move v2, p3

    move p3, v4

    goto :goto_18

    .line 833
    :cond_12
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    aget p3, p3, v2

    goto :goto_11

    .line 784
    :cond_13
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result p3

    .line 785
    const-string p4, "FragmentTopConfig"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setTopImageResource: VIDEO_BOKEH isSwitchOn = "

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 786
    if-eqz p3, :cond_14

    .line 787
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v3

    .line 788
    :goto_12
    move v2, p4

    goto :goto_13

    .line 787
    :cond_14
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v2

    goto :goto_12

    .line 788
    :goto_13
    if-eqz p3, :cond_15

    .line 789
    const p3, 0x7f09020f

    goto :goto_14

    :cond_15
    const p3, 0x7f090210

    .line 790
    :goto_14
    goto :goto_18

    .line 738
    :cond_16
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getSettingResources()I

    move-result v2

    .line 739
    const p3, 0x7f0900eb

    .line 740
    goto :goto_18

    .line 793
    :cond_17
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result p3

    .line 794
    if-eqz p3, :cond_18

    .line 795
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    aget p4, p4, v3

    .line 796
    :goto_15
    move v2, p4

    goto :goto_16

    .line 795
    :cond_18
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    aget p4, p4, v2

    goto :goto_15

    .line 796
    :goto_16
    if-eqz p3, :cond_19

    .line 797
    const p3, 0x7f090255

    goto :goto_17

    .line 798
    :cond_19
    const p3, 0x7f090256

    .line 799
    :goto_17
    nop

    .line 837
    :cond_1a
    :goto_18
    if-eqz p2, :cond_1e

    if-lez v2, :cond_1e

    .line 838
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 839
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getInitialMargin(I)I

    move-result p1

    .line 840
    const p5, 0x7f0d0007

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, p5, v0}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 841
    if-lez p1, :cond_1c

    .line 842
    nop

    .line 843
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Landroid/widget/FrameLayout$LayoutParams;

    .line 844
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr v0, v1

    sub-int/2addr p1, v0

    .line 847
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v0, :cond_1b

    .line 848
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    sub-int/2addr v0, p1

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    sub-int/2addr v0, p1

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 p1, p1, 0x2

    sub-int/2addr v0, p1

    iput v0, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    goto :goto_19

    .line 850
    :cond_1b
    iput p1, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 852
    :goto_19
    invoke-virtual {p2, p5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 855
    :cond_1c
    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 856
    if-lez p3, :cond_1e

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-nez p1, :cond_1d

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result p1

    if-eqz p1, :cond_1e

    .line 857
    :cond_1d
    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 860
    :cond_1e
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc9
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showMenu()V
    .locals 4

    .line 607
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 608
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->hideAlert()V

    .line 610
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 611
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->setDegree(I)V

    .line 613
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    .line 614
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 615
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_0

    .line 616
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_0

    .line 618
    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 621
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0d00b6

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 623
    invoke-virtual {v3}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v3

    .line 621
    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 624
    return-void
.end method


# virtual methods
.method public alertAiDetectTipHint(IIJ)V
    .locals 6

    .line 1653
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1654
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1658
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v3

    move v1, p1

    move v2, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiDetectTipHint(IIIJ)V

    .line 1659
    return-void

    .line 1655
    :cond_1
    :goto_0
    return-void
.end method

.method public alertAiSceneSelector(I)V
    .locals 2

    .line 1350
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1351
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1354
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(II)V

    .line 1355
    return-void

    .line 1352
    :cond_1
    :goto_0
    return-void
.end method

.method public alertFlash(IZZ)V
    .locals 1

    .line 1330
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZZ)V

    .line 1331
    return-void
.end method

.method public alertFlash(IZZZ)V
    .locals 2

    .line 1311
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1312
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 1316
    :cond_0
    if-eqz p4, :cond_2

    .line 1317
    if-nez p1, :cond_1

    .line 1318
    if-eqz p3, :cond_2

    .line 1319
    const/16 p3, 0xc1

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    goto :goto_0

    .line 1322
    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 p4, 0x1

    invoke-virtual {p3, p4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 1325
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result p3

    invoke-virtual {v0, p1, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertFlash(IIZ)V

    .line 1326
    return-void

    .line 1313
    :cond_3
    :goto_1
    return-void
.end method

.method public alertHDR(IZZ)V
    .locals 1

    .line 1307
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZZ)V

    .line 1308
    return-void
.end method

.method public alertLightingHint(I)V
    .locals 2

    .line 1638
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1639
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1643
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingHint(II)V

    .line 1644
    return-void

    .line 1640
    :cond_1
    :goto_0
    return-void
.end method

.method public alertLightingTitle(Z)V
    .locals 2

    .line 1628
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1629
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1632
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingTitle(ZI)V

    .line 1634
    return-void

    .line 1630
    :cond_1
    :goto_0
    return-void
.end method

.method public alertMoonModeSelector(I)V
    .locals 4

    .line 1359
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1360
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1363
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090249

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1364
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090252

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1365
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v3

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMoonSelector(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1366
    return-void

    .line 1361
    :cond_1
    :goto_0
    return-void
.end method

.method public alertMusicClose(Z)V
    .locals 1

    .line 402
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 403
    if-eqz v0, :cond_0

    .line 404
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMusicClose(Z)V

    .line 406
    :cond_0
    return-void
.end method

.method public alertSwitchHint(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 1407
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1408
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1412
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(III)V

    .line 1413
    return-void

    .line 1409
    :cond_1
    :goto_0
    return-void
.end method

.method public alertSwitchHint(ILjava/lang/String;)V
    .locals 2

    .line 1417
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1418
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1422
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(ILjava/lang/String;I)V

    .line 1423
    return-void

    .line 1419
    :cond_1
    :goto_0
    return-void
.end method

.method public alertTopHint(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 1427
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1428
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1432
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(III)V

    .line 1433
    return-void

    .line 1429
    :cond_1
    :goto_0
    return-void
.end method

.method public alertTopHint(ILjava/lang/String;)V
    .locals 2

    .line 1437
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1438
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1441
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(IILjava/lang/String;)V

    .line 1442
    return-void

    .line 1439
    :cond_1
    :goto_0
    return-void
.end method

.method public alertUpdateValue(I)V
    .locals 2

    .line 1335
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1336
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1340
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertUpdateValue(II)V

    .line 1341
    return-void

    .line 1337
    :cond_1
    :goto_0
    return-void
.end method

.method public clearAlertStatus()V
    .locals 1

    .line 1673
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1674
    if-nez v0, :cond_0

    .line 1675
    return-void

    .line 1677
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clearAlertStatus()V

    .line 1678
    return-void
.end method

.method public varargs disableMenuItem([I)V
    .locals 5

    .line 1247
    if-eqz p1, :cond_0

    .line 1248
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 1249
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1250
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    .line 1251
    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1248
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1254
    :cond_0
    return-void
.end method

.method public varargs enableMenuItem([I)V
    .locals 5

    .line 1258
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1259
    return-void

    .line 1261
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget v2, p1, v1

    .line 1262
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1263
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    .line 1264
    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1261
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1266
    :cond_1
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 267
    const/16 v0, 0xf4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 262
    const v0, 0x7f040032

    return v0
.end method

.method public getTopImage(I)Landroid/widget/ImageView;
    .locals 1

    .line 456
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->findViewPosition(I)I

    move-result p1

    .line 457
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method public getTopImagePosition(I)I
    .locals 0

    .line 461
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->findViewPosition(I)I

    move-result p1

    return p1
.end method

.method public hideAlert()V
    .locals 2

    .line 1663
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1664
    if-nez v0, :cond_0

    .line 1665
    return-void

    .line 1667
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear()V

    .line 1668
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1669
    return-void
.end method

.method public hideConfigMenu()V
    .locals 2

    .line 1237
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1238
    return-void
.end method

.method public hideExtraMenu()V
    .locals 1

    .line 1203
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1204
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 129
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    .line 130
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAutoZoomResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAutoZoomResources:[I

    .line 131
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideResource:[I

    .line 132
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    .line 133
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraPixelPhotographyResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    .line 134
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLiveShotResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    .line 135
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLightingResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    .line 136
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getVideoBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    .line 137
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFilterResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    .line 138
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMusicSelectResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    .line 139
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    .line 140
    new-instance v0, Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/LastAnimationComponent;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    .line 142
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    .line 144
    const v0, 0x7f0d00b6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    .line 145
    const v0, 0x7f0d00a9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    .line 147
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    .line 149
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 150
    sget v1, Lcom/android/camera/Util;->sStatusBarHeight:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 152
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->initTopView()V

    .line 153
    const v0, 0x7f0d00b5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    .line 154
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 155
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 156
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 158
    nop

    .line 159
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0021

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    .line 162
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f02012e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    .line 164
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    .line 166
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 167
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 168
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/Util;->startScreenSlideAlphaInAnimation(Landroid/view/View;)V

    .line 172
    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;I)V

    .line 173
    return-void
.end method

.method public insertConfigItem(I)V
    .locals 0

    .line 1188
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 1189
    return-void
.end method

.method public needViewClear()Z
    .locals 1

    .line 1648
    const/4 v0, 0x1

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    .line 1526
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1527
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    if-nez p1, :cond_0

    .line 1528
    new-instance p1, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 1530
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1531
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setDegree(I)V

    .line 1532
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertTopMargin(I)V

    .line 1533
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d00b7

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 1534
    invoke-virtual {v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1533
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1538
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1540
    if-eqz p1, :cond_1

    .line 1541
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMutexConfigs(I)V

    .line 1542
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckUltraPixelPhotoGraphy()V

    .line 1543
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckLiveShot()V

    .line 1544
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckHandGesture()V

    .line 1546
    :cond_1
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1518
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1520
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1521
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 p2, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;I)V

    .line 1522
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1502
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 6

    .line 642
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 643
    return v3

    .line 646
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 647
    if-eqz v0, :cond_4

    .line 648
    const/4 v4, 0x6

    const/16 v5, 0xc8

    if-eq p1, v4, :cond_2

    packed-switch p1, :pswitch_data_0

    .line 662
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const/16 v4, 0xf5

    .line 663
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 662
    invoke-static {v0, v4}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 664
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 651
    :pswitch_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 652
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 653
    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 652
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 653
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 654
    goto :goto_1

    .line 657
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 658
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 659
    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 658
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 659
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 660
    nop

    .line 668
    :goto_1
    if-eq p1, v1, :cond_3

    .line 669
    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reInitAlert(Z)V

    .line 673
    :cond_3
    return v3

    .line 675
    :cond_4
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    .line 1506
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1507
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1508
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1512
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1513
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 281
    const-string v0, "FragmentTopConfig"

    const-string v1, "top config onclick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    return-void

    .line 287
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 289
    if-nez v0, :cond_1

    .line 290
    return-void

    .line 294
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    .line 295
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 296
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 297
    return-void

    .line 300
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 301
    return-void

    .line 304
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 306
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 307
    return-void

    .line 310
    :cond_4
    const/16 v2, 0xc7

    if-eq v1, v2, :cond_c

    const/16 v2, 0xd1

    if-eq v1, v2, :cond_b

    const/16 v2, 0xe1

    if-eq v1, v2, :cond_a

    const/16 v2, 0xf3

    if-eq v1, v2, :cond_9

    const/16 v2, 0xf5

    if-eq v1, v2, :cond_8

    const/16 v2, 0xfd

    if-eq v1, v2, :cond_7

    packed-switch v1, :pswitch_data_0

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_0

    .line 375
    :pswitch_0
    const/16 p1, 0xcf

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 376
    goto/16 :goto_0

    .line 381
    :pswitch_1
    const/16 p1, 0xce

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 382
    goto/16 :goto_0

    .line 372
    :pswitch_2
    const/16 p1, 0xcd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 373
    goto/16 :goto_0

    .line 369
    :pswitch_3
    const/16 p1, 0xcc

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 370
    goto/16 :goto_0

    .line 361
    :pswitch_4
    const/16 p1, 0xcb

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 362
    goto/16 :goto_0

    .line 357
    :pswitch_5
    const/16 p1, 0xca

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 358
    goto/16 :goto_0

    .line 331
    :pswitch_6
    const/16 p1, 0xc9

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 332
    goto/16 :goto_0

    .line 340
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->showMenu()V

    .line 341
    goto/16 :goto_0

    .line 335
    :pswitch_8
    const/16 p1, 0xc4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 336
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 337
    goto/16 :goto_0

    .line 348
    :pswitch_9
    const/16 p1, 0xc3

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 349
    goto/16 :goto_0

    .line 326
    :pswitch_a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 327
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    .line 328
    goto/16 :goto_0

    .line 312
    :pswitch_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 313
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    .line 314
    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->disableUpdate()Z

    move-result v2

    if-nez v2, :cond_5

    .line 315
    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    goto :goto_0

    .line 317
    :cond_5
    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getDisableReasonString()I

    move-result p1

    .line 318
    if-eqz p1, :cond_6

    .line 319
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 321
    :cond_6
    const-string p1, "FragmentTopConfig"

    const-string v0, "ignore click flash for disable update"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    goto :goto_0

    .line 384
    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 385
    goto :goto_0

    .line 387
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->getFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    .line 388
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveMusicClick()V

    .line 389
    if-nez p1, :cond_d

    .line 390
    new-instance p1, Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-direct {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;-><init>()V

    .line 391
    const/4 v0, 0x2

    const v1, 0x7f0c0020

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->setStyle(II)V

    .line 392
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    sget-object v1, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    .line 393
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 394
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    goto :goto_0

    .line 365
    :cond_9
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 366
    goto :goto_0

    .line 344
    :cond_a
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showSetting()V

    .line 345
    goto :goto_0

    .line 378
    :cond_b
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 379
    goto :goto_0

    .line 352
    :cond_c
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 353
    check-cast p1, Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 354
    nop

    .line 398
    :cond_d
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc9
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onExpandValueChange(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;)V
    .locals 7

    .line 418
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 419
    return-void

    .line 422
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 424
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 426
    if-nez v1, :cond_1

    .line 427
    return-void

    .line 429
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result p1

    const v2, 0x7f09005f

    const/16 v3, 0xc1

    const/16 v4, 0xc2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq p1, v2, :cond_4

    const v2, 0x7f090131

    if-eq p1, v2, :cond_2

    goto :goto_0

    .line 441
    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackHdrChanged(ILjava/lang/String;)V

    .line 442
    new-array p1, v6, [I

    aput v4, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 443
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigFlashIfHdrChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 444
    new-array p1, v6, [I

    aput v3, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 447
    :cond_3
    invoke-interface {v1, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configHdr(Ljava/lang/String;)V

    goto :goto_0

    .line 431
    :cond_4
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackFlashChanged(ILjava/lang/String;)V

    .line 432
    new-array p1, v6, [I

    aput v3, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 433
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHhrIfFlashChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 434
    new-array p1, v6, [I

    aput v4, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 437
    :cond_5
    invoke-interface {v1, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configFlash(Ljava/lang/String;)V

    .line 438
    nop

    .line 451
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v6}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 452
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    move-object/from16 v6, p0

    move/from16 v7, p1

    move-object/from16 v8, p2

    .line 1012
    move/from16 v0, p3

    iget v9, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1013
    const/4 v11, 0x1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 1014
    move v1, v11

    goto :goto_0

    .line 1013
    :cond_0
    nop

    .line 1014
    const/4 v1, 0x0

    :goto_0
    invoke-super/range {p0 .. p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 1016
    nop

    .line 1017
    packed-switch v9, :pswitch_data_0

    packed-switch v9, :pswitch_data_1

    goto :goto_2

    .line 1022
    :pswitch_0
    const/16 v2, 0xa2

    if-eq v7, v2, :cond_1

    packed-switch v7, :pswitch_data_2

    .line 1030
    move v2, v11

    goto :goto_1

    .line 1027
    :cond_1
    :pswitch_1
    nop

    .line 1030
    const/4 v2, 0x0

    :goto_1
    goto :goto_3

    .line 1032
    :pswitch_2
    const/16 v2, 0xa1

    if-ne v7, v2, :cond_2

    .line 1033
    nop

    .line 1041
    const/4 v2, 0x0

    goto :goto_3

    :cond_2
    :goto_2
    move v2, v11

    :goto_3
    if-eqz v2, :cond_3

    .line 1042
    const/4 v2, 0x4

    invoke-virtual {v6, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1045
    :cond_3
    if-eqz v1, :cond_4

    .line 1046
    iget-object v1, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 1051
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v1

    .line 1052
    if-eqz v1, :cond_5

    .line 1053
    invoke-virtual {v1, v7, v8, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideAnimateElement(ILjava/util/List;I)V

    .line 1056
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v12

    .line 1057
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 1058
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    iget v2, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 1060
    if-nez v1, :cond_6

    .line 1061
    return-void

    .line 1064
    :cond_6
    iget-object v2, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_7

    .line 1065
    iget-object v2, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1068
    :cond_7
    iget v2, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1072
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v3

    .line 1068
    invoke-static {v2, v12, v0, v1, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 1073
    const/4 v13, 0x0

    :goto_4
    iget-object v0, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v13, v0, :cond_13

    .line 1074
    iget-object v0, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Landroid/widget/ImageView;

    .line 1075
    invoke-virtual {v14, v11}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 1076
    const v15, 0x7f0d0007

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v16

    .line 1077
    if-eqz v16, :cond_8

    move-object/from16 v0, v16

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1078
    move v5, v0

    goto :goto_5

    .line 1077
    :cond_8
    nop

    .line 1078
    const/4 v5, 0x0

    :goto_5
    iget-object v0, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v13}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigTypeForViewPosition(I)I

    move-result v4

    .line 1079
    if-eqz v8, :cond_9

    move/from16 v17, v11

    goto :goto_6

    :cond_9
    const/16 v17, 0x0

    :goto_6
    move-object v0, v6

    move v1, v4

    move-object v2, v14

    move v3, v7

    move v10, v4

    move-object v4, v12

    move v11, v5

    move/from16 v5, v17

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    move-result v0

    .line 1082
    if-eqz v0, :cond_a

    iget-object v1, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1083
    goto/16 :goto_a

    .line 1086
    :cond_a
    nop

    .line 1087
    if-eqz v0, :cond_c

    if-eqz v16, :cond_c

    .line 1089
    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1090
    if-ne v11, v1, :cond_b

    goto :goto_7

    .line 1093
    :cond_b
    const/4 v11, 0x0

    goto :goto_8

    :cond_c
    :goto_7
    const/4 v11, 0x1

    :goto_8
    invoke-virtual {v14}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 1094
    invoke-virtual {v14}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1095
    if-ne v1, v10, :cond_d

    if-eqz v11, :cond_d

    .line 1096
    goto :goto_a

    .line 1099
    :cond_d
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1102
    if-nez v8, :cond_f

    .line 1103
    if-eqz v0, :cond_e

    .line 1104
    invoke-static {v14}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_a

    .line 1106
    :cond_e
    invoke-static {v14}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_a

    .line 1109
    :cond_f
    const/16 v1, 0x96

    if-eqz v0, :cond_10

    .line 1110
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v0, v14}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1111
    nop

    .line 1112
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 1113
    invoke-virtual {v2, v1}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    .line 1114
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1115
    goto :goto_a

    .line 1116
    :cond_10
    const/16 v0, 0xa5

    if-eq v9, v0, :cond_12

    iget v2, v6, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-ne v2, v0, :cond_11

    goto :goto_9

    .line 1120
    :cond_11
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v0, v14}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1121
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 1120
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 1118
    :cond_12
    :goto_9
    invoke-static {v14}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1073
    :goto_a
    add-int/lit8 v13, v13, 0x1

    const/4 v11, 0x1

    goto/16 :goto_4

    .line 1126
    :cond_13
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xa8
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
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

    .line 1596
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1597
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 1598
    if-eqz v0, :cond_0

    .line 1599
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->provideRotateItem(Ljava/util/List;I)V

    .line 1602
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1603
    if-eqz v0, :cond_1

    .line 1604
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideRotateItem(Ljava/util/List;I)V

    .line 1606
    :cond_1
    return-void
.end method

.method public reInitAlert(Z)V
    .locals 2

    .line 1682
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1683
    if-eqz v0, :cond_0

    .line 1684
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1685
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigCommonTip()V

    .line 1686
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfFlash(Z)V

    .line 1687
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipOfHdr(Z)V

    .line 1688
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateMusicHint()V

    .line 1689
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertUpdateValue(I)V

    .line 1691
    :cond_0
    return-void
.end method

.method public refreshExtraMenu()V
    .locals 1

    .line 1230
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1231
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->reFresh()V

    .line 1233
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 628
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 629
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 630
    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 631
    return-void
.end method

.method public removeConfigItem(I)V
    .locals 0

    .line 1193
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 1194
    return-void
.end method

.method public removeExtraMenu(I)V
    .locals 0

    .line 1198
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1199
    return-void
.end method

.method public rotate()V
    .locals 0

    .line 1497
    return-void
.end method

.method public setAiSceneImageLevel(I)V
    .locals 2

    .line 1370
    nop

    .line 1371
    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    .line 1372
    const/16 p1, 0x17

    .line 1375
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1376
    const/16 v1, 0xc9

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v1

    .line 1377
    if-eqz v0, :cond_2

    if-nez v1, :cond_1

    goto :goto_0

    .line 1380
    :cond_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1396
    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    .line 1397
    return-void

    .line 1378
    :cond_2
    :goto_0
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 272
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 273
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 274
    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setClickEnable(Z)V

    .line 277
    :cond_0
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 1

    .line 1271
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1272
    if-eqz v0, :cond_0

    .line 1273
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 1275
    :cond_0
    invoke-static {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setPendingRecordingState(I)V

    .line 1277
    :goto_0
    return-void
.end method

.method public setShow(Z)V
    .locals 1

    .line 1457
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1458
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1460
    :cond_0
    return-void
.end method

.method public showConfigMenu()V
    .locals 2

    .line 1242
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1243
    return-void
.end method

.method public startLiveShotAnimation()V
    .locals 3

    .line 1208
    const/16 v0, 0xce

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 1209
    if-eqz v0, :cond_3

    .line 1210
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1211
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_3

    .line 1212
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/RotateDrawable;

    .line 1213
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->getTarget()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_1

    .line 1214
    :cond_0
    const-string v1, "level"

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    .line 1215
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1216
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1219
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1220
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1222
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1225
    :cond_3
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x2710
    .end array-data
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 635
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 636
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 637
    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 638
    return-void
.end method

.method public varargs updateConfigItem([I)V
    .locals 9

    .line 1172
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    .line 1173
    array-length v7, p1

    const/4 v0, 0x0

    move v8, v0

    :goto_0
    if-ge v8, v7, :cond_1

    aget v1, p1, v8

    .line 1174
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->isHasConfigItem(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1175
    goto :goto_1

    .line 1177
    :cond_0
    nop

    .line 1179
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v5, 0x0

    .line 1177
    move-object v0, p0

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;Z)Z

    .line 1173
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1184
    :cond_1
    return-void
.end method

.method public updateContentDescription()V
    .locals 2

    .line 1620
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 1621
    if-eqz v0, :cond_0

    .line 1622
    const v1, 0x7f0900e6

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1624
    :cond_0
    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    .line 1281
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1282
    if-eqz v0, :cond_0

    .line 1283
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 1285
    :cond_0
    return-void
.end method
