.class Lcom/ss/android/medialib/camera/TextureHolder$1;
.super Ljava/lang/Object;
.source "TextureHolder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/medialib/camera/TextureHolder;->onCreate(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V
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

    .line 64
    iput-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$1;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 67
    iget-object p1, p0, Lcom/ss/android/medialib/camera/TextureHolder$1;->this$0:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder;->frameAvailable()V

    .line 68
    return-void
.end method
