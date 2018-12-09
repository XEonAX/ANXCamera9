.class Lcom/android/zxing/QRCodeManager$2;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/zxing/QRCodeManager;->startDecode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/zxing/QRCodeManager;


# direct methods
.method constructor <init>(Lcom/android/zxing/QRCodeManager;)V
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 152
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/android/zxing/QRCodeManager$2;->accept(Ljava/lang/String;)V

    return-void
.end method

.method public accept(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 155
    const-string v0, "QRCodeManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSuccess: result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0, p1}, Lcom/android/zxing/QRCodeManager;->access$502(Lcom/android/zxing/QRCodeManager;Ljava/lang/String;)Ljava/lang/String;

    .line 157
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 158
    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 159
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 160
    iget-object p1, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/android/zxing/QRCodeManager;->access$002(Lcom/android/zxing/QRCodeManager;Z)Z

    .line 161
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showQrCodeTip()V

    goto :goto_0

    .line 163
    :cond_0
    iget-object p1, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/android/zxing/QRCodeManager;->access$002(Lcom/android/zxing/QRCodeManager;Z)Z

    .line 164
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideQrCodeTip()V

    .line 166
    :goto_0
    return-void
.end method
