.class public Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;
.super Landroid/os/Handler;
.source "CircularMediaEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EventHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;Landroid/os/Looper;)V
    .locals 0

    .line 278
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->this$0:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;

    .line 279
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 280
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 284
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 315
    invoke-static {}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown message "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 305
    :pswitch_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->this$0:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doRelease()V

    .line 307
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    .line 308
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    .line 309
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 310
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 311
    goto :goto_0

    .line 295
    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->this$0:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStop()V

    .line 297
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    .line 298
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    .line 299
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 300
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 301
    goto :goto_0

    .line 286
    :pswitch_2
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$EventHandler;->this$0:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;->doStart()V

    .line 288
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    .line 289
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    .line 290
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 291
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 292
    nop

    .line 318
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
