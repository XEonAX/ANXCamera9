.class public Lcom/android/camera2/AFFrameControl;
.super Ljava/lang/Object;
.source "AFFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/AFFrameControl$AFGyroData;,
        Lcom/android/camera2/AFFrameControl$MarshalQueryableAFFrameControl;
    }
.end annotation


# static fields
.field private static final COORDINATE_COUNT:I = 0x4

.field private static final MAX_AFGYRO_SAMPLE_SIZE:I = 0x20

.field private static final MAX_NUM_OF_STEPS:I = 0x2f


# instance fields
.field private mAFGyroData:Lcom/android/camera2/AFFrameControl$AFGyroData;

.field private mTargetLensPosition:I

.field private mUseDACValue:I


# direct methods
.method public constructor <init>(IILcom/android/camera2/AFFrameControl$AFGyroData;)V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput p1, p0, Lcom/android/camera2/AFFrameControl;->mTargetLensPosition:I

    .line 89
    iput p2, p0, Lcom/android/camera2/AFFrameControl;->mUseDACValue:I

    .line 90
    iput-object p3, p0, Lcom/android/camera2/AFFrameControl;->mAFGyroData:Lcom/android/camera2/AFFrameControl$AFGyroData;

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/AFFrameControl;)I
    .locals 0

    .line 79
    iget p0, p0, Lcom/android/camera2/AFFrameControl;->mTargetLensPosition:I

    return p0
.end method

.method static synthetic access$100(Lcom/android/camera2/AFFrameControl;)I
    .locals 0

    .line 79
    iget p0, p0, Lcom/android/camera2/AFFrameControl;->mUseDACValue:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera2/AFFrameControl;)Lcom/android/camera2/AFFrameControl$AFGyroData;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/android/camera2/AFFrameControl;->mAFGyroData:Lcom/android/camera2/AFFrameControl$AFGyroData;

    return-object p0
.end method


# virtual methods
.method public getAFGyroData()Lcom/android/camera2/AFFrameControl$AFGyroData;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/android/camera2/AFFrameControl;->mAFGyroData:Lcom/android/camera2/AFFrameControl$AFGyroData;

    return-object v0
.end method

.method public getTargetLensPosition()I
    .locals 1

    .line 94
    iget v0, p0, Lcom/android/camera2/AFFrameControl;->mTargetLensPosition:I

    return v0
.end method

.method public getUseDACValue()I
    .locals 1

    .line 98
    iget v0, p0, Lcom/android/camera2/AFFrameControl;->mUseDACValue:I

    return v0
.end method
