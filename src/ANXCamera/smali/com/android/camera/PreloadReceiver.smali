.class public Lcom/android/camera/PreloadReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PreloadReceiver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PreloadReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 18
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 19
    const-string p2, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 20
    const-string p1, "PreloadReceiver"

    const-string p2, "receive boot complete"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 22
    new-instance p1, Lcom/android/camera/module/Camera2Module;

    invoke-direct {p1}, Lcom/android/camera/module/Camera2Module;-><init>()V

    .line 23
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->preload()V

    .line 24
    new-instance p1, Lcom/android/camera/CameraSettings;

    invoke-direct {p1}, Lcom/android/camera/CameraSettings;-><init>()V

    .line 25
    invoke-static {}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->preload()V

    .line 27
    :cond_0
    return-void
.end method
