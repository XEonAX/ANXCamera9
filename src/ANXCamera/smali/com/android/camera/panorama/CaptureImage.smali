.class public abstract Lcom/android/camera/panorama/CaptureImage;
.super Ljava/lang/Object;
.source "CaptureImage.java"


# instance fields
.field private mExposureTime:J

.field protected mImage:Landroid/media/Image;

.field private mImageTimeStamp:J

.field private mRaw:[B

.field private mRollingShutterSkew:J

.field private mSensitivity:I

.field private mSensorTimeStamp:J


# direct methods
.method public constructor <init>(Landroid/media/Image;)V
    .locals 3

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    .line 24
    const/4 v0, 0x0

    new-array v1, v0, [B

    iput-object v1, p0, Lcom/android/camera/panorama/CaptureImage;->mRaw:[B

    .line 25
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    :goto_0
    iput-wide v1, p0, Lcom/android/camera/panorama/CaptureImage;->mImageTimeStamp:J

    .line 26
    invoke-virtual {p0, v0}, Lcom/android/camera/panorama/CaptureImage;->setSensitivity(I)V

    .line 27
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setExposureTime(J)V

    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setRollingShutterSkew(J)V

    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setSensorTimeStamp(J)V

    .line 30
    return-void
.end method

.method constructor <init>([B)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-eqz p1, :cond_0

    .line 34
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lcom/android/camera/panorama/CaptureImage;->mRaw:[B

    .line 36
    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImageTimeStamp:J

    .line 38
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/panorama/CaptureImage;->setSensitivity(I)V

    .line 39
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setExposureTime(J)V

    .line 40
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setRollingShutterSkew(J)V

    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/panorama/CaptureImage;->setSensorTimeStamp(J)V

    .line 42
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    .line 49
    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mRaw:[B

    .line 50
    return-void
.end method

.method public getExposureTime()J
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/android/camera/panorama/CaptureImage;->mExposureTime:J

    return-wide v0
.end method

.method public abstract getHeight()I
.end method

.method public abstract getImageFormat()Ljava/lang/String;
.end method

.method public getRollingShutterSkew()J
    .locals 2

    .line 77
    iget-wide v0, p0, Lcom/android/camera/panorama/CaptureImage;->mRollingShutterSkew:J

    return-wide v0
.end method

.method public getSensitivity()I
    .locals 1

    .line 61
    iget v0, p0, Lcom/android/camera/panorama/CaptureImage;->mSensitivity:I

    return v0
.end method

.method public getSensorTimeStamp()J
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/android/camera/panorama/CaptureImage;->mSensorTimeStamp:J

    return-wide v0
.end method

.method public getTimestamp()J
    .locals 2

    .line 53
    iget-wide v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImageTimeStamp:J

    return-wide v0
.end method

.method public abstract getWidth()I
.end method

.method public image()Landroid/media/Image;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mImage:Landroid/media/Image;

    return-object v0
.end method

.method public raw()[B
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/android/camera/panorama/CaptureImage;->mRaw:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public setExposureTime(J)V
    .locals 0

    .line 65
    iput-wide p1, p0, Lcom/android/camera/panorama/CaptureImage;->mExposureTime:J

    .line 66
    return-void
.end method

.method public setRollingShutterSkew(J)V
    .locals 0

    .line 73
    iput-wide p1, p0, Lcom/android/camera/panorama/CaptureImage;->mRollingShutterSkew:J

    .line 74
    return-void
.end method

.method public setSensitivity(I)V
    .locals 0

    .line 57
    iput p1, p0, Lcom/android/camera/panorama/CaptureImage;->mSensitivity:I

    .line 58
    return-void
.end method

.method public setSensorTimeStamp(J)V
    .locals 0

    .line 81
    iput-wide p1, p0, Lcom/android/camera/panorama/CaptureImage;->mSensorTimeStamp:J

    .line 82
    return-void
.end method
