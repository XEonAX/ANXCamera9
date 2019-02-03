.class Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;
.super Landroid/os/Handler;
.source "FocusManager2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusManager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/loader/camera2/FocusManager2;Landroid/os/Looper;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 134
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 135
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 139
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 151
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 154
    if-eqz v0, :cond_0

    .line 155
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->reShowFaceRect()V

    .line 159
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 160
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 161
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 162
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 163
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 164
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$300(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_0

    .line 166
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$400(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_0

    .line 169
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    .line 173
    nop

    .line 177
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
