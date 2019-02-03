.class Lcom/android/camera/module/Camera2Module$9;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->startCount(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$time:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0

    .line 1735
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .line 1766
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1767
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 1768
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v2}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v2

    invoke-static {v0, v2}, Lcom/android/camera/module/Camera2Module;->access$3200(Lcom/android/camera/module/Camera2Module;I)V

    .line 1769
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 1771
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xac

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1772
    if-eqz v0, :cond_0

    .line 1773
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->reInitAlert(Z)V

    .line 1775
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1762
    return-void
.end method

.method public onNext(Ljava/lang/Long;)V
    .locals 2

    .line 1752
    iget v0, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    sub-int/2addr v0, p1

    .line 1753
    if-lez v0, :cond_0

    .line 1754
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 1755
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showDelayNumber(I)V

    .line 1757
    :cond_0
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1735
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module$9;->onNext(Ljava/lang/Long;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2

    .line 1739
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->access$3102(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1740
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 1742
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xac

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1743
    if-eqz p1, :cond_0

    .line 1744
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideAlert()V

    .line 1746
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 1747
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v0, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showDelayNumber(I)V

    .line 1748
    return-void
.end method
