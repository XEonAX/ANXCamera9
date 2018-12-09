.class public Lcom/xiaomi/camera/imagecodec/ReprocessData;
.super Ljava/lang/Object;
.source "ReprocessData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;
    }
.end annotation


# instance fields
.field private mImageTag:Ljava/lang/String;

.field private mIsFrontCamera:Z

.field private mOutputHeight:I

.field private mOutputWidth:I

.field private mResultListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;

.field private mTotalCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field private mYuvImage:Lcom/xiaomi/camera/imagecodec/MiImage;


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/imagecodec/MiImage;Ljava/lang/String;Lcom/xiaomi/protocol/ICustomCaptureResult;ZIILcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;)V
    .locals 0
    .param p1    # Lcom/xiaomi/camera/imagecodec/MiImage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/xiaomi/protocol/ICustomCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mYuvImage:Lcom/xiaomi/camera/imagecodec/MiImage;

    .line 51
    iput-object p2, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mImageTag:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mTotalCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 53
    iput-boolean p4, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mIsFrontCamera:Z

    .line 54
    if-nez p5, :cond_0

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result p5

    :cond_0
    iput p5, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mOutputWidth:I

    .line 55
    if-nez p6, :cond_1

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result p6

    :cond_1
    iput p6, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mOutputHeight:I

    .line 56
    iput-object p7, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mResultListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/imagecodec/MiImage;Ljava/lang/String;Lcom/xiaomi/protocol/ICustomCaptureResult;ZLcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;)V
    .locals 8
    .param p1    # Lcom/xiaomi/camera/imagecodec/MiImage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/xiaomi/protocol/ICustomCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 29
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/MiImage;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/MiImage;->getHeight()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/xiaomi/camera/imagecodec/ReprocessData;-><init>(Lcom/xiaomi/camera/imagecodec/MiImage;Ljava/lang/String;Lcom/xiaomi/protocol/ICustomCaptureResult;ZIILcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getImageTag()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mImageTag:Ljava/lang/String;

    return-object v0
.end method

.method public getOutputHeight()I
    .locals 1

    .line 84
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mOutputHeight:I

    return v0
.end method

.method public getOutputWidth()I
    .locals 1

    .line 80
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mOutputWidth:I

    return v0
.end method

.method public getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mResultListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;

    return-object v0
.end method

.method public getTotalCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mTotalCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    return-object v0
.end method

.method public getYuvImage()Lcom/xiaomi/camera/imagecodec/MiImage;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mYuvImage:Lcom/xiaomi/camera/imagecodec/MiImage;

    return-object v0
.end method

.method public isFrontCamera()Z
    .locals 1

    .line 76
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/ReprocessData;->mIsFrontCamera:Z

    return v0
.end method
