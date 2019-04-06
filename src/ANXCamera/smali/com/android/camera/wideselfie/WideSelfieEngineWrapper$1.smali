.class Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;
.super Ljava/lang/Object;
.source "WideSelfieEngineWrapper.java"

# interfaces
.implements Lcom/arcsoft/camera/wideselfie/WideSelfieCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;


# direct methods
.method constructor <init>(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;->this$0:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProcessCallback(ILcom/arcsoft/camera/wideselfie/ProcessResult;)V
    .locals 1

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;->this$0:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-static {v0}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->access$000(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$1;->this$0:Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;

    invoke-static {p1}, Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;->access$000(Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
