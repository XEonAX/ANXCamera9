.class Lcom/android/camera/module/Camera2Module$8;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->onBeautyBodySlimCountChange(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$isNeedTip:Z


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;Z)V
    .locals 0

    .line 1246
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$8;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean p2, p0, Lcom/android/camera/module/Camera2Module$8;->val$isNeedTip:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1249
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1250
    if-nez v0, :cond_0

    .line 1251
    return-void

    .line 1253
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module$8;->val$isNeedTip:Z

    const v2, 0x7f090267

    if-eqz v1, :cond_1

    .line 1254
    const/4 v1, 0x0

    const-wide/16 v3, 0xfa0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiDetectTipHint(IIJ)V

    goto :goto_0

    .line 1256
    :cond_1
    const/16 v1, 0x8

    const-wide/16 v3, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiDetectTipHint(IIJ)V

    .line 1258
    :goto_0
    return-void
.end method
