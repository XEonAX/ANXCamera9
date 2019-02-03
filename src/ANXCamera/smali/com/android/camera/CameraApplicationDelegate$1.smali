.class Lcom/android/camera/CameraApplicationDelegate$1;
.super Ljava/lang/Object;
.source "CameraApplicationDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/CameraApplicationDelegate;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/CameraApplicationDelegate;


# direct methods
.method constructor <init>(Lcom/android/camera/CameraApplicationDelegate;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/android/camera/CameraApplicationDelegate$1;->this$0:Lcom/android/camera/CameraApplicationDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 33
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 34
    return-void
.end method
