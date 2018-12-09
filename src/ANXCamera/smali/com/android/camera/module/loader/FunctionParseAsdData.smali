.class public Lcom/android/camera/module/loader/FunctionParseAsdData;
.super Ljava/lang/Object;
.source "FunctionParseAsdData.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Lcom/android/camera/module/loader/AsdDataHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mAsdDataHolder:Lcom/android/camera/module/loader/AsdDataHolder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lcom/android/camera/module/loader/AsdDataHolder;

    invoke-direct {v0}, Lcom/android/camera/module/loader/AsdDataHolder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdData;->mAsdDataHolder:Lcom/android/camera/module/loader/AsdDataHolder;

    .line 15
    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera/module/loader/AsdDataHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdData;->mAsdDataHolder:Lcom/android/camera/module/loader/AsdDataHolder;

    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getHDRDetectedScene(Landroid/hardware/camera2/CaptureResult;)I

    move-result p1

    iput p1, v0, Lcom/android/camera/module/loader/AsdDataHolder;->hdrMode:I

    .line 24
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdData;->apply(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera/module/loader/AsdDataHolder;

    move-result-object p1

    return-object p1
.end method
