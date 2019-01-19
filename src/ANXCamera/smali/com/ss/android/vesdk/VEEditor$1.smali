.class Lcom/ss/android/vesdk/VEEditor$1;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/VEEditor;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    .line 258
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 261
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p2}, Lcom/ss/android/vesdk/VEEditor;->access$000(Lcom/ss/android/vesdk/VEEditor;)Landroid/graphics/SurfaceTexture;

    move-result-object p2

    if-ne p2, p1, :cond_0

    .line 262
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iget-object p3, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p3}, Lcom/ss/android/vesdk/VEEditor;->access$100(Lcom/ss/android/vesdk/VEEditor;)Landroid/view/Surface;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/ss/android/vesdk/VEEditor;->access$200(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)V

    goto :goto_0

    .line 264
    :cond_0
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    new-instance p3, Landroid/view/Surface;

    invoke-direct {p3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-static {p2, p3}, Lcom/ss/android/vesdk/VEEditor;->access$102(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)Landroid/view/Surface;

    .line 265
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    iget-object p3, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p3}, Lcom/ss/android/vesdk/VEEditor;->access$100(Lcom/ss/android/vesdk/VEEditor;)Landroid/view/Surface;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/ss/android/vesdk/VEEditor;->access$200(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)V

    .line 267
    :goto_0
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p2, p1}, Lcom/ss/android/vesdk/VEEditor;->access$002(Lcom/ss/android/vesdk/VEEditor;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 268
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 279
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$600(Lcom/ss/android/vesdk/VEEditor;)V

    .line 280
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$100(Lcom/ss/android/vesdk/VEEditor;)Landroid/view/Surface;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Surface;->release()V

    .line 281
    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 272
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEEditor;->access$302(Lcom/ss/android/vesdk/VEEditor;I)I

    .line 273
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1, p3}, Lcom/ss/android/vesdk/VEEditor;->access$402(Lcom/ss/android/vesdk/VEEditor;I)I

    .line 274
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$1;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$500(Lcom/ss/android/vesdk/VEEditor;)V

    .line 275
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 287
    return-void
.end method
