.class Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "V9EdgeShutterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/V9EdgeShutterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomAnimatorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/V9EdgeShutterView;


# direct methods
.method private constructor <init>(Lcom/android/camera/ui/V9EdgeShutterView;)V
    .locals 0

    .line 283
    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/ui/V9EdgeShutterView;Lcom/android/camera/ui/V9EdgeShutterView$1;)V
    .locals 0

    .line 283
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;-><init>(Lcom/android/camera/ui/V9EdgeShutterView;)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3

    .line 305
    const-string v0, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAnimationCancel animation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$502(Lcom/android/camera/ui/V9EdgeShutterView;I)I

    .line 307
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 286
    const-string v0, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAnimationEnd animation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$400(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$500(Lcom/android/camera/ui/V9EdgeShutterView;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 288
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$600(Lcom/android/camera/ui/V9EdgeShutterView;I)V

    .line 289
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$502(Lcom/android/camera/ui/V9EdgeShutterView;I)I

    goto :goto_0

    .line 290
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$700(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {p1}, Lcom/android/camera/ui/V9EdgeShutterView;->access$500(Lcom/android/camera/ui/V9EdgeShutterView;)I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 291
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$502(Lcom/android/camera/ui/V9EdgeShutterView;I)I

    .line 293
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setX(F)V

    .line 294
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 298
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-static {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->access$800(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 299
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;->this$0:Lcom/android/camera/ui/V9EdgeShutterView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setX(F)V

    .line 301
    :cond_0
    return-void
.end method
