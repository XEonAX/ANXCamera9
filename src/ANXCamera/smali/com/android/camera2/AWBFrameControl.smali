.class public Lcom/android/camera2/AWBFrameControl;
.super Ljava/lang/Object;
.source "AWBFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;
    }
.end annotation


# instance fields
.field mBGain:F

.field mColorTemperature:I

.field mGGain:F

.field mRGain:F


# direct methods
.method public constructor <init>(FFFI)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lcom/android/camera2/AWBFrameControl;->mRGain:F

    .line 21
    iput p2, p0, Lcom/android/camera2/AWBFrameControl;->mGGain:F

    .line 22
    iput p3, p0, Lcom/android/camera2/AWBFrameControl;->mBGain:F

    .line 24
    iput p4, p0, Lcom/android/camera2/AWBFrameControl;->mColorTemperature:I

    .line 25
    return-void
.end method


# virtual methods
.method public getColorTemperature()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/android/camera2/AWBFrameControl;->mColorTemperature:I

    return v0
.end method
