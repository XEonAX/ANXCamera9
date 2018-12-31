.class Lcom/android/camera/module/loader/camera2/FocusManager2$2;
.super Ljava/lang/Object;
.source "FocusManager2.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusManager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Lcom/android/camera/module/loader/camera2/FocusTask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0

    .line 365
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 368
    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "focusResult: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$600(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 368
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_8

    .line 371
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    goto/16 :goto_4

    .line 376
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$800(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    const/4 v3, 0x4

    if-ne v0, v1, :cond_3

    .line 380
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 381
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 382
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    goto :goto_0

    .line 384
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 385
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 387
    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 388
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 389
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$300(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto/16 :goto_3

    .line 391
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$400(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_3

    .line 393
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$900(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    .line 397
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 398
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 399
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 403
    const-string p1, "auto"

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1000(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 404
    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1100(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result p1

    if-eq p1, v1, :cond_6

    .line 405
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->playFocusSound(I)V

    goto :goto_2

    .line 408
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1300(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v1

    goto :goto_1

    :cond_5
    move v0, v3

    :goto_1
    invoke-static {p1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 409
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 411
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 413
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1400(Lcom/android/camera/module/loader/camera2/FocusManager2;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 414
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1502(Lcom/android/camera/module/loader/camera2/FocusManager2;Z)Z

    goto :goto_3

    .line 415
    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$1600(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    .line 419
    :goto_3
    return-void

    .line 372
    :cond_8
    :goto_4
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->access$700(Lcom/android/camera/module/loader/camera2/FocusManager2;ZZ)V

    .line 373
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 365
    check-cast p1, Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$2;->accept(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    return-void
.end method
