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

    .line 681
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOpenGLCreate()V
    .locals 2

    .line 684
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/ss/android/medialib/listener/GLCallback;->onCreateTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->onCreate(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V

    .line 685
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    new-instance v1, Lcom/ss/android/medialib/TTRecorder$2$1;

    invoke-direct {v1, p0}, Lcom/ss/android/medialib/TTRecorder$2$1;-><init>(Lcom/ss/android/medialib/TTRecorder$2;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 695
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 696
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/medialib/camera/TextureHolder;->getTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/medialib/listener/GLCallback;->onTextureCreated(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V

    .line 698
    :cond_1
    return-void
.end method

.method public onOpenGLDestroy()V
    .locals 2

    .line 702
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v1}, Lcom/ss/android/medialib/TTRecorder;->access$200(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/ss/android/medialib/listener/GLCallback;->onDestroy()Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder;->onDestroy(Z)V

    .line 703
    return-void
.end method

.method public onOpenGLRunning()I
    .locals 2

    .line 707
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_0

    .line 708
    const/4 v0, -0x1

    return v0

    .line 712
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 717
    nop

    .line 718
    const/4 v0, 0x0

    return v0

    .line 713
    :catch_0
    move-exception v0

    .line 714
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 715
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->access$500()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    const/4 v0, -0x2

    return v0
.end method
