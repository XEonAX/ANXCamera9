.class public Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;
.super Ljava/lang/Object;
.source "LiveFilterChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;


# instance fields
.field private mRecorder:Lcom/ss/android/vesdk/TERecorder;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/TERecorder;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveFilterChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 13
    return-void
.end method


# virtual methods
.method public onFilterChanged(II)V
    .locals 0

    .line 28
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 17
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 18
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 22
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 23
    return-void
.end method
