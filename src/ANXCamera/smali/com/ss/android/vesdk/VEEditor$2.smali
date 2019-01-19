.class Lcom/ss/android/vesdk/VEEditor$2;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback2;


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

    .line 290
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3

    .line 304
    const-string p1, "VEEditor"

    const-string v0, "surfaceChanged: pixel format [%d], size [%d, %d]"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1, p3}, Lcom/ss/android/vesdk/VEEditor;->access$302(Lcom/ss/android/vesdk/VEEditor;I)I

    .line 306
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1, p4}, Lcom/ss/android/vesdk/VEEditor;->access$402(Lcom/ss/android/vesdk/VEEditor;I)I

    .line 307
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$500(Lcom/ss/android/vesdk/VEEditor;)V

    .line 309
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1, p3, p4}, Lcom/ss/android/vesdk/VEEditor;->access$700(Lcom/ss/android/vesdk/VEEditor;II)V

    .line 310
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 298
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    .line 299
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEEditor;->access$200(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)V

    .line 300
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 314
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor$2;->this$0:Lcom/ss/android/vesdk/VEEditor;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEEditor;->access$600(Lcom/ss/android/vesdk/VEEditor;)V

    .line 315
    return-void
.end method

.method public surfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 293
    const-string p1, "VEEditor"

    const-string v0, "surfaceRedrawNeeded..."

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    return-void
.end method
