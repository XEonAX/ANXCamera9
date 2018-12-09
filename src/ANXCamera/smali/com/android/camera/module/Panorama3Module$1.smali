.class Lcom/android/camera/module/Panorama3Module$1;
.super Ljava/lang/Object;
.source "Panorama3Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Panorama3Module;->onPause()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Panorama3Module;

.field final synthetic val$panorama:Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;)V
    .locals 0

    .line 873
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    iput-object p2, p0, Lcom/android/camera/module/Panorama3Module$1;->val$panorama:Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 877
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$600(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 878
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    .line 880
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    const/4 v1, 0x1

    invoke-static {v0, v1, v1}, Lcom/android/camera/module/Panorama3Module;->access$700(Lcom/android/camera/module/Panorama3Module;ZZ)V

    .line 884
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$1;->val$panorama:Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 885
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "onPause setDisplayPreviewBitmap null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 886
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$1;->val$panorama:Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    .line 890
    :cond_1
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$800()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 891
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 892
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 893
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2, v1}, Lcom/android/camera/module/Panorama3Module;->access$902(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 895
    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 896
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPause recycle bitmap "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v4}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 897
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 898
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$1;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2, v1}, Lcom/android/camera/module/Panorama3Module;->access$1002(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 900
    :cond_3
    monitor-exit v0

    .line 901
    return-void

    .line 900
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
