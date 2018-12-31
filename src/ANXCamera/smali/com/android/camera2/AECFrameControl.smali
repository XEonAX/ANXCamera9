.class public Lcom/android/camera2/AECFrameControl;
.super Ljava/lang/Object;
.source "AECFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/AECFrameControl$AECExposureData;,
        Lcom/android/camera2/AECFrameControl$MarshalQueryableAECFrameControl;
    }
.end annotation


# static fields
.field private static final EXPOSURE_INDEX_COUNT:I = 0x3


# instance fields
.field private mAecExposureDatas:[Lcom/android/camera2/AECFrameControl$AECExposureData;


# direct methods
.method public constructor <init>([Lcom/android/camera2/AECFrameControl$AECExposureData;)V
    .locals 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/camera2/AECFrameControl$AECExposureData;

    iput-object v0, p0, Lcom/android/camera2/AECFrameControl;->mAecExposureDatas:[Lcom/android/camera2/AECFrameControl$AECExposureData;

    .line 52
    iput-object p1, p0, Lcom/android/camera2/AECFrameControl;->mAecExposureDatas:[Lcom/android/camera2/AECFrameControl$AECExposureData;

    .line 53
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/AECFrameControl;)[Lcom/android/camera2/AECFrameControl$AECExposureData;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/android/camera2/AECFrameControl;->mAecExposureDatas:[Lcom/android/camera2/AECFrameControl$AECExposureData;

    return-object p0
.end method


# virtual methods
.method public getAecExposureDatas()[Lcom/android/camera2/AECFrameControl$AECExposureData;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/android/camera2/AECFrameControl;->mAecExposureDatas:[Lcom/android/camera2/AECFrameControl$AECExposureData;

    return-object v0
.end method
