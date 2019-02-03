.class Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;
.super Ljava/lang/Object;
.source "Panorama3Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PostAttachRunnable"
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;)V
    .locals 0

    .line 2241
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    .line 2241
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2244
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$2000(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 2248
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$5800(Lcom/android/camera/module/Panorama3Module;)V

    .line 2250
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$5900(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2251
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$6000(Lcom/android/camera/module/Panorama3Module;)V

    .line 2254
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    .line 2255
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 2257
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$4700()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 2258
    if-eqz v0, :cond_2

    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1500(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 2259
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;->this$2:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1500(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 2261
    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_2
    :goto_0
    monitor-exit v1

    .line 2262
    return-void

    .line 2261
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 2245
    :cond_3
    :goto_2
    return-void
.end method
