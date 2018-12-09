.class Lcom/android/camera2/MiCamera2$8;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 2398
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 2401
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, v0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    .line 2402
    return-void
.end method
