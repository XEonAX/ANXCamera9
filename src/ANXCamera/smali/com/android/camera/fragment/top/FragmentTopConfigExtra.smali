.class public Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopConfigExtra.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final FRAGMENT_INFO:I = 0xf5


# instance fields
.field private mBackgroundView:Landroid/view/View;

.field private mDisplayRectTopMargin:I

.field private mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private addContentDescriptionForConfigs(I)V
    .locals 6

    .line 301
    nop

    .line 302
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 303
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 304
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    const/16 v3, 0xa0

    const v4, 0x7f0900ef

    const v5, 0x7f0900f0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 417
    :pswitch_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result p1

    .line 418
    const v0, 0x7f090129

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    if-eqz p1, :cond_0

    .line 420
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 422
    :cond_0
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    goto/16 :goto_0

    .line 427
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p1

    .line 428
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    .line 429
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isSwitchOn(I)Z

    move-result v1

    .line 430
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getValueDisplayString(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    if-eqz v1, :cond_1

    .line 432
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 434
    :cond_1
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 407
    :pswitch_3
    const-string p1, "pref_camera_show_gender_age_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 408
    const v0, 0x7f09014a

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    if-eqz p1, :cond_2

    .line 410
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 412
    :cond_2
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    goto/16 :goto_0

    .line 397
    :pswitch_4
    const-string p1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 398
    const v0, 0x7f09018f

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    if-eqz p1, :cond_3

    .line 400
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 402
    :cond_3
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    goto/16 :goto_0

    .line 357
    :pswitch_5
    const-string p1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 358
    const v0, 0x7f0901cc

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    if-eqz p1, :cond_4

    .line 360
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 362
    :cond_4
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    goto/16 :goto_0

    .line 367
    :pswitch_6
    const-string p1, "pref_camera_scenemode_setting_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 368
    const v0, 0x7f0901ce

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    if-eqz p1, :cond_5

    .line 370
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 372
    :cond_5
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    goto/16 :goto_0

    .line 387
    :pswitch_7
    const-string p1, "pref_video_speed_fast_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 388
    const v0, 0x7f090158

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    if-eqz p1, :cond_6

    .line 390
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 392
    :cond_6
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    goto/16 :goto_0

    .line 377
    :pswitch_8
    const-string p1, "pref_video_speed_slow_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 378
    const v0, 0x7f090159

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    if-eqz p1, :cond_7

    .line 380
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 382
    :cond_7
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    goto/16 :goto_0

    .line 346
    :pswitch_9
    const-string p1, "pref_camera_ubifocus_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 347
    const v0, 0x7f0901cf

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    if-eqz p1, :cond_8

    .line 349
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 351
    :cond_8
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    goto/16 :goto_0

    .line 336
    :pswitch_a
    const-string p1, "pref_camera_hand_night_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 337
    const v0, 0x7f0901cb

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    if-eqz p1, :cond_9

    .line 339
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 341
    :cond_9
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    goto :goto_0

    .line 326
    :pswitch_b
    const-string p1, "pref_camera_gradienter_key"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    .line 327
    const v0, 0x7f0901ca

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    if-eqz p1, :cond_a

    .line 329
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 331
    :cond_a
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    goto :goto_0

    .line 316
    :pswitch_c
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object p1

    .line 317
    const-string v1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 318
    if-eqz v0, :cond_b

    .line 319
    invoke-virtual {p1, v3}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getValueDisplayString(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 321
    :cond_b
    const p1, 0x7f0901cd

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    goto :goto_0

    .line 307
    :pswitch_d
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object p1

    .line 308
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->isSwitchOn()Z

    move-result v0

    .line 309
    invoke-virtual {p1, v3}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getValueDisplayString(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    if-nez v0, :cond_c

    .line 311
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    :cond_c
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_d

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 439
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v2}, Landroid/support/v7/widget/RecyclerView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 440
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->sendAccessibilityEvent(I)V

    .line 442
    :cond_d
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xe2
        :pswitch_d
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private adjustViewBackground(I)V
    .locals 1

    .line 115
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    .line 116
    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 120
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 121
    goto :goto_0

    .line 124
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    const v0, 0x7f0b0048

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 127
    :goto_0
    return-void
.end method


# virtual methods
.method public animateIn()V
    .locals 13

    .line 202
    sget-boolean v0, Lcom/android/camera/Util;->isLongRatioScreen:Z

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_0

    .line 203
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    invoke-direct {v0, v2, v2, v1, v2}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    .line 204
    new-instance v3, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v3}, Landroid/view/animation/ScaleAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 205
    const-wide/16 v3, 0x140

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 206
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 208
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 209
    new-instance v1, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 210
    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    .line 211
    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 212
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 213
    goto :goto_0

    .line 214
    :cond_0
    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 215
    new-instance v3, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v3, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 217
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    const v10, -0x42333333    # -0.1f

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v4, v1

    invoke-direct/range {v4 .. v12}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 223
    invoke-virtual {v0, v3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 224
    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 226
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 227
    const-wide/16 v1, 0x15e

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 228
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 230
    :goto_0
    return-void
.end method

.method public animateOut()V
    .locals 14

    .line 238
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra$1;-><init>(Lcom/android/camera/fragment/top/FragmentTopConfigExtra;)V

    .line 258
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz v1, :cond_0

    .line 259
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    invoke-direct {v1, v4, v4, v4, v3}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    .line 260
    new-instance v5, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v5}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v5}, Landroid/view/animation/ScaleAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 261
    const-wide/16 v5, 0x140

    invoke-virtual {v1, v5, v6}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 262
    invoke-virtual {v1, v0}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 263
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 265
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 266
    new-instance v1, Lmiui/view/animation/SineEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 267
    const-wide/16 v3, 0x78

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 268
    invoke-virtual {v0, v2}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 269
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 270
    goto :goto_0

    .line 271
    :cond_0
    new-instance v1, Landroid/view/animation/AnimationSet;

    invoke-direct {v1, v2}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 272
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v2, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 274
    new-instance v3, Landroid/view/animation/TranslateAnimation;

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x1

    const v13, -0x4270a3d7    # -0.07f

    move-object v5, v3

    invoke-direct/range {v5 .. v13}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 280
    invoke-virtual {v1, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 281
    invoke-virtual {v1, v3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 283
    new-instance v2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 284
    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 285
    invoke-virtual {v1, v0}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 286
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 288
    :goto_0
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .line 111
    const/16 v0, 0xf5

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 106
    const v0, 0x7f040033

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    .line 62
    const v0, 0x7f0d00b8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    .line 63
    const v0, 0x7f0d00b9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 65
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mDisplayRectTopMargin:I

    .line 67
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p1

    .line 68
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mCurrentMode:I

    .line 69
    invoke-virtual {v0, p1, v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 70
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mCurrentMode:I

    .line 72
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v2

    .line 74
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v3

    .line 70
    invoke-static {v1, p1, v2, v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v1

    .line 78
    :goto_0
    const/4 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 79
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v1

    int-to-float v1, v1

    int-to-float v2, v0

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    .line 80
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0075

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    mul-int/2addr v2, v1

    .line 82
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 83
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 84
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 85
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0145

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 86
    const/4 v3, 0x0

    if-lez v2, :cond_1

    .line 88
    invoke-virtual {v1, v3, v2, v3, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 90
    :cond_1
    sget-boolean v1, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz v1, :cond_2

    .line 91
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mCurrentMode:I

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->adjustViewBackground(I)V

    .line 92
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mBackgroundView:Landroid/view/View;

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mDisplayRectTopMargin:I

    invoke-virtual {v1, v3, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 95
    :cond_2
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 96
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 97
    new-instance v0, Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-direct {v0, p1, p0}, Lcom/android/camera/fragment/top/ExtraAdapter;-><init>(Lcom/android/camera/data/data/config/SupportedConfigs;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    .line 99
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mDegree:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/top/ExtraAdapter;->setNewDegree(I)V

    .line 100
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 101
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->setFocusable(Z)V

    .line 102
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 137
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    return-void

    .line 141
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    .line 142
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 144
    if-nez v0, :cond_1

    .line 145
    return-void

    .line 149
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 150
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 151
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 152
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 153
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 154
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/top/ExtraAdapter;->setOnClictTag(I)V

    .line 156
    :cond_2
    const/16 v1, 0xe1

    if-eq p1, v1, :cond_4

    const/16 v1, 0xf2

    if-eq p1, v1, :cond_3

    .line 177
    iget-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 161
    :cond_3
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideExtraMenu()V

    .line 170
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc1

    .line 171
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;

    .line 172
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;->startAiLens()V

    .line 174
    const-string p1, "counter"

    const-string v0, "ai_detect_changed"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    goto :goto_0

    .line 158
    :cond_4
    const/4 p1, 0x5

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 159
    nop

    .line 183
    :goto_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 191
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 192
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateIn()V

    .line 193
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

    .line 132
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    .line 133
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 0

    .line 198
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .line 234
    const/4 v0, 0x0

    return-object v0
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

    .line 292
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 293
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {v0, p2}, Lcom/android/camera/fragment/top/ExtraAdapter;->setNewDegree(I)V

    .line 294
    const/4 p2, 0x0

    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 297
    :cond_0
    return-void
.end method

.method public reFresh()V
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 187
    return-void
.end method
