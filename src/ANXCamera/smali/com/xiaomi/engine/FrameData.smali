.class public Lcom/xiaomi/engine/FrameData;
.super Ljava/lang/Object;
.source "FrameData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/engine/FrameData$FrameStatusCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBufferImage:Landroid/media/Image;

.field private mCaptureResultMetadataNative:Landroid/os/Parcelable;

.field private mFrameNumber:J

.field private mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

.field private mStreamIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Lcom/xiaomi/engine/FrameData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/engine/FrameData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IJLandroid/os/Parcelable;Landroid/media/Image;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput p1, p0, Lcom/xiaomi/engine/FrameData;->mStreamIndex:I

    .line 47
    iput-wide p2, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    .line 48
    iput-object p4, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    .line 49
    iput-object p5, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    .line 50
    return-void
.end method


# virtual methods
.method public getBufferImage()Landroid/media/Image;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    return-object v0
.end method

.method public getCaptureResultMetaDataNative()Landroid/os/Parcelable;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    return-object v0
.end method

.method public getFrameCallback()Lcom/xiaomi/engine/FrameData$FrameStatusCallback;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    return-object v0
.end method

.method public getFrameNumber()J
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    return-wide v0
.end method

.method public getStreamIndex()I
    .locals 1

    .line 68
    iget v0, p0, Lcom/xiaomi/engine/FrameData;->mStreamIndex:I

    return v0
.end method

.method public release()V
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    .line 57
    sget-object v0, Lcom/xiaomi/engine/FrameData;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "release: close Image: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    .line 59
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    iget-object v1, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-interface {v0, v1}, Lcom/xiaomi/engine/FrameData$FrameStatusCallback;->onFrameImageClosed(Landroid/media/Image;)V

    .line 64
    :cond_0
    return-void
.end method

.method public setBufferImage(Landroid/media/Image;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    .line 97
    return-void
.end method

.method public setCaptureResultMetaDataNative(Landroid/os/Parcelable;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    .line 89
    return-void
.end method

.method public setFrameCallback(Lcom/xiaomi/engine/FrameData$FrameStatusCallback;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    .line 105
    return-void
.end method

.method public setFrameNumber(J)V
    .locals 0

    .line 80
    iput-wide p1, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    .line 81
    return-void
.end method

.method public setStreamIndex(I)V
    .locals 0

    .line 72
    iput p1, p0, Lcom/xiaomi/engine/FrameData;->mStreamIndex:I

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FrameData{ mStreamIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/engine/FrameData;->mStreamIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mFrameNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mCaptureResultMetadataNative="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mBufferImage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
