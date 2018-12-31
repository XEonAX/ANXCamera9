.class public Lcom/ss/android/ttve/utils/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;,
        Lcom/ss/android/ttve/utils/UIUtils$ToastHook;
    }
.end annotation


# static fields
.field public static final API_ET_20:Z

.field private static DPI:I = 0x0

.field public static final ELLIPSIS_CHAR:C = '\u2026'

.field public static final LAYOUT_PARAMS_KEEP_OLD:I = -0x3

.field public static sTempEllipsisResult:Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

.field private static sToastHook:Lcom/ss/android/ttve/utils/UIUtils$ToastHook;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 57
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/ss/android/ttve/utils/UIUtils;->API_ET_20:Z

    .line 282
    const/4 v0, -0x1

    sput v0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    .line 564
    new-instance v0, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

    invoke-direct {v0}, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/utils/UIUtils;->sTempEllipsisResult:Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assertInUIThread()V
    .locals 2

    .line 250
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 251
    :goto_0
    if-eqz v0, :cond_1

    .line 252
    return-void

    .line 255
    :cond_1
    return-void
.end method

.method public static clearAnimation(Landroid/view/View;)Z
    .locals 1

    .line 592
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 595
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 596
    const/4 p0, 0x1

    return p0

    .line 593
    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static detachFromParent(Landroid/view/View;)V
    .locals 2

    .line 446
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 449
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 450
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    .line 451
    return-void

    .line 454
    :cond_1
    :try_start_0
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 457
    goto :goto_0

    .line 455
    :catch_0
    move-exception p0

    .line 458
    :goto_0
    return-void

    .line 447
    :cond_2
    :goto_1
    return-void
.end method

.method public static dip2Px(Landroid/content/Context;F)F
    .locals 0

    .line 147
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 148
    mul-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    return p1
.end method

.method public static displayLongTimeToast(Landroid/content/Context;II)V
    .locals 2

    .line 97
    if-nez p0, :cond_0

    .line 98
    return-void

    .line 100
    :cond_0
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 101
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    return-void

    .line 104
    :cond_1
    const/4 v0, 0x1

    const/16 v1, 0x11

    invoke-static {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    .line 105
    return-void
.end method

.method public static displayToast(Landroid/content/Context;I)V
    .locals 0

    .line 73
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public static displayToast(Landroid/content/Context;II)V
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;Ljava/lang/String;I)V

    .line 86
    return-void
.end method

.method public static displayToast(Landroid/content/Context;ILjava/lang/String;)V
    .locals 2

    .line 93
    const/4 v0, 0x0

    const/16 v1, 0x11

    invoke-static {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    .line 94
    return-void
.end method

.method public static displayToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 69
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 70
    return-void
.end method

.method public static displayToast(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    .line 89
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V

    .line 90
    return-void
.end method

.method private static displayToastInternal(Landroid/content/Context;ILjava/lang/String;II)V
    .locals 0

    .line 140
    return-void
.end method

.method public static displayToastWithIcon(Landroid/content/Context;II)V
    .locals 0

    .line 77
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 78
    return-void
.end method

.method public static displayToastWithIcon(Landroid/content/Context;ILjava/lang/String;)V
    .locals 0

    .line 81
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/utils/UIUtils;->displayToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 82
    return-void
.end method

.method public static ellipseSingleLineStr(Ljava/lang/String;ILandroid/graphics/Paint;ILcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;)V
    .locals 9

    .line 530
    const/4 v0, 0x0

    if-le p1, p3, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 535
    :cond_0
    invoke-virtual {p2, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Lcom/ss/android/ttve/utils/UIUtils;->floatToIntBig(F)I

    move-result v1

    .line 536
    if-gt v1, p1, :cond_1

    .line 537
    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    .line 538
    iput v1, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    .line 539
    return-void

    .line 541
    :cond_1
    sub-int p3, p1, p3

    .line 542
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 543
    const/4 v4, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    int-to-float v7, p3

    const/4 v8, 0x0

    move-object v2, p2

    move-object v3, p0

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Paint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result p2

    .line 544
    const/4 p3, 0x1

    if-ge p2, p3, :cond_2

    .line 545
    const-string p0, ""

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    .line 546
    iput v0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    .line 547
    return-void

    .line 549
    :cond_2
    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    const/16 p0, 0x2026

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 551
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    .line 552
    iput p1, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    .line 553
    return-void

    .line 531
    :cond_3
    :goto_0
    const-string p0, ""

    iput-object p0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->ellipsisStr:Ljava/lang/String;

    .line 532
    iput v0, p4, Lcom/ss/android/ttve/utils/UIUtils$EllipsisMeasureResult;->length:I

    .line 533
    return-void
.end method

.method public static expandClickRegion(Landroid/view/View;IIII)V
    .locals 7

    .line 158
    new-instance v6, Lcom/ss/android/ttve/utils/UIUtils$1;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move v3, p4

    move v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/utils/UIUtils$1;-><init>(Landroid/view/View;IIII)V

    invoke-virtual {p0, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 175
    return-void
.end method

.method public static floatToIntBig(F)I
    .locals 1

    .line 556
    const v0, 0x3f7fbe77    # 0.999f

    add-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static getDiggBuryWidth(Landroid/content/Context;)I
    .locals 2

    .line 294
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 295
    mul-int/lit16 v0, v0, 0x55f

    div-int/lit16 v0, v0, 0x2710

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {p0, v1}, Lcom/ss/android/ttve/utils/UIUtils;->dip2Px(Landroid/content/Context;F)F

    move-result p0

    float-to-int p0, p0

    add-int/2addr v0, p0

    .line 296
    return v0
.end method

.method public static final getDisplayCount(I)Ljava/lang/String;
    .locals 7

    .line 217
    const/16 v0, 0x2710

    if-le p0, v0, :cond_1

    .line 218
    const-string v0, "%.1f"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    int-to-double v5, p0

    mul-double/2addr v3, v5

    const-wide v5, 0x40c3880000000000L    # 10000.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 219
    const/16 v0, 0x30

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v0, v1, :cond_0

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\u4e07"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 222
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\u4e07"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 225
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDpi(Landroid/content/Context;)I
    .locals 2

    .line 285
    sget v0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 286
    if-eqz p0, :cond_0

    .line 287
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    sput p0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    .line 290
    :cond_0
    sget p0, Lcom/ss/android/ttve/utils/UIUtils;->DPI:I

    return p0
.end method

.method public static getIndexInParent(Landroid/view/View;)I
    .locals 3

    .line 581
    const/4 v0, -0x1

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 584
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 585
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    .line 586
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p0

    return p0

    .line 588
    :cond_1
    return v0

    .line 582
    :cond_2
    :goto_0
    return v0
.end method

.method public static getLocationInAncestor(Landroid/view/View;Landroid/view/View;)[I
    .locals 7

    .line 484
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_2

    .line 488
    :cond_0
    const/4 v1, 0x2

    new-array v2, v1, [I

    .line 489
    new-array v1, v1, [F

    fill-array-data v1, :array_0

    .line 490
    nop

    .line 492
    const/4 v3, 0x0

    aget v4, v1, v3

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v1, v3

    .line 493
    const/4 v4, 0x1

    aget v5, v1, v4

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    aput v5, v1, v4

    .line 495
    nop

    .line 496
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 497
    :goto_0
    instance-of v5, p0, Landroid/view/View;

    if-eqz v5, :cond_2

    .line 498
    move-object v5, p0

    check-cast v5, Landroid/view/View;

    .line 499
    if-ne p0, p1, :cond_1

    .line 500
    nop

    .line 501
    nop

    .line 511
    move p0, v4

    goto :goto_1

    .line 503
    :cond_1
    aget p0, v1, v3

    invoke-virtual {v5}, Landroid/view/View;->getScrollX()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr p0, v6

    aput p0, v1, v3

    .line 504
    aget p0, v1, v4

    invoke-virtual {v5}, Landroid/view/View;->getScrollY()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr p0, v6

    aput p0, v1, v4

    .line 506
    aget p0, v1, v3

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr p0, v6

    aput p0, v1, v3

    .line 507
    aget p0, v1, v4

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr p0, v6

    aput p0, v1, v4

    .line 509
    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 510
    goto :goto_0

    .line 511
    :cond_2
    move p0, v3

    :goto_1
    if-nez p0, :cond_3

    .line 513
    return-object v0

    .line 515
    :cond_3
    aget p0, v1, v3

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p0, p1

    float-to-int p0, p0

    aput p0, v2, v3

    .line 516
    aget p0, v1, v4

    add-float/2addr p0, p1

    float-to-int p0, p0

    aput p0, v2, v4

    .line 517
    return-object v2

    .line 486
    :cond_4
    :goto_2
    return-object v0

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static getLocationInUpView(Landroid/view/View;Landroid/view/View;[IZ)V
    .locals 5

    .line 335
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    array-length v0, p2

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    invoke-virtual {p0, p2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 339
    const/4 p0, 0x0

    aget v0, p2, p0

    .line 340
    const/4 v2, 0x1

    aget v3, p2, v2

    .line 341
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 342
    aget v4, p2, p0

    sub-int/2addr v4, v0

    .line 343
    aget v0, p2, v2

    sub-int/2addr v0, v3

    .line 344
    if-eqz p3, :cond_1

    .line 345
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p3

    .line 346
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    .line 347
    div-int/2addr p3, v1

    add-int/2addr v4, p3

    .line 348
    div-int/2addr p1, v1

    add-int/2addr v0, p1

    .line 350
    :cond_1
    aput v4, p2, p0

    .line 351
    aput v0, p2, v2

    .line 352
    return-void

    .line 336
    :cond_2
    :goto_0
    return-void
.end method

.method public static final getRatioOfScreen(Landroid/content/Context;F)I
    .locals 0

    .line 238
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 239
    if-nez p0, :cond_0

    .line 240
    const/4 p0, 0x0

    return p0

    .line 242
    :cond_0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p0, p0

    mul-float/2addr p0, p1

    float-to-int p0, p0

    return p0
.end method

.method public static final getScreenHeight(Landroid/content/Context;)I
    .locals 1

    .line 258
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 259
    return v0

    .line 262
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 264
    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_0
    return v0
.end method

.method public static final getScreenWidth(Landroid/content/Context;)I
    .locals 1

    .line 229
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 230
    return v0

    .line 233
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 234
    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    :goto_0
    return v0
.end method

.method public static final getStatusBarHeight(Landroid/content/Context;)I
    .locals 5

    .line 300
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 301
    return v0

    .line 303
    :cond_0
    nop

    .line 304
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "status_bar_height"

    const-string v3, "dimen"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 305
    if-lez v1, :cond_1

    .line 306
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 308
    :cond_1
    return v0
.end method

.method public static isInUIThread()Z
    .locals 2

    .line 246
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isViewVisible(Landroid/view/View;)Z
    .locals 1

    .line 323
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 324
    return v0

    .line 327
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0
.end method

.method public static px2dip(Landroid/content/Context;F)I
    .locals 0

    .line 152
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 153
    div-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static requestOrienation(Landroid/app/Activity;Z)V
    .locals 1

    .line 567
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 570
    :cond_0
    xor-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 573
    const/16 v0, 0x400

    if-eqz p1, :cond_1

    .line 574
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0

    .line 576
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 578
    :goto_0
    return-void

    .line 568
    :cond_2
    :goto_1
    return-void
.end method

.method public static setClickListener(ZLandroid/view/View;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 602
    if-nez p1, :cond_0

    .line 603
    return-void

    .line 605
    :cond_0
    if-eqz p0, :cond_1

    .line 606
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 607
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    goto :goto_0

    .line 609
    :cond_1
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 610
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 612
    :goto_0
    return-void
.end method

.method public static setColorAlpha(II)I
    .locals 1

    .line 521
    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    .line 522
    nop

    .line 526
    move p1, v0

    goto :goto_0

    .line 523
    :cond_0
    if-gez p1, :cond_1

    .line 524
    const/4 p1, 0x0

    .line 526
    :cond_1
    :goto_0
    const v0, 0xffffff

    and-int/2addr p0, v0

    const/high16 v0, 0x1000000

    mul-int/2addr p1, v0

    or-int/2addr p0, p1

    return p0
.end method

.method public static setLayoutParams(Landroid/view/View;II)V
    .locals 1

    .line 412
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 413
    if-nez p0, :cond_0

    .line 414
    return-void

    .line 417
    :cond_0
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_1

    .line 418
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 420
    :cond_1
    if-eq p2, v0, :cond_2

    .line 421
    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 423
    :cond_2
    return-void
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    .line 438
    if-nez p0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 439
    return-void

    .line 442
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 443
    return-void
.end method

.method public static setTextViewMaxLines(Landroid/widget/TextView;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 473
    if-eqz p0, :cond_3

    if-gtz p1, :cond_0

    goto :goto_1

    .line 476
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/widget/TextView;->getMaxLines()I

    move-result v0

    if-ne v0, p1, :cond_1

    .line 477
    return-void

    .line 479
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 480
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 481
    return-void

    .line 474
    :cond_3
    :goto_1
    return-void
.end method

.method public static setToastHook(Lcom/ss/android/ttve/utils/UIUtils$ToastHook;)V
    .locals 0

    .line 65
    sput-object p0, Lcom/ss/android/ttve/utils/UIUtils;->sToastHook:Lcom/ss/android/ttve/utils/UIUtils$ToastHook;

    .line 66
    return-void
.end method

.method public static setTopMargin(Landroid/view/View;F)V
    .locals 2

    .line 399
    if-nez p0, :cond_0

    .line 400
    return-void

    .line 402
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 403
    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    .line 404
    const/4 v0, -0x3

    invoke-static {p0, v0, p1, v0, v0}, Lcom/ss/android/ttve/utils/UIUtils;->updateLayoutMargin(Landroid/view/View;IIII)V

    .line 405
    return-void
.end method

.method public static setTxtAndAdjustVisible(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    .line 426
    if-nez p0, :cond_0

    .line 427
    return-void

    .line 429
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 430
    const/16 p1, 0x8

    invoke-static {p0, p1}, Lcom/ss/android/ttve/utils/UIUtils;->setViewVisibility(Landroid/view/View;I)V

    goto :goto_0

    .line 432
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/ss/android/ttve/utils/UIUtils;->setViewVisibility(Landroid/view/View;I)V

    .line 433
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 435
    :goto_0
    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;I)V
    .locals 4

    .line 180
    if-nez p0, :cond_0

    .line 181
    return-void

    .line 183
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    .line 184
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 185
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 187
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 188
    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 189
    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;Landroid/content/res/Resources;I)V
    .locals 4

    .line 192
    if-nez p0, :cond_0

    .line 193
    return-void

    .line 195
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    .line 196
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 197
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    .line 198
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 199
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 200
    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 201
    return-void
.end method

.method public static setViewBackgroundWithPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 4

    .line 205
    if-nez p0, :cond_0

    .line 206
    return-void

    .line 208
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    .line 209
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 210
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    .line 211
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 212
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 213
    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 214
    return-void
.end method

.method public static setViewMinHeight(Landroid/view/View;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 462
    if-nez p0, :cond_0

    .line 463
    return-void

    .line 465
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    if-ne v0, p1, :cond_1

    .line 466
    return-void

    .line 468
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 469
    return-void
.end method

.method public static final setViewVisibility(Landroid/view/View;I)V
    .locals 1

    .line 316
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_1

    invoke-static {p1}, Lcom/ss/android/ttve/utils/UIUtils;->visibilityValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 319
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 320
    return-void

    .line 317
    :cond_1
    :goto_0
    return-void
.end method

.method public static sp2px(Landroid/content/Context;F)F
    .locals 1

    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x2

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    return p0
.end method

.method public static updateLayout(Landroid/view/View;II)V
    .locals 2

    .line 355
    if-nez p0, :cond_0

    .line 356
    return-void

    .line 357
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 358
    if-eqz v0, :cond_4

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_1

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v1, p2, :cond_1

    goto :goto_0

    .line 360
    :cond_1
    const/4 v1, -0x3

    if-eq p1, v1, :cond_2

    .line 361
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 362
    :cond_2
    if-eq p2, v1, :cond_3

    .line 363
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 364
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    return-void

    .line 359
    :cond_4
    :goto_0
    return-void
.end method

.method public static updateLayoutMargin(Landroid/view/View;IIII)V
    .locals 8

    .line 368
    if-nez p0, :cond_0

    .line 369
    return-void

    .line 370
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 371
    if-nez v0, :cond_1

    .line 372
    return-void

    .line 373
    :cond_1
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_2

    .line 374
    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object v2, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-static/range {v2 .. v7}, Lcom/ss/android/ttve/utils/UIUtils;->updateMargin(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V

    .line 376
    :cond_2
    return-void
.end method

.method private static updateMargin(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
    .locals 1

    .line 379
    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v0, p2, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v0, p3, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v0, p4, :cond_0

    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-ne v0, p5, :cond_0

    goto :goto_0

    .line 383
    :cond_0
    const/4 v0, -0x3

    if-eq p2, v0, :cond_1

    .line 384
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 385
    :cond_1
    if-eq p3, v0, :cond_2

    .line 386
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 387
    :cond_2
    if-eq p4, v0, :cond_3

    .line 388
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 389
    :cond_3
    if-eq p5, v0, :cond_4

    .line 390
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 391
    :cond_4
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 392
    return-void

    .line 382
    :cond_5
    :goto_0
    return-void
.end method

.method private static visibilityValid(I)Z
    .locals 1

    .line 312
    if-eqz p0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
