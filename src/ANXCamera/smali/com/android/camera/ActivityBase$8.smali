.class Lcom/android/camera/ActivityBase$8;
.super Ljava/lang/Object;
.source "ActivityBase.java"

# interfaces
.implements Lcom/android/camera/CameraScreenNail$NailListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase;->createCameraScreenNail(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ActivityBase;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0

    .line 613
    iput-object p1, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOrientation()I
    .locals 1

    .line 667
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget v0, v0, Lcom/android/camera/ActivityBase;->mOrientation:I

    return v0
.end method

.method public isKeptBitmapTexture()Z
    .locals 1

    .line 672
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isKeptBitmapTexture()Z

    move-result v0

    return v0
.end method

.method public onFrameAvailable(I)V
    .locals 7

    .line 645
    const/4 v0, 0x1

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v0, v0, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 647
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v4, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v4, v4, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    sub-long/2addr v0, v4

    .line 648
    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackStartAppCost(J)V

    .line 649
    iget-object v4, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-static {v4}, Lcom/android/camera/ActivityBase;->access$100(Lcom/android/camera/ActivityBase;)Ljava/util/HashMap;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 650
    iget-object v4, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-static {v4}, Lcom/android/camera/ActivityBase;->access$100(Lcom/android/camera/ActivityBase;)Ljava/util/HashMap;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-virtual {v5}, Lcom/android/camera/ActivityBase;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackAppLunchTimeEnd(Ljava/util/Map;Landroid/content/Context;)V

    goto :goto_0

    .line 652
    :cond_0
    sget-object v4, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackScenarioAbort(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 654
    :goto_0
    const-string v4, "ActivityBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onFrameAvailable: trackStartAppCost: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 658
    goto :goto_1

    .line 655
    :catch_0
    move-exception v0

    .line 656
    const-string v1, "ActivityBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", start time: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v5, v0, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", now: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 657
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 656
    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 659
    :goto_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iput-wide v2, v0, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    .line 661
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->dismissBlurCover()V

    .line 662
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0, p1}, Lcom/android/camera/ActivityBase;->notifyOnFirstFrameArrived(I)V

    .line 663
    return-void
.end method

.method public onPreviewPixelsRead([BII)V
    .locals 1

    .line 640
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/module/Module;->onPreviewPixelsRead([BII)V

    .line 641
    return-void
.end method

.method public onPreviewTextureCopied()V
    .locals 0

    .line 636
    return-void
.end method

.method public onSurfaceTextureCreated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 617
    return-void
.end method

.method public onSurfaceTextureReleased()V
    .locals 1

    .line 628
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 629
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onSurfaceTextureReleased()V

    .line 631
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 1

    .line 621
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 622
    iget-object v0, p0, Lcom/android/camera/ActivityBase$8;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 624
    :cond_0
    return-void
.end method
