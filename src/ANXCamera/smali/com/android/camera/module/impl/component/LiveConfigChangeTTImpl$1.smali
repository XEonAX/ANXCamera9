.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;
.super Ljava/lang/Object;
.source "LiveConfigChangeTTImpl.java"

# interfaces
.implements Lcom/ss/android/vesdk/IRenderCallback;


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

    .line 169
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateTexture()Lcom/ss/android/vesdk/Texture;
    .locals 3

    .line 172
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTRenderCallback, onCreateTexture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$102(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;Z)Z

    .line 176
    new-instance v0, Lcom/android/gallery3d/ui/ExtTexture;

    invoke-direct {v0}, Lcom/android/gallery3d/ui/ExtTexture;-><init>()V

    .line 177
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/ui/ExtTexture;->onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z

    .line 178
    iget-object v1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$200(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/SurfaceTexture;->attachToGLContext(I)V

    .line 179
    new-instance v1, Lcom/ss/android/vesdk/Texture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$200(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/ss/android/vesdk/Texture;-><init>(ILandroid/graphics/SurfaceTexture;)V

    .line 180
    return-object v1
.end method

.method public onDestroy()Z
    .locals 2

    .line 188
    invoke-static {}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTRenderCallback onDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$1;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$200(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    .line 190
    const/4 v0, 0x0

    return v0
.end method

.method public onTextureCreated(Lcom/ss/android/vesdk/Texture;)V
    .locals 0

    .line 185
    return-void
.end method
