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

.field private mBeforeMode:I

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

.field private mViewPadding:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 71
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 96
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    .line 104
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    return-void
.end method

.method private expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V
    .locals 7

    .line 483
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    return-void

    .line 489
    :cond_0
    new-instance v0, Lcom/android/camera/fragment/top/ExpandAdapter;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/fragment/top/ExpandAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;)V

    .line 493
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09001b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 494
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    mul-int/2addr v2, p1

    .line 495
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 496
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 497
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 498
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 504
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v3, 0x7f090021

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 505
    const/4 v3, 0x3

    mul-int/2addr p1, v3

    .line 507
    nop

    .line 508
    nop

    .line 509
    nop

    .line 512
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 513
    iget v4, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v5, 0x800003

    if-ne v4, v5, :cond_1

    .line 514
    move v4, v1

    goto :goto_0

    .line 513
    :cond_1
    nop

    .line 514
    move v4, v0

    :goto_0
    if-eqz v4, :cond_2

    .line 516
    nop

    .line 521
    move v1, v0

    goto :goto_1

    .line 519
    :cond_2
    nop

    .line 521
    :goto_1
    iget-boolean v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v5, :cond_3

    rsub-int/lit8 v1, v1, 0x4

    :cond_3
    packed-switch v1, :pswitch_data_0

    .line 562
    move p1, v0

    move v1, p1

    move v3, v1

    goto :goto_3

    .line 550
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 551
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 552
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/2addr p1, v3

    .line 553
    sub-int v3, v1, v2

    .line 554
    goto :goto_3

    .line 544
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 545
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    .line 546
    sub-int v3, v1, v2

    .line 547
    goto :goto_3

    .line 538
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v1, v3

    .line 539
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v3, v2

    sub-int p1, v3, p1

    .line 540
    sub-int v3, v1, v2

    .line 542
    goto :goto_3

    .line 530
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 531
    nop

    .line 533
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result p1

    .line 534
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    .line 535
    goto :goto_2

    .line 523
    :pswitch_4
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->setExpandGravity(I)V

    .line 524
    nop

    .line 525
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v1

    sub-int p1, v1, p1

    .line 526
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    .line 527
    nop

    .line 562
    :goto_2
    move v3, v1

    move v1, v0

    :goto_3
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    iput-object v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 563
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v6

    iput v6, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    .line 564
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput p1, v5, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    .line 565
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-virtual {v5, p3, v6}, Lcom/android/camera/fragment/top/LastAnimationComponent;->hideOtherViews(ILjava/util/List;)V

    .line 566
    if-nez v4, :cond_4

    .line 567
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput-object p2, p3, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 568
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    sub-int/2addr v1, p2

    invoke-virtual {p3, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->translateAnchorView(I)V

    .line 570
    :cond_4
    iget-boolean p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz p2, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    sub-int v0, p2, v2

    nop

    .line 571
    :cond_5
    iget-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    sub-int/2addr p1, v0

    sub-int/2addr v3, v0

    invoke-virtual {p2, p1, v3}, Lcom/android/camera/fragment/top/LastAnimationComponent;->showExtraView(II)V

    .line 575
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

    .line 1509
    nop

    .line 1510
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 1511
    if-ltz p1, :cond_0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 1512
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    .line 1514
    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 1515
    return-object p1
.end method

.method private getAiSceneResources()[I
    .locals 1

    .line 916
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 917
    nop

    .line 918
    nop

    .line 919
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020108
        0x7f020109
    .end array-data
.end method

.method private getAlertTopMargin()I
    .locals 3

    .line 1388
    nop

    .line 1390
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const v1, 0x7f090021

    const/16 v2, 0xa5

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-nez v0, :cond_0

    .line 1391
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1392
    int-to-float v0, v0

    const/high16 v2, 0x3f400000    # 0.75f

    div-float v2, v0, v2

    sub-float/2addr v2, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v2, v0

    float-to-int v0, v2

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sub-int/2addr v0, v2

    .line 1393
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1394
    goto :goto_1

    .line 1395
    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sget v2, Lcom/android/camera/Util;->sStatusBarHeight:I

    if-ne v0, v2, :cond_1

    .line 1396
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_1

    .line 1397
    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-lez v0, :cond_3

    .line 1398
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0900bc

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 1399
    sget-boolean v2, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v2, :cond_2

    if-lez v0, :cond_2

    .line 1400
    goto :goto_0

    .line 1402
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1403
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1405
    :goto_0
    goto :goto_1

    .line 1406
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 1407
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1412
    :goto_1
    return v0
.end method

.method private getFPS960ImageResource(I)I
    .locals 0
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 477
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

    .line 852
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 853
    nop

    .line 854
    nop

    .line 855
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020119
        0x7f02011a
    .end array-data
.end method

.method private getFocusPeakImageResource()I
    .locals 3
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 437
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_peak_key"

    .line 438
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 439
    const-string v1, "zh"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 440
    if-eqz v0, :cond_0

    .line 441
    const v0, 0x7f02010e

    return v0

    .line 443
    :cond_0
    const v0, 0x7f020111

    return v0

    .line 447
    :cond_1
    if-eqz v0, :cond_2

    .line 448
    const v0, 0x7f020110

    return v0

    .line 450
    :cond_2
    const v0, 0x7f02010f

    return v0
.end method

.method private getHFRContentDesc(I)I
    .locals 1
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .line 467
    const/16 v0, 0xaa

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 468
    :goto_0
    if-eqz p1, :cond_1

    .line 469
    const p1, 0x7f0b00f8

    return p1

    .line 471
    :cond_1
    const p1, 0x7f0b00f9

    return p1
.end method

.method private getHFRImageResource(I)I
    .locals 1
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 457
    const/16 v0, 0xaa

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 458
    :goto_0
    if-eqz p1, :cond_1

    .line 459
    const p1, 0x7f020117

    return p1

    .line 461
    :cond_1
    const p1, 0x7f020118

    return p1
.end method

.method private getInitialMargin(I)I
    .locals 8

    .line 209
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigsSize()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_4

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigsSize()I

    move-result v0

    .line 213
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->findConfigPositionFromType(I)I

    move-result v2

    .line 214
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v3, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->findConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v3

    .line 215
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p1

    .line 216
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 217
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 218
    const/4 v5, 0x1

    const v6, 0x800003

    const v7, 0x800005

    packed-switch v0, :pswitch_data_0

    .line 236
    if-nez v2, :cond_6

    .line 237
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 238
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 239
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    return v1

    .line 225
    :pswitch_0
    if-nez v2, :cond_2

    .line 226
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 227
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget v6, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_0
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_2

    .line 228
    :cond_2
    if-ne v2, v5, :cond_4

    .line 229
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 230
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    iget v7, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_1
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 232
    :cond_4
    :goto_2
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    return v1

    .line 220
    :pswitch_1
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 221
    iget v0, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    if-nez v0, :cond_5

    goto :goto_3

    :cond_5
    iget v7, v3, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    :goto_3
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 222
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 223
    return v1

    .line 241
    :cond_6
    sub-int/2addr v0, v5

    if-ne v2, v0, :cond_7

    .line 242
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 243
    iput v7, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 244
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 245
    return v1

    .line 247
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

    .line 210
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

    .line 903
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 904
    nop

    .line 905
    nop

    .line 906
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02011b
        0x7f02011c
    .end array-data
.end method

.method private getLiveShotResources()[I
    .locals 1

    .line 940
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020104
        0x7f020105
    .end array-data
.end method

.method private getMoreResources()I
    .locals 1

    .line 893
    const v0, 0x7f02011d

    return v0
.end method

.method private getMusicSelectResources()[I
    .locals 1

    .line 977
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 978
    nop

    .line 979
    nop

    .line 980
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f0200f3
        0x7f0200f6
    .end array-data
.end method

.method private getPortraitResources()I
    .locals 1

    .line 877
    const v0, 0x7f02011e

    return v0
.end method

.method private getSettingResources()I
    .locals 1

    .line 885
    const v0, 0x7f020116

    return v0
.end method

.method private getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;
    .locals 3

    .line 1371
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1372
    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1373
    return-object v1

    .line 1375
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1376
    const-string v0, "FragmentTopConfig"

    const-string v2, "getTopAlert(): fragment is not added yet"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1377
    return-object v1

    .line 1379
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    return-object v0
.end method

.method private getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    .locals 2

    .line 1383
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 1384
    const/16 v1, 0xf5

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 1383
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    return-object v0
.end method

.method private getUltraPixelPhotographyResources()[I
    .locals 1

    .line 953
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020139
        0x7f02013a
    .end array-data
.end method

.method private getUltraWideBokehResources()[I
    .locals 2

    .line 963
    const-string v0, "zh"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 964
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    return-object v0

    .line 969
    :cond_0
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02013b
        0x7f02013d
    .end array-data

    :array_1
    .array-data 4
        0x7f02013c
        0x7f02013e
    .end array-data
.end method

.method private getUltraWideResources()[I
    .locals 1

    .line 927
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 928
    nop

    .line 929
    nop

    .line 930
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f020156
        0x7f020157
    .end array-data
.end method

.method private getVideoBokehResources()[I
    .locals 1

    .line 866
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 867
    nop

    .line 868
    nop

    .line 869
    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02011e
        0x7f02011f
    .end array-data
.end method

.method private initTopView()V
    .locals 12

    .line 170
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v1, 0x7f0d0093

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 171
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v2, 0x7f0d0094

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 172
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v3, 0x7f0d0095

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 173
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v4, 0x7f0d0096

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 174
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v5, 0x7f0d0097

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 175
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v6, 0x7f0d0098

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 176
    iget-object v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v7, 0x7f0d0099

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 177
    iget-object v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v8, 0x7f0d009a

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 178
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v9, 0x7f0d009b

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    .line 179
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0d009c

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 180
    iget-object v10, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v11, 0x7f0d009d

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    .line 182
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    invoke-virtual {v6, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    invoke-virtual {v7, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    invoke-virtual {v8, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    invoke-virtual {v9, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    invoke-virtual {v10, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    .line 195
    iget-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    return-void
.end method

.method private reConfigTipImage()V
    .locals 5

    .line 1467
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1468
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    .line 1469
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1470
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 1471
    const-string v2, "1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1472
    invoke-virtual {p0, v4, v4, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    .line 1473
    return-void

    .line 1474
    :cond_0
    const-string v2, "2"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1475
    invoke-virtual {p0, v4, v3, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    .line 1476
    return-void

    .line 1480
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 1481
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1482
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1483
    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "normal"

    .line 1484
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 1487
    :cond_2
    const-string v1, "live"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1488
    invoke-virtual {p0, v4, v3, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    .line 1489
    return-void

    .line 1485
    :cond_3
    :goto_0
    invoke-virtual {p0, v4, v4, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    .line 1486
    return-void

    .line 1492
    :cond_4
    return-void
.end method

.method private resetImages()V
    .locals 18

    .line 1088
    move-object/from16 v7, p0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v8

    .line 1089
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 1090
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    iget v2, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 1091
    iget v2, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1095
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v3

    .line 1091
    invoke-static {v2, v8, v0, v1, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 1096
    const/4 v9, 0x0

    move v10, v9

    :goto_0
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v10, v0, :cond_5

    .line 1097
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/widget/ImageView;

    .line 1098
    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 1099
    const v13, 0x7f0d0007

    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v14

    .line 1100
    if-eqz v14, :cond_0

    move-object v0, v14

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1101
    move v15, v0

    goto :goto_1

    .line 1100
    :cond_0
    nop

    .line 1101
    move v15, v9

    :goto_1
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v10}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigTypeForViewPosition(I)I

    move-result v6

    .line 1102
    iget v3, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v16, 0x0

    move-object v0, v7

    move v1, v6

    move-object v2, v11

    move-object v4, v8

    move v5, v10

    move v12, v6

    move/from16 v6, v16

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    move-result v0

    .line 1103
    nop

    .line 1104
    if-eqz v0, :cond_2

    if-eqz v14, :cond_2

    .line 1106
    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1107
    if-ne v15, v1, :cond_1

    goto :goto_2

    .line 1110
    :cond_1
    move/from16 v17, v9

    goto :goto_3

    :cond_2
    :goto_2
    const/16 v17, 0x1

    :goto_3
    invoke-virtual {v11}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1111
    invoke-virtual {v11}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1112
    if-ne v1, v12, :cond_3

    if-eqz v17, :cond_3

    .line 1113
    goto :goto_4

    .line 1116
    :cond_3
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1117
    invoke-virtual {v11}, Landroid/widget/ImageView;->clearAnimation()V

    .line 1118
    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1119
    if-eqz v0, :cond_4

    .line 1120
    const/4 v0, 0x0

    invoke-static {v11, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 1121
    invoke-static {v11}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

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

    goto :goto_4

    .line 1123
    :cond_4
    const/4 v0, 0x4

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1096
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 1126
    :cond_5
    return-void
.end method

.method private setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z
    .locals 5

    .line 655
    nop

    .line 656
    nop

    .line 658
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p5

    .line 659
    const/16 v0, 0xa2

    invoke-virtual {p5, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p5

    check-cast p5, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 660
    const/16 v0, 0xd1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_1f

    const/16 v0, 0xe1

    if-eq p1, v0, :cond_1e

    const/16 v0, 0xf3

    if-eq p1, v0, :cond_1b

    const/16 v0, 0xf5

    if-eq p1, v0, :cond_19

    const/16 v0, 0x8

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto/16 :goto_13

    .line 798
    :pswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideBokehOn()Z

    move-result p3

    .line 799
    if-eqz p3, :cond_0

    .line 800
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v1

    .line 801
    :goto_0
    move v2, p4

    goto :goto_1

    .line 800
    :cond_0
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    aget p4, p4, v2

    goto :goto_0

    .line 801
    :goto_1
    if-eqz p3, :cond_1

    .line 802
    const p3, 0x7f0b0243

    goto :goto_2

    :cond_1
    const p3, 0x7f0b0244

    .line 803
    :goto_2
    goto/16 :goto_1e

    .line 805
    :pswitch_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p3

    .line 806
    if-eqz p3, :cond_2

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v1

    .line 807
    :goto_3
    move v2, p4

    goto :goto_4

    .line 806
    :cond_2
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    aget p4, p4, v2

    goto :goto_3

    .line 807
    :goto_4
    if-eqz p3, :cond_3

    .line 808
    const p3, 0x7f0b0236

    goto :goto_5

    :cond_3
    const p3, 0x7f0b0237

    .line 809
    :goto_5
    goto/16 :goto_1e

    .line 792
    :pswitch_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen()Z

    move-result p3

    .line 793
    if-eqz p3, :cond_4

    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideResource:[I

    aget p4, p4, v1

    .line 794
    :goto_6
    move v2, p4

    goto :goto_7

    .line 793
    :cond_4
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideResource:[I

    aget p4, p4, v2

    goto :goto_6

    .line 794
    :goto_7
    if-eqz p3, :cond_5

    .line 795
    const p3, 0x7f0b023a

    goto :goto_8

    :cond_5
    const p3, 0x7f0b023b

    .line 796
    :goto_8
    goto/16 :goto_1e

    .line 757
    :pswitch_3
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFPS960ImageResource(I)I

    move-result v2

    .line 758
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p3

    .line 759
    invoke-virtual {p3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getContentDesc()I

    move-result p3

    .line 760
    goto/16 :goto_1e

    .line 762
    :pswitch_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->isSwitchOn(I)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 763
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v1

    goto :goto_9

    .line 765
    :cond_6
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    aget p3, p3, v2

    .line 767
    :goto_9
    if-eqz p5, :cond_1a

    .line 768
    invoke-interface {p5}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p4

    if-eqz p4, :cond_7

    .line 769
    const v2, 0x7f0b00fe

    goto/16 :goto_17

    .line 771
    :cond_7
    const v2, 0x7f0b00fd

    goto/16 :goto_17

    .line 752
    :pswitch_5
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getHFRImageResource(I)I

    move-result v2

    .line 753
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getHFRContentDesc(I)I

    move-result p3

    .line 754
    goto/16 :goto_1e

    .line 746
    :pswitch_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result p3

    if-eqz p3, :cond_8

    .line 747
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p3, p3, v1

    .line 748
    :goto_a
    move v2, p3

    goto :goto_b

    .line 747
    :cond_8
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    aget p3, p3, v2

    goto :goto_a

    .line 748
    :goto_b
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result p3

    if-eqz p3, :cond_9

    .line 749
    const p3, 0x7f0b00e3

    goto :goto_c

    :cond_9
    const p3, 0x7f0b00e4

    .line 750
    :goto_c
    goto/16 :goto_1e

    .line 742
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v2

    .line 743
    const p3, 0x7f0b00e8

    .line 744
    goto/16 :goto_1e

    .line 662
    :pswitch_8
    return v2

    .line 730
    :pswitch_9
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMoreResources()I

    move-result v2

    .line 731
    const p3, 0x7f0b00e5

    .line 732
    goto/16 :goto_1e

    .line 709
    :pswitch_a
    if-eqz p6, :cond_a

    .line 710
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p6

    invoke-virtual {p6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p6

    invoke-interface {p4, p3, p6}, Lcom/android/camera/data/backup/DataBackUp;->getBackupFilter(II)Ljava/lang/String;

    move-result-object p3

    goto :goto_d

    .line 712
    :cond_a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 715
    :goto_d
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    .line 716
    sget p4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p3, p4, :cond_c

    if-gtz p3, :cond_b

    goto :goto_e

    .line 719
    :cond_b
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v1

    goto :goto_f

    .line 717
    :cond_c
    :goto_e
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    aget p3, p3, v2

    .line 721
    :goto_f
    if-eqz p5, :cond_1a

    .line 722
    invoke-interface {p5}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result p4

    if-eqz p4, :cond_d

    .line 723
    const v2, 0x7f0b00e2

    goto/16 :goto_17

    .line 725
    :cond_d
    const v2, 0x7f0b00e1

    goto/16 :goto_17

    .line 738
    :pswitch_b
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getPortraitResources()I

    move-result v2

    .line 739
    const p3, 0x7f0b00e7

    .line 740
    goto/16 :goto_1e

    .line 690
    :pswitch_c
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p4

    .line 691
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_12

    .line 692
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedDrawableIgnoreClose(I)I

    move-result p5

    .line 693
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    .line 694
    if-nez p6, :cond_11

    .line 695
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 696
    const-string p4, "on"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_10

    const-string p4, "normal"

    .line 697
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_e

    goto :goto_10

    .line 699
    :cond_e
    const-string p4, "live"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_f

    .line 700
    invoke-virtual {p0, v2, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    goto :goto_11

    .line 702
    :cond_f
    invoke-virtual {p0, v0, v2, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    goto :goto_11

    .line 698
    :cond_10
    :goto_10
    invoke-virtual {p0, v2, v2, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    .line 704
    :goto_11
    nop

    .line 815
    :cond_11
    move v2, p5

    :goto_12
    move p3, v3

    goto/16 :goto_1e

    :cond_12
    :goto_13
    move p3, v2

    goto/16 :goto_1e

    .line 664
    :pswitch_d
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p4

    .line 665
    invoke-virtual {p4}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_17

    .line 666
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedDrawableIgnoreClose(I)I

    move-result p5

    .line 667
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v3

    .line 668
    if-nez p6, :cond_16

    .line 669
    invoke-virtual {p4, p3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 670
    const-string p4, "1"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_15

    const-string p4, "101"

    .line 671
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_13

    goto :goto_14

    .line 673
    :cond_13
    const-string p4, "2"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_14

    .line 674
    invoke-virtual {p0, v2, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    goto :goto_15

    .line 676
    :cond_14
    invoke-virtual {p0, v0, v2, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    goto :goto_15

    .line 672
    :cond_15
    :goto_14
    invoke-virtual {p0, v2, v2, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    .line 680
    :cond_16
    :goto_15
    move v2, p5

    goto :goto_16

    :cond_17
    move v3, v2

    :goto_16
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {p3, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->findConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p3

    .line 681
    iget-boolean p4, p3, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 682
    iget-boolean p3, p3, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    if-nez p3, :cond_18

    .line 684
    const p3, 0x3f19999a    # 0.6f

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_12

    .line 686
    :cond_18
    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 688
    goto :goto_12

    .line 811
    :cond_19
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    aget p3, p3, v2

    .line 815
    :cond_1a
    :goto_17
    move v4, v2

    move v2, p3

    move p3, v4

    goto :goto_1e

    .line 776
    :cond_1b
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result p3

    .line 777
    const-string p4, "FragmentTopConfig"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "setTopImageResource: VIDEO_BOKEH isSwitchOn = "

    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    if-eqz p3, :cond_1c

    .line 779
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v1

    .line 780
    :goto_18
    move v2, p4

    goto :goto_19

    .line 779
    :cond_1c
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    aget p4, p4, v2

    goto :goto_18

    .line 780
    :goto_19
    if-eqz p3, :cond_1d

    .line 781
    const p3, 0x7f0b0206

    goto :goto_1a

    :cond_1d
    const p3, 0x7f0b0207

    .line 782
    :goto_1a
    goto :goto_1e

    .line 734
    :cond_1e
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getSettingResources()I

    move-result v2

    .line 735
    const p3, 0x7f0b00e6

    .line 736
    goto :goto_1e

    .line 785
    :cond_1f
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result p3

    .line 786
    if-eqz p3, :cond_20

    .line 787
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    aget p4, p4, v1

    .line 788
    :goto_1b
    move v2, p4

    goto :goto_1c

    .line 787
    :cond_20
    iget-object p4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    aget p4, p4, v2

    goto :goto_1b

    .line 788
    :goto_1c
    if-eqz p3, :cond_21

    .line 789
    const p3, 0x7f0b0248

    goto :goto_1d

    :cond_21
    const p3, 0x7f0b0249

    .line 790
    :goto_1d
    nop

    .line 815
    :goto_1e
    if-eqz p2, :cond_25

    if-lez v2, :cond_25

    .line 816
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 817
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getInitialMargin(I)I

    move-result p1

    .line 818
    const p5, 0x7f0d0007

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-virtual {p2, p5, p6}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 819
    if-lez p1, :cond_23

    .line 820
    nop

    .line 821
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Landroid/widget/FrameLayout$LayoutParams;

    .line 822
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p6

    div-int/lit8 p6, p6, 0x2

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr p6, v0

    sub-int/2addr p1, p6

    .line 825
    iget-boolean p6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz p6, :cond_22

    .line 826
    iget p6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    sub-int/2addr p6, p1

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    sub-int/2addr p6, p1

    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 p1, p1, 0x2

    sub-int/2addr p6, p1

    iput p6, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    goto :goto_1f

    .line 828
    :cond_22
    iput p1, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 830
    :goto_1f
    invoke-virtual {p2, p5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 833
    :cond_23
    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 834
    if-lez p3, :cond_25

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-nez p1, :cond_24

    invoke-static {}, Lcom/android/camera/Util;->isSetContentDesc()Z

    move-result p1

    if-eqz p1, :cond_25

    .line 835
    :cond_24
    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 843
    :cond_25
    return v1

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

    .line 578
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 579
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->hideAlert()V

    .line 581
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 582
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->setDegree(I)V

    .line 584
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    .line 585
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 586
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_0

    .line 587
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_0

    .line 589
    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 592
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0d009f

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 594
    invoke-virtual {v3}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v3

    .line 592
    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 595
    return-void
.end method


# virtual methods
.method public alertAiDetectTipHint(IIJ)V
    .locals 6

    .line 1553
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1554
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1558
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v3

    move v1, p1

    move v2, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiDetectTipHint(IIIJ)V

    .line 1559
    return-void

    .line 1555
    :cond_1
    :goto_0
    return-void
.end method

.method public alertAiSceneSelector(I)V
    .locals 2

    .line 1296
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1297
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1300
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(II)V

    .line 1301
    return-void

    .line 1298
    :cond_1
    :goto_0
    return-void
.end method

.method public alertFlash(IZZ)V
    .locals 2

    .line 1265
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1266
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 1270
    :cond_0
    if-nez p1, :cond_1

    .line 1271
    if-eqz p3, :cond_2

    .line 1272
    const/16 p3, 0xc1

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    goto :goto_0

    .line 1275
    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 1277
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result p3

    invoke-virtual {v0, p1, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertFlash(IIZ)V

    .line 1278
    return-void

    .line 1267
    :cond_3
    :goto_1
    return-void
.end method

.method public alertHDR(IZZ)V
    .locals 2

    .line 1247
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1248
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 1252
    :cond_0
    if-nez p1, :cond_1

    .line 1253
    if-eqz p3, :cond_2

    .line 1254
    const/16 p3, 0xc2

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object p3

    invoke-virtual {p3}, Landroid/widget/ImageView;->performClick()Z

    goto :goto_0

    .line 1257
    :cond_1
    iget-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 1260
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result p3

    invoke-virtual {v0, p1, p3, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertHDR(IIZ)V

    .line 1261
    return-void

    .line 1249
    :cond_3
    :goto_1
    return-void
.end method

.method public alertLightingHint(I)V
    .locals 2

    .line 1538
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1539
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1543
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingHint(II)V

    .line 1544
    return-void

    .line 1540
    :cond_1
    :goto_0
    return-void
.end method

.method public alertLightingTitle(Z)V
    .locals 2

    .line 1528
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1529
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1532
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertLightingTitle(ZI)V

    .line 1534
    return-void

    .line 1530
    :cond_1
    :goto_0
    return-void
.end method

.method public alertMoonModeSelector(I)V
    .locals 4

    .line 1305
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1306
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1309
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b023c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1310
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0245

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1311
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v3

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertMoonSelector(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1312
    return-void

    .line 1307
    :cond_1
    :goto_0
    return-void
.end method

.method public alertSwitchHint(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 1352
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1353
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1357
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertSwitchHint(III)V

    .line 1358
    return-void

    .line 1354
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

    .line 1362
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1363
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1367
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopHint(III)V

    .line 1368
    return-void

    .line 1364
    :cond_1
    :goto_0
    return-void
.end method

.method public alertTopMusicHint(ILjava/lang/String;)V
    .locals 3

    .line 382
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 383
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090106

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 384
    invoke-virtual {v0, p1, p2, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertTopMusicHint(ILjava/lang/String;I)V

    .line 385
    return-void
.end method

.method public alertUpdateValue(I)V
    .locals 2

    .line 1282
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1283
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1287
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertUpdateValue(II)V

    .line 1288
    return-void

    .line 1284
    :cond_1
    :goto_0
    return-void
.end method

.method public varargs disableMenuItem([I)V
    .locals 4

    .line 1207
    if-eqz p1, :cond_0

    .line 1208
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 1209
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1208
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1212
    :cond_0
    return-void
.end method

.method public varargs enableMenuItem([I)V
    .locals 4

    .line 1217
    if-eqz p1, :cond_1

    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    .line 1220
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget v2, p1, v1

    .line 1221
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1220
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1218
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 1224
    :cond_2
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 258
    const/16 v0, 0xf4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 253
    const v0, 0x7f04002f

    return v0
.end method

.method public getTopImage(I)Landroid/widget/ImageView;
    .locals 1

    .line 427
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->findViewPosition(I)I

    move-result p1

    .line 428
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method public getTopImagePosition(I)I
    .locals 0

    .line 432
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->findViewPosition(I)I

    move-result p1

    return p1
.end method

.method public hideAlert()V
    .locals 2

    .line 1563
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1564
    if-nez v0, :cond_0

    .line 1565
    return-void

    .line 1567
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear()V

    .line 1568
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1569
    return-void
.end method

.method public hideConfigMenu()V
    .locals 2

    .line 1197
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1198
    return-void
.end method

.method public hideExtraMenu()V
    .locals 1

    .line 1163
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1164
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 2

    .line 121
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mAiSceneResources:[I

    .line 122
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideResource:[I

    .line 123
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraWideBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraWideBokehResources:[I

    .line 124
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getUltraPixelPhotographyResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mUltraPixelPhotographyResources:[I

    .line 125
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLiveShotResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotResource:[I

    .line 126
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getLightingResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLightingResource:[I

    .line 127
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getVideoBokehResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mVideoBokehResource:[I

    .line 128
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFilterResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFilterResources:[I

    .line 129
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getMusicSelectResources()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveMusicSelectResources:[I

    .line 130
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    .line 131
    new-instance v0, Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-direct {v0}, Lcom/android/camera/fragment/top/LastAnimationComponent;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    .line 133
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    .line 135
    const v0, 0x7f0d009f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    .line 136
    const v0, 0x7f0d0092

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    .line 138
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    .line 140
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 141
    sget v1, Lcom/android/camera/Util;->sStatusBarHeight:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 143
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->initTopView()V

    .line 144
    const v0, 0x7f0d009e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    .line 145
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 146
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 147
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 149
    nop

    .line 150
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f090021

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    .line 153
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f02010b

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    .line 155
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    .line 157
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 158
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 159
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {p1}, Lcom/android/camera/Util;->startScreenSlideAlphaInAnimation(Landroid/view/View;)V

    .line 163
    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;Z)V

    .line 164
    return-void
.end method

.method public insertConfigItem(I)V
    .locals 0

    .line 1148
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 1149
    return-void
.end method

.method public needViewClear()Z
    .locals 1

    .line 1548
    const/4 v0, 0x1

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    .line 1446
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1447
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    if-nez p1, :cond_0

    .line 1448
    new-instance p1, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 1450
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1451
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setDegree(I)V

    .line 1452
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertTopMargin(I)V

    .line 1453
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d00a0

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 1454
    invoke-virtual {v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    .line 1453
    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 1458
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1460
    if-eqz p1, :cond_1

    .line 1461
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMutexConfigs(I)V

    .line 1463
    :cond_1
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    .line 1438
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1440
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1441
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 p2, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1442
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    .line 1422
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 6

    .line 613
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

    .line 614
    return v3

    .line 617
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 618
    if-eqz v0, :cond_4

    .line 619
    const/4 v4, 0x6

    const/16 v5, 0xc8

    if-eq p1, v4, :cond_2

    packed-switch p1, :pswitch_data_0

    .line 633
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const/16 v4, 0xf5

    .line 634
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 633
    invoke-static {v0, v4}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 635
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 622
    :pswitch_0
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 623
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 624
    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 623
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 624
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 625
    goto :goto_1

    .line 628
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 629
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 630
    invoke-virtual {v0, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 629
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 630
    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 631
    nop

    .line 639
    :goto_1
    if-eq p1, v1, :cond_3

    .line 640
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reInitAlert()V

    .line 644
    :cond_3
    return v3

    .line 646
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

    .line 1426
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1427
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1428
    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    .line 1432
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 1433
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 275
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 276
    return-void

    .line 280
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 282
    if-nez v0, :cond_1

    .line 283
    return-void

    .line 287
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    .line 288
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 289
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 290
    return-void

    .line 293
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

    .line 294
    return-void

    .line 297
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 299
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 300
    return-void

    .line 303
    :cond_4
    const/16 v2, 0xc7

    if-eq v1, v2, :cond_9

    const/16 v2, 0xd1

    if-eq v1, v2, :cond_8

    const/16 v2, 0xe1

    if-eq v1, v2, :cond_7

    const/16 v2, 0xf3

    if-eq v1, v2, :cond_6

    const/16 v2, 0xf5

    if-eq v1, v2, :cond_5

    packed-switch v1, :pswitch_data_0

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_0

    .line 359
    :pswitch_0
    const/16 p1, 0xcf

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 360
    goto/16 :goto_0

    .line 365
    :pswitch_1
    const/16 p1, 0xce

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 366
    goto/16 :goto_0

    .line 356
    :pswitch_2
    const/16 p1, 0xcd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 357
    goto/16 :goto_0

    .line 353
    :pswitch_3
    const/16 p1, 0xcc

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 354
    goto/16 :goto_0

    .line 345
    :pswitch_4
    const/16 p1, 0xcb

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 346
    goto/16 :goto_0

    .line 341
    :pswitch_5
    const/16 p1, 0xca

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 342
    goto/16 :goto_0

    .line 315
    :pswitch_6
    const/16 p1, 0xc9

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 316
    goto/16 :goto_0

    .line 324
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->showMenu()V

    .line 325
    goto/16 :goto_0

    .line 319
    :pswitch_8
    const/16 p1, 0xc4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 320
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 321
    goto :goto_0

    .line 332
    :pswitch_9
    const/16 p1, 0xc3

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 333
    goto :goto_0

    .line 310
    :pswitch_a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 311
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    .line 312
    goto :goto_0

    .line 305
    :pswitch_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 306
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    .line 307
    goto :goto_0

    .line 368
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->getFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    .line 369
    if-nez p1, :cond_a

    .line 370
    new-instance p1, Lcom/android/camera/fragment/live/FragmentLiveMusic;

    invoke-direct {p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;-><init>()V

    .line 371
    const/4 v0, 0x2

    const v1, 0x7f0c001f

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveMusic;->setStyle(II)V

    .line 372
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveMusic;->TAG:Ljava/lang/String;

    .line 373
    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    .line 374
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    goto :goto_0

    .line 349
    :cond_6
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 350
    goto :goto_0

    .line 328
    :cond_7
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showSetting()V

    .line 329
    goto :goto_0

    .line 362
    :cond_8
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 363
    goto :goto_0

    .line 336
    :cond_9
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 337
    check-cast p1, Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 338
    nop

    .line 378
    :cond_a
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

    .line 389
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 390
    return-void

    .line 393
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 395
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 397
    if-nez v1, :cond_1

    .line 398
    return-void

    .line 400
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result p1

    const v2, 0x7f0b005e

    const/16 v3, 0xc1

    const/16 v4, 0xc2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq p1, v2, :cond_4

    const v2, 0x7f0b012a

    if-eq p1, v2, :cond_2

    goto :goto_0

    .line 412
    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackHdrChanged(ILjava/lang/String;)V

    .line 413
    new-array p1, v6, [I

    aput v4, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 414
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigFlashIfHdrChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 415
    new-array p1, v6, [I

    aput v3, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 418
    :cond_3
    invoke-interface {v1, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configHdr(Ljava/lang/String;)V

    goto :goto_0

    .line 402
    :cond_4
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {p1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackFlashChanged(ILjava/lang/String;)V

    .line 403
    new-array p1, v6, [I

    aput v3, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 404
    iget p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHhrIfFlashChanged(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 405
    new-array p1, v6, [I

    aput v4, p1, v5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 408
    :cond_5
    invoke-interface {v1, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configFlash(Ljava/lang/String;)V

    .line 409
    nop

    .line 422
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {p1, v6}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 423
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v7, p0

    move/from16 v8, p1

    move-object/from16 v9, p2

    .line 986
    iget v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-eq v0, v8, :cond_0

    .line 987
    iget v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    iput v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    .line 989
    :cond_0
    iget v10, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 990
    invoke-super/range {p0 .. p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 992
    nop

    .line 993
    const/4 v11, 0x1

    const/4 v12, 0x0

    packed-switch v10, :pswitch_data_0

    packed-switch v10, :pswitch_data_1

    goto :goto_1

    .line 998
    :pswitch_0
    const/16 v0, 0xa2

    if-eq v8, v0, :cond_1

    packed-switch v8, :pswitch_data_2

    .line 1006
    move v0, v11

    goto :goto_0

    .line 1003
    :cond_1
    :pswitch_1
    nop

    .line 1006
    move v0, v12

    :goto_0
    goto :goto_2

    .line 1008
    :pswitch_2
    const/16 v0, 0xa1

    if-ne v8, v0, :cond_2

    .line 1009
    nop

    .line 1014
    move v0, v12

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v11

    :goto_2
    if-eqz v0, :cond_3

    .line 1015
    const/4 v0, 0x4

    invoke-virtual {v7, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1018
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1019
    if-eqz v0, :cond_4

    .line 1020
    invoke-virtual {v0, v8, v9, v12}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1023
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v13

    .line 1024
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 1025
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    iget v2, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 1027
    if-nez v1, :cond_5

    .line 1028
    return-void

    .line 1031
    :cond_5
    iget v2, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1035
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v3

    .line 1031
    invoke-static {v2, v13, v0, v1, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 1036
    move v14, v12

    :goto_3
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v14, v0, :cond_10

    .line 1037
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/widget/ImageView;

    .line 1038
    invoke-virtual {v15, v11}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 1039
    const v6, 0x7f0d0007

    invoke-virtual {v15, v6}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v16

    .line 1040
    if-eqz v16, :cond_6

    move-object/from16 v0, v16

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1041
    move v5, v0

    goto :goto_4

    .line 1040
    :cond_6
    nop

    .line 1041
    move v5, v12

    :goto_4
    iget-object v0, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v14}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfigTypeForViewPosition(I)I

    move-result v4

    .line 1042
    if-eqz v9, :cond_7

    move/from16 v17, v11

    goto :goto_5

    :cond_7
    move/from16 v17, v12

    :goto_5
    move-object v0, v7

    move v1, v4

    move-object v2, v15

    move v3, v8

    move v11, v4

    move-object v4, v13

    move v12, v5

    move v5, v14

    move v8, v6

    move/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    move-result v0

    .line 1045
    nop

    .line 1046
    if-eqz v0, :cond_9

    if-eqz v16, :cond_9

    .line 1048
    invoke-virtual {v15, v8}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1049
    if-ne v12, v1, :cond_8

    goto :goto_6

    .line 1052
    :cond_8
    const/4 v1, 0x0

    goto :goto_7

    :cond_9
    :goto_6
    const/4 v1, 0x1

    :goto_7
    invoke-virtual {v15}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1053
    invoke-virtual {v15}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1054
    if-ne v2, v11, :cond_a

    if-eqz v1, :cond_a

    .line 1055
    goto :goto_9

    .line 1058
    :cond_a
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v15, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1061
    if-nez v9, :cond_c

    .line 1062
    if-eqz v0, :cond_b

    .line 1063
    invoke-static {v15}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_9

    .line 1065
    :cond_b
    invoke-static {v15}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_9

    .line 1068
    :cond_c
    const/16 v1, 0x96

    if-eqz v0, :cond_d

    .line 1069
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v0, v15}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1070
    nop

    .line 1071
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 1072
    invoke-virtual {v2, v1}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    .line 1073
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1074
    goto :goto_9

    .line 1075
    :cond_d
    const/16 v0, 0xa5

    if-eq v10, v0, :cond_f

    iget v2, v7, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    if-ne v2, v0, :cond_e

    goto :goto_8

    .line 1079
    :cond_e
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v0, v15}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    .line 1080
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 1079
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1077
    :cond_f
    :goto_8
    invoke-static {v15}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1036
    :goto_9
    add-int/lit8 v14, v14, 0x1

    move/from16 v8, p1

    const/4 v11, 0x1

    const/4 v12, 0x0

    goto/16 :goto_3

    .line 1085
    :cond_10
    return-void

    nop

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

    .line 1496
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1497
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 1498
    if-eqz v0, :cond_0

    .line 1499
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->provideRotateItem(Ljava/util/List;I)V

    .line 1502
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1503
    if-eqz v0, :cond_1

    .line 1504
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideRotateItem(Ljava/util/List;I)V

    .line 1506
    :cond_1
    return-void
.end method

.method public reInitAlert()V
    .locals 2

    .line 1573
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1574
    if-nez v0, :cond_0

    .line 1575
    return-void

    .line 1577
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 1578
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipImage()V

    .line 1579
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertUpdateValue(I)V

    .line 1580
    return-void
.end method

.method public refreshExtraMenu()V
    .locals 1

    .line 1190
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1191
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->reFresh()V

    .line 1193
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    .line 599
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 600
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 601
    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 602
    return-void
.end method

.method public removeConfigItem(I)V
    .locals 0

    .line 1153
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 1154
    return-void
.end method

.method public removeExtraMenu(I)V
    .locals 0

    .line 1158
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 1159
    return-void
.end method

.method public rotate()V
    .locals 0

    .line 1417
    return-void
.end method

.method public setAiSceneImageLevel(I)V
    .locals 2

    .line 1316
    nop

    .line 1317
    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    .line 1318
    const/16 p1, 0x17

    .line 1321
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1322
    const/16 v1, 0xc9

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v1

    .line 1323
    if-eqz v0, :cond_2

    if-nez v1, :cond_1

    goto :goto_0

    .line 1326
    :cond_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1342
    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    .line 1343
    return-void

    .line 1324
    :cond_2
    :goto_0
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    .line 263
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 264
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 265
    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setClickEnable(Z)V

    .line 268
    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    if-eqz p1, :cond_1

    .line 269
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisabledFunctionMenu:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 271
    :cond_1
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 1

    .line 1229
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1230
    if-eqz v0, :cond_0

    .line 1231
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 1233
    :cond_0
    invoke-static {p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setPendingRecordingState(I)V

    .line 1235
    :goto_0
    return-void
.end method

.method public showConfigMenu()V
    .locals 2

    .line 1202
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1203
    return-void
.end method

.method public startLiveShotAnimation()V
    .locals 3

    .line 1168
    const/16 v0, 0xce

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 1169
    if-eqz v0, :cond_3

    .line 1170
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1171
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_3

    .line 1172
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/RotateDrawable;

    .line 1173
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->getTarget()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_1

    .line 1174
    :cond_0
    const-string v1, "level"

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    .line 1175
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1176
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1179
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1180
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1182
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLiveShotAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1185
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

    .line 606
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 607
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 608
    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 609
    return-void
.end method

.method public varargs updateConfigItem([I)V
    .locals 10

    .line 1130
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    .line 1131
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1132
    array-length v8, p1

    const/4 v1, 0x0

    move v9, v1

    :goto_0
    if-ge v9, v8, :cond_1

    aget v2, p1, v9

    .line 1133
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->isHasConfigItem(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1134
    goto :goto_1

    .line 1136
    :cond_0
    nop

    .line 1138
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 1141
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImagePosition(I)I

    move-result v6

    const/4 v7, 0x0

    .line 1136
    move-object v1, p0

    move-object v5, v0

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    .line 1132
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1144
    :cond_1
    return-void
.end method

.method public updateContentDescription()V
    .locals 2

    .line 1520
    const/16 v0, 0xc4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 1521
    if-eqz v0, :cond_0

    .line 1522
    const v1, 0x7f0b00e1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1524
    :cond_0
    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    .line 1239
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1240
    if-eqz v0, :cond_0

    .line 1241
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 1243
    :cond_0
    return-void
.end method
