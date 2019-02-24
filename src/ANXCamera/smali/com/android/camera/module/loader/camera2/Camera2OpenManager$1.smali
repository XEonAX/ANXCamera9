.class Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;
.super Landroid/os/Handler;
.source "Camera2OpenManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->initData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Looper;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$000(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Message;)V

    .line 91
    return-void
.end method
