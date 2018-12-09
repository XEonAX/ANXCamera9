.class public Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;
.super Landroid/util/Spline;
.source "CameraBrightness.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/CameraBrightness;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MonotoneCubicSpline"
.end annotation


# instance fields
.field private mM:[F

.field private mX:[F

.field private mY:[F


# direct methods
.method public constructor <init>([F[F)V
    .locals 12

    .line 422
    invoke-direct {p0}, Landroid/util/Spline;-><init>()V

    .line 423
    if-eqz p1, :cond_7

    if-eqz p2, :cond_7

    array-length v0, p1

    array-length v1, p2

    if-ne v0, v1, :cond_7

    array-length v0, p1

    const/4 v1, 0x2

    if-lt v0, v1, :cond_7

    .line 428
    array-length v0, p1

    .line 429
    add-int/lit8 v2, v0, -0x1

    new-array v3, v2, [F

    .line 430
    new-array v4, v0, [F

    .line 433
    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const/4 v7, 0x0

    if-ge v6, v2, :cond_1

    .line 434
    add-int/lit8 v8, v6, 0x1

    aget v9, p1, v8

    aget v10, p1, v6

    sub-float/2addr v9, v10

    .line 435
    cmpg-float v7, v9, v7

    if-lez v7, :cond_0

    .line 439
    aget v7, p2, v8

    aget v10, p2, v6

    sub-float/2addr v7, v10

    div-float/2addr v7, v9

    aput v7, v3, v6

    .line 433
    move v6, v8

    goto :goto_0

    .line 436
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The control points must all have strictly increasing X values."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 443
    :cond_1
    aget v6, v3, v5

    aput v6, v4, v5

    .line 444
    const/4 v6, 0x1

    :goto_1
    if-ge v6, v2, :cond_2

    .line 445
    add-int/lit8 v8, v6, -0x1

    aget v8, v3, v8

    aget v9, v3, v6

    add-float/2addr v8, v9

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v8, v9

    aput v8, v4, v6

    .line 444
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 447
    :cond_2
    sub-int/2addr v0, v1

    aget v0, v3, v0

    aput v0, v4, v2

    .line 450
    :goto_2
    if-ge v5, v2, :cond_6

    .line 451
    aget v0, v3, v5

    cmpl-float v0, v0, v7

    if-nez v0, :cond_3

    .line 452
    aput v7, v4, v5

    .line 453
    add-int/lit8 v0, v5, 0x1

    aput v7, v4, v0

    goto :goto_3

    .line 455
    :cond_3
    aget v0, v4, v5

    aget v1, v3, v5

    div-float/2addr v0, v1

    .line 456
    add-int/lit8 v1, v5, 0x1

    aget v6, v4, v1

    aget v8, v3, v5

    div-float/2addr v6, v8

    .line 457
    cmpg-float v8, v0, v7

    if-ltz v8, :cond_5

    cmpg-float v8, v6, v7

    if-ltz v8, :cond_5

    .line 461
    float-to-double v8, v0

    float-to-double v10, v6

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v8

    double-to-float v8, v8

    .line 462
    const/high16 v9, 0x41100000    # 9.0f

    cmpl-float v9, v8, v9

    if-lez v9, :cond_4

    .line 463
    const/high16 v9, 0x40400000    # 3.0f

    div-float/2addr v9, v8

    .line 464
    mul-float/2addr v0, v9

    aget v8, v3, v5

    mul-float/2addr v0, v8

    aput v0, v4, v5

    .line 465
    mul-float/2addr v9, v6

    aget v0, v3, v5

    mul-float/2addr v9, v0

    aput v9, v4, v1

    .line 450
    :cond_4
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 458
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The control points must have monotonic Y values."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 470
    :cond_6
    iput-object p1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    .line 471
    iput-object p2, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    .line 472
    iput-object v4, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mM:[F

    .line 473
    return-void

    .line 424
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "There must be at least two control points and the arrays must be of equal length."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public interpolate(F)F
    .locals 7

    .line 478
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    array-length v0, v0

    .line 479
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 480
    return p1

    .line 482
    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_1

    .line 483
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget p1, p1, v2

    return p1

    .line 485
    :cond_1
    iget-object v1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    add-int/lit8 v0, v0, -0x1

    aget v1, v1, v0

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_2

    .line 486
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget p1, p1, v0

    return p1

    .line 491
    :cond_2
    nop

    .line 492
    :goto_0
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    add-int/lit8 v1, v2, 0x1

    aget v0, v0, v1

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_4

    .line 493
    nop

    .line 494
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    aget v0, v0, v1

    cmpl-float v0, p1, v0

    if-nez v0, :cond_3

    .line 495
    iget-object p1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget p1, p1, v1

    return p1

    .line 492
    :cond_3
    move v2, v1

    goto :goto_0

    .line 500
    :cond_4
    iget-object v0, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    aget v0, v0, v1

    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    aget v3, v3, v2

    sub-float/2addr v0, v3

    .line 501
    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    aget v3, v3, v2

    sub-float/2addr p1, v3

    div-float/2addr p1, v0

    .line 502
    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget v3, v3, v2

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, p1

    const/high16 v5, 0x3f800000    # 1.0f

    add-float v6, v5, v4

    mul-float/2addr v3, v6

    iget-object v6, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mM:[F

    aget v2, v6, v2

    mul-float/2addr v2, v0

    mul-float/2addr v2, p1

    add-float/2addr v3, v2

    sub-float v2, v5, p1

    mul-float/2addr v3, v2

    mul-float/2addr v3, v2

    iget-object v2, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget v2, v2, v1

    const/high16 v6, 0x40400000    # 3.0f

    sub-float/2addr v6, v4

    mul-float/2addr v2, v6

    iget-object v4, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mM:[F

    aget v1, v4, v1

    mul-float/2addr v0, v1

    sub-float v1, p1, v5

    mul-float/2addr v0, v1

    add-float/2addr v2, v0

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    add-float/2addr v3, v2

    return v3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 509
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 510
    iget-object v1, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    array-length v1, v1

    .line 511
    const-string v2, "MonotoneCubicSpline{["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 513
    if-eqz v2, :cond_0

    .line 514
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    :cond_0
    const-string v3, "("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mX:[F

    aget v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 517
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mY:[F

    aget v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 518
    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;->mM:[F

    aget v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 520
    :cond_1
    const-string v1, "]}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
