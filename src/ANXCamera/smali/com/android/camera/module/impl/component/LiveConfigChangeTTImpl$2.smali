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

    .line 194
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHardEncoderInit(Z)V
    .locals 0

    .line 204
    return-void
.end method

.method public onNativeInit(ILjava/lang/String;)V
    .locals 1

    .line 197
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$302(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 198
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$400(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object p1

    sget-object p2, Lcom/android/camera/module/impl/component/FileUtils;->BEAUTY_12_DIR:Ljava/lang/String;

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFace(ILjava/lang/String;)I

    .line 199
    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$2;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$400(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/ss/android/vesdk/TERecorder;

    move-result-object p1

    const p2, 0x3f0ccccd    # 0.55f

    invoke-virtual {p1, p2, p2}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFaceIntensity(FF)I

    .line 200
    return-void
.end method
