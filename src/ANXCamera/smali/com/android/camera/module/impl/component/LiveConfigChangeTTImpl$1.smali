.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/ss/android/vesdk/IRenderCallback;


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

    .line 224
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateTexture()Lcom/ss/android/vesdk/Texture;
    .locals 3

    .line 227
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 228
    return-object v1

    .line 230
    :cond_0
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "TTRenderCallback, onCreateTexture"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$202(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 234
    new-instance v0, Lcom/android/gallery3d/ui/ExtTexture;

    invoke-direct {v0}, Lcom/android/gallery3d/ui/ExtTexture;-><init>()V

    .line 235
    invoke-virtual {v0, v1}, Lcom/android/gallery3d/ui/ExtTexture;->onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z

    .line 236
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$300(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/SurfaceTexture;->attachToGLContext(I)V

    .line 237
    new-instance v1, Lcom/ss/android/vesdk/Texture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$300(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/ss/android/vesdk/Texture;-><init>(ILandroid/graphics/SurfaceTexture;)V

    .line 238
    return-object v1
.end method

.method public onDestroy()Z
    .locals 4

    .line 248
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTRenderCallback onDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$300(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    goto :goto_0

    .line 251
    :catch_0
    move-exception v0

    .line 252
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "detachFromGLContext exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$202(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 255
    return v1
.end method

.method public onTextureCreated(Lcom/ss/android/vesdk/Texture;)V
    .locals 0

    .line 244
    return-void
.end method
