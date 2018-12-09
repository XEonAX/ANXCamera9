.class public Lcom/android/camera/panorama/MorphoSensorFusion;
.super Ljava/lang/Object;
.source "MorphoSensorFusion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;
    }
.end annotation


# static fields
.field public static final MAXIMUM_DATA_SIZE:I = 0x200

.field public static final MODE_USE_ACCELEROMETER_AND_MAGNETIC_FIELD:I = 0x3

.field public static final MODE_USE_ALL_SENSORS:I = 0x0

.field public static final MODE_USE_GYROSCOPE:I = 0x1

.field public static final MODE_USE_GYROSCOPE_AND_ROTATION_VECTOR:I = 0x4

.field public static final MODE_USE_GYROSCOPE_WITH_ACCELEROMETER:I = 0x2

.field public static final OFFSET_MODE_DYNAMIC:I = 0x1

.field public static final OFFSET_MODE_STATIC:I = 0x0

.field public static final ROTATE_0:I = 0x0

.field public static final ROTATE_180:I = 0x2

.field public static final ROTATE_270:I = 0x3

.field public static final ROTATE_90:I = 0x1

.field public static final SENSOR_TYPE_ACCELEROMETER:I = 0x1

.field public static final SENSOR_TYPE_GYROSCOPE:I = 0x0

.field public static final SENSOR_TYPE_MAGNETIC_FIELD:I = 0x2

.field public static final SENSOR_TYPE_ROTATION_VECTOR:I = 0x3

.field public static final STATE_CALC_OFFSET:I = 0x0

.field public static final STATE_PROCESS:I = 0x1

.field public static final TAG:Ljava/lang/String; = "MorphoSensorFusion"


# instance fields
.field private mNative:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 11
    :try_start_0
    const-string v0, "morpho_sensor_fusion"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    goto :goto_0

    .line 12
    :catch_0
    move-exception v0

    .line 13
    const-string v1, "MorphoSensorFusion"

    const-string v2, "can\'t loadLibrary morpho_sensor_fusion"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    .line 66
    invoke-direct {p0}, Lcom/android/camera/panorama/MorphoSensorFusion;->createNativeObject()J

    move-result-wide v2

    .line 67
    cmp-long v4, v2, v0

    if-eqz v4, :cond_0

    .line 68
    iput-wide v2, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    goto :goto_0

    .line 70
    :cond_0
    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    .line 72
    :goto_0
    return-void
.end method

.method private native calc(J)I
.end method

.method private native createNativeObject()J
.end method

.method private native deleteNativeObject(J)V
.end method

.method private native finish(J)I
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .line 62
    invoke-static {}, Lcom/android/camera/panorama/MorphoSensorFusion;->nativeGetVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private native initialize(J)I
.end method

.method private static native nativeGetVersion()Ljava/lang/String;
.end method

.method private native outputRotationAngle(J[D)I
.end method

.method private native outputRotationMatrix3x3(JI[D)I
.end method

.method private native setAppState(JI)I
.end method

.method private native setMode(JI)I
.end method

.method private native setOffset(JLcom/android/camera/panorama/MorphoSensorFusion$SensorData;I)I
.end method

.method private native setOffsetMode(JI)I
.end method

.method private native setRotation(JI)I
.end method

.method private native setSensorData(J[Ljava/lang/Object;I)I
.end method

.method private native setSensorReliability(JII)I
.end method


# virtual methods
.method public calc()I
    .locals 4

    .line 169
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 170
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoSensorFusion;->calc(J)I

    move-result v0

    goto :goto_0

    .line 172
    :cond_0
    const v0, -0x7ffffffe

    .line 174
    :goto_0
    return v0
.end method

.method public finish()I
    .locals 6

    .line 87
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 88
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoSensorFusion;->finish(J)I

    move-result v0

    .line 89
    iget-wide v4, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v4, v5}, Lcom/android/camera/panorama/MorphoSensorFusion;->deleteNativeObject(J)V

    .line 90
    iput-wide v2, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    goto :goto_0

    .line 92
    :cond_0
    const v0, -0x7ffffffe

    .line 94
    :goto_0
    return v0
.end method

.method public initialize()I
    .locals 4

    .line 76
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 77
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/panorama/MorphoSensorFusion;->initialize(J)I

    move-result v0

    goto :goto_0

    .line 79
    :cond_0
    const v0, -0x7ffffffe

    .line 81
    :goto_0
    return v0
.end method

.method public outputRotationAngle([D)I
    .locals 4

    .line 189
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 190
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->outputRotationAngle(J[D)I

    move-result p1

    goto :goto_0

    .line 192
    :cond_0
    const p1, -0x7ffffffe

    .line 194
    :goto_0
    return p1
.end method

.method public outputRotationMatrix3x3(I[D)I
    .locals 4

    .line 179
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 180
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->outputRotationMatrix3x3(JI[D)I

    move-result p1

    goto :goto_0

    .line 182
    :cond_0
    const p1, -0x7ffffffe

    .line 184
    :goto_0
    return p1
.end method

.method public setAppState(I)I
    .locals 4

    .line 109
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 110
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setAppState(JI)I

    move-result p1

    goto :goto_0

    .line 112
    :cond_0
    const p1, -0x7ffffffe

    .line 114
    :goto_0
    return p1
.end method

.method public setMode(I)I
    .locals 4

    .line 99
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 100
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setMode(JI)I

    move-result p1

    goto :goto_0

    .line 102
    :cond_0
    const p1, -0x7ffffffe

    .line 104
    :goto_0
    return p1
.end method

.method public setOffset(Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;I)I
    .locals 4

    .line 149
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 150
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->setOffset(JLcom/android/camera/panorama/MorphoSensorFusion$SensorData;I)I

    move-result p1

    goto :goto_0

    .line 152
    :cond_0
    const p1, -0x7ffffffe

    .line 154
    :goto_0
    return p1
.end method

.method public setOffsetMode(I)I
    .locals 4

    .line 139
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 140
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setOffsetMode(JI)I

    move-result p1

    goto :goto_0

    .line 142
    :cond_0
    const p1, -0x7ffffffe

    .line 144
    :goto_0
    return p1
.end method

.method public setRotation(I)I
    .locals 4

    .line 119
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 120
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setRotation(JI)I

    move-result p1

    goto :goto_0

    .line 122
    :cond_0
    const p1, -0x7ffffffe

    .line 124
    :goto_0
    return p1
.end method

.method public setSensorData([Ljava/lang/Object;I)I
    .locals 4

    .line 159
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 160
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->setSensorData(J[Ljava/lang/Object;I)I

    move-result p1

    goto :goto_0

    .line 162
    :cond_0
    const p1, -0x7ffffffe

    .line 164
    :goto_0
    return p1
.end method

.method public setSensorReliability(II)I
    .locals 4

    .line 129
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 130
    iget-wide v0, p0, Lcom/android/camera/panorama/MorphoSensorFusion;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->setSensorReliability(JII)I

    move-result p1

    goto :goto_0

    .line 132
    :cond_0
    const p1, -0x7ffffffe

    .line 134
    :goto_0
    return p1
.end method
