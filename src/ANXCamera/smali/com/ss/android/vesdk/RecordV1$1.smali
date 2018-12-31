.class Lcom/ss/android/vesdk/RecordV1$1;
.super Ljava/lang/Object;
.source "RecordV1.java"

# interfaces
.implements Lcom/ss/android/medialib/listener/GLCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/RecordV1;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/RecordV1;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/RecordV1;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateTexture()Lcom/ss/android/medialib/camera/TextureHolder$Texture;
    .locals 3

    .line 38
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v1}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v1}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/ss/android/vesdk/IRenderCallback;->onCreateTexture()Lcom/ss/android/vesdk/Texture;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    invoke-static {v0, v1}, Lcom/ss/android/vesdk/RecordV1;->access$002(Lcom/ss/android/vesdk/RecordV1;Lcom/ss/android/vesdk/Texture;)Lcom/ss/android/vesdk/Texture;

    .line 39
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v2, Lcom/ss/android/medialib/camera/TextureHolder$Texture;

    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/Texture;->getSurfaceTextureID()I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v1}, Lcom/ss/android/vesdk/RecordV1;->access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/Texture;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;-><init>(ILandroid/graphics/SurfaceTexture;)V

    :goto_1
    return-object v2
.end method

.method public onDestroy()Z
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRenderCallback;->onDestroy()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public onTextureCreated(Lcom/ss/android/medialib/camera/TextureHolder$Texture;)V
    .locals 3

    .line 44
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;

    move-result-object v0

    if-nez v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    new-instance v1, Lcom/ss/android/vesdk/Texture;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->getSurfaceTextureID()I

    move-result v2

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder$Texture;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Lcom/ss/android/vesdk/Texture;-><init>(ILandroid/graphics/SurfaceTexture;)V

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/RecordV1;->access$002(Lcom/ss/android/vesdk/RecordV1;Lcom/ss/android/vesdk/Texture;)Lcom/ss/android/vesdk/Texture;

    .line 48
    :cond_0
    iget-object p1, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {p1}, Lcom/ss/android/vesdk/RecordV1;->access$100(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/IRenderCallback;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/vesdk/RecordV1$1;->this$0:Lcom/ss/android/vesdk/RecordV1;

    invoke-static {v0}, Lcom/ss/android/vesdk/RecordV1;->access$000(Lcom/ss/android/vesdk/RecordV1;)Lcom/ss/android/vesdk/Texture;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/ss/android/vesdk/IRenderCallback;->onTextureCreated(Lcom/ss/android/vesdk/Texture;)V

    .line 50
    :cond_1
    return-void
.end method
