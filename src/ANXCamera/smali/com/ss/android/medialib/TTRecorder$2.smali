.class Lcom/ss/android/medialib/TTRecorder$2;
.super Ljava/lang/Object;
.source "TTRecorder.java"

# interfaces
.implements Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/medialib/TTRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/medialib/TTRecorder;


# direct methods
.method constructor <init>(Lcom/ss/android/medialib/TTRecorder;)V
    .locals 0

    .line 704
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOpenGLCreate()V
    .locals 2

    .line 707
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onOpenGLCreate..."

    invoke-static {v0, v1}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/ss/android/medialib/listener/GLCallback;->onCreateTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->onCreate(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V

    .line 710
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    new-instance v1, Lcom/ss/android/medialib/TTRecorder$2$1;

    invoke-direct {v1, p0}, Lcom/ss/android/medialib/TTRecorder$2$1;-><init>(Lcom/ss/android/medialib/TTRecorder$2;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 723
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 724
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/medialib/camera/TextureHolder;->getTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/medialib/listener/GLCallback;->onTextureCreated(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V

    .line 726
    :cond_1
    return-void
.end method

.method public onOpenGLDestroy()V
    .locals 2

    .line 730
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onOpenGLDestroy..."

    invoke-static {v0, v1}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/ss/android/medialib/listener/GLCallback;->onDestroy()Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->onDestroy(Z)V

    .line 733
    return-void
.end method

.method public onOpenGLRunning()I
    .locals 2

    .line 737
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onOpenGLRunning..."

    invoke-static {v0, v1}, Lcom/ss/android/medialib/common/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_0

    .line 740
    const/4 v0, -0x1

    return v0

    .line 744
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 749
    nop

    .line 750
    const/4 v0, 0x0

    return v0

    .line 745
    :catch_0
    move-exception v0

    .line 746
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 747
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->access$200()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 748
    const/4 v0, -0x2

    return v0
.end method
