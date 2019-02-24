.class public Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;
.super Ljava/lang/Object;
.source "LiveStickerChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;


# instance fields
.field private mRecorder:Lcom/ss/android/vesdk/TERecorder;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/TERecorder;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    .line 11
    return-void
.end method


# virtual methods
.method public onStickerChanged(Ljava/lang/String;)V
    .locals 3

    .line 25
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveStickerChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->STICKER_RESOURCE_DIR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/TERecorder;->switchEffect(Ljava/lang/String;)I

    .line 26
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 15
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb2

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 16
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 20
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb2

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 21
    return-void
.end method
