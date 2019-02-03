.class public Lcom/xiaomi/camera/core/CaptureData;
.super Ljava/lang/Object;
.source "CaptureData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAlgoType:I

.field private mAlreadyDataNum:I

.field private mBurstNum:I

.field private mCaptureDataBeanList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

.field private mCaptureTimestamp:J

.field private mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

.field private mSaveInputImage:Z

.field private mStreamNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-class v0, Lcom/xiaomi/camera/core/CaptureData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/CaptureData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IIIJ)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    .line 34
    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlgoType:I

    .line 35
    iput p2, p0, Lcom/xiaomi/camera/core/CaptureData;->mStreamNum:I

    .line 36
    iput p3, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    .line 37
    iput-wide p4, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureTimestamp:J

    .line 38
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 19
    sget-object v0, Lcom/xiaomi/camera/core/CaptureData;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getAlgoType()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlgoType:I

    return v0
.end method

.method public getBurstNum()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    return v0
.end method

.method public getCaptureDataBeanList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    return-object v0
.end method

.method public getCaptureDataListener()Lcom/xiaomi/camera/core/CaptureDataListener;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    return-object v0
.end method

.method public getCaptureTimestamp()J
    .locals 2

    .line 82
    iget-wide v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureTimestamp:J

    return-wide v0
.end method

.method public getMultiFrameProcessResult()Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    return-object v0
.end method

.method public getStreamNum()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mStreamNum:I

    return v0
.end method

.method public isDataReady()Z
    .locals 2

    .line 46
    iget v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    iget v1, p0, Lcom/xiaomi/camera/core/CaptureData;->mBurstNum:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSaveInputImage()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mSaveInputImage:Z

    return v0
.end method

.method public putCaptureDataBean(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataBeanList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    iget p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mAlreadyDataNum:I

    .line 43
    return-void
.end method

.method public setMultiFrameProcessListener(Lcom/xiaomi/camera/core/CaptureDataListener;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    .line 71
    return-void
.end method

.method public setMultiFrameProcessResult(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mMultiFrameProcessResult:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    .line 79
    return-void
.end method

.method public setSaveInputImage(Z)V
    .locals 0

    .line 90
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/CaptureData;->mSaveInputImage:Z

    .line 91
    return-void
.end method
