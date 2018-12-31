.class public Lcom/android/camera/panorama/RoundDetector;
.super Ljava/lang/Object;
.source "RoundDetector.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;,
        Lcom/android/camera/panorama/RoundDetector$LoopRange;
    }
.end annotation


# static fields
.field protected static final DETECT_DIRECTION_MARGIN_DEGREE:F = 20.0f

.field private static final MATRIX_SIZE:I = 0x10

.field public static final SynchronizedObject:Ljava/lang/Object;

.field public static final TAG:Ljava/lang/String; = "RoundDetector"


# instance fields
.field protected isLandscape:Z

.field private mAccelerometerValues:[F

.field protected mCurrentDegreeLandscape:I

.field protected mCurrentDegreePortrait:I

.field protected mDirection:I

.field private mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

.field private mI:[F

.field private mInR:[F

.field protected mIsEndOk:Z

.field private mMagneticValues:[F

.field private mOutR:[F

.field private mStartDegree:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/panorama/RoundDetector;->SynchronizedObject:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    invoke-direct {p0}, Lcom/android/camera/panorama/RoundDetector;->emptyRange()Lcom/android/camera/panorama/RoundDetector$LoopRange;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    .line 109
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/panorama/RoundDetector;->mDirection:I

    .line 111
    const/16 v0, 0x10

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mInR:[F

    .line 112
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mOutR:[F

    .line 113
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/camera/panorama/RoundDetector;->mI:[F

    .line 115
    const/4 v0, 0x0

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mMagneticValues:[F

    .line 116
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/camera/panorama/RoundDetector;->mAccelerometerValues:[F

    .line 117
    return-void
.end method

.method private static correctionCircleDegree(I)I
    .locals 1

    .line 254
    const/16 v0, 0x168

    if-gez p0, :cond_0

    .line 255
    add-int/2addr p0, v0

    return p0

    .line 257
    :cond_0
    if-ge v0, p0, :cond_1

    .line 258
    sub-int/2addr p0, v0

    return p0

    .line 260
    :cond_1
    return p0
.end method

.method private emptyRange()Lcom/android/camera/panorama/RoundDetector$LoopRange;
    .locals 3

    .line 104
    new-instance v0, Lcom/android/camera/panorama/RoundDetector$LoopRange;

    const/4 v1, -0x1

    const/16 v2, 0x168

    invoke-direct {v0, p0, v1, v1, v2}, Lcom/android/camera/panorama/RoundDetector$LoopRange;-><init>(Lcom/android/camera/panorama/RoundDetector;III)V

    return-object v0
.end method

.method protected static radianToDegree(F)I
    .locals 2

    .line 250
    float-to-double v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p0, v0

    return p0
.end method


# virtual methods
.method public currentDegree()I
    .locals 1

    .line 175
    iget-boolean v0, p0, Lcom/android/camera/panorama/RoundDetector;->isLandscape:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/panorama/RoundDetector;->mCurrentDegreeLandscape:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/panorama/RoundDetector;->mCurrentDegreePortrait:I

    :goto_0
    return v0
.end method

.method public currentDegree0Base()I
    .locals 2

    .line 179
    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result v0

    .line 180
    iget v1, p0, Lcom/android/camera/panorama/RoundDetector;->mDirection:I

    if-eqz v1, :cond_0

    .line 181
    rsub-int v0, v0, 0x168

    .line 183
    :cond_0
    return v0
.end method

.method public detect()Z
    .locals 5

    .line 187
    sget-object v0, Lcom/android/camera/panorama/RoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    .line 188
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/panorama/RoundDetector;->mIsEndOk:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 189
    monitor-exit v0

    return v2

    .line 192
    :cond_0
    iget v1, p0, Lcom/android/camera/panorama/RoundDetector;->mDirection:I

    const/4 v3, 0x1

    if-nez v1, :cond_2

    .line 193
    iget v1, p0, Lcom/android/camera/panorama/RoundDetector;->mStartDegree:I

    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result v4

    if-lt v1, v4, :cond_1

    move v2, v3

    nop

    :cond_1
    monitor-exit v0

    return v2

    .line 195
    :cond_2
    iget v1, p0, Lcom/android/camera/panorama/RoundDetector;->mStartDegree:I

    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result v4

    if-gt v1, v4, :cond_3

    move v2, v3

    nop

    :cond_3
    monitor-exit v0

    return v2

    .line 196
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 247
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 204
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 212
    return-void

    .line 209
    :pswitch_0
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mMagneticValues:[F

    .line 210
    goto :goto_0

    .line 206
    :pswitch_1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mAccelerometerValues:[F

    .line 207
    nop

    .line 215
    :goto_0
    iget-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mMagneticValues:[F

    array-length p1, p1

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mAccelerometerValues:[F

    array-length p1, p1

    if-gtz p1, :cond_0

    goto :goto_1

    .line 219
    :cond_0
    iget-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mInR:[F

    iget-object v0, p0, Lcom/android/camera/panorama/RoundDetector;->mI:[F

    iget-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mAccelerometerValues:[F

    iget-object v2, p0, Lcom/android/camera/panorama/RoundDetector;->mMagneticValues:[F

    invoke-static {p1, v0, v1, v2}, Landroid/hardware/SensorManager;->getRotationMatrix([F[F[F[F)Z

    .line 221
    const/4 p1, 0x3

    new-array v0, p1, [F

    .line 223
    iget-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mInR:[F

    const/16 v2, 0x81

    iget-object v3, p0, Lcom/android/camera/panorama/RoundDetector;->mOutR:[F

    invoke-static {v1, p1, v2, v3}, Landroid/hardware/SensorManager;->remapCoordinateSystem([FII[F)Z

    .line 224
    iget-object v1, p0, Lcom/android/camera/panorama/RoundDetector;->mOutR:[F

    invoke-static {v1, v0}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    .line 225
    const/4 v1, 0x0

    aget v2, v0, v1

    invoke-static {v2}, Lcom/android/camera/panorama/RoundDetector;->radianToDegree(F)I

    move-result v2

    .line 226
    if-gez v2, :cond_1

    .line 227
    add-int/lit16 v2, v2, 0x168

    .line 230
    :cond_1
    iget-object v3, p0, Lcom/android/camera/panorama/RoundDetector;->mInR:[F

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/android/camera/panorama/RoundDetector;->mOutR:[F

    invoke-static {v3, v4, p1, v5}, Landroid/hardware/SensorManager;->remapCoordinateSystem([FII[F)Z

    .line 231
    iget-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mOutR:[F

    invoke-static {p1, v0}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    .line 232
    aget p1, v0, v1

    invoke-static {p1}, Lcom/android/camera/panorama/RoundDetector;->radianToDegree(F)I

    move-result p1

    .line 233
    if-gez p1, :cond_2

    .line 234
    add-int/lit16 p1, p1, 0x168

    .line 237
    :cond_2
    sget-object v0, Lcom/android/camera/panorama/RoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    .line 238
    :try_start_0
    iput v2, p0, Lcom/android/camera/panorama/RoundDetector;->mCurrentDegreeLandscape:I

    .line 239
    iput p1, p0, Lcom/android/camera/panorama/RoundDetector;->mCurrentDegreePortrait:I

    .line 240
    iget-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/android/camera/panorama/RoundDetector$LoopRange;->contains(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/panorama/RoundDetector;->mIsEndOk:Z

    .line 241
    monitor-exit v0

    .line 242
    return-void

    .line 241
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 216
    :cond_3
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setStartPosition(IIFFZ)V
    .locals 5

    .line 120
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
    iput-boolean p1, p0, Lcom/android/camera/panorama/RoundDetector;->isLandscape:Z

    .line 121
    iget-boolean p1, p0, Lcom/android/camera/panorama/RoundDetector;->isLandscape:Z

    if-eqz p1, :cond_2

    float-to-int p1, p3

    goto :goto_2

    :cond_2
    float-to-int p1, p4

    .line 122
    :goto_2
    sget-object p3, Lcom/android/camera/panorama/RoundDetector;->SynchronizedObject:Ljava/lang/Object;

    monitor-enter p3

    .line 124
    if-eqz p5, :cond_3

    .line 125
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result p4

    goto :goto_3

    .line 171
    :catchall_0
    move-exception p1

    goto/16 :goto_7

    .line 127
    :cond_3
    if-nez p2, :cond_4

    .line 129
    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result p4

    add-int/lit8 p5, p1, -0x14

    add-int/2addr p4, p5

    invoke-static {p4}, Lcom/android/camera/panorama/RoundDetector;->correctionCircleDegree(I)I

    move-result p4

    goto :goto_3

    .line 132
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result p4

    add-int/lit8 p5, p1, -0x14

    sub-int/2addr p4, p5

    invoke-static {p4}, Lcom/android/camera/panorama/RoundDetector;->correctionCircleDegree(I)I

    move-result p4

    .line 137
    :goto_3
    const/4 p5, 0x2

    packed-switch p2, :pswitch_data_0

    .line 145
    iput-boolean v1, p0, Lcom/android/camera/panorama/RoundDetector;->mIsEndOk:Z

    goto :goto_6

    .line 139
    :pswitch_0
    mul-int/lit8 v2, p1, 0x3

    div-int/2addr v2, p5

    sub-int v2, p4, v2

    .line 140
    goto :goto_4

    .line 142
    :pswitch_1
    add-int v2, p4, p1

    .line 143
    nop

    .line 150
    :goto_4
    div-int/2addr p1, p5

    add-int/2addr p1, v2

    .line 151
    invoke-static {v2}, Lcom/android/camera/panorama/RoundDetector;->correctionCircleDegree(I)I

    move-result v2

    .line 152
    invoke-static {p1}, Lcom/android/camera/panorama/RoundDetector;->correctionCircleDegree(I)I

    move-result p1

    .line 154
    const/16 v3, 0x168

    if-nez p2, :cond_6

    .line 155
    if-ge v2, p4, :cond_5

    .line 156
    nop

    .line 158
    move v2, v3

    :cond_5
    new-instance v4, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;

    invoke-direct {v4, p0, v2, p1, v3}, Lcom/android/camera/panorama/RoundDetector$LoopRangeLeft;-><init>(Lcom/android/camera/panorama/RoundDetector;III)V

    iput-object v4, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    goto :goto_5

    .line 160
    :cond_6
    if-ge p4, p1, :cond_7

    .line 161
    nop

    .line 163
    move p1, v1

    :cond_7
    new-instance v4, Lcom/android/camera/panorama/RoundDetector$LoopRange;

    invoke-direct {v4, p0, v2, p1, v3}, Lcom/android/camera/panorama/RoundDetector$LoopRange;-><init>(Lcom/android/camera/panorama/RoundDetector;III)V

    iput-object v4, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    .line 166
    :goto_5
    iput p2, p0, Lcom/android/camera/panorama/RoundDetector;->mDirection:I

    .line 167
    iput p4, p0, Lcom/android/camera/panorama/RoundDetector;->mStartDegree:I

    .line 168
    iput-boolean v1, p0, Lcom/android/camera/panorama/RoundDetector;->mIsEndOk:Z

    .line 169
    const-string p1, "RoundDetector"

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p4, "%s, start:%d(>>%d)"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    invoke-virtual {v3}, Lcom/android/camera/panorama/RoundDetector$LoopRange;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 170
    invoke-virtual {p0}, Lcom/android/camera/panorama/RoundDetector;->currentDegree()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v0

    iget v0, p0, Lcom/android/camera/panorama/RoundDetector;->mStartDegree:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, p5

    .line 169
    invoke-static {p2, p4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    monitor-exit p3

    .line 172
    return-void

    .line 146
    :goto_6
    invoke-direct {p0}, Lcom/android/camera/panorama/RoundDetector;->emptyRange()Lcom/android/camera/panorama/RoundDetector$LoopRange;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/panorama/RoundDetector;->mEndDegreeRange:Lcom/android/camera/panorama/RoundDetector$LoopRange;

    .line 147
    const-string p1, "RoundDetector"

    const-string p2, "Unsupported Direction."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    monitor-exit p3

    return-void

    .line 171
    :goto_7
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public stop()V
    .locals 0

    .line 200
    return-void
.end method
