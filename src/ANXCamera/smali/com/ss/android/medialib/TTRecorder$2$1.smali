.class Lcom/ss/android/medialib/TTRecorder$2$1;
.super Ljava/lang/Object;
.source "TTRecorder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/medialib/TTRecorder$2;->onOpenGLCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ss/android/medialib/TTRecorder$2;


# direct methods
.method constructor <init>(Lcom/ss/android/medialib/TTRecorder$2;)V
    .locals 0

    .line 685
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 4

    .line 689
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    iget-object p1, p1, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {p1}, Lcom/ss/android/medialib/TTRecorder;->access$000(Lcom/ss/android/medialib/TTRecorder;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 691
    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    iget-object p1, p1, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    iget-object v0, v0, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v0}, Lcom/ss/android/medialib/TTRecorder;->access$000(Lcom/ss/android/medialib/TTRecorder;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    iget-object v2, v2, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v2}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTextureID()I

    move-result v2

    iget-object v3, p0, Lcom/ss/android/medialib/TTRecorder$2$1;->this$1:Lcom/ss/android/medialib/TTRecorder$2;

    iget-object v3, v3, Lcom/ss/android/medialib/TTRecorder$2;->this$0:Lcom/ss/android/medialib/TTRecorder;

    invoke-static {v3}, Lcom/ss/android/medialib/TTRecorder;->access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/ss/android/medialib/camera/TextureHolder;->getMPV()[F

    move-result-object v3

    invoke-static {p1, v0, v1, v2, v3}, Lcom/ss/android/medialib/TTRecorder;->access$400(Lcom/ss/android/medialib/TTRecorder;JI[F)I

    .line 693
    :cond_0
    return-void
.end method
