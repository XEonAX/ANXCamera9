.class Lcom/ss/android/medialib/camera/TextureHolder$2;
.super Ljava/lang/Object;
.source "TextureHolder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/medialib/camera/TextureHolder;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/medialib/camera/TextureHolder;


# direct methods
.method constructor <init>(Lcom/ss/android/medialib/camera/TextureHolder;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$2;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder$2;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    iget-object v0, v0, Lcom/ss/android/medialib/camera/TextureHolder;->mMPV:[F

    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 93
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder$2;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->access$200(Lcom/ss/android/medialib/camera/TextureHolder;)Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/ss/android/medialib/camera/TextureHolder$2;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-static {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->access$200(Lcom/ss/android/medialib/camera/TextureHolder;)Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 96
    :cond_0
    return-void
.end method
