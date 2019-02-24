.class Lcom/android/zxing/QrDecoder$1;
.super Ljava/lang/Object;
.source "QrDecoder.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/zxing/QrDecoder;->startDecode()V
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
.field final synthetic this$0:Lcom/android/zxing/QrDecoder;


# direct methods
.method constructor <init>(Lcom/android/zxing/QrDecoder;)V
    .locals 0

    .line 142
    iput-object p1, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

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

    .line 142
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/android/zxing/QrDecoder$1;->accept(Ljava/lang/String;)V

    return-void
.end method

.method public accept(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 145
    const-string v0, "QrDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSuccess: result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    iput-boolean v1, v0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    .line 149
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    invoke-static {v0}, Lcom/android/zxing/QrDecoder;->access$000(Lcom/android/zxing/QrDecoder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    .line 154
    :goto_0
    xor-int/2addr v0, v1

    goto :goto_1

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    .line 152
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    invoke-static {v0}, Lcom/android/zxing/QrDecoder;->access$000(Lcom/android/zxing/QrDecoder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 154
    :goto_1
    if-nez v0, :cond_1

    .line 155
    return-void

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    invoke-static {v0, p1}, Lcom/android/zxing/QrDecoder;->access$002(Lcom/android/zxing/QrDecoder;Ljava/lang/String;)Ljava/lang/String;

    .line 159
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    .line 160
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 162
    iget-object v0, p0, Lcom/android/zxing/QrDecoder$1;->this$0:Lcom/android/zxing/QrDecoder;

    iget-boolean v0, v0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    if-nez v0, :cond_2

    .line 163
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showQrCodeTip()V

    goto :goto_2

    .line 165
    :cond_2
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideQrCodeTip()V

    .line 168
    :goto_2
    return-void
.end method
