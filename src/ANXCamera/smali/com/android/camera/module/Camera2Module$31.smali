.class Lcom/android/camera/module/Camera2Module$31;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->startScreenLight(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$brightness:I

.field final synthetic val$color:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;II)V
    .locals 0

    .line 5890
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$31;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/Camera2Module$31;->val$brightness:I

    iput p3, p0, Lcom/android/camera/module/Camera2Module$31;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 5893
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$31;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    .line 5894
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$31;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/Camera2Module$31;->val$brightness:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setWindowBrightness(I)V

    .line 5897
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;

    .line 5898
    if-eqz v0, :cond_1

    .line 5899
    iget v1, p0, Lcom/android/camera/module/Camera2Module$31;->val$color:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->setScreenLightColor(I)V

    .line 5900
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$FullScreenProtocol;->showScreenLight()V

    .line 5902
    :cond_1
    return-void
.end method
