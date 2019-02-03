.class Lcom/android/camera/ui/FaceView$2;
.super Lmiui/view/animation/CubicEaseOutInterpolator;
.source "FaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/FaceView;->setFaceRectVisible(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/FaceView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/FaceView;)V
    .locals 0

    .line 356
    iput-object p1, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    invoke-direct {p0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 3

    .line 359
    invoke-super {p0, p1}, Lmiui/view/animation/CubicEaseOutInterpolator;->getInterpolation(F)F

    move-result p1

    .line 360
    iget-object v0, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    invoke-static {v0}, Lcom/android/camera/ui/FaceView;->access$200(Lcom/android/camera/ui/FaceView;)Landroid/graphics/Paint;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p1

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 361
    iget-object v0, p0, Lcom/android/camera/ui/FaceView$2;->this$0:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->invalidate()V

    .line 362
    return p1
.end method
