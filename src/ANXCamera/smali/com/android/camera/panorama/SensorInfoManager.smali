.class public Lcom/android/camera/panorama/SensorInfoManager;
.super Ljava/lang/Object;
.source "SensorInfoManager.java"


# instance fields
.field public a_ix:I

.field public exposureTime:J

.field public g_ix:I

.field public imageTimeStamp:J

.field public img_ix:J

.field public r_ix:I

.field public rollingShutterSkew:J

.field public sensitivity:I

.field public sensorData:[Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field public sensorTimeStamp:J

.field public timeMillis:J


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->timeMillis:J

    .line 20
    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->imageTimeStamp:J

    .line 21
    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->sensorTimeStamp:J

    .line 22
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/camera/panorama/SensorInfoManager;->sensitivity:I

    .line 23
    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->exposureTime:J

    .line 24
    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->rollingShutterSkew:J

    .line 25
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->img_ix:J

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    .line 27
    iput v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    .line 28
    iput v0, p0, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    .line 29
    new-array p1, p1, [Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    .line 30
    return-void
.end method
