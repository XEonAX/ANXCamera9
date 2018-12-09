.class Lcom/android/camera/ui/FaceView$2;
.super Ljava/lang/Object;
.source "FaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/FaceView;->setContentDescription(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/FaceView;

.field final synthetic val$newFaceSize:I


# direct methods
.method constructor <init>(Lcom/android/camera/ui/FaceView;I)V
    .locals 0

    .line 299
    iput-object p1, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    iput p2, p0, Lcom/android/camera/ui/FaceView$2;->val$newFaceSize:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 302
    iget v0, p0, Lcom/android/camera/ui/FaceView$2;->val$newFaceSize:I

    if-lez v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    iget-object v1, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v1}, Lcom/android/camera/ui/FaceView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x7f110000

    iget v3, p0, Lcom/android/camera/ui/FaceView$2;->val$newFaceSize:I

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/camera/ui/FaceView$2;->val$newFaceSize:I

    .line 304
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    .line 303
    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 305
    iget-object v0, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 307
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 309
    :goto_0
    return-void
.end method
