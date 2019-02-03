.class Lcom/android/camera/module/VideoModule$11;
.super Ljava/lang/Object;
.source "VideoModule.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 2550
    iput-object p1, p0, Lcom/android/camera/module/VideoModule$11;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Long;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2553
    iget-object p1, p0, Lcom/android/camera/module/VideoModule$11;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {p1}, Lcom/android/camera/module/VideoModule;->access$1900(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_0

    .line 2554
    iget-object p1, p0, Lcom/android/camera/module/VideoModule$11;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {p1}, Lcom/android/camera/module/VideoModule;->access$200(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    move-result-object p1

    const/4 v0, 0x0

    const v1, 0x7f090281

    const-wide/16 v2, -0x1

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiDetectTipHint(IIJ)V

    .line 2556
    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2550
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule$11;->accept(Ljava/lang/Long;)V

    return-void
.end method
