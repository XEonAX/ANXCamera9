.class Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;
.super Ljava/lang/Object;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mMiddleX:I

.field private mTouchDownX:F

.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0

    .line 237
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    .line 240
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-virtual {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mMiddleX:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 244
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$700(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 245
    return v0

    .line 248
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    .line 249
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 250
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$800(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)I

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_1

    .line 252
    neg-float v1, v1

    invoke-virtual {p2, v1, p1}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_0

    .line 253
    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$900(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_2

    .line 255
    neg-float p1, p1

    neg-float v1, v1

    invoke-virtual {p2, p1, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_0

    .line 256
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1000(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_3

    .line 258
    invoke-virtual {p2, v1, p1}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 264
    :cond_3
    :goto_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 266
    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    cmpl-float p1, p1, v2

    if-nez p1, :cond_4

    .line 267
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    .line 268
    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 269
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2, p1, v0}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 270
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1100(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Lcom/android/camera/ui/HorizontalSlideView;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_1

    .line 272
    :cond_4
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    sub-float/2addr v0, v2

    add-float/2addr p1, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2, p1, v0}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 273
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1100(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Lcom/android/camera/ui/HorizontalSlideView;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 274
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1200(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/View$OnTouchListener;

    move-result-object p1

    invoke-interface {p1, v1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 276
    goto :goto_1

    .line 280
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    sub-float/2addr v3, v4

    add-float/2addr p1, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p2, p1, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 281
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1100(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Lcom/android/camera/ui/HorizontalSlideView;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 282
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1200(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/View$OnTouchListener;

    move-result-object p1

    invoke-interface {p1, v1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 283
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$702(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z

    .line 284
    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;->mTouchDownX:F

    .line 288
    :goto_1
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
