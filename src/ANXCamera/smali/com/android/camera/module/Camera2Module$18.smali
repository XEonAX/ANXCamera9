.class Lcom/android/camera/module/Camera2Module$18;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->updateEyeLight()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$alert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/protocol/ModeProtocol$TopAlert;)V
    .locals 0

    .line 3850
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$18;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-object p2, p0, Lcom/android/camera/module/Camera2Module$18;->val$alert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 3853
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$18;->val$alert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(II)V

    .line 3854
    return-void
.end method
