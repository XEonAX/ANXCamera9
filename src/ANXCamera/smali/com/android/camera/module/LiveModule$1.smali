.class Lcom/android/camera/module/LiveModule$1;
.super Landroid/telephony/PhoneStateListener;
.source "LiveModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/LiveModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/LiveModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    .line 200
    iput-object p1, p0, Lcom/android/camera/module/LiveModule$1;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 2

    .line 203
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$1;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Lcom/android/camera/module/LiveModule;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-static {}, Lcom/android/camera/module/LiveModule;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CALL_STATE_OFFHOOK"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v0, p0, Lcom/android/camera/module/LiveModule$1;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Lcom/android/camera/module/LiveModule;->onStop()V

    .line 207
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 208
    return-void
.end method
