.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->startPreview(Landroid/view/Surface;)V
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

    .line 230
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHardEncoderInit(Z)V
    .locals 0

    .line 246
    return-void
.end method

.method public onNativeInit(ILjava/lang/String;)V
    .locals 2

    .line 233
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$302(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 234
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$400(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 235
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$500(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$400(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ss/android/vesdk/TERecorder;->switchEffect(Ljava/lang/String;)I

    .line 238
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveFilter()I

    move-result p1

    .line 239
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/EffectController;->findLiveFilter(Landroid/content/Context;I)Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    move-result-object p1

    .line 240
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    if-eqz p1, :cond_1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, p2, p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->setFilter(ZLjava/lang/String;)V

    .line 241
    return-void
.end method
