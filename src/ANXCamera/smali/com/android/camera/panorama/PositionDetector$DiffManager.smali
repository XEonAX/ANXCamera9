.class Lcom/android/camera/panorama/PositionDetector$DiffManager;
.super Ljava/lang/Object;
.source "PositionDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/panorama/PositionDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DiffManager"
.end annotation


# static fields
.field private static final NUM:I = 0x5


# instance fields
.field private add_num:I

.field private ave:D

.field private index:I

.field private final pos:[D


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 453
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 448
    const/4 v0, 0x5

    new-array v0, v0, [D

    iput-object v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->pos:[D

    .line 454
    invoke-virtual {p0}, Lcom/android/camera/panorama/PositionDetector$DiffManager;->clear()V

    .line 455
    return-void
.end method

.method private calc()V
    .locals 5

    .line 478
    nop

    .line 479
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    if-ge v2, v3, :cond_0

    .line 480
    iget-object v3, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->pos:[D

    aget-wide v3, v3, v2

    add-double/2addr v0, v3

    .line 479
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 482
    :cond_0
    iget v2, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->ave:D

    .line 483
    return-void
.end method


# virtual methods
.method public add(D)V
    .locals 2

    .line 466
    iget-object v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->pos:[D

    iget v1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    aput-wide p1, v0, v1

    .line 467
    iget p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    .line 468
    iget p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    const/4 p2, 0x5

    if-lt p1, p2, :cond_0

    .line 469
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    .line 471
    :cond_0
    iget p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    if-ge p1, p2, :cond_1

    .line 472
    iget p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    .line 474
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector$DiffManager;->calc()V

    .line 475
    return-void
.end method

.method public clear()V
    .locals 5

    .line 458
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x5

    if-ge v1, v2, :cond_0

    .line 459
    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->pos:[D

    const-wide/16 v3, 0x0

    aput-wide v3, v2, v1

    .line 458
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 461
    :cond_0
    iput v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->index:I

    .line 462
    iput v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add_num:I

    .line 463
    return-void
.end method

.method public getDiff()D
    .locals 2

    .line 486
    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector$DiffManager;->ave:D

    return-wide v0
.end method
