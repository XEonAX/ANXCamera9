.class Lcom/android/camera/ui/V6EffectCropView$3;
.super Landroid/os/Handler;
.source "V6EffectCropView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/V6EffectCropView;->initHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/V6EffectCropView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/V6EffectCropView;Landroid/os/Looper;)V
    .locals 0

    .line 708
    iput-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 7

    .line 711
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v2}, Lcom/android/camera/ui/V6EffectCropView;->access$300(Lcom/android/camera/ui/V6EffectCropView;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 712
    nop

    .line 713
    iget p1, p1, Landroid/os/Message;->what:I

    const-wide/16 v2, 0x1e

    const-wide/16 v4, 0x258

    const/high16 v6, 0x3f800000    # 1.0f

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_2

    .line 726
    :pswitch_0
    cmp-long p1, v0, v4

    if-gez p1, :cond_0

    .line 727
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$500(Lcom/android/camera/ui/V6EffectCropView;)Landroid/view/animation/Interpolator;

    move-result-object p1

    long-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->access$400(Lcom/android/camera/ui/V6EffectCropView;)J

    move-result-wide v4

    long-to-float v1, v4

    div-float/2addr v0, v1

    invoke-interface {p1, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    .line 729
    const/4 p1, 0x2

    invoke-virtual {p0, p1, v2, v3}, Lcom/android/camera/ui/V6EffectCropView$3;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 731
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$600(Lcom/android/camera/ui/V6EffectCropView;)V

    .line 733
    :goto_0
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$1100(Lcom/android/camera/ui/V6EffectCropView;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    .line 734
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->access$1100(Lcom/android/camera/ui/V6EffectCropView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    .line 735
    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    iget-object v2, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v2}, Lcom/android/camera/ui/V6EffectCropView;->access$1300(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v3}, Lcom/android/camera/ui/V6EffectCropView;->access$1400(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    float-to-int v3, v3

    add-int/2addr v2, v3

    invoke-static {v1, v2}, Lcom/android/camera/ui/V6EffectCropView;->access$1202(Lcom/android/camera/ui/V6EffectCropView;I)I

    .line 736
    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->access$1500(Lcom/android/camera/ui/V6EffectCropView;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v2}, Lcom/android/camera/ui/V6EffectCropView;->access$1200(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v2

    int-to-float v2, v2

    sub-float v2, p1, v2

    iget-object v3, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v3}, Lcom/android/camera/ui/V6EffectCropView;->access$1200(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v3

    int-to-float v3, v3

    sub-float v3, v0, v3

    iget-object v4, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    .line 737
    invoke-static {v4}, Lcom/android/camera/ui/V6EffectCropView;->access$1200(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v4

    int-to-float v4, v4

    add-float/2addr p1, v4

    iget-object v4, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v4}, Lcom/android/camera/ui/V6EffectCropView;->access$1200(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v0, v4

    .line 736
    invoke-virtual {v1, v2, v3, p1, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 738
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$1000(Lcom/android/camera/ui/V6EffectCropView;)V

    .line 739
    goto :goto_2

    .line 715
    :pswitch_1
    cmp-long p1, v0, v4

    if-gez p1, :cond_1

    .line 716
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$500(Lcom/android/camera/ui/V6EffectCropView;)Landroid/view/animation/Interpolator;

    move-result-object p1

    long-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->access$400(Lcom/android/camera/ui/V6EffectCropView;)J

    move-result-wide v4

    long-to-float v1, v4

    div-float/2addr v0, v1

    invoke-interface {p1, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    .line 718
    const/4 p1, 0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/android/camera/ui/V6EffectCropView$3;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1

    .line 720
    :cond_1
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$600(Lcom/android/camera/ui/V6EffectCropView;)V

    .line 722
    :goto_1
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->access$800(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->access$900(Lcom/android/camera/ui/V6EffectCropView;)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v6

    float-to-int v1, v1

    add-int/2addr v0, v1

    invoke-static {p1, v0}, Lcom/android/camera/ui/V6EffectCropView;->access$702(Lcom/android/camera/ui/V6EffectCropView;I)I

    .line 723
    iget-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$3;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {p1}, Lcom/android/camera/ui/V6EffectCropView;->access$1000(Lcom/android/camera/ui/V6EffectCropView;)V

    .line 724
    nop

    .line 743
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
