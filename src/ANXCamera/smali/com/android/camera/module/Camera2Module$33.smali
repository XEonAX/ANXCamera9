.class Lcom/android/camera/module/Camera2Module$33;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->onUltraWideChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$isOpenUltraWide:Z


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;Z)V
    .locals 0

    .line 5816
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean p2, p0, Lcom/android/camera/module/Camera2Module$33;->val$isOpenUltraWide:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 5819
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 5820
    if-eqz v0, :cond_2

    .line 5824
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module$33;->val$isOpenUltraWide:Z

    if-eqz v1, :cond_1

    .line 5828
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v2, v2, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0x24

    invoke-static {v1, v2, v3}, Lcom/android/camera/module/Camera2Module;->access$4800(Lcom/android/camera/module/Camera2Module;II)V

    .line 5830
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v1

    const/16 v2, 0xab

    if-eq v1, v2, :cond_0

    .line 5838
    const/16 v1, 0xe

    const v2, 0x7f090240

    const/4 v3, 0x5

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    goto :goto_0

    .line 5834
    :cond_0
    return-void

    .line 5843
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$33;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v2, v2, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/android/camera/module/Camera2Module;->access$4800(Lcom/android/camera/module/Camera2Module;II)V

    .line 5845
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 5848
    :cond_2
    :goto_0
    return-void
.end method
