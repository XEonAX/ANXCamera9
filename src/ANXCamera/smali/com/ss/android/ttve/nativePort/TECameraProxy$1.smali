.class Lcom/ss/android/ttve/nativePort/TECameraProxy$1;
.super Ljava/lang/Object;
.source "TECameraProxy.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttve/nativePort/TECameraProxy;->setSurfaceTexture(Ljava/lang/Object;I)I
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

    .line 51
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy$1;->this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    monitor-enter p0

    .line 54
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy$1;->this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-static {v0}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->access$000(Lcom/ss/android/ttve/nativePort/TECameraProxy;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TECameraProxy$1;->this$0:Lcom/ss/android/ttve/nativePort/TECameraProxy;

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->access$100()J

    move-result-wide v1

    invoke-static {v0, v1, v2, p1}, Lcom/ss/android/ttve/nativePort/TECameraProxy;->access$200(Lcom/ss/android/ttve/nativePort/TECameraProxy;JLandroid/graphics/SurfaceTexture;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    :cond_0
    monitor-exit p0

    return-void

    .line 53
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
