.class Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;
.super Ljava/lang/Object;
.source "Panorama3Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module$PanoramaPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UiUpdateRunnable"
.end annotation


# instance fields
.field private mDetectResult:I

.field final synthetic this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)V
    .locals 0

    .line 2302
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    .line 2302
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 2311
    iget v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    const/4 v1, 0x1

    const/4 v2, -0x2

    if-eq v0, v2, :cond_5

    iget v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_5

    iget v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    if-ne v0, v1, :cond_0

    goto/16 :goto_2

    .line 2321
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->access$6400(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)Lcom/android/camera/panorama/PositionDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/panorama/PositionDetector;->getFrameRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 2322
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "frame_rect = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2323
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 2324
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$4100(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 2325
    iget v3, v0, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    iput v3, v2, Landroid/graphics/Point;->x:I

    goto :goto_0

    .line 2327
    :cond_1
    iget v3, v0, Landroid/graphics/RectF;->left:F

    float-to-int v3, v3

    iput v3, v2, Landroid/graphics/Point;->x:I

    .line 2330
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    float-to-int v0, v0

    iput v0, v2, Landroid/graphics/Point;->y:I

    .line 2333
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$800()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 2334
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v3

    if-nez v3, :cond_2

    .line 2335
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mPreviewImage is null in UiUpdateRunnable"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2336
    monitor-exit v0

    return-void

    .line 2338
    :cond_2
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 2339
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v4, v4, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v4}, Lcom/android/camera/module/Panorama3Module;->access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 2340
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2342
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x2

    div-int/2addr v3, v4

    invoke-static {v0, v3}, Lcom/android/camera/module/Panorama3Module;->access$6602(Lcom/android/camera/module/Panorama3Module;I)I

    .line 2344
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v3, 0xb0

    .line 2345
    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 2347
    if-eqz v0, :cond_4

    .line 2348
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$6600(Lcom/android/camera/module/Panorama3Module;)I

    move-result v3

    invoke-interface {v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDirectionPosition(Landroid/graphics/Point;I)V

    .line 2350
    iget v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    if-eq v2, v4, :cond_3

    .line 2355
    const/4 v1, 0x0

    invoke-interface {v0, v1, v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDirectionTooFast(ZI)V

    goto :goto_1

    .line 2352
    :cond_3
    const/16 v2, 0x1770

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDirectionTooFast(ZI)V

    .line 2353
    nop

    .line 2359
    :cond_4
    :goto_1
    return-void

    .line 2340
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 2314
    :cond_5
    :goto_2
    iget v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    if-eq v0, v1, :cond_6

    .line 2315
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopPanoramaShooting due to detect result "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2317
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0, v1}, Lcom/android/camera/module/Panorama3Module;->access$5700(Lcom/android/camera/module/Panorama3Module;Z)V

    .line 2318
    return-void
.end method

.method public setDetectResult(I)V
    .locals 0

    .line 2306
    iput p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->mDetectResult:I

    .line 2307
    return-void
.end method
