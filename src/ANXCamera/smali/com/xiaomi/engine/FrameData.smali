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

.field private mImageFlag:I

.field private mSequenceId:I


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

.method public constructor <init>(IIJLandroid/os/Parcelable;Landroid/media/Image;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lcom/xiaomi/engine/FrameData;->mImageFlag:I

    .line 48
    iput p2, p0, Lcom/xiaomi/engine/FrameData;->mSequenceId:I

    .line 49
    iput-wide p3, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    .line 50
    iput-object p5, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    .line 51
    iput-object p6, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    .line 52
    return-void
.end method


# virtual methods
.method public getBufferImage()Landroid/media/Image;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    return-object v0
.end method

.method public getCaptureResultMetaDataNative()Landroid/os/Parcelable;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    return-object v0
.end method

.method public getFrameCallback()Lcom/xiaomi/engine/FrameData$FrameStatusCallback;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    return-object v0
.end method

.method public getFrameNumber()J
    .locals 2

    .line 78
    iget-wide v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    return-wide v0
.end method

.method public getImageFlag()I
    .locals 1

    .line 70
    iget v0, p0, Lcom/xiaomi/engine/FrameData;->mImageFlag:I

    return v0
.end method

.method public getSequenceId()I
    .locals 1

    .line 86
    iget v0, p0, Lcom/xiaomi/engine/FrameData;->mSequenceId:I

    return v0
.end method

.method public release()V
    .locals 3

    .line 58
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    if-eqz v0, :cond_0

    .line 59
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

    .line 60
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    .line 61
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    iget-object v1, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    invoke-interface {v0, v1}, Lcom/xiaomi/engine/FrameData$FrameStatusCallback;->onFrameImageClosed(Landroid/media/Image;)V

    .line 66
    :cond_0
    return-void
.end method

.method public setBufferImage(Landroid/media/Image;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mBufferImage:Landroid/media/Image;

    .line 107
    return-void
.end method

.method public setCaptureResultMetaDataNative(Landroid/os/Parcelable;)V
    .locals 0

    .line 98
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mCaptureResultMetadataNative:Landroid/os/Parcelable;

    .line 99
    return-void
.end method

.method public setFrameCallback(Lcom/xiaomi/engine/FrameData$FrameStatusCallback;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/xiaomi/engine/FrameData;->mFrameStatusCallback:Lcom/xiaomi/engine/FrameData$FrameStatusCallback;

    .line 115
    return-void
.end method

.method public setFrameNumber(J)V
    .locals 0

    .line 82
    iput-wide p1, p0, Lcom/xiaomi/engine/FrameData;->mFrameNumber:J

    .line 83
    return-void
.end method

.method public setImageFlag(I)V
    .locals 0

    .line 74
    iput p1, p0, Lcom/xiaomi/engine/FrameData;->mImageFlag:I

    .line 75
    return-void
.end method

.method public setSequenceId(I)V
    .locals 0

    .line 90
    iput p1, p0, Lcom/xiaomi/engine/FrameData;->mSequenceId:I

    .line 91
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FrameData{ mImageFlag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/engine/FrameData;->mImageFlag:I

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
