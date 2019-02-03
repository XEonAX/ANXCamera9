.class Lcom/android/camera/module/VideoModule$1;
.super Ljava/lang/Object;
.source "VideoModule.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/VideoModule;->initAutoZoom()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Lcom/android/camera2/autozoom/AutoZoomCaptureResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    .line 336
    iput-object p1, p0, Lcom/android/camera/module/VideoModule$1;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 339
    iget-object v0, p0, Lcom/android/camera/module/VideoModule$1;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v0, p1}, Lcom/android/camera/module/VideoModule;->access$000(Lcom/android/camera/module/VideoModule;Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    .line 340
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 336
    check-cast p1, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule$1;->accept(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    return-void
.end method
