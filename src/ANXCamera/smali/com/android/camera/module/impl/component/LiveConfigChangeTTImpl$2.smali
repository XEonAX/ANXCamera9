.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->startPreview(Landroid/view/Surface;Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V
    .locals 0

    .line 267
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHardEncoderInit(Z)V
    .locals 0

    .line 293
    return-void
.end method

.method public onNativeInit(ILjava/lang/String;)V
    .locals 8

    .line 270
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$402(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 271
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object v0

    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$500(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Z

    move-result v1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/module/impl/component/FileUtils;->MODELS_DIR:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/slammodel/"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "phoneParams.txt"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/vesdk/TERecorder;->slamDeviceConfig(ZIZZZZLjava/lang/String;)I

    move-result p1

    .line 277
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "slam config result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/TERecorder;->setUseLargeMattingModel(Z)I

    .line 279
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$700(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 280
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$700(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ss/android/vesdk/TERecorder;->switchEffect(Ljava/lang/String;)I

    .line 283
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getLiveFilter()I

    move-result p1

    .line 284
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$800(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/EffectController;->findLiveFilter(Landroid/content/Context;I)Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    move-result-object p1

    .line 285
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    if-eqz p1, :cond_1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, p2, p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setFilter(ZLjava/lang/String;)V

    .line 287
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$900(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)V

    .line 288
    return-void
.end method
