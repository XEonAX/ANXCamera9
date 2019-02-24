.class Lcom/ss/android/ttve/nativePort/TECameraProxy$2;
.super Ljava/lang/Object;
.source "TECameraProxy.java"

# interfaces
.implements Lcom/ss/android/ttve/utils/CameraInstance$CameraOpenCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/nativePort/TECameraProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;


# direct methods
.method constructor <init>(Lcom/ss/android/ttve/nativePort/TECameraProxy;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy$2;->this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cameraReady()V
    .locals 4

    .line 95
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy$2;->this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->access$100()J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->access$300(Lcom/ss/android/ttve/nativePort/TECameraProxy;JI)I

    .line 96
    return-void
.end method
