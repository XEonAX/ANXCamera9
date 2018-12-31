.class public Lcom/android/camera/panorama/GyroscopeRoundDetector;
.super Lcom/android/camera/panorama/RoundDetector;
.source "GyroscopeRoundDetector.java"


# static fields
.field private static final NS2S:F = 1.0E-9f


# instance fields
.field private mLastTimestamp:F

.field private mRadianLandscape:F

.field private mRadianPortrait:F

.field private mTargetDegree:F

.field private mUseSensor:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 8
    invoke-direct {p0}, Lcom/android/camera/panorama/RoundDetector;-><init>()V

    .line 15
    const/high16 v0, 0x43b40000    # 360.0f

    iput v0, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mTargetDegree:F

    return-void
.end method


# virtual methods
.method public detect()Z
    .locals 10

    .line 41
    sget-object v0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    .line 42
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mIsEndOk:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 43
    monitor-exit v0

    return v2

    .line 46
    :cond_0
    iget v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mDirection:I

    const/4 v3, 0x1

    if-nez v1, :cond_2

    .line 47
    iget v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mTargetDegree:F

    invoke-virtual {p0}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->currentDegree()I

    move-result v4

    int-to-float v4, v4

    cmpg-float v1, v1, v4

    if-gtz v1, :cond_1

    move v2, v3

    nop

    :cond_1
    monitor-exit v0

    return v2

    .line 49
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->currentDegree()I

    move-result v1

    int-to-double v4, v1

    const-wide v6, 0x4076800000000000L    # 360.0

    iget v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mTargetDegree:F

    float-to-double v8, v1

    sub-double/2addr v6, v8

    cmpg-double v1, v4, v6

    if-gtz v1, :cond_3

    move v2, v3

    nop

    :cond_3
    monitor-exit v0

    return v2

    .line 50
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8

    .line 62
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 63
    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    .line 64
    return-void

    .line 67
    :cond_0
    sget-object v0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    .line 68
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mUseSensor:Z

    if-nez v1, :cond_1

    .line 69
    monitor-exit v0

    return-void

    .line 72
    :cond_1
    iget v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mLastTimestamp:F

    float-to-double v1, v1

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isEqualsZero(D)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_2

    .line 73
    iget-wide v4, p1, Landroid/hardware/SensorEvent;->timestamp:J

    long-to-float v1, v4

    iget v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mLastTimestamp:F

    sub-float/2addr v1, v4

    const v4, 0x3089705f    # 1.0E-9f

    mul-float/2addr v1, v4

    .line 74
    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    .line 75
    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    .line 77
    iget v6, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianLandscape:F

    mul-float/2addr v4, v1

    add-float/2addr v6, v4

    iput v6, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianLandscape:F

    .line 78
    iget v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianPortrait:F

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    iput v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianPortrait:F

    .line 81
    :cond_2
    iget-wide v4, p1, Landroid/hardware/SensorEvent;->timestamp:J

    long-to-float p1, v4

    iput p1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mLastTimestamp:F

    .line 82
    iget p1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianLandscape:F

    invoke-static {p1}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->radianToDegree(F)I

    move-result p1

    .line 83
    iget v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianPortrait:F

    invoke-static {v1}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->radianToDegree(F)I

    move-result v1

    .line 85
    if-gtz p1, :cond_3

    iget v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mDirection:I

    if-ne v4, v3, :cond_3

    .line 86
    add-int/lit16 p1, p1, 0x168

    .line 88
    :cond_3
    if-gtz v1, :cond_4

    iget v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mDirection:I

    if-ne v4, v3, :cond_4

    .line 89
    add-int/lit16 v1, v1, 0x168

    .line 92
    :cond_4
    iget-boolean v4, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->isLandscape:Z

    if-eqz v4, :cond_5

    .line 93
    move v4, p1

    goto :goto_0

    :cond_5
    move v4, v1

    :goto_0
    iget-boolean v5, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->isLandscape:Z

    if-eqz v5, :cond_6

    iget v5, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreeLandscape:I

    goto :goto_1

    :cond_6
    iget v5, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreePortrait:I

    .line 97
    :goto_1
    iget v6, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mDirection:I

    const/16 v7, 0xb4

    if-eqz v6, :cond_9

    .line 102
    if-eqz v5, :cond_8

    if-lt v5, v4, :cond_7

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-ge v4, v7, :cond_7

    goto :goto_2

    .line 106
    :cond_7
    move v4, v2

    goto :goto_4

    .line 102
    :cond_8
    :goto_2
    nop

    .line 106
    move v4, v3

    goto :goto_4

    .line 99
    :cond_9
    if-eqz v5, :cond_b

    if-gt v5, v4, :cond_a

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-ge v4, v7, :cond_a

    goto :goto_3

    .line 100
    :cond_a
    move v4, v2

    goto :goto_4

    .line 99
    :cond_b
    :goto_3
    nop

    .line 100
    move v4, v3

    .line 106
    :goto_4
    if-eqz v4, :cond_c

    .line 107
    iput p1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreeLandscape:I

    .line 108
    iput v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreePortrait:I

    .line 111
    :cond_c
    iget-boolean p1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mIsEndOk:Z

    if-nez p1, :cond_e

    .line 112
    invoke-virtual {p0}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->currentDegree()I

    move-result p1

    if-gt v7, p1, :cond_d

    invoke-virtual {p0}, Lcom/android/camera/panorama/GyroscopeRoundDetector;->currentDegree()I

    move-result p1

    const/16 v1, 0xbe

    if-gt p1, v1, :cond_d

    move v2, v3

    nop

    :cond_d
    iput-boolean v2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mIsEndOk:Z

    .line 114
    :cond_e
    monitor-exit v0

    .line 115
    return-void

    .line 114
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setStartPosition(IIFFZ)V
    .locals 3

    .line 19
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    const/16 v2, 0xb4

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    move p1, v1

    goto :goto_1

    :cond_1
    :goto_0
    move p1, v0

    :goto_1
    iput-boolean p1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->isLandscape:Z

    .line 20
    sget-object p1, Lcom/android/camera/panorama/GyroscopeRoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter p1

    .line 21
    const/4 v2, 0x0

    :try_start_0
    iput v2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mLastTimestamp:F

    .line 22
    iput v2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianLandscape:F

    .line 23
    iput v2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mRadianPortrait:F

    .line 24
    iput v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreeLandscape:I

    .line 25
    iput v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mCurrentDegreePortrait:I

    .line 26
    iput p2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mDirection:I

    .line 27
    iput-boolean v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mIsEndOk:Z

    .line 28
    iput-boolean v0, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mUseSensor:Z

    .line 29
    if-nez p5, :cond_3

    .line 30
    iget-boolean p2, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->isLandscape:Z

    const/high16 p5, 0x41a00000    # 20.0f

    const/high16 v0, 0x43b40000    # 360.0f

    if-eqz p2, :cond_2

    .line 31
    sub-float/2addr v0, p3

    add-float/2addr v0, p5

    iput v0, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mTargetDegree:F

    goto :goto_2

    .line 33
    :cond_2
    sub-float/2addr v0, p4

    add-float/2addr v0, p5

    iput v0, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mTargetDegree:F

    .line 36
    :cond_3
    :goto_2
    monitor-exit p1

    .line 37
    return-void

    .line 36
    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public stop()V
    .locals 2

    .line 55
    sget-object v0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    .line 56
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/panorama/GyroscopeRoundDetector;->mUseSensor:Z

    .line 57
    monitor-exit v0

    .line 58
    return-void

    .line 57
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
